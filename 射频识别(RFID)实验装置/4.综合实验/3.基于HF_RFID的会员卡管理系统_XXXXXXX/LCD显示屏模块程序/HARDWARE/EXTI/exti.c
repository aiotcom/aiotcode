#include "TFT.h"
#include "exti.h"
#include "delay.h"
#include "stm32f1xx.h"

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
    
    __HAL_RCC_GPIOB_CLK_ENABLE();               	//开启GPIOB时钟

    GPIO_Initure.Pin=GPIO_PIN_14;									//PB14
    GPIO_Initure.Mode=GPIO_MODE_IT_RISING;     		//上升沿触发
    GPIO_Initure.Pull=GPIO_PULLUP;
    HAL_GPIO_Init(GPIOB,&GPIO_Initure);
	
	  HAL_NVIC_SetPriority(EXTI15_10_IRQn,1,1);   	//抢占优先级为1，子优先级为1
    HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);         	//使能中断线
}

//==========================================================
//	函数名称：	EXTI15_10_IRQnHandler
//
//	函数功能：	中断服务函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void EXTI15_10_IRQHandler(void)
{
		if(!touch_fig)			//按键按下了
		{
			touch_fig = 1;	//一次接触完成
		}
	
   HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_14);		//调用中断处理公用函数
}


