#ifndef UIP_APPCALL_H
#define UIP_APPCALL_H

#include "stm32f1xx.h"

/* Since this file will be included by uip.h, we cannot include uip.h
   here. But we might need to include uipopt.h if we need the u8_t and
   u16_t datatypes. */
#include "uipopt.h"
#include "psock.h"

/* 通信程序状态字(用户可以自己定义) */
enum
{
	STATE_CMD		= 0,	/* 命令接收状态 */
	STATE_TX_TEST	= 1,	/* 连续发送数据包状态(速度测试) */
	STATE_RX_TEST	= 2		/* 连续接收数据包状态(速度测试) */
};

/*
	定义 uip_tcp_appstate_t 数据类型，用户可以添加应用程序需要用到
	成员变量。不要更改结构体类型的名字，因为这个类型名会被uip引用。

	uip.h 中定义的 	struct uip_conn  结构体中引用了 uip_tcp_appstate_t
*/
struct tcp_test_appstate
{
	u8_t state;
	u8_t *textptr;
	int textlen;
};
typedef struct tcp_test_appstate uip_tcp_appstate_t;

/*这里终于明白了。如果是有在uip-conf.h定义了
typedef int uip_tcp_appstate_t，或者uipopt.h中定义了
typedef int uip_udp_appstate_t，那么实际上只定义长度一个信息，
用结构体可以扩充信息内容,此处引用在uip.h L1180。
*/

/* 定义应用程序回调函数 */
#ifndef UIP_APPCALL
#define UIP_APPCALL 	 tcp_appcall //TCP 应用回调
#define UIP_UDP_APPCALL  myudp_appcall      //upd应用程序调用
#endif


void tcp_appcall(void);
void tcp_test_appcall(void);
void myudp_appcall(void);
void myudp_send(char *str,short n);
void UDP_newdata(void);

void etherdev_init(void);
void tcp_server_appcall(void);
void uip_log(char *m);



#endif

