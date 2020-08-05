#ifndef __LED_MODE_H
#define __LED_MODE_H 			   

#include <ioCC2530.h>
#include "hal_types.h"
#include "Hal_Defs.H"

#define KEY_PRESS   0x00
#define KEY_RELASE  0x01

#define S1 P1_5
#define S2 P1_4
#define S3 P0_0
#define S4 P0_1

#define KEY_S1 0x01
#define KEY_S2 0x02
#define KEY_S3 0x04
#define KEY_S4 0x08

void LedMode_Init(void);
void Led2_On(void);
void Led2_Off(void);
uint8   Key_ReadS4(void);
uint8  key_handler(void);
#endif