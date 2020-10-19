#ifndef __Rs485_H
#define __Rs485_H
#include "stm32f1xx_hal.h"

//模式控制
#define RS485_TX_EN		 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_SET);	//485模式控制发送.
#define RS485_RX_EN		 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_RESET);	//485模式控制接收;

void RS485_Init(void);  //初始化485
void RS485_Send(uint8_t *pdata,uint8_t len);
void RS485_Printf(uint8_t *pdata,uint32_t Data);
#endif

