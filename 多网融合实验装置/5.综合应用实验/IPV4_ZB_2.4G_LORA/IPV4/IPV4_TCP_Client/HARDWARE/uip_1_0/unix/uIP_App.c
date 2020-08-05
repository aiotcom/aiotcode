#include "uIP_App.h"
#include "stm32f1xx.h"
#include "uIP_AppCall.h"
#include "uip.h"
#include "tapdev.h"
#include "clock-arch.h"
#include "timer.h"
#include "uip_arp.h"

/*uIP  stack*/
#define BUF ((struct uip_eth_hdr *)&uip_buf[0])
#define uIP_INT_Statue GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_3)          //ENC28J60接收帧完成中断脚 

struct uip_conn *pxConnectServerConn = 0;
struct uip_udp_conn *pxUDP_Conn = 0;
struct timer periodic_timer, arp_timer;//超时时间0.5s,10s

FlagStatus *ETH_INT;




/****************************************************************************
* 名    称：void eth_poll(void)
* 功    能：定时查询TCP连接收发状态	ARP表更新， 并响应
* 入口参数：无
* 出口参数：无
* 说    明：
* 调用方法：无 
****************************************************************************/ 
void eth_poll(void)
{
	unsigned char i=0;
	if(timer_expired(&periodic_timer))	/* 0.5秒定时器超时 */
	{
        
		timer_reset(&periodic_timer);
		/* 轮流处理每个TCP连接, UIP_CONNS缺省是10个 */
		for(i = 0; i < UIP_CONNS; i++)
		{
			uip_periodic(i);/* 轮询每个TCP通信事件(最多10个) */
			/*
				当上面的函数执行后，如果需要发送数据，则全局变量 uip_len > 0
				需要发送的数据在uip_buf, 长度是uip_len  (这是2个全局变量)
			*/
			if(uip_len > 0)
			{
				uip_arp_out();		//加以太网头结构，在主动连接时可能要构造ARP请求
				tapdev_send();		//发送数据到以太网（设备驱动程序）
			}
		}

	#if UIP_UDP
		/* 轮流处理每个UDP连接, UIP_UDP_CONNS缺省是10个 */
		for(i = 0; i < UIP_UDP_CONNS; i++)
		{
			uip_udp_periodic(i);	/*处理UDP通信事件 */
			/* 如果上面的函数调用导致数据应该被发送出去，全局变量uip_len设定值> 0 */
			if(uip_len > 0)
			{
				uip_arp_out();		//加以太网头结构，在主动连接时可能要构造ARP请求
				tapdev_send();		//发送数据到以太网（设备驱动程序）
			}
		}
	#endif /* UIP_UDP */

		/* 每隔10秒调用1次ARP定时器函数 用于定期ARP处理,ARP表10秒更新一次，旧的条目会被抛弃*/
		if(timer_expired(&arp_timer))
		{
			timer_reset(&arp_timer);
			uip_arp_timer();
		}
	}
}

/*******************************************************************************
*	函数名：UipPro
*	输  入:
*	输  出:
*	功能说明：中断触发读取网络接收缓存
*	注意：当使用uCOS时，不适合用中断。请务必谨记。
********************************************************************/
void UipPro(void)
{
//	uint8_t err;
/*	//注意：此语句要写在最前面不应放在函数中
uIP_INT_Mbox = OSMboxCreate((void *)0); // 创建邮箱*/

//	ETH_INT=OSMboxPend(uIP_INT_Mbox,0, &err);//接收消息
//	if(*ETH_INT==SET)
	{					//当网络接收到数据时，会产生中断
//	rep:
//		*ETH_INT=RESET;
		uip_len = tapdev_read();	//从网络设备读取一个IP包,返回数据长度
		if(uip_len > 0)			    //收到数据时长度会变化
		{
			/* 处理IP数据包(只有校验通过的IP包才会被接收) */
			if(BUF->type == htons(UIP_ETHTYPE_IP))   //收到IP包
			{
				uip_arp_ipin();		   //去除以太网头结构，更新ARP表
				uip_input();		   //IP包处理
				/*
					因为uip_input();函数调用了回调函数UIP_APPCALL(),即tcp_server_appcall
					当上面的函数执行后，如果回调函数需要发送数据，则全局变量 uip_len > 0
					需要发送的数据在uip_buf, 长度是uip_len  (这是2个全局变量)
				*/
				if (uip_len > 0)		//有带外回应数据
				{
					uip_arp_out();		//加以太网头结构，在主动连接时可能要构造ARP请求
					tapdev_send();		//发送数据到以太网（设备驱动程序）
				}
			}
			/* 处理arp报文 */
			else if (BUF->type == htons(UIP_ETHTYPE_ARP))	//是ARP请求包
			{
				uip_arp_arpin();		//如是是ARP回应，更新ARP表；如果是请求，构造回应数据包
				/*
					当上面的函数执行后，如果需要发送数据，则全局变量 uip_len > 0
					需要发送的数据在uip_buf, 长度是uip_len  (这是2个全局变量)
				*/
				if (uip_len > 0)		//是ARP请求，要发送回应
				{
					tapdev_send();		//发ARP回应到以太网上
				}
			}
		}
  	}
//  	else
//	{//防止大包造成接收死机,当没有产生中断，而ENC28J60中断信号始终为低说明接收死机
//  	  if(uIP_INT_Statue==0) 
//		goto rep; 	
//  	}
}

/*******************************************************************************
*	函数名：InitNet
*	输  入:
*	输  出:
*	功能说明：初始化网络硬件、UIP协议栈、配置本机IP地址
************************************************************/
#if 0
#define TCP_Client 0
#define TCP_Server 0
#define UDP_client 1
#define UDP_SERVER 0
#define HTTP       0
#endif
void uIP_Net_Init(void)
{
	uip_ipaddr_t ipaddr;	
    
	timer_set(&periodic_timer, CLOCK_SECOND / 10);
	timer_set(&arp_timer, CLOCK_SECOND); 

	tapdev_init();//以太网控制器驱动ENC28J60初始化
	uip_init();								 //UIP协议栈初始化
}







