/**************************************************************************************************
  Filename:       SampleApp.c
  Revised:        $Date: 2009-03-18 15:56:27 -0700 (Wed, 18 Mar 2009) $
  Revision:       $Revision: 19453 $

  Description:    Sample Application (no Profile).


  Copyright 2007 Texas Instruments Incorporated. All rights reserved.

  IMPORTANT: Your use of this Software is limited to those specific rights
  granted under the terms of a software license agreement between the user
  who downloaded the software, his/her employer (which must be your employer)
  and Texas Instruments Incorporated (the "License").  You may not use this
  Software unless you agree to abide by the terms of the License. The License
  limits your use, and you acknowledge, that the Software may not be modified,
  copied or distributed unless embedded on a Texas Instruments microcontroller
  or used solely and exclusively in conjunction with a Texas Instruments radio
  frequency transceiver, which is integrated into your product.  Other than for
  the foregoing purpose, you may not use, reproduce, copy, prepare derivative
  works of, modify, distribute, perform, display or sell this Software and/or
  its documentation for any purpose.

  YOU FURTHER ACKNOWLEDGE AND AGREE THAT THE SOFTWARE AND DOCUMENTATION ARE
  PROVIDED 揂S IS?WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED,
  INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY, TITLE,
  NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL
  TEXAS INSTRUMENTS OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER CONTRACT,
  NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER
  LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
  INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE
  OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT
  OF SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
  (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.

  Should you have any questions regarding your right to use this Software,
  contact Texas Instruments Incorporated at www.TI.com.
**************************************************************************************************/

/*********************************************************************
  This application isn't intended to do anything useful, it is
  intended to be a simple example of an application's structure.

  This application sends it's messages either as broadcast or
  broadcast filtered group messages.  The other (more normal)
  message addressing is unicast.  Most of the other sample
  applications are written to support the unicast message model.

  Key control:
    SW1:  Sends a flash command to all devices in Group 1.
    SW2:  Adds/Removes (toggles) this device in and out
          of Group 1.  This will enable and disable the
          reception of the flash command.
*********************************************************************/

/*********************************************************************
 * INCLUDES
 */
/*********************************************************************
 * INCLUDES
 */

#include "ZComDef.h"
#include "hal_drivers.h"
#include "OSAL.h"
#include "OSAL_Tasks.h"
#include "nwk.h"
#include "APS.h"
#include "ZDApp.h"
#if defined ( ZIGBEE_FREQ_AGILITY ) || defined ( ZIGBEE_PANID_CONFLICT )
  #include "ZDNwkMgr.h"
#endif
#if defined ( ZIGBEE_FRAGMENTATION )
  #include "aps_frag.h"
#endif

#include "SampleApp.h"
#include "WiFiGate.h"
#include "OSAL.h"
#include "ZGlobals.h"
#include "AF.h"
#include "aps_groups.h"
#include "ZDApp.h"

#include "SampleApp.h"
#include "SampleAppHw.h"

#include "OnBoard.h"

/* HAL */
#include "hal_lcd.h"
#include "hal_led.h"
#include "hal_key.h"
#include "string.h"

#include "MT_UART.h"
#include "MT_APP.h"
#include "MT.h"
#include "OLED.h"
#include "SHT20.h"
#include "bottom_led.h"
#include "stdio.h"
#include "UART2RS485.h"
#include "WiFiGate.h"
#include "_bind.h"
#include "led_mode.h"

/*********************************************************************
 * GLOBAL VARIABLES
 */

// The order in this table must be identical to the task initialization calls below in osalInitTask.
const pTaskEventHandlerFn tasksArr[] = {
  macEventLoop,
  nwk_event_loop,
  Hal_ProcessEvent,
#if defined( MT_TASK )
  MT_ProcessEvent,
#endif
  APS_event_loop,
#if defined ( ZIGBEE_FRAGMENTATION )
  APSF_ProcessEvent,
#endif
  ZDApp_event_loop,
#if defined ( ZIGBEE_FREQ_AGILITY ) || defined ( ZIGBEE_PANID_CONFLICT )
  ZDNwkMgr_event_loop,
#endif
  SampleApp_ProcessEvent,
//  WiFiGate_ProcessEvent,  
};
const uint8 tasksCnt = sizeof( tasksArr ) / sizeof( tasksArr[0] );
uint16 *tasksEvents;
/*********************************************************************
 * FUNCTIONS
 *********************************************************************/

/*********************************************************************
 * @fn      osalInitTasks
 *
 * @brief   This function invokes the initialization function for each task.
 *
 * @param   void
 *
 * @return  none
 */
