#include "stm32f1xx_hal.h"
#include "Martix_Key.h"	
#include "stm32f1xx.h"
#include "delay.h"
#include "usart.h"
#include "timer.h"
#include "Rs485.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-03-18
*
*	版本： 		V1.0
*
*	说明： 		矩阵键盘程序
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
void RS485_HandlerCb(void);
uint8_t TheKeyValue;
int main(void)
{
    HAL_Init();             					//初始化HAL库  
	KEY_Init();												//初始化按键
	UART1_Init(115200);								//初始化串口二
    Rs485_Init();
	TIM3_Init(10000-1,64-1,RS485_HandlerCb);					//初始化定时器中断周期64M/64/10000/ = 100HZ
    
    USART3_Init(115200);
	while(1)
	{
        TheKeyValue = KEY_Process();  								//接收按键输入
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
//	说明：		定时器3中断，回调函数，每10ms调用一次
//==========================================================
void RS485_HandlerCb(void)
{  
    static uint16_t command;
    if((!DataHandling_485(Addr_Matrixkey))&&(Rx_Stack.Command == Matrixkey_Get_value))
    {
        //printf("get req\r\n");
        if(TheKeyValue != KEY_NULL)
        {
            command = FindKeyValue2Command(TheKeyValue);
            Rs485_Send(Addr_Matrixkey,Addr_Linux,command,1,&TheKeyValue);
            TheKeyValue = KEY_NULL;
        }
    }        
}


