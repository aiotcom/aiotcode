#ifndef _FLAME_H
#define _FLAME_H

#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

#define Flame1_PORT 		GPIOA
#define Flame1_PIN			GPIO_PIN_9

#define Flame2_PORT 		GPIOA
#define Flame2_PIN			GPIO_PIN_10

#define Flame1_Read()   HAL_GPIO_ReadPin(Flame1_PORT,Flame1_PIN)  //传感器1
#define Flame2_Read()   HAL_GPIO_ReadPin(Flame2_PORT,Flame2_PIN)  //传感器2

extern void Flame_Init(void);

#endif
