#ifndef __Bsp_Stepper_Motor_H
#define __Bsp_Stepper_Motor_H

#include "delay.h"

#include <ioCC2530.h>

#define A0HIGH() 	P0_1 = 1
#define A0LOW() 	P0_1 = 0

#define A1HIGH()  	P0_0 = 1
#define A1LOW()  	P0_0 = 0

#define B0HIGH()  	P1_0 = 1
#define B0LOW()  	P1_0 = 0

#define B1HIGH()  	P1_1 = 1
#define B1LOW()  	P1_1 = 0

extern void Stepper_Motor_Init(void);  //步进电机初始化
extern void Stepper_Motor_Set(uint8_t A1,uint8_t A0,uint8_t B1,uint8_t B0);
extern void Stepper_Motor_Turn(uint8_t Direction,uint16_t Cycle_Number,uint16_t Delay);

#endif /*Stepper_Motor_H */


