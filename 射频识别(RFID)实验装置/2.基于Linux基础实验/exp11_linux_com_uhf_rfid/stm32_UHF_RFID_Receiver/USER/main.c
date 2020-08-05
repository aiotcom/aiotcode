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
uint8_t CC2500_Version;
uint8_t CC2500_ReceiveBuffer[32],CC2500_ReceiveLen;
uint8_t CC2500_SendBuffer[32];
int main(void)
{ 
    uint8_t receive_status;
    HAL_Init(); 
    Rs485_Init();
    UART1_Init(115200);
    USART3_Init(115200);
    CC2500_Init();
    CC2500_ModeRx();   
    printf("cc2500 RX Mode\r\n");    
 
    Platform_RGB_LED_Init();
    CC2500_Version  = CC2500_ReadStatus(); 
    printf("Status:%x\r\n",CC2500_Version);   
    while(1)
    {                   
        receive_status = CC2500_RevPacket(&CC2500_ReceiveLen,CC2500_ReceiveBuffer);
        
        if(SUCCESS == receive_status)
        {
            printf("==%s\r\n",CC2500_ReceiveBuffer);
            if(strstr((const char*)CC2500_ReceiveBuffer,(const char*)"led on"))
            {
                Platform_RGB_LED_Red();
            }
            else if(strstr((const char*)CC2500_ReceiveBuffer,(const char*)"led off"))
            {
                Platform_RGB_LED_Blackout();
            }
        }
    }//while(1)
}

