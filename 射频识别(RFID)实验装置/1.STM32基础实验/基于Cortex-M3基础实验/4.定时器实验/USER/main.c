#include "stm32f1xx.h"
#include "delay.h"
#include "led.h"
#include "timer.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2020-03-10
*
*	版本： 		V2.0
*
*	说明： 		定时器实验-HAL库版本
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
	HAL_Init();                  	//初始化HAL库    
	LED_Init();				     				//初始化LED	
	TIM2_Init(1000-1,64-1);    		//定时器2初始化(1ms)			
	
	while(1)
	{
		Water_Lamp_Time(1000);				//LED流水灯
	}
}




