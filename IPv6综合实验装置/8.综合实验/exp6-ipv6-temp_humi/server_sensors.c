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
#include "LORA/LORA.h"

#define UIP_IP_BUF   ((struct uip_ip_hdr *)&uip_buf[UIP_LLH_LEN])
#define UIP_UDP_BUF  ((struct uip_udp_hdr *)&uip_buf[uip_l2_l3_hdr_len])

#define LORA_FREQ 500
#define MAX_PAYLOAD_LEN 120
static struct uip_udp_conn *server_conn,fan_link;
static char buf[MAX_PAYLOAD_LEN];
static uint16_t len;
static uint8_t fan_control,LoraSendState;

static process_event_t key_event;
uint8_t oled_temp_display_buffer[]={"temp=xx"};
uint8_t oled_humi_display_buffer[]={"humi=xx"};
uint8_t enable_lora_send = 0;
//网络发送命令函数，内部有协调打包处理代码
extern void send_cmd(struct uip_udp_conn *pconn,  \
                    uint8_t cmd,uint8_t devtype,uint8_t len,uint8_t *pbuf);
/*
命令码+设备类型+数据长度+数据区
命令码：0x80->设备向服务器注册
		0x81->服务器向设备回复注册状态
        0x82->设备/服务器发送的是数据
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
typedef struct{
	uint8_t temp;
	uint8_t humidity;
}_sensor_data;
_sensor_data sensor_data={22,33};
uint8_t LoraRecvBuffer[32];
uint8_t IRQ_RegValue;
uint8_t fan_sw;
static process_event_t fan_control_event;
uint8_t lora_send_buf[5],sync=0;
/*
LORA 数据发送与接收
*/
PROCESS_THREAD(key_process, ev, data)
{
	static struct etimer et;
	static uint8_t LoraSendIntervalCount=0,state = 0;
	fan_control_event = process_alloc_event();
	PROCESS_BEGIN();
	PRINTF("key process start\r\n");
	etimer_set(&et, 13); //13->101ms
	LORA_Init(LORA_FREQ);
	while(1) 
	{
		PROCESS_YIELD();
		if(etimer_expired(&et)) 
		{
			switch(state)
			{
				case 0:					
					if(enable_lora_send)
					{
						state = 1;
					}
					break;
				case 1:							
					lora_send_buf[0] = 0xA1;
					lora_send_buf[1] = 0x02;	
					lora_send_buf[2] = sensor_data.temp;
					lora_send_buf[3] = sensor_data.humidity;							
					if(!Sx1278SendLong((uint8_t*)&lora_send_buf,4))
					{
						enable_lora_send = 0;
						state = 0;
					}
				break;
			}		
			etimer_restart(&et);
		} 
	}
	PROCESS_END();
}
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
				uip_ipaddr_copy(&server_conn->ripaddr, &UIP_IP_BUF->srcipaddr);
				server_conn->rport = UIP_UDP_BUF->srcport;
				uip_ipaddr_copy(&fan_link.ripaddr, &UIP_IP_BUF->srcipaddr);
				fan_link.rport = UIP_UDP_BUF->srcport;				
								
				//回复注册
				PRINTF("\r\nreply fan register\r\n");
				send_cmd(server_conn,0x81,0x01,0,NULL);	
				OLED_P8x16Str(0,6," *fan on line*");	
				/* Restore server connection to allow data from any node */
				uip_create_unspecified(&server_conn->ripaddr);
				server_conn->rport = 0;					
			}
		}
		if(buf[0] = 0x82)
		{
			if(buf[1] == 0x02)
			{
				printf("\r\nhumidity=%d\r\n",buf[3]);//打印湿度
				printf("\r\ntemperature=%d\r\n",buf[4]);//打印温度
				oled_temp_display_buffer[5]=buf[4]/10 + 0x30;
				oled_temp_display_buffer[6]=buf[4]%10 + 0x30;				
				OLED_P8x16Str(0,2,oled_temp_display_buffer);

				oled_humi_display_buffer[5]=buf[3]/10 + 0x30;
				oled_humi_display_buffer[6]=buf[3]%10 + 0x30;					
				OLED_P8x16Str(0,4,oled_humi_display_buffer);
				
				sensor_data.temp = buf[4];
				sensor_data.humidity = buf[3];
				
				enable_lora_send = 1;
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
	
	server_conn = udp_new(NULL, UIP_HTONS(0), NULL);
	udp_bind(server_conn, UIP_HTONS(3000));
	process_start(&key_process,NULL);//启动按键扫描线程
	PRINTF("Listen port: 3000, TTL=%u\r\n", server_conn->ttl);
	while(1) 
	{
		PROCESS_YIELD();
		if(ev == tcpip_event) 
		{
			tcpip_handler();
		}
		if(ev == fan_control_event)
		{
			sw = *((unsigned char*)data);
			if(sw==1)
			{
				PRINTF("\r\ncmd:fan on\r\n");
				fan_control = 1;
				uip_ipaddr_copy(&server_conn->ripaddr, &fan_link.ripaddr);
				server_conn->rport = fan_link.rport;					
				send_cmd(server_conn,0x83,0x01,1,&fan_control);
				/* Restore server connection to allow data from any node */
				uip_create_unspecified(&server_conn->ripaddr);
				server_conn->rport = 0;					
			}
			if(sw==2)
			{
				PRINTF("\r\ncmd:fan off\r\n");
				fan_control = 0;
				uip_ipaddr_copy(&server_conn->ripaddr, &fan_link.ripaddr);
				server_conn->rport = fan_link.rport;					
				send_cmd(server_conn,0x83,0x01,1,&fan_control);
				uip_create_unspecified(&server_conn->ripaddr);
				server_conn->rport = 0;				
			}		
		}
	}
	PROCESS_END();
}
/*--------------------------udp server--------------------------------------*/
