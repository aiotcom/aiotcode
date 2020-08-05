#ifndef __Bsp_Stepper_Motor_H
#define __Bsp_Stepper_Motor_H

#include "stm32f1xx_hal.h"

#define A0_PORT 		GPIOB
#define A1_PORT 		GPIOB
#define B0_PORT 		GPIOA
#define B1_PORT 		GPIOA

#define A0_PIN 			GPIO_PIN_6
#define A1_PIN 			GPIO_PIN_7
#define B0_PIN 			GPIO_PIN_1
#define B1_PIN 			GPIO_PIN_0

#define A0HIGH() 		HAL_GPIO_WritePin(A0_PORT, A0_PIN, GPIO_PIN_SET)
#define A0LOW() 		HAL_GPIO_WritePin(A0_PORT, A0_PIN, GPIO_PIN_RESET)

#define A1HIGH()  	HAL_GPIO_WritePin(A1_PORT, A1_PIN, GPIO_PIN_SET)
#define A1LOW()  		HAL_GPIO_WritePin(A1_PORT, A1_PIN, GPIO_PIN_RESET)

#define B0HIGH()  	HAL_GPIO_WritePin(B0_PORT, B0_PIN, GPIO_PIN_SET)
#define B0LOW()  		HAL_GPIO_WritePin(B0_PORT, B0_PIN, GPIO_PIN_RESET)

#define B1HIGH()  	HAL_GPIO_WritePin(B1_PORT, B1_PIN, GPIO_PIN_SET)
#define B1LOW()  		HAL_GPIO_WritePin(B1_PORT, B1_PIN, GPIO_PIN_RESET)

extern void Stepper_Motor_Init(void);  //步进电机初始化
extern void Stepper_Motor_Set(uint8_t A1,uint8_t A0,uint8_t B1,uint8_t B0);
extern void Stepper_Motor_Turn(uint8_t Direction,uint16_t Cycle_Number,uint16_t Delay);

#endif /*Stepper_Motor_H */


