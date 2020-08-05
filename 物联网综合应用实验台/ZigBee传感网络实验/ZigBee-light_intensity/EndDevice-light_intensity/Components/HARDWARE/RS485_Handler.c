#include "RS485_Handler.h"

#define RS485_HANDLER_MSG_EVT  0x0003
uint8 RS485_Handler_TaskId;
uint8 ReceiveBuffer[64]={0};
uint8_t sensor_data[16];
static uint8 RxLen,state = 0,count=0;
void RS485_Handler_Init( uint8 task_id )
{
	RS485_Handler_TaskId = task_id;
	Rs485_Init();   
    P1DIR |= BV(4);
	
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
		Rs485_Send(Addr_Light,Addr_Light,Get_Light_Data,0,(void*)0);
		count = 0;
		state = 1;
		osal_start_timerEx( RS485_Handler_TaskId, RS485_HANDLER_MSG_EVT,2000);
		P1_4   = 1;
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
			
		if(!DataHandling_485(Addr_Light))
		{
		  	sensor_data[0] = Rx_Stack.Data[0];
		  	sensor_data[1] = Rx_Stack.Data[1];			
			osal_set_event( SampleApp_TaskID, SEND_SENSOR_DATA_EVENT );//SampleApp_TaskID 任务发送事件ID			
		}	
		state = 0;
		osal_start_timerEx( RS485_Handler_TaskId, RS485_HANDLER_MSG_EVT,1000);
	}
	
	return (events ^ RS485_HANDLER_MSG_EVT);
  }
  
  return 0;
}
