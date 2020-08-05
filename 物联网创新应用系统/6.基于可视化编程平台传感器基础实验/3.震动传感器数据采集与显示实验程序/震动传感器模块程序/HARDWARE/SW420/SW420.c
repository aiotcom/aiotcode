#include "SW420.h"
#include "delay.h"

uint8_t SW420_fig = 0;
uint8_t Shock_Fre[10];			//震动频率

//==========================================================
//	函数名称：	SW420_Init()
//
//	函数功能：	初始化震动传感器
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：			检测到低电平震动
//==========================================================
void SW420_Init(void)
{
	  GPIO_InitTypeDef GPIO_Initure;

		__HAL_RCC_GPIOA_CLK_ENABLE();						//开启GPIOA时钟

		GPIO_Initure.Pin = SW420_OUT0|SW420_OUT1;
		GPIO_Initure.Mode = GPIO_MODE_INPUT;   	//上拉输入
		GPIO_Initure.Pull = GPIO_NOPULL;				//浮空
		HAL_GPIO_Init(SW420_GPIO_PORT, &GPIO_Initure);
}

//==========================================================
//	函数名称：	SW420_Fig()
//
//	函数功能：	检测震动
//
//	入口参数：	无
//
//	返回参数：	SW420_fig = 1:表示有震动
//							SW420_fig = 0:表示无震动
//
//	说明：			检测到低电平震动
//==========================================================
void SW420_Fig(void)
{
	if(!SW420_OUT0_STATE() || !SW420_OUT1_STATE())
	{
		if(!SW420_OUT0_STATE() && !SW420_OUT1_STATE())
		{
			SW420_fig = 1;
			HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4 ,GPIO_PIN_RESET);
		}
	}
	else
	{
		SW420_fig = 0;
		HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4 ,GPIO_PIN_SET);
	}
}











