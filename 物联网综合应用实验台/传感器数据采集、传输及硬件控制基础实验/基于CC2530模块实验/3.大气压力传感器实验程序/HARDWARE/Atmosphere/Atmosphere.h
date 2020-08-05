#ifndef _ATMOSPHERE_H
#define _ATMOSPHERE_H

#include <ioCC2530.h>
#include "delay.h"

#define ATMOS_DEVICE_ADDR (0x76<<1)

#define ATMOS_IIC_SDA_GPIO_PIN  P0_0
#define ATMOS_IIC_SCL_GPIO_PIN  P0_1

#define IIC_SDA(v)              (v?(ATMOS_IIC_SDA_GPIO_PIN = 1):(ATMOS_IIC_SDA_GPIO_PIN = 0))
#define IIC_SCL(v)              (v?(ATMOS_IIC_SCL_GPIO_PIN = 1):(ATMOS_IIC_SCL_GPIO_PIN = 0))

#define READ_SDA  P0_0

extern void Atmosphere_Init(void);
extern float Atmosphere_GetPress(void);
extern uint8_t Atmosphere_TestFunc(void);

#endif

