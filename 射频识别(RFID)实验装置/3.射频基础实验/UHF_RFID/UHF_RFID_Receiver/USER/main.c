#include "stm32f1xx.h"
#include "delay.h"
#include "led.h"
#include "Rs485.h"
#include "Usart.h"
#include "string.h"
#include "CC2500.h"
#include "CC2500_reg.h"
#include "Platform_RGB_LED.h"
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
#define MSG_HEAD_LEN  9
uint8_t CC2500_Version;
#define TX 0
uint8_t RxBuffer[32];
int main(void)
{ 
    uint8_t ledstate = 0;
    HAL_Init(); 
    CC2500_Init();
    Platform_RGB_LED_Init();
    CC2500_ModeRx();   
    
    USART3_Init(115200);
    CC2500_Version  = CC2500_ReadStatus();  
    printf("ver=%d\r\n",CC2500_Version);    
    while(1)
    {                     
        if(CC2500_RevPacket(RxBuffer) == SUCCESS)
        {
            if(ledstate == 0)
            {
                Platform_RGB_LED_Red();
                ledstate = 1;
            }
            else if(ledstate == 1)
            {
                Platform_RGB_LED_Green();
                ledstate = 2;
            }            
            else if(ledstate == 2)
            {
                Platform_RGB_LED_Blue();
                ledstate = 0;
            }
        }
    }//while(1)
}

