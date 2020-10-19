#include "Platform_RGB_LED.h"
//==========================================================
//	函数名称：	Platform_RGB_LED_Init(void)
//
//	函数功能：	初始化底座的RGB LED灯的控制IO,PB3、PB4、PB15。控制输出电平占空比为50%，周期为1s。
//              该函数在systick中断处理函数中调用。
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Platform_RGB_LED_Init(void)
{    
    GPIO_InitTypeDef GPIO_Initure;

    __HAL_RCC_AFIO_CLK_ENABLE();	
    __HAL_AFIO_REMAP_SWJ_NOJTAG(); 

    __HAL_RCC_GPIOB_CLK_ENABLE();           	                //开启GPIOB时钟
    __HAL_RCC_GPIOA_CLK_ENABLE();           	                //开启GPIOB时钟

    GPIO_Initure.Mode  = GPIO_MODE_OUTPUT_PP;  	                //推挽输出
    GPIO_Initure.Pull  = GPIO_PULLUP;          	                //上拉
    GPIO_Initure.Speed = GPIO_SPEED_HIGH;    	 	            //高速

    GPIO_Initure.Pin   = GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_15; 	//PB3,PB4
    HAL_GPIO_Init(GPIOB,&GPIO_Initure);

    GPIO_Initure.Pin   = GPIO_PIN_15; 	                        //PA15 	 	            
    HAL_GPIO_Init(GPIOA,&GPIO_Initure);

    ////PB3,PB4,PA15 置1，默认初始化后灯灭 
    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_15,GPIO_PIN_SET);	
    HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15                      ,GPIO_PIN_SET);        
}
//==========================================================
//	函数名称：	Platform_RGB_LED_Red(void)
//
//	函数功能：	将底座灯 点为红色
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Platform_RGB_LED_Green(void)
{
    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4 ,GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3 ,GPIO_PIN_SET);
    HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15,GPIO_PIN_SET);
}
//==========================================================
//	函数名称：	Platform_RGB_LED_Red(void)
//
//	函数功能：	将底座灯 点为绿色
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Platform_RGB_LED_Red(void)
{
    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3            ,GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_4|GPIO_PIN_15,GPIO_PIN_SET);
    HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15           ,GPIO_PIN_SET);    
}
//==========================================================
//	函数名称：	Platform_RGB_LED_Red(void)
//
//	函数功能：	将底座灯 点为蓝色
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Platform_RGB_LED_Blue(void)
{
    HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15          ,GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3|GPIO_PIN_4,GPIO_PIN_SET);    
}
//==========================================================
//	函数名称：	void Platform_RGB_LED_Blackout(void)
//
//	函数功能：	将底座灯 点为蓝色
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Platform_RGB_LED_Blackout(void)
{
    HAL_GPIO_WritePin(GPIOA,GPIO_PIN_15          ,GPIO_PIN_SET);
    HAL_GPIO_WritePin(GPIOB,GPIO_PIN_3|GPIO_PIN_4,GPIO_PIN_SET);    
}
