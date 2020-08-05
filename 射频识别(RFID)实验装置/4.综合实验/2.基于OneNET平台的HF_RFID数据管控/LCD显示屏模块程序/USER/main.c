#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "exti.h"
#include "TFT.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2020-02-07
*
*	版本： 		V2.0
*
*	说明： 		TFT程序
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
  HAL_Init();             	//初始化HAL库
	TFT_Init();             	//初始化TFT显示器端口
	Lcd_Init();								//初始化LCD
	Rs485_Init();							//初始化485
	UART1_Init(115200);				//初始化串口一
	TFT_UI();									//计算器UI界面
	EXTI_Init();							//初始化外部中断

	while(1)
	{
			Key_Handler();				//屏幕触摸按键数据处理
	}
}






