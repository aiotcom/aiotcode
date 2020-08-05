#include "stm32f1xx_hal.h"
#include "Smoke_Sensor.h"
#include "stm32f1xx.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2020-03-09
*
*	版本： 		V1.0
*
*	说明： 		烟雾传感器
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
uint8_t Data_Smoke[2];

int main(void)
{
  HAL_Init();             		//初始化HAL库  
	Rs485_Init();								//初始化485
	UART1_Init(115200);					//初始化串口1
	Smoke_Sensor_Init();				//初始化烟雾传感器

	while(1)
	{
		if(!DataHandling_485(Addr_Smoke))		//处理485数据
		{
			Rs485_Send(Addr_Smoke,Rx_Stack.Src_Adr,Smoke_State,1,Data_Smoke);	//发送数据到WiFi模块
		}
		
		if(Smoke_Read())
		{
			 Data_Smoke[0] = 1;
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4 ,GPIO_PIN_SET);
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3 ,GPIO_PIN_RESET);
			 HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15,GPIO_PIN_SET);
		}
		else
		{
			 Data_Smoke[0] = 0;
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4 ,GPIO_PIN_RESET);
			 HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3 ,GPIO_PIN_SET);
			 HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15,GPIO_PIN_SET);
		}
	}
}

