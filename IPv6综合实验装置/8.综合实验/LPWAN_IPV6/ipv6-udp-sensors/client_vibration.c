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
#include <string.h>
#include "debug.h"
#include "Vibration/Vibration.h"
/*
#define DEBUG 1  //使能PRINTF()打印功能
#define DEBUG 0            //禁止PRINTF()打印功能
*/
#define DEBUG 1

#define SEND_INTERVAL		2 //15ms
#define MAX_PAYLOAD_LEN		50
#define LOCAL_CONN_PORT 3001

static uint8_t counter = 0;
static char send_buf[MAX_PAYLOAD_LEN];
static uint8_t send_enable=0,send_data,flag;
static struct uip_udp_conn *l_conn;
static void tcpip_handler(void)
{
  if(uip_newdata()) 
  {//打印服务器返回的数据信息
	PRINTF("server respone data_len:%d\r\n",uip_datalen());  
	PRINTF("server respone data:%s\r\n",uip_appdata);	
  }
  return;
}
/*---------------------------------------------------------------------------*/
static void timeout_handler(void)
{
	static unsigned char readseq =0,state = 0; 

	flag = (!Vibration_State0 && !Vibration_State1);
	if(state == 0)
	{
		if(flag)
		{
			send_enable = 1;
			send_data = 1;
			state = 1;
			counter = 100;			
		}
	}
	else
	{//如果连续1.5s(15x100)都没有检测到振动则允许发送。
		if((!flag)&&counter)
		{
			counter--;
			if(!counter)
			{
				send_enable = 1;
				send_data = 0;
				state = 0;
			}
		}
		if(flag)
		{
			counter = 100;
		}
	}
	if(send_enable)
	{
		send_enable = 0;
		readseq++;
		send_buf[0] = 0x83;	
		send_buf[1] = readseq;
		send_buf[2] = send_data;		
		uip_udp_packet_send(l_conn, (char*)send_buf/*数据buffer*/, 3/*数据长度*/); 
	}
}
/*---------------------------------------------------------------------------*/
PROCESS(udp_client_process, "UDP client process");
AUTOSTART_PROCESSES(&udp_client_process);
PROCESS_THREAD(udp_client_process, ev, data)
{
	static struct etimer et;
	uip_ipaddr_t ipaddr;
	PROCESS_BEGIN();
	printf("vibration client process started\n");

	//服务器的CC2530的IEEE MAC地址转换为IPV6格式的地址，每个CC2530的IEEE MAC地址都不一样的
	//00 12 4B 00 1B DB 6F 1D->转换出来为
	//fe80:0000:0000:0000:00:12:4B:00:1B:DB:6F:1D 这个就是服务器IPV6的IP地址
	uip_ip6addr(&ipaddr, 0xfe80, 0, 0, 0,0x0212,0x4B00,0x1BDB,0x6F1D);
	//创建一个连接 远端目标 ipaddr ，远端目标端口
	l_conn = udp_new(&ipaddr, UIP_HTONS(3000), NULL);
	if(!l_conn) {
		PRINTF("udp_new l_conn error.\n");
	}
	//绑定到本机的LOCAL_CONN_PORT 端口，即通过本机的LOCAL_CONN_PORT 与远端的设备通信
	udp_bind(l_conn, UIP_HTONS(LOCAL_CONN_PORT));

	printf("Link-Local connection with ");
	PRINT6ADDR(&l_conn->ripaddr);
	printf(" local/remote port %u/%u\n",UIP_HTONS(l_conn->lport), UIP_HTONS(l_conn->rport));

	printf("Client to: ");
	PRINT6ADDR(&l_conn->ripaddr);
	printf("\r\n");

	etimer_set(&et, SEND_INTERVAL);
	while(1) 
	{
		PROCESS_YIELD();
		if(etimer_expired(&et)) 
		{
			timeout_handler();
			etimer_restart(&et);
		} 
		else if(ev == tcpip_event) 
		{
			tcpip_handler();
		}
	}
	PROCESS_END();
}
/*---------------------------------------------------------------------------*/
