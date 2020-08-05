/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-25
*
*	版本： 		V2.0
*
*	说明： 		定时器--LED控制实验
*
*	修改记录：	
************************************************************
************************************************************  
************************************************************
**/

#include <ioCC2530.h>
#include "delay.h"
#include "Time.h"
#include "Lamp.h"
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
    LampInit();       //底座灯初始化
    Init_Timer1();    //定时器初始化(1ms)

    while(1)
    {
        Water_Lamp(500);  //流水灯   
        
        if(count>=5000)   //5秒
        {
          LED_ON();
          delay_ms(500);
          LED_OFF();
          delay_ms(500);
          LED_ON();
          delay_ms(500);
          LED_OFF();
          count = 0;
        }
    }
}
