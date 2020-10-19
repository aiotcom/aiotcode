#include "stm32f1xx.h"
#include "delay.h"
#include "RS485.h"
#include "string.h"
#include "USART.h"
#include "uip.h"
#include "uIP_AppCall.h"
#include "uIP_App.h"
#include "tapdev.h"
#include "clock-arch.h"
#include "enc28j60.h"
#include "spi_enc28j60.h"
#include "clock-arch.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2018-01-01
*
*	版本： 		V1.0
*
*	说明： 		IPV4模块
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

extern uint8_t client_sel;
static uint8_t rEIR=0;
uint8_t uip_udp_client_send_buf[50];
uint8_t uip_udp_client_send_len = 0;
uint32_t UIP_RunTimeCounter = 0;
uint32_t UIP_HanlderCounter = 0;

uint32_t uip_udp_client_send_counter = 0;
uint32_t uip_tcp_client_send_counter = 0;
uint8_t uip_tcp_client_send_buf[50];
uint8_t uip_tcp_client_send_len;

#define TCP_Client_Test 1  //TCP客户端实验
#define TCP_Server_Test 0  //TCP服务器实验
#define UDP_TEST        0  //UDP实验

/*
void myudp_appcall(void) ;UDP数据接收uIP_AppCall.c
void tcp_appcall(void)   ;UDP数据接收uIP_AppCall.c
*/
int main(void)
{
    uip_ipaddr_t ipaddr;
    HAL_Init();          //初始化HAL库    
    RS485_Init();        //初始化RS485控制IO
    UART2_Init(115200);
    SPI_Enc28j60_Init();
    uIP_Net_Init();//初始化UIP,初始化芯片

	uip_ipaddr(ipaddr, 192,168,3,33);		 //设置本地IP地址
	uip_sethostaddr(ipaddr);
	uip_ipaddr(ipaddr, 192,168,3,1);		 //设置默认路由器IP地址  网关
	uip_setdraddr(ipaddr);	
	uip_ipaddr(ipaddr, 255,255,255,0);		 //设置网络掩码
	uip_setnetmask(ipaddr);
    
#if TCP_Client_Test    
	uip_ipaddr(&ipaddr,192,168,3,3);	//设置IP为192.168.1.12 
    //在pxConnectServerConn 包括了用于本次连接服务器的本地端口号 pxConnectServerConn->lport(local port)
	pxConnectServerConn = uip_connect(&ipaddr,htons(1400));//创建一个TCP Client 连接，远端IP192.168.0.3,端口是1400
#endif    


#if TCP_Server_Test
    uip_listen(HTONS(1200));//TCP监听
#endif

#if UDP_TEST
    uip_ipaddr(&ipaddr,192,168,3,3);	//设置连接目标端的IP为192.168.3.3
    pxUDP_Conn = uip_udp_new(&ipaddr,htons(1400)); 	//端口为1400
#endif   

    UIP_RunTimeCounter = HAL_GetTick()+50;
    UIP_HanlderCounter = HAL_GetTick()+50;  
    uip_udp_client_send_counter = HAL_GetTick()+1000;    
    uip_tcp_client_send_counter = HAL_GetTick()+1000;

	while(1)
	{
        if(HAL_GetTick() > UIP_RunTimeCounter)
        {//50ms
            UIP_RunTimeCounter = HAL_GetTick()+50;
            uIP_RunTime++;
            if (uIP_RunTime == 0x80000000)
            {
                uIP_RunTime=0;
            }

            if((GPIOB->IDR&GPIO_PIN_9) == 0)
            {
                rEIR = enc28j60ReadOp(ENC28J60_READ_CTRL_REG, EIR);
                if(rEIR&0x10)
                {

                }
                ENC28J60_ReadPhy(PHIR);
            }
        }//if(HAL_GetTick() > UIP_RunTimeCounter)
        if(HAL_GetTick() > UIP_HanlderCounter)
        {
            UIP_HanlderCounter = HAL_GetTick()+10;
            eth_poll();
            UipPro();	
        }
/*
void myudp_appcall(void) ;UDP数据接收uIP_AppCall.c
void tcp_appcall(void)   ;UDP数据接收uIP_AppCall.c
*/
#if UDP_TEST     
        //TCP客户端主动发送   每5000ms发送一次数据       
        if(HAL_GetTick() > uip_udp_client_send_counter)
        {
            uip_udp_client_send_counter = HAL_GetTick()+5000;
            sprintf(&uip_udp_client_send_buf[0],"uwTick=%d\r\n",HAL_GetTick());
            uip_udp_client_send_len = strlen((const char*)&uip_udp_client_send_buf[0]);
        }
#endif 

#if TCP_Client_Test 
        //TCP客户端主动发送    每5000ms发送一次数据     
        if(HAL_GetTick() > uip_tcp_client_send_counter)
        {
            uip_tcp_client_send_counter = HAL_GetTick()+5000;
            sprintf(&uip_tcp_client_send_buf[0],(uint8_t*)"uwTick=%d\r\n",HAL_GetTick());
            uip_tcp_client_send_len = strlen((const char*)&uip_tcp_client_send_buf[0]);
        } 
#endif 
#if TCP_Server_Test
        //TCP服务器主动发送 每5000ms发送一次数据
        if(HAL_GetTick() > uip_tcp_client_send_counter)
        {
            client_sel = 1 - client_sel;
            uip_tcp_client_send_counter = HAL_GetTick()+2500;
            sprintf(&uip_tcp_client_send_buf[0],"uwTick=%d\r\n",HAL_GetTick());
            uip_tcp_client_send_len = strlen((const char*)&uip_tcp_client_send_buf[0]);
        }
#endif        
	}
}



