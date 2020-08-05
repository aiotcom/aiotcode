#include "Rs485.h"
#include "usart.h"
#include "delay.h"
#include "PN532.h"
#include "NFC.h"

/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2020-02-20
*
*	版本： 		V1.0
*
*	说明： 		STM32F767-NFC模块实验
*
*	修改记录：
************************************************************
************************************************************
************************************************************
**/

uint32_t NFC_CardID2 = 0;
uint8_t Secret_Key2[6] = {0xff,0xff,0xff,0xff,0xff,0xff};//密钥数据
uint8_t NFC_Data[20];

int main(void)
{
	HAL_Init();       		//初始化HAL库   
	PN532_Init();    			//初始化PN532
	Rs485_Init();					//初始化485
	UART7_Init(115200);		//初始化串口七
	PN532_CSn_L;					//激活PN532
	delay_ms(10);
	PN532_CSn_H;
	SAMConfig();					//初始化芯片配置
	delay_ms(500);				//延时等待

	while(1)
	{
		NFC_CardID2 = readPassiveTargetID(0x00);//0x00 s50卡 106kbps 寻卡

		if(NFC_CardID2)
		{		
			if(authenticateBlock(1,NFC_CardID2,0x05,KEY_A,Secret_Key2))			//验证密钥A
			{
				if(readMemoryBlock(1,0x05,NFC_Data))//读取数据
				{

				}
			}
		}
	}
}



