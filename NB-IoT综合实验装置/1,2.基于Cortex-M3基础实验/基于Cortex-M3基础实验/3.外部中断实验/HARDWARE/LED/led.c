#include "led.h"
#include "delay.h"
#include "stm32f1xx.h"

//==========================================================
//	函数名称：	LED_Init
//
//	函数功能：	LED灯初始化
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void LED_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;

    __HAL_RCC_GPIOA_CLK_ENABLE();           	//开启GPIOA时钟
	
    GPIO_Initure.Pin=LED1_PIN|LED2_PIN|LED3_PIN|LED4_PIN;
    GPIO_Initure.Mode=GPIO_MODE_OUTPUT_PP;  	//推挽输出
    GPIO_Initure.Pull=GPIO_PULLUP;          	//上拉
    GPIO_Initure.Speed=GPIO_SPEED_HIGH;    	 	//高速
    HAL_GPIO_Init(LED_PORT,&GPIO_Initure);
	
    LED_OFF();
}

//==========================================================
//	函数名称：	LED_Twinkle
//
//	函数功能：	LED灯闪烁
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void LED_Twinkle(void)
{
	LED_ON();delay_ms(200);LED_OFF();delay_ms(200);
	LED_ON();delay_ms(200);LED_OFF();delay_ms(200);
	LED_ON();delay_ms(200);LED_OFF();
}

//==========================================================
//	函数名称：	Water_Lamp
//
//	函数功能：	LED流水灯
//
//	入口参数：	time:控制流水灯时间间隔
//
//	返回参数：	无
//
//	说明：			
//==========================================================
void Water_Lamp(uint16_t time)
{
	static uint8_t Time_Flag = 1;		//执行标志位
	static uint16_t Time_Count = 0;	//计数值
	
	switch(Time_Flag)
	{
		case 1://控制LED1
			LED1_ON();
			delay_ms(1);
			Time_Count++;
		
			if(Time_Count>=time)
			{
				LED1_OFF();
				Time_Flag = 2;
				Time_Count = 0;
			}
			break;
		case 2://控制LED2
			LED2_ON();
			delay_ms(1);
			Time_Count++;
		
			if(Time_Count>=time)
			{
				LED2_OFF();
				Time_Flag = 3;
				Time_Count = 0;
			}
			break;
		case 3://控制LED3
			LED3_ON();
			delay_ms(1);
			Time_Count++;
		
			if(Time_Count>=time)
			{
				LED3_OFF();
				Time_Flag = 4;
				Time_Count = 0;
			}
			break;
		case 4://控制LED4
			LED4_ON();
			delay_ms(1);
			Time_Count++;
		
			if(Time_Count>=time)
			{
				LED4_OFF();
				Time_Flag = 1;
				Time_Count = 0;
			}
			break;
		default: break;
	}
}

