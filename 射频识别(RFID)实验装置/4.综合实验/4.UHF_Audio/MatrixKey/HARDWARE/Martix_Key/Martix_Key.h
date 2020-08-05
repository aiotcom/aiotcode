#ifndef __Martix_Key_H
#define __Martix_Key_H
#include "stm32f1xx_hal.h"

#define		LED2_ON()			HAL_GPIO_WritePin(GPIOA,GPIO_PIN_0,GPIO_PIN_RESET);
#define		LED2_OFF()		HAL_GPIO_WritePin(GPIOA,GPIO_PIN_0,GPIO_PIN_SET);

#define 	B0_Read()   	HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_0)
#define 	B1_Read()   	HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_1) 
#define 	B13_Read()   	HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_13)
#define 	B14_Read()   	HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_14)
enum{
    KEY_0,
    KEY_1,
    KEY_2,
    KEY_3,
    KEY_4,
    KEY_5,
    KEY_6,
    KEY_7,
    KEY_8,
    KEY_9,
    KEY_ENTER,
    KEY_CANNCEL,
    KEY_UP,
    KEY_DOWN,
    KEY_RIGHT,
    KEY_LEFT,
    KEY_NULL //没有按键按下
};
extern uint16_t Key_value;
uint8_t KEY_Process(void); 	//获取按键
void KEY_Init(void);  	//初始化按键配置

#endif

