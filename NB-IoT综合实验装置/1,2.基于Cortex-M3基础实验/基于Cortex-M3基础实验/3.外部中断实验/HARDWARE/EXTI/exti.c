#include "led.h"
#include "key.h"
#include "exti.h"
#include "delay.h"
#include "stm32f1xx.h"

unsigned char Key_flag = 0;  //按键标志

//==========================================================
//	函数名称：	EXTI_Init
//
//	函数功能：	外部中断初始化
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void EXTI_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;
    
    __HAL_RCC_GPIOA_CLK_ENABLE();               //开启GPIOA时钟

    GPIO_Initure.Pin=S1_PIN|S2_PIN; 						//按键S1、S2
    GPIO_Initure.Mode=GPIO_MODE_IT_FALLING;     //下降沿触发
    GPIO_Initure.Pull=GPIO_PULLUP;
    HAL_GPIO_Init(KEY1_PORT,&GPIO_Initure);

		HAL_NVIC_SetPriority(EXTI4_IRQn,1,1);      	//抢占优先级为1，子优先级为1
    HAL_NVIC_EnableIRQ(EXTI4_IRQn);            	//使能中断线
	
    HAL_NVIC_SetPriority(EXTI9_5_IRQn,1,1);    	//抢占优先级为1，子优先级为1
    HAL_NVIC_EnableIRQ(EXTI9_5_IRQn);          	//使能中断线
}

//==========================================================
//	函数名称：	EXTI4_IRQHandler()
//
//	函数功能：	中断服务函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void EXTI4_IRQHandler(void)
{
    HAL_GPIO_EXTI_IRQHandler(S2_PIN);		//调用中断处理公用函数
}

//==========================================================
//	函数名称：	EXTI9_5_IRQHandler()
//
//	函数功能：	中断服务函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void EXTI9_5_IRQHandler(void)
{
    HAL_GPIO_EXTI_IRQHandler(S1_PIN);		//调用中断处理公用函数
}

//==========================================================
//	函数名称：	HAL_GPIO_EXTI_Callback
//
//	函数功能：	中断服务程序
//
//	入口参数：	GPIO_Pin:中断引脚号
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
	if(!Key_flag)
	{
		switch(GPIO_Pin)
		{
			case S1_PIN:
				Key_flag = 1;
				break;
			case S2_PIN:
				Key_flag = 2;
				break;
			default:break;
		}
	}
}
