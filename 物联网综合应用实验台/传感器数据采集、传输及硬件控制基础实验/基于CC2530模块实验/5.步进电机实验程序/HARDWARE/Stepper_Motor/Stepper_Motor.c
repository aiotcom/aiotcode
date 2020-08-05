#include "Stepper_Motor.h"
#include "stdlib.h"
#include "string.h"
#include "stdio.h"

//==========================================================
//	函数名称：	Stepper_Motor_Init()
//
//	函数功能：	步进电机初始化
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Stepper_Motor_Init(void)
{
   P0DIR |= 0x03;      //P0.0、P0.1定义为输出
   P1DIR |= 0x03;      //P1.0、P1.1定义为输出
	
  A1LOW();A0LOW();B1LOW();B0LOW();//初始化拉低
}

//==========================================================
//	函数名称：	Stepper_Motor_Set()
//
//	函数功能：	设置步进电机转动节拍
//
//	入口参数：	A1:	A+
//			A0:	A-
//			B1:	B+
//			B0:	B-
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Stepper_Motor_Set(uint8_t A1,uint8_t A0,uint8_t B1,uint8_t B0)
{
    if(A1) A1HIGH();
    else A1LOW();
    
    if(A0) A0HIGH();
    else A0LOW();
    
    if(B1) B1HIGH();
    else B1LOW();
    
    if(B0) B0HIGH();
    else B0LOW();
}

//==========================================================
//	函数名称：	Stepper_Motor_Turn()
//
//	函数功能：	设置步进电机转速
//
//	入口参数：	Direction:旋转方向 1：顺时针  0：逆时针
//			Cycle_Number：转动圈数
//			Delay: 	转一圈耗时(ms)
//
//	返回参数：	无
//
//	说明：			angle
//==========================================================
void Stepper_Motor_Turn(uint8_t Direction,uint16_t Cycle_Number,uint16_t Delay)
{
    static uint32_t i = 0;
    static uint16_t Time = 0;
    
    if(Delay>=40)
      Time = Delay/20;
    else
      Time = 2;
    
    if(Direction)
    {
        for(i=0;i<(Cycle_Number*5);i++)
        {
            Stepper_Motor_Set(1,0,0,0);//第一拍
            delay_ms(Time);

            Stepper_Motor_Set(0,0,1,0);//第二拍
            delay_ms(Time);

            Stepper_Motor_Set(0,1,0,0);//第三拍
            delay_ms(Time);

            Stepper_Motor_Set(0,0,0,1);//第四拍
            delay_ms(Time);
        }
    }
    else
    {
        for(i=0;i<(Cycle_Number*5);i++)
        {
            Stepper_Motor_Set(0,0,0,1);//第一拍
            delay_ms(Time);

            Stepper_Motor_Set(0,1,0,0);//第二拍
            delay_ms(Time);

            Stepper_Motor_Set(0,0,1,0);//第三拍
            delay_ms(Time);

            Stepper_Motor_Set(1,0,0,0);//第四拍
            delay_ms(Time);
        }
    }
    A1LOW();A0LOW();B1LOW();B0LOW();//初始化拉低
}


