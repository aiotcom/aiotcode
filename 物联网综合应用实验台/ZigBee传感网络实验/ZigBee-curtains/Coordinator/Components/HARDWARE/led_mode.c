#include "led_mode.h"
#include "stdio.h"
/*
初始化LED模块上的S4->P1.6按键，LED2->P1.2按键的IO串口口
*/
void LedMode_Init(void)
{
    //LED灯IO口初始化
    P1SEL &= ~BV(2);     //设置P1.2为普通IO口  
    P1DIR |= BV(2);      //P1.2定义为输出

    //按键IO口初始化    
    P1SEL &= ~(BV(5)|BV(4));     //设置P1.5为普通IO口  
    P1DIR &= ~(BV(5)|BV(4));      //P1.5定义为输入 
    P1INP &= ~(BV(5)|BV(4));     //打开P1.5上拉电阻

    P0SEL &= ~(BV(0)|BV(1));     //设置P1.5为普通IO口  
    P0DIR &= ~(BV(0)|BV(1));      //P1.5定义为输入 
    P0INP &= ~(BV(0)|BV(1));     //打开P1.5上拉电阻	
	
}
/*
LED模块上LED2点亮
*/
void Led2_On(void)   
{
  P1_2 = 0;
}
/*
LED模块上LED2熄灭
*/
void Led2_Off(void)  
{
  P1_2 = 1;
}
/*
读LED模块上的按键S4
*/
uint8 Key_ReadS4(void)
{
  return P1_6?KEY_RELASE:KEY_PRESS;
}
/*
读取所有的按键
*/
uint8 key_all_read(void)
{
	uint8 kv = 0xf0;
	kv |= S1;
	kv |= S2<<1;
	kv |= S3<<2;
	kv |= S4<<3;
	
	return ~kv;
}
/*
按键处理
*/
uint8 key_handler(void)
{
    static unsigned char state = KEY_RELASE,prekv = 0,kv = 0;
	
	kv = key_all_read();	
	
	if(KEY_RELASE == state)
	
	{
		
		if((kv)&&(prekv == kv))
		
		{
	
			printf("key pressed\r\n");
		
			state = KEY_PRESS;
			return kv;
						
		
		}		
		
	}
	
	else if((KEY_PRESS == state)&&(kv == 0))
	
	{
		
		printf("key relase\r\n");
	
		state = KEY_RELASE;
	
	}
	prekv = kv;
	
	return 0;
	

}