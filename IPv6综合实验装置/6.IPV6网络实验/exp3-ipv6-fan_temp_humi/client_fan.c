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
#include "net/uip-debug.h"
#include "Fan/Fan.h"
#include <string.h>
#include "debug.h"

/*
#define DEBUG DEBUG_PRINT  //使能PRINTF()打印功能
#define DEBUG 0            //禁止PRINTF()打印功能
*/
#define DEBUG 1

#define SEND_INTERVAL		CLOCK_SECOND
#define MAX_PAYLOAD_LEN		50
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
static char buf[MAX_PAYLOAD_LEN];
uint8_t stop_register = 0;
/* Our destinations and udp conns. One link-local and one global */
#define LOCAL_CONN_PORT 3001
static uint8_t register_with_server_data[5];
static uint8_t *pappdata;
static struct uip_conn *tcp_l_conn;
static uint8_t conn_server_state = 0;
static uint8_t send_register_cmd = 0;
static uint8_t poweron_connect = 0;
//网络发送命令函数，内部有协调打包处理代码
extern void send_cmd(struct uip_conn *c,uint8_t cmd,uint8_t devtype,uint8_t len,uint8_t *pbuf);
/*
向服务器注册
*/
void register_with_server(void)
{
	send_cmd(tcp_l_conn,0x80,0x01,0,(void*)0);						  
}
static void tcpip_handler(void)
{
	if(uip_newdata()) 
	{//打印服务器返回的数据信息
		printf("server respone data_len:%d\r\n",uip_datalen());  
		printf("server respone data:%s\r\n",uip_appdata);	
		memcpy((void*)buf,(const void*)uip_appdata,uip_datalen());
		if((buf[0] == 0x81)&&(buf[1] == 0x01))
		{
			stop_register = 1;
		}
		else if((buf[0] == 0x83)&&(buf[1] == 0x01))
		{
			if(buf[3])
			{
				fan_gear(1);
			}
			else
			{
				fan_gear(0);
			}
		}
	}
	return;
}

PROCESS(udp_client_process, "tcp client process");
AUTOSTART_PROCESSES(&udp_client_process);
#define SERVER_PORT 3000
PROCESS_THREAD(udp_client_process, ev, data)
{
	static struct etimer et,et_conn_server;
	static uip_ipaddr_t ipaddr;

	PROCESS_BEGIN();
	printf("tcp client process started\r\n");

	//服务器的CC2530的IEEE MAC地址转换为IPV6格式的地址，每个CC2530的IEEE MAC地址都不一样的
	//00:12:4B:00:0A:CC:19:38->转换出来为
	//fe80:0000:0000:0000:00:12:4B:00:0A:CC:19:38 这个就是服务器IPV6的IP地址
	uip_ip6addr(&ipaddr, 0xfe80, 0, 0, 0,0x0212,0x4B00,0x0ACC,0x1938);

	//定时向服务器注册，服务器通过注册了解fan节点的IP和port
	etimer_set(&et, SEND_INTERVAL);
	etimer_set(&et_conn_server,CLOCK_SECOND);
	while(1) 
	{
		PROCESS_YIELD();
		if(ev == tcpip_event) 
		{
			if(uip_aborted() || uip_timedout() || uip_closed()) 
			{ //如果连接不成功，串口显示提示信息
				printf("Could not establish connection\r\n");
				tcp_l_conn->tcpstateflags = UIP_CLOSED;//关闭之前的链接
				tcp_l_conn = tcp_connect(&ipaddr, UIP_HTONS(SERVER_PORT), NULL);
				conn_server_state = 0;
			}
			else if(uip_connected()) 
			{ //连接成功
				printf("Connected\r\n");	
				conn_server_state = 1;
			}
			else
			{
				tcpip_handler();
			}
		}
		else if((etimer_expired(&et)) && (!stop_register)) 
		{
			if(conn_server_state == 1)
			{
				register_with_server();
				printf("register to server\r\n");
			}			
			etimer_restart(&et);
		} 
		else if(etimer_expired(&et_conn_server) && (!poweron_connect))
		{
			poweron_connect = 1;
			tcp_l_conn = tcp_connect(&ipaddr, UIP_HTONS(SERVER_PORT), NULL);
		}
	}
	PROCESS_END();
}
/*---------------------------------------------------------------------------*/
