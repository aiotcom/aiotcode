#include "stdlib.h"
#include "string.h"
#include "stdio.h"
#include "Rs485.h"
#include "usart.h"
#include "delay.h"

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
    P1SEL &= ~0x80;     //设置P1.3为普通IO口  
    P1DIR |= 0x08;      // P1.3定义为输出
    RS485_RX_EN();      //初始化为接收模式
}

//==========================================================
//	函数名称：	Rs485_Send()
//
//	函数功能：	发送数据到485总线上
//
//	入口参数：	*pData  :数据
//			Len	:数据长度
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Rs485_Send(uint8_t *pData,uint8_t Len)
{
  RS485_TX_EN();//开启485发送
  delay_ms(1);
  USART1_SendString(pData,Len);    //485发送数据
  delay_us(100);
  RS485_RX_EN();//开启485接收
}
