#include "Smoke_Sensor.h"
#include "stm32f1xx.h"
#include "delay.h"

//==========================================================
//	函数名称：	Smoke_Sensor_Init()
//
//	函数功能：	烟雾传感器初始化函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void Smoke_Sensor_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;
    
    __HAL_RCC_GPIOA_CLK_ENABLE();           //开启GPIOA时钟
    
    GPIO_Initure.Pin=Smoke_PIN;    					//PA2
    GPIO_Initure.Mode=GPIO_MODE_INPUT;      //输入
    GPIO_Initure.Pull=GPIO_PULLDOWN;        //下拉
    GPIO_Initure.Speed=GPIO_SPEED_LOW;     	//低速
    HAL_GPIO_Init(Smoke_PORT,&GPIO_Initure);
}



