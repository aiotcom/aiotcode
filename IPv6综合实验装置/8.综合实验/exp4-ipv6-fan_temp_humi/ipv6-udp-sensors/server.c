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
static char recv_buf[MAX_PAYLOAD_LEN];
float  atmophere_press = 0;
unsigned long u32_data,temp;
static uint8_t recv_len;
uint8_t *ptr,i;
uint8_t sensor_flag[4];
uint8_t TempHumidity[]={"H:22  T:33"};
uint8_t optoc_smoke[]={"optoc:0  smoke:0"};
uint8_t vibra[]={"vibra:1         "};
/*
发送协议格式：设备类型(1 Byte)+序列号(1 Byte)+数据(n Byte)
设备类型码：
0x80 seq 数据
0x80：大气压传感器
0x81：温湿度感器
0x82: 光电传感器
0x83: 振动传感器
0x84:烟雾传感器
*/
/*--------------------------udp server--------------------------------------*/
static void tcpip_handler(void)
{
	uint8_t temp;
	memset(recv_buf, 0, MAX_PAYLOAD_LEN);
	if(uip_newdata()) 
	{
 		recv_len = uip_datalen();		
		memcpy(recv_buf, (uint8_t*)uip_appdata, recv_len);
		switch(recv_buf[0])
		{
			case 0x81:
				//recv_buf[2] 等于 1，表示有检测到火焰，反则之。
				printf("\r\nT:%d H:%d",recv_buf[2],recv_buf[3]);
				
//转化湿度值
				temp = recv_buf[2]/10;
				TempHumidity[2] = temp+0x30;

				temp = recv_buf[2]%10;
				TempHumidity[3] = temp+0x30;		
//转化湿度值
//转化温度值
				temp = recv_buf[3]/10;
				TempHumidity[8] = temp+0x30;

				temp = recv_buf[3]%10;
				TempHumidity[9] = temp+0x30;
//转化温度值				
			break;
			case 0x82:
				//recv_buf[2] 等于 1，表示有检测遮挡物，反则之。			
				//printf("\r\noptocoupler data:%d:%d",recv_buf[1],recv_buf[2]);	
				sensor_flag[1] = recv_buf[2];
			break;
			case 0x83:
				//recv_buf[2] 等于 1，表示有检测振动发生，反则之。			
				//printf("\r\nvibration data:%d:%d",recv_buf[1],recv_buf[2]);
				sensor_flag[2] = recv_buf[2];
			break;
			case 0x84:
				//recv_buf[2] 等于 1，表示有检测烟，反则之。			
				//printf("\r\nsmoke data:%d:%d",recv_buf[1],recv_buf[2]);
				sensor_flag[3] = recv_buf[2];
			break;			
		} 	
		OLED_P8x16Str(0,2,TempHumidity);
		
		optoc_smoke[6]  = sensor_flag[1] + 0x30;
		optoc_smoke[15] = sensor_flag[3] + 0x30;
		OLED_P8x16Str(0,4,optoc_smoke);
		
		vibra[6]  = sensor_flag[2] + 0x30;			
		OLED_P8x16Str(0,6,vibra);
	}
	return;
}
/*
服务器线程
*/
PROCESS(udp_server_process, "UDP server process");
AUTOSTART_PROCESSES(&udp_server_process);
PROCESS_THREAD(udp_server_process, ev, data)
{
	PROCESS_BEGIN();
	
	server_conn = udp_new(NULL, UIP_HTONS(0), NULL);
	udp_bind(server_conn, UIP_HTONS(3000));
	PRINTF("Listen port: 3000, TTL=%u\r\n", server_conn->ttl);
	memset(&sensor_flag[0],0,4);
	
	OLED_P8x16Str(0,0,"I am server!");//显示屏显示		
	OLED_P8x16Str(0,2,TempHumidity);//显示温湿度提示信息	
	OLED_P8x16Str(0,4,optoc_smoke);//显示光电开关及烟雾传感器提示信息		
	OLED_P8x16Str(0,6,vibra);//显示振动提示信息
		
	while(1) 
	{
		PROCESS_YIELD();
		if(ev == tcpip_event) 
		{
			tcpip_handler();
		}
	}
	PROCESS_END();
}
/*--------------------------udp server--------------------------------------*/


















