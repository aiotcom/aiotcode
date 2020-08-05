#include "stdlib.h"
#include "string.h"
#include "stdio.h"
#include "Rs485.h"
#include "usart.h"

//==========================================================
//	函数名称：	Rs485_Init()
//
//	函数功能：	初始化485
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：			 
//==========================================================
void Rs485_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;
	
    __HAL_RCC_GPIOF_CLK_ENABLE();           	//开启GPIOF时钟

		GPIO_Initure.Pin = GPIO_PIN_8;						//PF8
		GPIO_Initure.Mode = GPIO_MODE_OUTPUT_PP;	//推挽输出
		GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW; //低速
		HAL_GPIO_Init(GPIOF, &GPIO_Initure);

		RS485_RX_EN();   													//初始化为接收模式
}

//==========================================================
//	函数名称：	Rs485_Send()
//
//	函数功能：	发送数据到485总线上
//
//	入口参数：	*pData:数据
//							Len		:数据长度
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Rs485_Send(uint8_t *pData,uint8_t Len)
{
	RS485_TX_EN();		//开启485发送
	Rs485_delay_ms(2);
	HAL_UART_Transmit(&UART7_Handler,pData,Len,1000);//485发送数据
	Rs485_delay_ms(1);
	RS485_RX_EN();		//开启485接收
}

//==========================================================
//	函数名称：	Rs485_delay_ms()
//
//	函数功能：	毫秒延时函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Rs485_delay_ms(unsigned int nms)
{
	unsigned int i = 0,j = 0;
	
	for(i = 0;i<nms;i++)
	{
		for(j = 0;j<9600;j++)
		{;}
	}
}


