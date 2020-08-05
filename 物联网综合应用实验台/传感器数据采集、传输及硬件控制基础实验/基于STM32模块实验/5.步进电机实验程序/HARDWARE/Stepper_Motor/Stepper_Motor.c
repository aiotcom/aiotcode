#include "Stepper_Motor.h"
#include "delay.h"

//==========================================================
//	函数名称：	Stepper_Motor_Init()
//
//	函数功能：	步进电机初始化
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void Stepper_Motor_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct;

  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOG_CLK_ENABLE();

  GPIO_InitStruct.Pin = A0_PIN|A1_PIN;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  GPIO_InitStruct.Pin = B0_PIN;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
	
	 GPIO_InitStruct.Pin = B1_PIN;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOG, &GPIO_InitStruct);
	
	A1LOW();A0LOW();B1LOW();B0LOW();		//初始化拉低
}

//==========================================================
//	函数名称：	Stepper_Motor_Set()
//
//	函数功能：	设置步进电机转动节拍
//
//	入口参数：	A1:	A+
//							A0:	A-
//							B1:	B+
//							B0:	B-
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Stepper_Motor_Set(uint8_t A1,uint8_t A0,uint8_t B1,uint8_t B0)
{
	A1==1?A1HIGH():A1LOW();
	A0==1?A0HIGH():A0LOW();	
	B1==1?B1HIGH():B1LOW();
	B0==1?B0HIGH():B0LOW();
}

//==========================================================
//	函数名称：	Stepper_Motor_Turn()
//
//	函数功能：	设置步进电机转速
//
//	入口参数：	Direction:		旋转方向 1：顺时针  0：逆时针
//							Cycle_Number：转动圈数
//							Delay: 				转一圈耗时(ms)
//
//	返回参数：	无
//
//	说明：			angle
//==========================================================
void Stepper_Motor_Turn(uint8_t Direction,uint16_t Cycle_Number,uint16_t Delay)
{
	static uint32_t i = 0;
	static uint16_t Time = 0;
	
	if(Delay>=40)
		Time = Delay/20;
	else
		Time = 2;
	
	if(Direction)
	{
		for(i=0;i<(Cycle_Number*5);i++)
		{
			Stepper_Motor_Set(1,0,0,0);		//第一拍
			delay_ms(Time);

			Stepper_Motor_Set(0,0,1,0);		//第二拍
			delay_ms(Time);

			Stepper_Motor_Set(0,1,0,0);		//第三拍
			delay_ms(Time);

			Stepper_Motor_Set(0,0,0,1);		//第四拍
			delay_ms(Time);
		}
	}
	else
	{
		for(i=0;i<(Cycle_Number*5);i++)
		{
			Stepper_Motor_Set(0,0,0,1);		//第一拍
			delay_ms(Time);

			Stepper_Motor_Set(0,1,0,0);		//第二拍
			delay_ms(Time);

			Stepper_Motor_Set(0,0,1,0);		//第三拍
			delay_ms(Time);

			Stepper_Motor_Set(1,0,0,0);		//第四拍
			delay_ms(Time);
		}
	}
	A1LOW();A0LOW();B1LOW();B0LOW();	//初始化拉低
}


