#include <ioCC2530.h>
#include "enc28j60.h"
#include "spi_enc28j60.h"
#include "uIP_App.h"
#include "UIP.h"
#include "TIM.h"
#include "UART.h"
#include "stdio.h"
#include "string.h"
#include "type.h"
#include "clock-arch.h"
#include "app_basicrf.h"

//****宏定义*******************
#define PAN_ID              0x2007
#define LOCAL_SHORT_ADDR    0x2520
#define RF_CHANNEL          25 /*11~26*/     
//****宏定义*******************

//****函数定义*****************
void System_clockInit(void);
//****函数定义*****************

//****变量定义*******************
extern uint8_t client_sel;
static uint8_t rEIR=0;
uint8_t RxSensorData[5];
uint8_t uip_udp_client_send_buf[50];
uint8_t uip_udp_client_send_len = 0;
uint32_t UIP_RunTimeCounter = 0;
uint32_t UIP_HanlderCounter = 0;
uint32_t uip_udp_client_send_counter = 0;
uint32_t uip_tcp_client_send_counter = 0;
uint8_t uip_tcp_client_send_buf[50];
uint8_t uip_tcp_client_send_len;
//****变量定义*******************

//==========================================================
//	函数名称：	Init_Timer1()
//
//	函数功能：	定时器1初始化函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		定时器时钟16MHz，中断周期1000HZ
//==========================================================
void main(void)
{
  	uip_ipaddr_t ipaddr;
  	System_clockInit();
	UART_Init(UART_0);//初始化串口0
	
	Rf_Init(RF_CHANNEL,PAN_ID,LOCAL_SHORT_ADDR);   //初始化无线通信
	TIM1_Init(); //初始化定时器，中断周期1000Hz 	
	
	printf("this is uart0 print\r\n");
    
	SPI_Enc28j60_Init();
    uIP_Net_Init();//初始化UIP,初始化芯片

	uip_ipaddr(ipaddr, 192,168,3,33);		 //设置本地IP地址
	uip_sethostaddr(ipaddr);
	uip_ipaddr(ipaddr, 192,168,3,1);		 //设置默认路由器IP地址  网关
	uip_setdraddr(ipaddr);	
	uip_ipaddr(ipaddr, 255,255,255,0);		 //设置网络掩码
	uip_setnetmask(ipaddr);
    
    uip_ipaddr(ipaddr,192,168,3,3);	//设置连接目标端的IP为192.168.3.3
    pxUDP_Conn = uip_udp_new(&ipaddr,htons(1200)); 	//端口为1200

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

            if((ENC28J60_INT) == 0)
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
		
		if(Rf_Receive(RxSensorData))
		{
		    printf("get data\r\n");
			sprintf(&uip_udp_client_send_buf[0],(uint8_t*)"Temp=%d,Humidity=%d\r\n",RxSensorData[0],RxSensorData[1]);			
		}
/*
void myudp_appcall(void) ;UDP数据接收uIP_AppCall.c
void tcp_appcall(void)   ;UDP数据接收uIP_AppCall.c
*/       
        if(HAL_GetTick() > uip_udp_client_send_counter)
        {
            uip_udp_client_send_counter = HAL_GetTick()+5000;
            uip_udp_client_send_len = strlen((const char*)&uip_udp_client_send_buf[0]);
        }      
	}
}	
//==========================================================
//	函数名称：	void System_clockInit(void)
//
//	函数功能：	初始化系统时钟
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		定时器时钟16MHz，中断周期1000HZ
//==========================================================
void System_clockInit(void)
{
  CLKCONCMD &= ~(1<<6);        /*选择32MHz晶振*/  
  while(!(CLKCONSTA & (1<<6))); /*等待晶振稳定*/  
  CLKCONCMD &= ~0x47;          /* 不分频,系统时钟32MHZ，定时器时钟16MHZ*/             
}