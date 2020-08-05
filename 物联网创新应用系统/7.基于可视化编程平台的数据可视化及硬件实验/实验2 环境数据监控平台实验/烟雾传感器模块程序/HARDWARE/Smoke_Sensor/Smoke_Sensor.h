#ifndef _Smoke_Sensor_H
#define _Smoke_Sensor_H

#include "stm32f1xx.h"

#define Smoke_PORT 		GPIOA
#define Smoke_PIN			GPIO_PIN_2
#define Smoke_Read()  HAL_GPIO_ReadPin(Smoke_PORT,Smoke_PIN)  //PA2

extern void Smoke_Sensor_Init(void);

#endif
