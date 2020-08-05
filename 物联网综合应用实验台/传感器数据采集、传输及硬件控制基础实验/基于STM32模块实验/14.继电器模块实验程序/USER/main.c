#include "Relay.h"
#include "delay.h"

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
*	说明： 		STM32F767-继电器模块实验
*
*	修改记录：
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
	HAL_Init();       //初始化HAL库   
	Relay_Init();   	//初始化继电器

	while(1)
	{
			RELAY1_OPEN();	 //打开继电器1
			delay_ms(2000);
		
			RELAY1_CLOSE();  //关闭继电器1
			delay_ms(2000);

			RELAY2_OPEN();	 //打开继电器2
			delay_ms(2000);
		
			RELAY2_CLOSE();  //关闭继电器2
			delay_ms(2000);
	}
}



