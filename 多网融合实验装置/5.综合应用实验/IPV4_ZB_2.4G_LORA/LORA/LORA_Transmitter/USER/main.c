#include "stm32f1xx.h"
#include "string.h"
#include "delay.h"
#include "Usart.h"
#include "Rs485.h"
#include "LORA.h"
#include "led.h"
#include "TIMER.h"
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
uint8_t LoraSendBuffer[32],UpdataFlg=0;
void RS485_HandlerCb(void);
int main(void)
{
	uint8_t LedState = 1;

	HAL_Init();    //初始化HAL库    
	LORA_Init();   //初始化LORA芯片

	Rs485_Init();				    //初始化485
    TIM3_Init(10000-1,640-1,RS485_HandlerCb);//中断频率64M/640/10000=10HZ，中断频率10HZ
	UART1_Init(115200);				//初始化串口1
    USART3_Init(115200);            //printf 打印信息，PB10->TX,PB11->RX,通常只使用，TX功能
	
	ModLed_Init(); //初始化LORA模块上的LED灯控制管脚
	ModKey_Init(); //初始化LORA模块上的按键管脚
    version = SX1276ReadBuffer(REG_LR_VERSION);
    if(version == 0x12)
    {//如果模块安放稳妥，亮500ms
        MOD_LED_ON();
        HAL_Delay(500);
        MOD_LED_OFF();
    }
	while(1)
	{
        HAL_Delay(2000);
        LoraSendBuffer[0] = strlen((const char *)"LORA_Channel:hello world!")+1;
        sprintf((void*)&LoraSendBuffer[1],"%s\r\n","LORA_Channel:hello world!");
        Sx1278SendLong(LoraSendBuffer,LoraSendBuffer[0]);                 
	}
}
//==========================================================
//	函数名称：	void RS485_HandlerCb(void)
//
//	函数功能：	通过485总线获取数据处理函数
//
//	入口参数：	void
//
//	返回参数：	无
//
//	说明：		定时器3中断，回调函数，每100ms调用一次
//==========================================================
void RS485_HandlerCb(void)
{

}
