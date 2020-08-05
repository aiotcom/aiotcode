/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-24
*
*	版本： 		V2.0
*
*	说明： 		按键控制实验
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

#include <ioCC2530.h>
#include "delay.h"
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
//	说明：		
//==========================================================
void main(void)
{
    Hal_Init_32M();   //初始化32M时钟
    LED_Init();       //LED初始化
    KEY_Init();       //按键初始化
    LampInit();       //底座灯初始化

    while(1)
    {
      key_Operatio(); //按键操作
    }
}
