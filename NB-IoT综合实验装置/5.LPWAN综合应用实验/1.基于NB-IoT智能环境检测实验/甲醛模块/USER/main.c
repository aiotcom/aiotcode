#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "ADC.h"
#include "pwm.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2018-12-01
*
*	版本： 		V1.0
*
*	说明： 		甲醛模块
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

uint16_t Data = 0;
int main(void)
{
  HAL_Init();             					//初始化HAL库  
	MY_ADC_Init();										//初始化ADC
  TIM2_PWM_Init(64-1,10000-1);			//初始化定时器(10ms)

	while(1)
	{
		Data = Get_Adc_Average(ADC_CHANNEL_0,20);
	}
}


