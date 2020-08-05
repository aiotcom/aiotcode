#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "timer.h"
#include "WiFi.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2020-02-20
*
*	版本： 		V1.0
*
*	说明： 		PM2.5传感器数据采集与显示实验
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
  HAL_Init();             					//初始化HAL库  
	Rs485_Init();											//初始化485
	UART1_Init(115200);								//初始化串口1
	UART2_Init(115200);								//初始化串口2
	WiFi_Init();											//初始化WiFi
	TIM2_Init(1000-1,64-1);						//初始化定时器2(1ms)

	while(1)
	{
		USART_Data_Send();							//串口数据发送 
		USART1_IRQHand();								//串口1数据处理(485数据处理)
	}
}






