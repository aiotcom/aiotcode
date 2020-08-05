#include "stm32f1xx.h"
#include "delay.h"
#include "led.h"
#include "Usart.h"
#include "string.h"
#include "NFC.h"
#include "PN532.h"
#include "timer.h"
#include "Rs485.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-01-01
*
*	版本： 		V1.0
*
*	说明： 		NFC模块
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

uint32_t NFC_CardID2 = 0;
uint8_t Secret_Key2[6] = {0xff,0xff,0xff,0xff,0xff,0xff};//密钥数据
uint8_t NFC_SendBuffer[32];
uint8_t Set_NFC_Memblock = 0;
uint8_t Buffer_WriteMemblock[32];
void RS485_HandlerCb(void);
int main(void)
{
    HAL_Init();  							//初始化HAL库
    PN532_Init();    					//初始化PN532    
    USART3_Init(115200);				//初始化串口2
    PN532_CSn_L;							//激活PN532
    delay_ms(10);
    PN532_CSn_H;
    SAMConfig();							//初始化芯片配置
    delay_ms(500);						//延时等待
    printf("usart3 print\r\n");
    
    UART1_Init(115200);
    Rs485_Init();
	TIM3_Init(1000-1,640-1,RS485_HandlerCb);					//初始化定时器中断周期64M/640/1000/ = 100HZ    
    while(1)
    {
        NFC_CardID2 = readPassiveTargetID(0x00);//0x00 s50卡 106kbps 寻卡

        if(NFC_CardID2)
        {		         
            if(authenticateBlock(1,NFC_CardID2,0x05,KEY_A,Secret_Key2))			//验证密钥A
            {
                if(Set_NFC_Memblock)
                {
                    Set_NFC_Memblock = 0;
                    printf("write nfc block\r\n");
                    printf("---%c%c%c\r\n",Buffer_WriteMemblock[0],Buffer_WriteMemblock[1],Buffer_WriteMemblock[2]);
                    if(writeMemoryBlock(1,05, Buffer_WriteMemblock) ) 
                    {
                        printf("write nfc block success\r\n");
                    }                        
                }
                else if(readMemoryBlock(1,0x05,&NFC_SendBuffer[4]))//读取数据
                {
                   memcpy(NFC_SendBuffer,(const void*)&NFC_CardID2,4);
                }
                

            }
        }
				
    }    
}
//==========================================================
//	函数名称：	void RS485_HandlerCb(void)
//
//	函数功能：	通过485总线获取数据处理函数
//
//	入口参数：	void
//
//	返回参数：	无
//
//	说明：		定时器3中断，回调函数，每100ms调用一次
//==========================================================
void RS485_HandlerCb(void)
{  
    if(!DataHandling_485(Addr_NFC))
    {
        if(Rx_Stack.Command == NFC_Get_All)
        {
            Rs485_Send(Addr_NFC,Addr_LCD,NFC_ID,20,NFC_SendBuffer);
        }
        else if(Rx_Stack.Command == NFC_Set_Memblock)
        {
            printf("write nfc block---\r\n");
            memcpy((void*)Buffer_WriteMemblock,(const void*)Rx_Stack.Data,16);
            Set_NFC_Memblock = 1;
        }            
    }        
}
