#ifndef __SW420_H
#define __SW420_H 			   

#include "stm32f1xx_hal.h" 
#include "stm32f1xx.h"

#define  	SW420_GPIO_PORT  		GPIOA

#define		SW420_OUT0					GPIO_PIN_0			//输出口0
#define		SW420_OUT1					GPIO_PIN_1			//输出口1

#define 	SW420_OUT0_STATE()  HAL_GPIO_ReadPin(SW420_GPIO_PORT,SW420_OUT0)	//读取输出口0
#define 	SW420_OUT1_STATE()  HAL_GPIO_ReadPin(SW420_GPIO_PORT,SW420_OUT1)	//读取输出口1

extern uint8_t SW420_fig;
extern uint8_t Shock_Fre[];			//震动频率
extern void SW420_Init(void); 	//震动传感器初始化
extern void SW420_Fig(void);		//震动检测

#endif


