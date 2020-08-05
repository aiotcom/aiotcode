#ifndef __Rs485_H
#define __Rs485_H
#include "stm32f1xx_hal.h"
#include "stdio.h"
#define Rs485_Printf(fmt,...)      Rs485_Config(1); HAL_Delay(10); printf(fmt,__VA_ARGS__); HAL_Delay(20); Rs485_Config(0);
//模式控制
#define RS485_TX_EN		 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_SET);	//485模式控制发送.
#define RS485_RX_EN		 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_RESET);	//485模式控制接收;

void Rs485_Config(uint8_t fag); //控制485操作

void Rs485_Init(void);  //初始化485

#endif

