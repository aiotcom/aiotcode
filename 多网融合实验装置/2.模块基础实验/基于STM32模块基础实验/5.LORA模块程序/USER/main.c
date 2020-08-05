#include "stm32f1xx.h"
#include "string.h"
#include "delay.h"
#include "Usart.h"
#include "Rs485.h"
#include "LORA.h"
#include "led.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-01-01
*
*	版本： 		V1.0
*
*	说明： 		LORA模块
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

/*
	LORA模块上的按键初始化
*/
#define MOD_KEY_READ() (HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_2)?1:0)


void ModKey_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;

    __HAL_RCC_GPIOA_CLK_ENABLE();           //开启GPIOB时钟
	
    GPIO_Initure.Pin   = GPIO_PIN_2;
    GPIO_Initure.Mode  = GPIO_MODE_INPUT;  	//推挽输出
    GPIO_Initure.Pull  = GPIO_PULLUP;       //上拉
    GPIO_Initure.Speed = GPIO_SPEED_HIGH;   //高速
    HAL_GPIO_Init(GPIOA,&GPIO_Initure);    
}

/*
LORA模块上的LED初始化
*/
#define MOD_LED_ON()    HAL_GPIO_WritePin(GPIOA,GPIO_PIN_3,GPIO_PIN_RESET)
#define MOD_LED_OFF()    HAL_GPIO_WritePin(GPIOA,GPIO_PIN_3,GPIO_PIN_SET)

void ModLed_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;

    __HAL_RCC_GPIOA_CLK_ENABLE();           		//开启GPIOB时钟

    GPIO_Initure.Pin   = GPIO_PIN_3;
    GPIO_Initure.Mode  = GPIO_MODE_OUTPUT_PP;  	//推挽输出
    GPIO_Initure.Pull  = GPIO_PULLUP;          	//上拉
    GPIO_Initure.Speed = GPIO_SPEED_HIGH;    	 	//高速
    HAL_GPIO_Init(GPIOA,&GPIO_Initure);    

    MOD_LED_OFF();
}

uint8_t version;
uint8_t IRQ_RegValue=0;

int main(void)
{
    uint8_t keystate = 0;
	uint8_t LedState = 1;
	uint8_t LoraRecvBuffer[50];
	uint32_t DelayProbe = 0;

	HAL_Init();    //初始化HAL库    
	LORA_Init();   //初始化LORA芯片
	
	ModLed_Init(); //初始化LORA模块上的LED灯控制管脚
	ModKey_Init(); //初始化LORA模块上的按键管脚
    version = SX1276ReadBuffer(REG_LR_VERSION);
    if(version == 0x12)
    {//如果模块安放稳妥，亮500ms
        MOD_LED_ON();
        HAL_Delay(500);
        MOD_LED_OFF();
        HAL_Delay(500);
    }
	while(1)
	{
		if((MOD_KEY_READ() == 0)&&(keystate == 0))//按键按下  
		{
			HAL_Delay(10); //延时10ms按键消抖
			if(MOD_KEY_READ() == 0)//按键按下
			{
                keystate = 1;
                Sx1278SendLong("toggle led",strlen("toggle led"));
			}
		}
        else if(MOD_KEY_READ() == 1)
        {
            keystate = 0;
        }
             
		if(PollDelay(&DelayProbe,100))//处理接收数据，每间隔100ms查询一次
		{
			IRQ_RegValue = SX1276ReadBuffer( REG_LR_IRQFLAGS );
			if((IRQ_RegValue)&&(IRQ_RegValue != 0XFF))//读 LORA中断寄存器 REG_LR_IRQFLAGS，判断是否有中断发生
			{
				if(INT_FLG_RX_DONE == SX1278_InteruptHandler(LoraRecvBuffer))
				{//是接收中断，将接收的数据保存到LoraRecvBuffer中
					if(strstr((const char*)LoraRecvBuffer,(const char*)"toggle led"))
					{
						LedState?MOD_LED_ON():MOD_LED_OFF();
						LedState =  1-LedState;//切换灯的状态
					}
				}
			}     
		}      
	}
}

