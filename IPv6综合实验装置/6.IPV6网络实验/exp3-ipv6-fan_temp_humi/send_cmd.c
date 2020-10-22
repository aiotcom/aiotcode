#include "contiki.h"
#include "contiki-lib.h"
#include "contiki-net.h"
#include "net/uip-debug.h"
#include "stdio.h"
#include "string.h"
#include "tcpip.h"
#define SEND_BUF_LEN 20
uint8_t send_buf[SEND_BUF_LEN];
extern uint16_t uip_len, uip_slen;

void uip_tcp_packet_send(struct uip_conn *c, const void *data, int len)
{
	
	uip_conn = c;
	uip_send(data,len);
		   
	uip_process(UIP_TCP_SEND_CONN);
#if UIP_CONF_IPV6_MULTICAST
  /* Let the multicast engine process the datagram before we send it */
	if(uip_is_addr_mcast_routable(&uip_conn->ripaddr)) 
	{
		UIP_MCAST6.out();
	}
#endif /* UIP_IPV6_MULTICAST */	
	tcpip_ipv6_output();
}

void send_cmd(struct uip_conn *c,uint8_t cmd,uint8_t devtype,uint8_t len,uint8_t *pbuf)
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
	uip_tcp_packet_send(c,(char*)send_buf/*数据buffer*/, i/*数据长度*/);  	
}