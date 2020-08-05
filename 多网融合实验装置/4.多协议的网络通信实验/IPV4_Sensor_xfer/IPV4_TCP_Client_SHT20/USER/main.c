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
#include "_timer.h"
#include "RS485.h"
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

uint8_t UpdataFlg,TxBuffer[5];
#define TCP_Client_Test 1  //TCP客户端实验
void RS485_HandlerCb(void);//处理485总线上的数据
int main(void)
{
    uip_ipaddr_t ipaddr;
    HAL_Init();          //初始化HAL库    
    
    UART1_Init(115200);
    UART2_Init(115200);
    USART3_Init(115200);
    Rs485_Init();
    
    TIM3_Init(10000-1,640-1,RS485_HandlerCb);
    SPI_Enc28j60_Init();
    uIP_Net_Init();//初始化UIP,初始化芯片

	uip_ipaddr(&ipaddr, 192,168,3,31);		 //设置本地IP地址
	uip_sethostaddr(&ipaddr);
	uip_ipaddr(&ipaddr, 192,168,3,1);		 //设置默认路由器IP地址  网关
	uip_setdraddr(&ipaddr);	
	uip_ipaddr(&ipaddr, 255,255,255,0);		 //设置网络掩码
	uip_setnetmask(&ipaddr);
    
#if TCP_Client_Test    
	uip_ipaddr(&ipaddr,192,168,3,33);	//设置IP为192.168.3.33 
    //在pxConnectServerConn 包括了用于本次连接服务器的本地端口号 pxConnectServerConn->lport(local port)
	pxConnectServerConn = uip_connect(&ipaddr,htons(1200));//创建一个TCP Client 连接，远端IP192.168.3.33,端口是1200
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
#if TCP_Client_Test 
        //TCP客户端主动发送    每5000ms发送一次数据     
        if(UpdataFlg)
        {//接收到数据
            UpdataFlg = 0;
            memcpy((void*)uip_tcp_client_send_buf,TxBuffer,4);
            uip_tcp_client_send_len = 4;
        } 
#endif 
      
	}
}
//==========================================================
//	函数名称：	void TCP_ServerReceive_Handler(uint8_t data,uint)
//
//	函数功能：	TCP链接轮询任务
//
//	入口参数：	void
//
//	返回参数：	无
//
//	说明：		定时轮询每一个连接任务
//==========================================================
struct uip_conn *client_link_uip_conn[2];
uint8_t count=0; 
void tcp_appcall(void)
{//定时轮询，每个conn
    if(((uip_conn->lport) == pxConnectServerConn->lport)&&(pxConnectServerConn))
    {
        if (uip_aborted())
        {
            printf("uip_aborted!\r\n");
            //aborted();
        }

        else if (uip_timedout())
        {
            printf("uip_timedout!\r\n");
            //timedout();
        }

        else if (uip_closed())//服务器断开
        {
            printf("uip_closed!\r\n");
           // closed();
        }

        else if (uip_connected())
        {
            printf("uip_connected!\r\n");//连接上服务器
            //connected();
        }

        else if (uip_acked())//收到数据回复了ACK
        {
            printf("uip_acked!\r\n");
            //acked();
        }

        /* 接收到一个新的TCP数据包*/
        else if (uip_newdata())
        {//接收到的数据返回
            memcpy((void*)uip_tcp_client_send_buf,(const void*)uip_appdata,uip_len);
            uip_tcp_client_send_len = uip_len;
            uip_send(uip_tcp_client_send_buf,uip_tcp_client_send_len);
            uip_tcp_client_send_len = 0;
        }
        /* 当需要重发、新数据到达、数据包送达、连接建立时，通知uip发送数据 */
        if (uip_rexmit() ||	uip_newdata() || uip_acked() ||	uip_connected() || uip_poll())
        {
            
        }
        
        if(uip_tcp_client_send_len)
        {
            uip_send(uip_tcp_client_send_buf,uip_tcp_client_send_len);
            uip_tcp_client_send_len = 0;
        }
    }
    switch(uip_conn->lport) //本地端口
    {
        case HTONS(1200):
            if(uip_connected())
            {//如果有客户端接入，走到这里。client_link_uip_conn 保存客户端的连接
                client_link_uip_conn[count++] = uip_conn;
            }
            if(uip_newdata())
            {
                memcpy((void*)uip_tcp_client_send_buf,(const void*)"server return this\r\n",uip_len);
                uip_tcp_client_send_len = uip_len;
                uip_send(uip_tcp_client_send_buf,uip_tcp_client_send_len);
                uip_tcp_client_send_len = 0;  
            } 
            if(uip_tcp_client_send_len)
            {
                if(uip_conn == client_link_uip_conn[0])
                {
                    uip_send(uip_tcp_client_send_buf,uip_tcp_client_send_len);
                    uip_tcp_client_send_len = 0;
                }            
            }            
            break;
    }
}
//==========================================================
//	函数名称：	void RS485_HandlerCb(void)
//
//	函数功能：	通过485总线获取数据处理函数
//
//	入口参数：	void
//
//	返回参数：	无
//
//	说明：		定时器3中断，回调函数，每100ms调用一次
//==========================================================
void RS485_HandlerCb(void)
{  
    static uint32_t PollCounter=0;
    static uint8_t state = 0;
    
    if(state == 0)
    {
        if((++PollCounter) >= 20)
        {//2000ms发送一次轮询指令
            PollCounter = 0;
            Rs485_Send(Addr_IPV4,Addr_SHT20,SHT20_Get_All,  0,(void*)0); 
            state = 1;
        }
    }
    else if(state == 1)
    {
        if(!DataHandling_485(Addr_IPV4))
        {
            memcpy((void*)TxBuffer,Rx_Stack.Data,4);
            UpdataFlg = 1;
        }
        state = 0;    
    }       
}


