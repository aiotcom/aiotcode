#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "ADC.h"
#include "pwm.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-18
*
*	版本： 		V2.0
*
*	说明： 		PM2.5
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

uint16_t Data = 0;

uint8_t PM_Data[10];

int main(void)
{
  HAL_Init();             			//初始化HAL库
	ADC_Init();										//初始化ADC
	Rs485_Init();									//初始化485
	UART1_Init(115200);						//初始化串口1
	UART2_Init(115200);						//初始化串口2
  TIM2_PWM_Init(64-1,1000-1);		//初始化定时器(1ms)

	while(1)
	{
		Data = Get_Adc_Average(ADC_CHANNEL_3,100);
		printf("PM2.5-Data:%d\r\n",Data);
		PM_Data[0] = Data>>8;PM_Data[1] = Data;
		
		if(!DataHandling_485(Addr_PM2_5))		//处理485数据
		{
			Rs485_Send(Addr_PM2_5,Rx_Stack.Src_Adr,PM2_5_Conc,2,PM_Data);	//发送数据到WiFi模块
			memset(PM_Data,0,10);
		}
		delay_ms(100);
	}
}



