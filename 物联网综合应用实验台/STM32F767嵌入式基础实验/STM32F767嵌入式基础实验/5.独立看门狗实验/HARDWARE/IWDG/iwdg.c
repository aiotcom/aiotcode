#include "iwdg.h"

IWDG_HandleTypeDef IWDG_Handler; //独立看门狗句柄
//==========================================================
//	函数名称：	IWDG_Init
//
//	函数功能：	初始化独立看门狗
//
//	入口参数：	
//              prer:分频数:IWDG_PRESCALER_4~IWDG_PRESCALER_256
//              rlr:自动重装载值,0~0XFFF.
//
//	返回参数：	无
//
//	说明：			时间计算(大概):Tout=((4*2^prer)*rlr)/32 (ms).
//==========================================================
void IWDG_Init(unsigned char prer,unsigned int rlr)
{
    IWDG_Handler.Instance=IWDG;
    IWDG_Handler.Init.Prescaler=prer;    //设置IWDG分频系数
    IWDG_Handler.Init.Reload=rlr;        //重装载
    IWDG_Handler.Init.Window=IWDG_WINDOW_DISABLE;//关闭窗口功能

    HAL_IWDG_Init(&IWDG_Handler);  
}
   
//==========================================================
//	函数名称：	IWDG_Feed
//
//	函数功能：	喂独立看门狗
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void IWDG_Feed(void)
{   
    HAL_IWDG_Refresh(&IWDG_Handler); 	//喂狗
}


