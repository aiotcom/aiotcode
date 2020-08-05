#include "RS485_Handler.h"

#define RS485_HANDLER_MSG_EVT  0x0003
uint8 RS485_Handler_TaskId;
uint8 ReceiveBuffer[64]={0};
uint8_t sensor_data[16];
/*
#define			Addr_Light						0x1001		//光照传感器地址
#define			Addr_WS							0x1101		//温湿度传感器地址
#define			Addr_Motor						0x1201		//直流电机地址
#define			Addr_Lock						0x1301		//电磁锁地址
#define			Addr_Siren						0x1401		//警报器地址
#define			Addr_Fan						0x1501		//风扇地址
#define			Addr_NULL						0xFFFF		//空地址-无对象地址时数据传入该地址
*/
void RS485_Handler_Init( uint8 task_id )
{
	RS485_Handler_TaskId = task_id;
	Rs485_Init();
	//osal_start_timerEx( RS485_Handler_TaskId, RS485_HANDLER_MSG_EVT,100);
}

uint16 RS485_Handler_ProcessEvent( uint8 task_id, uint16 events )
{
  if ( events & SYS_EVENT_MSG )
  {
    return (events ^ SYS_EVENT_MSG);
  } 
  
  if( (events & SEND_CONTROL_EVENT) == SEND_CONTROL_EVENT)
  {
	printf("snd LED cmd%d\r\n",LedCmd);
	Rs485_Send(Addr_NULL,Addr_Led,LedCmd,0,0);
	
	return events ^ SEND_CONTROL_EVENT;
  }  
  return 0;
}
