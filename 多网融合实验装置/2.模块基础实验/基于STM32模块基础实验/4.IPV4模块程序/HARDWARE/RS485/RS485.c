#include "RS485.h"	
#include "USART.h"
#include "delay.h"
//==========================================================
//	函数名称：	RS485_Init
//
//	函数功能：	初始化485
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void RS485_Init(void)
{
    GPIO_InitTypeDef GPIO_Initure;    

    __HAL_RCC_GPIOA_CLK_ENABLE();           				    //开启GPIOA时钟

    GPIO_Initure.Pin = GPIO_PIN_8;							    //PA8
    GPIO_Initure.Mode = GPIO_MODE_OUTPUT_PP;				    //推挽输出
    GPIO_Initure.Speed = GPIO_SPEED_FREQ_LOW; 					//低速
    HAL_GPIO_Init(GPIOA, &GPIO_Initure);

    RS485_RX_EN;	                                            //设置RS485处于接收模式
    
    UART1_Init(115200);                                         //初始化串口1，采用的是UART1转RS485模式
}
//==========================================================
//	函数名称：	RS485_Send()
//
//	函数功能：	通过RS485总线发送数据
//
//	入口参数：	uint8_t *pdata,指向等待发送数据的指针，uint8_t len等待发送的数据长度
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void RS485_Send(uint8_t *pdata,uint8_t len)
{
    RS485_TX_EN;                  //开启RS485发送模式
    delay_us(10);                  //等待发送模式开启完成
    USART1_SendStream(pdata,len);
    delay_us(300); 
    RS485_RX_EN;                  //数据发送完成后，进入接收模式   
}
//==========================================================
//	函数名称：	RS485_Send()
//
//	函数功能：	通过RS485总线发送数据
//
//	入口参数：	uint8_t *pdata,指向等待发送数据的指针，uint8_t len等待发送的数据长度
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void RS485_Printf(uint8_t *pdata,uint32_t Data)
{
    RS485_TX_EN;                  //开启RS485发送模式
    delay_us(10);                  //等待发送模式开启完成
    printf((const char*)pdata,Data);
    delay_us(300); 
    RS485_RX_EN;                  //数据发送完成后，进入接收模式   
}

