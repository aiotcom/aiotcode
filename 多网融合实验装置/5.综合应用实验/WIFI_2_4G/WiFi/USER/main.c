#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "timer.h"
#include "WiFi.h"
#include "WS2812B.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-04-22
*
*	版本： 		V1.0
*
*	说明： 		WiFi控制
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
void RS485_HandlerCb(void);
uint8_t RxBuffer[4];
uint8_t SendToOneNET[20];
uint32_t SendTicks;
int main(void)
{
    HAL_Init();             					//初始化HAL库  
	Rs485_Init();								//初始化485
	UART1_Init(115200);						    //初始化串口1
	UART2_Init(115200);						    //初始化串口2
	UART3_Init(115200);						    //初始化串口3    
    WS2812B_Init();                             //初始化全彩灯WS2812B
	    
    WiFi_Init();							    //初始化WiFi
	TIM2_Init(1000-1,64-1);						//初始化定时器2(1ms)
    SendTicks = HAL_GetTick()+2000;
    TIM3_Init(10000-1,640-1,RS485_HandlerCb);//中断频率64M/640/10000=10HZ，中断频率10HZ    
	while(1)
	{
        if(HAL_GetTick() >= SendTicks)
        {
            SendTicks = HAL_GetTick() + 2000;            
            sprintf((char *)SendToOneNET,"%d%d%d",RxBuffer[0],RxBuffer[1],((RxBuffer[3]<<8)|(RxBuffer[2])));
            printf("=%s\r\n",SendToOneNET);
            HAL_UART_Transmit(&UART2_Handler,SendToOneNET,8,1000);	//发送数据到OneNET  
        }            
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
        if((++PollCounter) >= 5)
        {//500ms发送一次轮询指令
            PollCounter = 0;
            Rs485_Send(Addr_WiFi,Addr_2_4G,SHT20_Get_All,  0,(void*)0); 
            state = 1;
        }
    }
    else if(state == 1)
    {
        if(!DataHandling_485(Addr_WiFi))
        {           
            memcpy((void*)RxBuffer,Rx_Stack.Data,4);
        }
        state = 0;    
    }
}





