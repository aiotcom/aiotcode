#ifndef __Martix_Key_H
#define __Martix_Key_H

#include "stm32f7xx.h"
#include "stm32f7xx_hal.h"

/*
*	按键输出
*	1组			：Enter、1、4、7
*	2组			：0、2、5、8
*	3组			：Canel、3、6、9
*	Right组	：Right、Left、Down、UP
*/
#define	WKEY_1_PORT					GPIOA
#define	WKEY_2_PORT					GPIOA
#define	WKEY_3_PORT					GPIOA
#define	WKEY_Right_PORT			GPIOA

#define	WKEY_1_PIN					GPIO_PIN_4
#define	WKEY_2_PIN					GPIO_PIN_8
#define	WKEY_3_PIN					GPIO_PIN_3
#define	WKEY_Right_PIN			GPIO_PIN_0

#define	WKEY_1_Hight()			HAL_GPIO_WritePin(WKEY_1_PORT,WKEY_1_PIN,GPIO_PIN_SET)
#define	WKEY_1_Low()				HAL_GPIO_WritePin(WKEY_1_PORT,WKEY_1_PIN,GPIO_PIN_RESET)

#define	WKEY_2_Hight()			HAL_GPIO_WritePin(WKEY_2_PORT,WKEY_2_PIN,GPIO_PIN_SET)
#define	WKEY_2_Low()				HAL_GPIO_WritePin(WKEY_2_PORT,WKEY_2_PIN,GPIO_PIN_RESET)

#define	WKEY_3_Hight()			HAL_GPIO_WritePin(WKEY_3_PORT,WKEY_3_PIN,GPIO_PIN_SET)
#define	WKEY_3_Low()				HAL_GPIO_WritePin(WKEY_3_PORT,WKEY_3_PIN,GPIO_PIN_RESET)

#define	WKEY_Right_Hight()	HAL_GPIO_WritePin(WKEY_Right_PORT,WKEY_Right_PIN,GPIO_PIN_SET)
#define	WKEY_Right_Low()		HAL_GPIO_WritePin(WKEY_Right_PORT,WKEY_Right_PIN,GPIO_PIN_RESET)

#define WKEY_All_Hight()		HAL_GPIO_WritePin(GPIOA,WKEY_1_PIN|WKEY_2_PIN|WKEY_3_PIN|WKEY_Right_PIN,GPIO_PIN_SET)		//全部拉高
#define WKEY_All_Low()			HAL_GPIO_WritePin(GPIOA,WKEY_1_PIN|WKEY_2_PIN|WKEY_3_PIN|WKEY_Right_PIN,GPIO_PIN_RESET)	//全部拉低

/*
*	按键读取
*	UP组		：UP	、7、8、9
*	Down组	：Down、4、5、6
*	Left组	：Left、1、2、3
*	Right组	：Right、Enter、0、Canel
*/
#define	RKEY_Up_PORT				GPIOA
#define	RKEY_Down_PORT			GPIOA
#define	RKEY_Left_PORT			GPIOA
#define	RKEY_Right_PORT			GPIOA

#define	RKEY_Up_PIN					GPIO_PIN_15
#define	RKEY_Down_PIN				GPIO_PIN_11
#define	RKEY_Left_PIN				GPIO_PIN_10
#define	RKEY_Right_PIN			GPIO_PIN_9

#define	RKEY_Up_Read()			HAL_GPIO_ReadPin(RKEY_Up_PORT,RKEY_Up_PIN)
#define	RKEY_Down_Read()		HAL_GPIO_ReadPin(RKEY_Down_PORT,RKEY_Down_PIN)
#define	RKEY_Left_Read()		HAL_GPIO_ReadPin(RKEY_Left_PORT,RKEY_Left_PIN)
#define	RKEY_Right_Read()		HAL_GPIO_ReadPin(RKEY_Right_PORT,RKEY_Right_PIN)

extern uint16_t Key_value;
extern void KEY_ConFig(void); //获取按键
extern void KEY_Init(void);  	//初始化按键配置

#endif




