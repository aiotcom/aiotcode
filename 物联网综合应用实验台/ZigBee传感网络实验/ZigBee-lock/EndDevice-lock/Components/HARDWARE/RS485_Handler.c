#include "RS485_Handler.h"

uint8 RS485_Handler_TaskId;
uint8 ReceiveBuffer[64]={0};
uint8_t sensor_data[16];
static uint8 RxLen,state = 0;

void RS485_Handler_Init( uint8 task_id )
{
	RS485_Handler_TaskId = task_id;
	Rs485_Init();
//	osal_start_timerEx( RS485_Handler_TaskId, RS485_HANDLER_MSG_EVT,100);
}

uint16 RS485_Handler_ProcessEvent( uint8 task_id, uint16 events )
{
  if ( events & SYS_EVENT_MSG )
  {
    return (events ^ SYS_EVENT_MSG);
  } 
  
  if( (events & SEND_LOCK_CONTROL_EVENT) == SEND_LOCK_CONTROL_EVENT)
  {
	printf("send lock cmd%d\r\n",LockCmd);
	Rs485_Send(Addr_NULL,Addr_Lock,LockCmd,0,0);

	return events ^ SEND_LOCK_CONTROL_EVENT;
  }  
  return 0;
}
