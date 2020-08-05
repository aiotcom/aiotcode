#include "RS485_Handler.h"

uint8 RS485_Handler_TaskId;
uint8 ReceiveBuffer[64]={0};
uint8_t sensor_data[16];

void RS485_Handler_Init( uint8 task_id )
{
	RS485_Handler_TaskId = task_id;
	Rs485_Init();
}

uint16 RS485_Handler_ProcessEvent( uint8 task_id, uint16 events )
{
  if ( events & SYS_EVENT_MSG )
  {
    return (events ^ SYS_EVENT_MSG);
  } 
  
  if( (events & SEND_MOTOR_CONTROL_EVENT) == SEND_MOTOR_CONTROL_EVENT )
  {
	printf("send  MOTOR cmd%d\r\n",MotorCmd);
	Rs485_Send(Addr_NULL,Addr_Motor,MotorCmd,0,0);

	return events ^ SEND_MOTOR_CONTROL_EVENT;
  }  
  return 0;
}
