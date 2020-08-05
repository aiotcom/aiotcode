/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2018-10-30
*
*	版本： 		V1.0
*
*	说明： 		LED模块实验
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
#include "Stepper_Motor.h"
#include <ioCC2530.h>
#include "delay.h"
#include "Lamp.h"

//==========================================================
//	函数名称：	main()
//
//	函数功能：	程序入口函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void main(void)
{
    Hal_Init_32M();       //初始化32M时钟
    LampInit();           //底座灯初始化
    Stepper_Motor_Init(); //步进电机初始化
    
    while(1)
    {
        Stepper_Motor_Turn(1,100,80);		//最大支持40ms/圈
        delay_ms(1000);
        Stepper_Motor_Turn(0,100,80);		//最大支持40ms/圈
        delay_ms(1000);
    }
}
