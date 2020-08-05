#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "ADC.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-11
*
*	版本： 		V2.0
*
*	说明： 		火焰传感器
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
uint16_t Data_Flam0 = 0,Data_Flam1 = 0;

int main(void)
{
  HAL_Init();             		//初始化HAL库  
	ADC_Init();									//初始化ADC
	Rs485_Init();								//初始化485
	UART1_Init(115200);					//初始化串口1

	while(1)
	{
		Data_Flam0 = Get_Adc_Average(ADC_CHANNEL_2,20);	//获取PA0 火焰传感器数据
		delay_ms(50);
		Data_Flam1 = Get_Adc_Average(ADC_CHANNEL_3,20);	//获取PA1 火焰传感器数据
		delay_ms(50);

		if((Data_Flam0<4050 && Data_Flam0>3800) || (Data_Flam1<4050 && Data_Flam1>3800))
		{
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4 ,GPIO_PIN_SET);
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3 ,GPIO_PIN_RESET);
			 HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15,GPIO_PIN_RESET);
		}
		else if(Data_Flam0<3800 || Data_Flam1<3800)
		{
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4 ,GPIO_PIN_SET);
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3 ,GPIO_PIN_RESET);
			 HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15,GPIO_PIN_SET);
		}
		else
		{
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4 ,GPIO_PIN_SET);
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3 ,GPIO_PIN_SET);
			 HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15,GPIO_PIN_RESET);
		}
	}
}

