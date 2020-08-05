/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-11
*
*	版本： 		V2.0
*
*	说明： 		温湿度模块实验
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

#include <ioCC2530.h>
#include "TM1640.h"
#include "SHT20.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "Lamp.h"
#include "Time.h"
#include "IIC.h"
#include "ADC.h"

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
    Hal_Init_32M(); //初始化32M时钟
    LampInit();     //初始化底座灯
    ADC_Init();     //初始化ADC
    IIC_Init();     //初始化IIC 
    TM1640_Init();  //初始化TM1640   
    USRT1_Init();   //初始化串口1
    Rs485_Init();   //初始化485
    Init_Timer1();  //初始化定时器1(20ms)

    while(1)
    {
        Display_Data();		//获取温湿度并显示到数码管上
    }
}
