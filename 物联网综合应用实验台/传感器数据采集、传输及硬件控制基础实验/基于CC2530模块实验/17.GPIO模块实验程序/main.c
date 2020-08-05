/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2020-01-09
*
*	版本： 		V2.0
*
*	说明： 		LED模块实验
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

#include <ioCC2530.h>
#include "Time.h"
#include "Lamp.h"
#include "KEY.h"
#include "LED.h"

//==========================================================
//	函数名称：	main()
//
//	函数功能：	程序入口函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		LED模块程序
//==========================================================
void main(void)
{
    Hal_Init_32M();   //初始化32M时钟
    LED_Init();       //初始化风扇
    KEY_Init();       //初始化按键
    LampInit();       //初始化底座灯
    Init_Timer1();    //初始化定时器1

    while(1)
    {
       key_Operatio();//检测按键按下后执行相应的命令
    }
}
