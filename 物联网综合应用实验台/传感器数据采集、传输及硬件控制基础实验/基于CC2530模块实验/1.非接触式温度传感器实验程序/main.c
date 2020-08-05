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
*	说明： 		非接触温度模块实验
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

#include "Noncontact_Temp.h"	
#include <ioCC2530.h>
#include "OLEDIIC.h"
#include "delay.h"
#include "Rs485.h"
#include "usart.h"
#include "OLED.h"
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
    unsigned char buf[10];
    unsigned char SlaveAddress; //Contains device address
    unsigned char command;//Contains the access command
    unsigned int  data;	  //Contains data value	
    float temp;
    SlaveAddress=SA<<1;	  //Set device address
    command=RAM_Access|RAM_To; 	
  
    Hal_Init_32M(); //初始化32M时钟
    LampInit();     //初始化底座灯
    USRT1_Init();   //初始化串口1
    Rs485_Init();   //初始化485
    MLX90615_init();//初始化MLX90615
    OLED_IIC_Init();//初始化OLED_IIC
    OLED_Init();    //OLED屏初始化
    OLED_Init_UI(); //OLED屏初始化界面

    while(1)
    {
        data=MemRead(SlaveAddress,command); //Read memory
        temp=CalcTemp(data);
        sprintf((char *)buf," tmp:%0.2f  ",temp);
        OLED_P8x16Str(30,6,buf);
    }
}
