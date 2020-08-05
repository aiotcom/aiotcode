#include "RS485_Handler.h"

#define RS485_HANDLER_MSG_EVT  0x0003
uint8 RS485_Handler_TaskId;
uint8 ReceiveBuffer[64]={0};
extern uint8_t SHT20_Data[ ];
static uint8 RxLen,state = 0,count=0;
void RS485_Handler_Init( uint8 task_id )
{
	RS485_Handler_TaskId = task_id;
	Rs485_Init();
	osal_start_timerEx( RS485_Handler_TaskId, RS485_HANDLER_MSG_EVT,50);
}

uint16 RS485_Handler_ProcessEvent( uint8 task_id, uint16 events )
{
  if ( events & SYS_EVENT_MSG )
  {
    return (events ^ SYS_EVENT_MSG);
  } 
  
  if ( (events & RS485_HANDLER_MSG_EVT) == RS485_HANDLER_MSG_EVT )
  {
    if(state == 0)
	{
		if(Hal_UART_RxBufLen(HAL_UART_PORT_1))
		{
		  	count = 0;
			state = 1;
		}
	}
	else if(state == 1)
	{
	  	RxLen = Hal_UART_RxBufLen(HAL_UART_PORT_1);
		HalUARTRead(HAL_UART_PORT_1,ReceiveBuffer,RxLen);
		while(count<RxLen)
		{
			Rs485_Receive(ReceiveBuffer[count]);
			count++;
		}
		if(!DataHandling_485(Addr_ZigBee))
		{
			Rs485_Send(Addr_ZigBee,Addr_IPV4,SHT20_All,2,SHT20_Data);
		}
		state = 0;
	}
	osal_start_timerEx( RS485_Handler_TaskId, RS485_HANDLER_MSG_EVT,20);
	return (events ^ RS485_HANDLER_MSG_EVT);
  }
  
  return 0;
}