void osalInitTasks( void )
{
  uint8 taskID = 0;

  tasksEvents = (uint16 *)osal_mem_alloc( sizeof( uint16 ) * tasksCnt);
  osal_memset( tasksEvents, 0, (sizeof( uint16 ) * tasksCnt));

  macTaskInit( taskID++ );
  nwk_init( taskID++ );
  Hal_Init( taskID++ );
#if defined( MT_TASK )
  MT_TaskInit( taskID++ );
#endif
  APS_Init( taskID++ );
#if defined ( ZIGBEE_FRAGMENTATION )
  APSF_Init( taskID++ );
#endif
  ZDApp_Init( taskID++ );
#if defined ( ZIGBEE_FREQ_AGILITY ) || defined ( ZIGBEE_PANID_CONFLICT )
  ZDNwkMgr_Init( taskID++ );
#endif
  SampleApp_Init( taskID++ ); 
//  WiFiGate_Init( taskID++ ); 
}

const cId_t InClusterList[ ] =
{
  0,
};
const cId_t OutClusterList[ ] =
{
  //FAN_CONTROL_CLUSTERID,
  //LOCK_CONTROL_CLUSTERID,
  SIREN_CONTROL_CLUSTERID
};

const SimpleDescriptionFormat_t Coordinator_SimpleDesc =
{
  SAMPLEAPP_ENDPOINT,                 //  int Endpoint;
  SAMPLEAPP_PROFID,                   //  uint16 AppProfId[2];
  SAMPLEAPP_DEVICEID,                 //  uint16 AppDeviceId[2];
  SAMPLEAPP_DEVICE_VERSION,           //  int   AppDevVer:4;
  SAMPLEAPP_FLAGS,                    //  int   AppFlags:4;
  1,                                  //  uint8  AppNumInClusters;
  (cId_t *)InClusterList,             //  uint8 *pAppInClusterList;
  1,                                  //  uint8  AppNumOutClusters;
  (cId_t *)OutClusterList             //  uint8 *pAppOutClusterList;
};
// This is the Endpoint/Interface description.  It is defined here, but
// filled-in in SampleApp_Init().  Another way to go would be to fill
// in the structure here and make it a "const" (in code space).  The
// way it's defined in this sample app it is define in RAM.
endPointDesc_t Coordinator_epDesc;
/*********************************************************************
 * EXTERNAL VARIABLES
 */

/*********************************************************************
 * EXTERNAL FUNCTIONS
 */

/*********************************************************************
 * LOCAL VARIABLES
 */
uint8 SampleApp_TaskID;   // Task ID for internal task/event processing
                          // This variable will be received when
                          // SampleApp_Init() is called.
devStates_t SampleApp_NwkState;

uint8 SampleApp_TransID;  // This is the unique message ID (counter)

afAddrType_t Point_To_Point_DstAddr;//点对点通信定义

afAddrType_t Boardcast_DstAddr;//广播通信定义
/*********************************************************************
 * LOCAL FUNCTIONS
 */
void SampleApp_MessageMSGCB( afIncomingMSGPacket_t *pckt );
void Coor_Send_Siren_ControlCmd(uint16 cmd);
/*********************************************************************
 * @fn      SampleApp_Init
 *
 * @brief   Initialization function for the Generic App Task.
 *          This is called during initialization and should contain
 *          any application specific initialization (ie. hardware
 *          initialization/setup, table initialization, power up
 *          notificaiton ... ).
 *
 * @param   task_id - the ID assigned by OSAL.  This ID should be
 *                    used to send messages and set timers.
 *
 * @return  none
 */
void SampleApp_Init( uint8 task_id )
{
  SampleApp_TaskID = task_id;
  SampleApp_NwkState = DEV_INIT;
  SampleApp_TransID = 0;  

  OLED_Init();      //初始化OLED
  UartInit(HAL_UART_PORT_0,HAL_UART_BR_115200);//串口0初始化
  LedMode_Init();  //初始化LED模块
  bottom_led_init(); //初始化底部LED
  Bottom_Red();      //点亮底座红色
  
  printf("i am coordinator for alarm\r\n");//串口打印
  OLED_P8x16Str(0,0,"coor-alarm");
  
  Binded_Init(Coordinator_SimpleDesc.AppNumOutClusters,\
	         (const cId_t*)Coordinator_SimpleDesc.pAppOutClusterList);//初始化绑定列表
  
  // 点对点通讯定义  本次实验中 协调器只向风扇节点发送数据，而不会向湿湿度发送，
  // Point_To_Point_DstAddr 结构体用于向风扇节点发送指令使用
  Point_To_Point_DstAddr.addrMode       = (afAddrMode_t)Addr16Bit; //点播
  Point_To_Point_DstAddr.endPoint       = SAMPLEAPP_ENDPOINT;      
  Point_To_Point_DstAddr.addr.shortAddr = 0;

  //广播通信定义 
  Boardcast_DstAddr.addrMode       =  (afAddrMode_t)AddrBroadcast;
  Boardcast_DstAddr.endPoint       = SAMPLEAPP_ENDPOINT;
  Boardcast_DstAddr.addr.shortAddr = 0Xffff;
  
  // 填写端点
  Coordinator_epDesc.endPoint   = SAMPLEAPP_ENDPOINT;
  Coordinator_epDesc.task_id    = &SampleApp_TaskID;
  Coordinator_epDesc.simpleDesc = (SimpleDescriptionFormat_t *)&Coordinator_SimpleDesc;
  Coordinator_epDesc.latencyReq = noLatencyReqs;
  // 注册端点
  afRegister( &Coordinator_epDesc );
}

