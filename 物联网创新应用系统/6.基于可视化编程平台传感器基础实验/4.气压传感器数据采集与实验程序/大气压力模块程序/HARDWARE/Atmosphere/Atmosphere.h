#ifndef _ATMOSPHERE_H
#define _ATMOSPHERE_H

#include "stm32f1xx_hal.h"

#define ATMOS_DEVICE_ADDR (0x76<<1)

#define ATMOS_IIC_SDA_GPIO_PORT GPIOB
#define ATMOS_IIC_SDA_GPIO_PIN  GPIO_PIN_7

#define ATMOS_IIC_SCL_GPIO_PORT GPIOB
#define ATMOS_IIC_SCL_GPIO_PIN  GPIO_PIN_6

#define ATMOS_IIC_GPIO_RCC_EN() __HAL_RCC_GPIOB_CLK_ENABLE()

#define IIC_SDA(v)             (v?(ATMOS_IIC_SDA_GPIO_PORT->BSRR = ATMOS_IIC_SDA_GPIO_PIN): \
                                  (ATMOS_IIC_SDA_GPIO_PORT->BRR  = ATMOS_IIC_SDA_GPIO_PIN))

#define IIC_SCL(v)             (v?(ATMOS_IIC_SCL_GPIO_PORT->BSRR = ATMOS_IIC_SCL_GPIO_PIN): \
                                  (ATMOS_IIC_SCL_GPIO_PORT->BRR  = ATMOS_IIC_SCL_GPIO_PIN))

//IO·½ÏòÉèÖÃ
#define SDA_IN()  ATMOS_IIC_SDA_GPIO_PORT->CRL &= (uint32_t)0X0FFFFFFF;ATMOS_IIC_SDA_GPIO_PORT->CRL |= (uint32_t)(8<<28);
#define SDA_OUT() ATMOS_IIC_SDA_GPIO_PORT->CRL &= (uint32_t)0X0FFFFFFF;ATMOS_IIC_SDA_GPIO_PORT->CRL |= (uint32_t)(3<<28); 
#define READ_SDA  ((ATMOS_IIC_SDA_GPIO_PORT->IDR&ATMOS_IIC_SDA_GPIO_PIN)?1:0)

extern void Atmosphere_Init(void);
extern float Atmosphere_GetPress(void);
extern uint8_t Atmosphere_TestFunc(void);

#endif

