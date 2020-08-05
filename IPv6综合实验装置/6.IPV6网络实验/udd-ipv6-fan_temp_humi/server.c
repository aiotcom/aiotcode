/*
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the Institute nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE INSTITUTE AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 * This file is part of the Contiki operating system.
 *
 */

#include "contiki.h"
#include "contiki-lib.h"
#include "contiki-net.h"
#include <string.h>

/*
#define DEBUG 1  //使能PRINTF()打印功能
#define DEBUG 0  //禁止PRINTF()打印功能
*/
#define DEBUG 1

#include "net/uip-debug.h"
#include "dev/watchdog.h"
#include "net/rpl/rpl.h"
#include "debug.h"
#include "OLED/OLED.h"
#include "KEY/KEY.h"

#define UIP_IP_BUF   ((struct uip_ip_hdr *)&uip_buf[UIP_LLH_LEN])
#define UIP_UDP_BUF  ((struct uip_udp_hdr *)&uip_buf[uip_l2_l3_hdr_len])

#define MAX_PAYLOAD_LEN 20
static struct uip_udp_conn *server_conn;
struct uip_conn *fan_uip_conn;
static char buf[MAX_PAYLOAD_LEN],index = 0;
static uint16_t len;
static uint8_t fan_control;
static process_event_t key_event;
static uint8_t fan_has_register = 0;
uint8_t oled_temp_display_buffer[]={"temp=xx"};
uint8_t oled_humi_display_buffer[]={"humi=xx"};
//网络发送命令函数，内部有协调打包处理代码
extern void send_cmd(struct uip_conn *c,uint8_t cmd,uint8_t devtype,uint8_t len,uint8_t *pbuf);
extern void uip_tcp_packet_send(struct uip_conn *c, const void *data, int len);
/*
命令码+设备类型+数据长度+数据区
命令码：0x80->设备向服务器注册
		0x81->服务器向设备回复注册状态
        0x82->设备->服务器发送的是数据
		0x83->风扇控制指令
设备类型：0x00 服务器
          0x01 风扇
		  0x02 温度模块
*/
//process
PROCESS(udp_server_process, "UDP server process");
PROCESS(key_process, "key_process");
enum{
	KEY_RELASE,
	KEY_PRESSED
};
enum{
	S_1 = 0x01,
	S_2 = 0x02
};
/*--------------------------key process--------------------------------------*/
void key_handler(void)
{
	static unsigned char state = KEY_RELASE,prekv = 0,kv = 0;
	kv = key_all_read();	
	if(KEY_RELASE == state)
	{
		if((kv)&&(prekv == kv))
		{
			//PRINTF("key pressed\r\n");
			state = KEY_PRESSED;
			process_post(&udp_server_process, key_event, &kv);				
		}		
		prekv = kv?kv:0;
	}
	else if((KEY_PRESSED == state)&&(kv == 0))
	{
		//PRINTF("key relase\r\n");
		state = KEY_RELASE;
	}
}
/*
按键扫描线程
*/
PROCESS_THREAD(key_process, ev, data)
{
	static struct etimer et;
	key_event = process_alloc_event();
	PROCESS_BEGIN();
	PRINTF("key process start\r\n");
	etimer_set(&et, 1); 
	while(1) 
	{
		PROCESS_YIELD();
		if(etimer_expired(&et)) 
		{
			key_handler();
			etimer_restart(&et);
		} 
	}
	PROCESS_END();
}
/*--------------------------key process--------------------------------------*/
/*--------------------------udp server--------------------------------------*/
static void tcpip_handler(void)
{
	memset(buf, 0, MAX_PAYLOAD_LEN);
	if(uip_newdata()) 
	{
		len = uip_datalen();
		memcpy(buf, uip_appdata, len);
		if(buf[0] == 0x80)
		{//注册指令
			if(buf[1] == 0x01)
			{//风扇申请设备注册,注册过程注要是风扇节点的IP与端口，这个参数下发指令的时候要使用到。				
				PRINTF("reply fan registerr\r\n");
				fan_has_register = 1;
				fan_uip_conn = uip_conn;//获取当前连接
				index  = 0;
				buf[index++] = 0x81;
				buf[index++] = 0x01;
				buf[index++] = 0x00;
				uip_send(buf,index);
				OLED_P8x16Str(0,6," *fan on line*");				
			}
		}
		if(buf[0] = 0x82)
		{
			if(buf[1] == 0x02)
			{
				printf("temp=%d\r\n",buf[3]);//打印温度
				printf("humi=%d\r\n",buf[4]);//打印湿度
				oled_temp_display_buffer[5]=buf[3]/10 + 0x30;
				oled_temp_display_buffer[6]=buf[3]%10 + 0x30;				
				OLED_P8x16Str(0,2,oled_temp_display_buffer);

				oled_humi_display_buffer[5]=buf[4]/10 + 0x30;
				oled_humi_display_buffer[6]=buf[4]%10 + 0x30;					
				OLED_P8x16Str(0,4,oled_humi_display_buffer);
			}
		}
	}
	return;
}
/*
服务器线程
*/
AUTOSTART_PROCESSES(&udp_server_process);
PROCESS_THREAD(udp_server_process, ev, data)
{
	static struct etimer et;
	static unsigned char sw;
	PROCESS_BEGIN();
	
	process_start(&key_process,NULL);//启动按键扫描线程
	tcp_listen(UIP_HTONS(3000));
	OLED_P8x16Str(0,0,"I am Server->");
	while(1) 
	{
		PROCESS_YIELD();
		if(ev == tcpip_event) 
		{
			tcpip_handler();
		}
		if(ev == key_event)
		{
			sw = *((unsigned char*)data);
			if(sw&S_1)
			{
				PRINTF("cmd:fan on\r\n");
				fan_control = 1;
				send_cmd(fan_uip_conn,0x83,0x01,1,&fan_control);
			}
			if(sw&S_2)
			{
				PRINTF("cmd:fan off\r\n");
				fan_control = 0;
				send_cmd(fan_uip_conn,0x83,0x01,1,&fan_control);
			}		
		}
	}
	PROCESS_END();
}
/*--------------------------udp server--------------------------------------*/
