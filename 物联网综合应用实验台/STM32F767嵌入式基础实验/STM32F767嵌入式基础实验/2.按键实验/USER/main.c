#include "delay.h"
#include "key.h"
#include "led.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2020-02-20
*
*	版本： 		V1.0
*
*	说明： 		按键函数操作实验-HAL库版本
*
*	修改记录：
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
	HAL_Init();       //初始化HAL库   
	LED_Init();				//初始化LED	
	KEY_Init();				//初始化按键

	while(1)
	{
		key_Operatio();	//按键操作
	}
}



