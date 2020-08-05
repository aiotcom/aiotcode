#ifndef WIFIGATE_H
#define WIFIGATE_H
#include "hal_types.h"
#include "SampleApp.h"
#include "string.h"
#include "stdio.h"
#include "hal_uart.h"
#include "OSAL.h"

#define WIFI_INIT_EXIT_TRANSPARENT_EVT         0x0009  
#define WIFI_INIT_SEND_AT_EVT                  0x0010  
#define WIFI_INIT_SET_MODE_EVT                 0x0011  
#define WIFI_INIT_CONNECT_AP_EVT               0x0012 
#define WIFI_INIT_CONNECT_SERVER_EVT           0x0013 
#define WIFI_INIT_TRANSMIT_MODE_EVT            0x0014 
#define WIFI_INIT_START_SEND_EVT               0x0015
#define WIFI_INIT_CONNECT_ONENET               0x0019
#define WIFI_GET_RSPONE                        0x0020

#define WIFI_RECEIVE_MSG_EVT                   0x0017 
#define WIFI_SEND_DATA_MSG_EVT                 0x0016 

#define WIFI_AP                   "AT+CWJAP=\"stepiot\",\"f0f0f0f0f0\"\r\n"
#define CONNECT_ONENET_KEYSTRING  "*213941#0001#TeHuGyro*"

extern uint8  WiFiModeInitDone;
extern uint8 WiFiGate_TaskId;
uint16 WiFiGate_ProcessEvent( uint8 task_id, uint16 events );
void WiFiGate_Init( uint8 task_id );
void SendToWiFiNetwork(uint8 *pData,uint8 len);
#endif