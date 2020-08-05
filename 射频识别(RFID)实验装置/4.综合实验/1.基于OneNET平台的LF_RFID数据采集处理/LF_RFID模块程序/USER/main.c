#include "stm32f1xx.h"
#include "delay.h"
#include "led.h"
#include "key.h"
#include "timer.h"
#include "EM4095.h"
#include "usart.h"
#include "Rs485.h"
/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-17
*
*	版本： 		V2.0
*
*	说明： 		LF-RFID模块
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/
uint8_t CardID[5];

int main(void)
{
	HAL_Init();                   //初始化HAL库  
	Rs485_Init();    							//初始化485
	EM4095_Init();								//初始化EM4095
	UART1_Init(115200);						//初始化串口1
	TIM2_Init(2000-1,64-1);				//初始化定时器2(2ms中断)

	while(1)
	{
		if(EM4095_SearchHdr(CardID) == GET_ID)
		{
				Rs485_Send(Addr_LF_RFID,Addr_LCD,LF_RFID_ID,4,CardID);			//发送ID数据
		}
  }
}