/*********************************************************************
 * @fn      SampleApp_ProcessEvent
 *
 * @brief   Generic Application Task event processor.  This function
 *          is called to process all events for the task.  Events
 *          include timers, messages and any other user defined events.
 *
 * @param   task_id  - The OSAL assigned task ID.
 * @param   events - events to process.  This is a bit map and can
 *                   contain more than one event.
 *
 * @return  none
 */
uint8 SendTemperatureIndicate = 1;
uint8 KeyValue;
uint16 SampleApp_ProcessEvent( uint8 task_id, uint16 events )
{
  afIncomingMSGPacket_t *MSGpkt;
  (void)task_id;  // Intentionally unreferenced parameter

  if ( events & SYS_EVENT_MSG )
  {
    MSGpkt = (afIncomingMSGPacket_t *)osal_msg_receive( SampleApp_TaskID );
    while ( MSGpkt )
    {
      switch ( MSGpkt->hdr.event )
      {        
        // Received when a messages is received (OTA) for this endpoint
        case AF_INCOMING_MSG_CMD:
          SampleApp_MessageMSGCB( MSGpkt );
          break;

        // Received whenever the device changes state in the network
        case ZDO_STATE_CHANGE:
          SampleApp_NwkState = (devStates_t)(MSGpkt->hdr.status);
          if(SampleApp_NwkState == DEV_ZB_COORD)
          {
			osal_start_timerEx( SampleApp_TaskID, BIND_TIME_MSG_EVT,2);
			osal_start_timerEx( Hal_TaskID, READ_KEY_EVT,2);
            printf("coord ready!");
          }
          break;

        default:
          break;
      }

      // Release the memory
      osal_msg_deallocate( (uint8 *)MSGpkt );

      // Next - if one is available
      MSGpkt = (afIncomingMSGPacket_t *)osal_msg_receive( SampleApp_TaskID );
    }

    // return unprocessed events
    return (events ^ SYS_EVENT_MSG);
  }//if ( events & SYS_EVENT_MSG )
  
  if(events & BIND_TIME_MSG_EVT)//绑定超时
  {//设备绑定
    printf("bind timeout\r\n");
    if(StartBind() == 0)
	{
    	osal_start_timerEx( SampleApp_TaskID, BIND_TIME_MSG_EVT,2000);
	} 
	return (events ^ BIND_TIME_MSG_EVT);
  }
  if(events & GET_KEY_EVT)
  {//检测到按键按下，发送指令
	printf("KeyValue=%d\r\n",KeyValue);
	if(KeyValue == KEY_S1)
	{//按键S1->开启指令
		Coor_Send_Siren_ControlCmd(Siren_ON);
	}
	else if(KeyValue == KEY_S2)
	{//按键S2->关闭指令
		Coor_Send_Siren_ControlCmd(Siren_OFF);
	}
  	return (events ^ GET_KEY_EVT);
  }
  // Discard unknown events
  return 0;
}
void Coor_Send_Siren_ControlCmd(uint16 cmd)
{
  uint16 temp;
  temp = cmd;
  if ( AF_DataRequest( &Point_To_Point_DstAddr,&Coordinator_epDesc,
                       SIREN_CONTROL_CLUSTERID,
                       2,
                       (uint8 *)&temp,
                       &SampleApp_TransID,
                       AF_DISCV_ROUTE,
                       AF_DEFAULT_RADIUS ) == afStatus_SUCCESS )
  {
    //printf("tx success\r\n");//串口打印提示，发送成功
  }
}
/*********************************************************************
 * LOCAL FUNCTIONS
 */

/*********************************************************************
 * @fn      SampleApp_MessageMSGCB
 *
 * @brief   Data message processor callback.  This function processes
 *          any incoming data - probably from other devices.  So, based
 *          on cluster ID, perform the intended action.
 *
 * @param   none
 *
 * @return  none
*/
uint8 OLED_DisplayBuf[32]={0},index=0;
uint8 ReceiveIndicate  = 0;
uint16 BindRspCluterId = 0;
void SampleApp_MessageMSGCB( afIncomingMSGPacket_t *pkt )
{ 
  switch ( pkt->clusterId )
  {
  case BIND_RSP_CMD_ID:
		printf("get bind rsp\r\n");
		BindRspCluterId = pkt->cmd.Data[0] + (pkt->cmd.Data[1]<<8);
		printf("==%04X",BindRspCluterId);
		if(BindRspCluterId == SIREN_CONTROL_CLUSTERID)
		{
		  	Bind_Clean(SIREN_CONTROL_CLUSTERID);
			Point_To_Point_DstAddr.addr.shortAddr = pkt->srcAddr.addr.shortAddr;
		}	
		break;	
  }
}


/*********************************************************************
*********************************************************************/
