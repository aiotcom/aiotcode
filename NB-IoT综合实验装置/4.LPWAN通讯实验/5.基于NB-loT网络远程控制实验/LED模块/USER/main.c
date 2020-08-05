#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "led.h"

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
*	说明： 		LED控制
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
	HAL_Init();						//初始化HAL库    
	LED_Init();						//初始化LED	
	Rs485_Init();					//初始化485
	UART1_Init(115200);		//初始化串口一

	while(1)
	{
		if(!DataHandling_485(Addr_LED))		//处理485数据
		{
			switch(Rx_Stack.Command)
			{
				case LED_ON1:
					LED1_ON();	//点亮LED1
					break;
				case LED_ON2:
					LED2_ON();	//点亮LED2
					break;
				case LED_ON3:
					LED3_ON();	//点亮LED3
					break;
				case LED_ON4:
					LED4_ON();	//点亮LED4
					break;
				case LED_OFF1:
					LED1_OFF();	//关闭LED1
					break;
				case LED_OFF2:
					LED2_OFF();	//关闭LED2
					break;
				case LED_OFF3:
					LED3_OFF();	//关闭LED3
					break;
				case LED_OFF4:
					LED4_OFF();	//关闭LED4
					break;
				default: break;
			}
		}
	}
}




