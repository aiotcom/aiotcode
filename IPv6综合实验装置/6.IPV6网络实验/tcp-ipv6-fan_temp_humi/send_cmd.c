#include "contiki.h"
#include "contiki-lib.h"
#include "contiki-net.h"
#include "net/uip-debug.h"
#include "stdio.h"
#include "string.h"
#define SEND_BUF_LEN 20
uint8_t send_buf[SEND_BUF_LEN];
void send_cmd(struct uip_udp_conn *pconn,  \
                    uint8_t cmd,uint8_t devtype,uint8_t len,uint8_t *pbuf)
{
	uint8_t i = 0;	
	send_buf[i++] = cmd;
	send_buf[i++] = devtype;
	send_buf[i++] = len;
	if(len)
	{
		memcpy((void*)&send_buf[i],(const void*)pbuf,len);
	}
	i = i + len;
	//发送数据
	uip_udp_packet_send(pconn, (char*)send_buf/*数据buffer*/, i/*数据长度*/);  	
}
