#ifndef _ATMOSPHERE_H
#define _ATMOSPHERE_H

#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

#define ATMOS_DEVICE_ADDR (0x76<<1)

#define ATMOS_IIC_SDA_GPIO_PORT GPIOA
#define ATMOS_IIC_SDA_GPIO_PIN  GPIO_PIN_15

#define ATMOS_IIC_SCL_GPIO_PORT GPIOA
#define ATMOS_IIC_SCL_GPIO_PIN  GPIO_PIN_5

#define ATMOS_IIC_GPIO_RCC_EN() __HAL_RCC_GPIOA_CLK_ENABLE()

#define IIC_SDA(v)    (v?	(HAL_GPIO_WritePin(ATMOS_IIC_SDA_GPIO_PORT, ATMOS_IIC_SDA_GPIO_PIN,GPIO_PIN_SET)): \
													(HAL_GPIO_WritePin(ATMOS_IIC_SDA_GPIO_PORT, ATMOS_IIC_SDA_GPIO_PIN,GPIO_PIN_RESET)))

#define IIC_SCL(v)    (v?	(HAL_GPIO_WritePin(ATMOS_IIC_SCL_GPIO_PORT, ATMOS_IIC_SCL_GPIO_PIN,GPIO_PIN_SET)): \
													(HAL_GPIO_WritePin(ATMOS_IIC_SCL_GPIO_PORT, ATMOS_IIC_SCL_GPIO_PIN,GPIO_PIN_RESET)))

#define READ_SDA  		HAL_GPIO_ReadPin(ATMOS_IIC_SDA_GPIO_PORT,ATMOS_IIC_SDA_GPIO_PIN)

//IO·½ÏòÉèÖÃ
extern void	SDA_IN(void);
extern void	SDA_OUT(void); 
extern void Atmosphere_Init(void);
extern float Atmosphere_GetPress(void);
extern uint8_t Atmosphere_TestFunc(void);

#endif

