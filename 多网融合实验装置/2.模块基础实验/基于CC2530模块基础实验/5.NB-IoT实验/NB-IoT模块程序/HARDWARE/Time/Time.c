#include "Time.h"

uint32_t Task_Count = 0;//分时任务计数值

//==========================================================
//	函数名称：	Init_Timer1()
//
//	函数功能：	定时器1初始化函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：
//==========================================================
void Init_Timer1(void)
{
  T1CC0L = 0x7D;        //设置最大计数值的低8位
  T1CC0H = 0x00;        //设置最大计数值的高8位
  T1CCTL0 |= 0x04;      //开启通道0的输出比较模式
  T1IE = 1;             //使能定时器1中断
  T1OVFIM = 1;          //使能定时器1溢出中断
  EA = 1;               //使能总中断
  T1CTL = 0x0e;         //分频系数是128,模模式
}

//==========================================================
//	函数名称：	Timer1_Sevice()
//
//	函数功能：	定时器1服务函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
#pragma vector = T1_VECTOR
__interrupt void Timer1_Sevice()
{
  Task_Count++;
  T1STAT &= ~0x01;              //清除定时器1通道0中断标志 
}
