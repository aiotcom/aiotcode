#include "RS485_Handler.h"

#define RS485_HANDLER_MSG_EVT  0x0003
uint8 RS485_Handler_TaskId;
uint8 ReceiveBuffer[64]={0};
uint8_t sensor_data[16];
static uint8 RxLen,state = 0,count=0;
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
	osal_start_timerEx( RS485_Handler_TaskId, RS485_HANDLER_MSG_EVT,100);
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
		Rs485_Send(Addr_NULL,Addr_SMOKE,Get_Smoke_Sta,0,(void*)0);
		count = 0;
		state = 1;
		osal_start_timerEx( RS485_Handler_TaskId, RS485_HANDLER_MSG_EVT,500);
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
	
		if((!DataHandling_485(Addr_NULL)) || (0))
		{
		  	sensor_data[0] = Rx_Stack.Data[0];			
			osal_set_event( SampleApp_TaskID, SEND_SENSOR_DATA_EVENT );//SampleApp_TaskID 任务发送事件ID
		}	
		state = 0;
		osal_start_timerEx( RS485_Handler_TaskId, RS485_HANDLER_MSG_EVT,500);
	}
	
	return (events ^ RS485_HANDLER_MSG_EVT);
  }
  
  return 0;
}
