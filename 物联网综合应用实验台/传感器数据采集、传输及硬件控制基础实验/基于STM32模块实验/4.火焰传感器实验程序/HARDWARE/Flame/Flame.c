#include "Flame.h"
#include "delay.h"

//==========================================================
//	函数名称：	Flame_Init()
//
//	函数功能：	按键初始化函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Flame_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;

    __HAL_RCC_GPIOA_CLK_ENABLE();           //开启GPIOA时钟
    
    GPIO_Initure.Pin=Flame1_PIN|Flame2_PIN;
    GPIO_Initure.Mode=GPIO_MODE_INPUT;      //输入
    GPIO_Initure.Speed=GPIO_SPEED_LOW;     	//低速
    HAL_GPIO_Init(GPIOA,&GPIO_Initure);
}




