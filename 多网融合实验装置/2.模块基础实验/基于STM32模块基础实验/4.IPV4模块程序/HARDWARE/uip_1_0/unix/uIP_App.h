#ifndef UIP_APP_H
#define UIP_APP_H

void eth_poll(void);
void UipPro(void);
void uIP_Net_Init(void);
extern struct uip_conn *pxConnectServerConn;
extern struct uip_udp_conn *pxUDP_Conn;
#endif

