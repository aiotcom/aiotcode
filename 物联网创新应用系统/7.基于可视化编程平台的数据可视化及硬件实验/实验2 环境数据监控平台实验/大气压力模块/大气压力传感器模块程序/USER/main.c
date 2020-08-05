#include "Atmosphere.h"
#include "stm32f1xx.h"
#include "string.h"
#include "delay.h"
#include "RS485.h"
#include "usart.h"	

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-12
*
*	版本： 		V2.0
*
*	说明： 		大气压力模块实验
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

int main(void)
{
	HAL_Init();          		//初始化HAL库    
	Rs485_Init();       	 	//初始化RS485
	Atmosphere_Init();  		//初始化大气压力传感器
	UART1_Init(115200);			//初始化串口一
	UART2_Init(115200);			//初始化串口二

	while(1)
	{
		Atmosphere_TestFunc();  //检测大气压力数据并输出到串口2中
		
		delay_ms(100);
	}
}



