#include "stm32f1xx.h"
#include "delay.h"
#include "led.h"
#include "Rs485.h"
#include "Usart.h"
#include "string.h"
#include "CC2500.h"
#include "CC2500_reg.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2018-01-01
*
*	版本： 		V1.0
*
*	说明： 		跑马灯库函数操作实验-HAL库版本
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
const uint8_t MSG_HEAD[]="mrk->lora";
unsigned char recv[1250];
uint8_t CC2500_Version;
int main(void)
{ 
    HAL_Init(); 
    Rs485_Init();
    UART1_Init(115200);
    CC2500_Init();
  
    delay_ms(10); 
    printf("cc2500 TX Mode\r\n");
    
    delay_ms(10); 
    CC2500_Version = CC2500_ReadReg(VERSION);
    while(1)
    {           
        HAL_Delay(500);
        CC2500_SendPacket("toggle",strlen((const void*)"toggle"));
    }//while(1)
}

