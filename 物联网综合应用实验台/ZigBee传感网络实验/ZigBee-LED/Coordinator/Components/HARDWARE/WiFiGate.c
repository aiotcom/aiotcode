#include "WiFiGate.h"

#define SEND_TO_WIFI(d,l)        HalUARTWrite(HAL_UART_PORT_0,d,l);
#define WIFI_RECV_DATA_BUFFER_LEN 100
uint8 WiFiRecvDataBuffer[ WIFI_RECV_DATA_BUFFER_LEN ];
uint8 WiFiRecvLenght = 0;
uint8 NextEvent=0;
uint8 WiFiCmdHandle = 0;

#define GET_RECV_LENGHT()        Hal_UART_RxBufLen(HAL_UART_PORT_0);
#define GET_RECV_DATA(b,l)       HalUARTRead(HAL_UART_PORT_0,b,l);
/*
WIFI模块初始化
*/
uint8 WiFiGate_TaskId = 0;
uint8 WiFiModeInitDone = 0;
void WiFiGate_Init( uint8 task_id )
{
  WiFiGate_TaskId = task_id;
//  osal_set_event(WiFiGate_TaskId,WIFI_INIT_SEND_AT_EVT);
  osal_start_timerEx( WiFiGate_TaskId, WIFI_INIT_EXIT_TRANSPARENT_EVT,2000); 
  UartInit(HAL_UART_PORT_0,HAL_UART_BR_115200);
}
/*
配置WIFI参数
*/
void ConfigWiFiArg(uint8 *pConfig,uint16 NextSta,uint16 timeout)
{
  memset((void*)WiFiRecvDataBuffer,0,WIFI_RECV_DATA_BUFFER_LEN);
  WiFiRecvLenght = 0;
  HalUARTResetRxQueue();
  SEND_TO_WIFI(pConfig,strlen((const char*)pConfig)); 
  osal_start_timerEx( WiFiGate_TaskId, WIFI_GET_RSPONE,timeout);
  NextEvent = NextSta;
}
/*
wifi网关处理任务，包括初始化WiFi模块，接收数据
*/
uint16 WiFiGate_ProcessEvent( uint8 task_id, uint16 events )
{
  uint8 len=0;
  (void)task_id;  // Intentionally unreferenced parameter

  if ( events & SYS_EVENT_MSG )
  {//如果是系统任务
    return (events ^ SYS_EVENT_MSG);
  }
  else
  {//如果是用户自定义任务
    switch(events)
    {
      case WIFI_INIT_EXIT_TRANSPARENT_EVT:
           osal_start_timerEx( WiFiGate_TaskId, WIFI_INIT_SEND_AT_EVT,5000);
           SEND_TO_WIFI("+++",3);        
      break; 
      case WIFI_INIT_SEND_AT_EVT:
		   osal_stop_timerEx( WiFiGate_TaskId, WIFI_INIT_SEND_AT_EVT);	
           ConfigWiFiArg("AT\r\n",WIFI_INIT_SET_MODE_EVT,500);
        break;
      case WIFI_INIT_SET_MODE_EVT:
           ConfigWiFiArg("AT+CWMODE=3\r\n",WIFI_INIT_CONNECT_AP_EVT,500);
        break;
      case WIFI_INIT_CONNECT_AP_EVT:
           ConfigWiFiArg(WIFI_AP,WIFI_INIT_CONNECT_SERVER_EVT,500);
        break;
      case WIFI_INIT_CONNECT_SERVER_EVT:
           ConfigWiFiArg("AT+CIPSTART=\"TCP\",\"183.230.40.40\",1811\r\n",WIFI_INIT_TRANSMIT_MODE_EVT,500);
        break;
      case WIFI_INIT_TRANSMIT_MODE_EVT:
           ConfigWiFiArg("AT+CIPMODE=1\r\n",WIFI_INIT_START_SEND_EVT,500);
        break;
      case WIFI_INIT_START_SEND_EVT:
           ConfigWiFiArg("AT+CIPSEND\r\n",WIFI_INIT_CONNECT_ONENET,500);
        break;
      case WIFI_INIT_CONNECT_ONENET:
           ConfigWiFiArg(CONNECT_ONENET_KEYSTRING,WIFI_RECEIVE_MSG_EVT,50);
           printf("Try to connect OneNET\r\n");
           WiFiModeInitDone = 1;//wifi模块初始化正常，并连接到oneNET上。
        break;        
      case WIFI_GET_RSPONE:
           len = GET_RECV_LENGHT();
            if(len)
            {              
              GET_RECV_DATA(&WiFiRecvDataBuffer[WiFiRecvLenght],len);
              WiFiRecvLenght = WiFiRecvLenght + len;
              if(WiFiRecvLenght >= WIFI_RECV_DATA_BUFFER_LEN)
              {
                WiFiRecvLenght = 0;
              }
            }
            if(strstr((const char*)WiFiRecvDataBuffer,"OK\r\n"))
            {
                osal_set_event(WiFiGate_TaskId,NextEvent);
				osal_stop_timerEx( WiFiGate_TaskId, WIFI_GET_RSPONE);
            }
            else
            {
                osal_start_timerEx( WiFiGate_TaskId, WIFI_GET_RSPONE,100); 
            }
			if(NextEvent == WIFI_RECEIVE_MSG_EVT)
			{
			 	osal_stop_timerEx( WiFiGate_TaskId, WIFI_GET_RSPONE);
				osal_set_event(WiFiGate_TaskId,WIFI_RECEIVE_MSG_EVT);
			}
        break;
      case WIFI_RECEIVE_MSG_EVT:
           len = GET_RECV_LENGHT();
            if(len)
            {              
              GET_RECV_DATA(&WiFiRecvDataBuffer[WiFiRecvLenght],len);
              WiFiRecvLenght = WiFiRecvLenght + len;
              if(WiFiRecvLenght >= WIFI_RECV_DATA_BUFFER_LEN)
              {
                WiFiRecvLenght = 0;
              }
            }
            if(WiFiCmdHandle)
            {
              if(strstr((const char*)WiFiRecvDataBuffer,(const char*)"~FAN_ON"))
              {
				Coor_SendFanControlCmd(FAN_ON); 
				printf("FAN_ON\r\n");
              }
              else if(strstr((const char*)WiFiRecvDataBuffer,(const char*)"~FAN_OFF"))
              {
                 Coor_SendFanControlCmd(FAN_OFF); 
				 printf("FAN_OFF\r\n");
              }
	      	  memset((void*)WiFiRecvDataBuffer,0,WIFI_RECV_DATA_BUFFER_LEN);
              WiFiCmdHandle = 0;
              WiFiRecvLenght = 0;
            }
            if(!len)
            {
              osal_start_timerEx( WiFiGate_TaskId, WIFI_RECEIVE_MSG_EVT,100);
            }
            else
            {	  
              osal_start_timerEx( WiFiGate_TaskId, WIFI_RECEIVE_MSG_EVT,10);
              WiFiCmdHandle = 1;
            }
      break;
      case WIFI_SEND_DATA_MSG_EVT:
           osal_msg_receive( WiFiGate_TaskId );
           //SEND_TO_WIFI();
      break;
      
    }
    
  }
  return 0;
} 
/*
发送数据到WIFI网络上
*/
void SendToWiFiNetwork(uint8 *pData,uint8 len)
{
  if(WiFiModeInitDone)
  {
    SEND_TO_WIFI(pData,len);
  }
}