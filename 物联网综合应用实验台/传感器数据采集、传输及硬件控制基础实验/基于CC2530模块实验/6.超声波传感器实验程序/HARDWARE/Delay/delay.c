#include "delay.h"

//==========================================================
//	函数名称：	delay_ms()
//
//	函数功能：	毫秒延时函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void delay_ms(uint32_t nms)
{		
    uint16_t i,j;
    
    for (i=0; i<nms; i++)
        for (j=0; j<1035; j++);
}

//==========================================================
//	函数名称：	delay_us()
//
//	函数功能：	微秒延时函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void delay_us(uint32_t nus)
{		
    uint8_t i;
    
    for (i=0; i<nus; i++);
}


//==========================================================
//	函数名称：	Hal_Init_32M()
//
//	函数功能：	32M时钟初始化
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Hal_Init_32M(void)
{
    CLKCONCMD &= ~0x40;         // 设置系统时钟源为 32MHZ晶振
    while(CLKCONSTA & 0x40);    // 等待晶振稳定
    CLKCONCMD &= ~0x47;         // 设置系统主时钟频率为 32MHZ
}



