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

#define BOARD_REQUERY_DATA_MSG_EVT            0x0001 //协调器广播请求网络内终端上报数据定时器事件  
#define BOARD_REQUERY_DATA_MSG_TIMEOUT        2000   // 发送RFID数据间隔 
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
}
// This list should be filled with Application specific Cluster IDs.


const cId_t SampleApp_OutClusterList[1] =
{
  BOARDCAST_REQUERY_DATA_CLUSTER_ID
};
const cId_t SampleApp_IntClusterList[2] =
{
  TEMP_HUMI_CLUSTER_ID,
  MPU6050_DATA_CLUSTER_ID
};
const SimpleDescriptionFormat_t SampleApp_SimpleDesc =
{
  SAMPLEAPP_ENDPOINT,              //  int Endpoint;
  SAMPLEAPP_PROFID,                //  uint16 AppProfId[2];
  SAMPLEAPP_DEVICEID,              //  uint16 AppDeviceId[2];
  SAMPLEAPP_DEVICE_VERSION,        //  int   AppDevVer:4;
  SAMPLEAPP_FLAGS,                 //  int   AppFlags:4;
  2,          //  uint8  AppNumInClusters;
  (cId_t *)SampleApp_IntClusterList,  //  uint8 *pAppInClusterList;
  1,          //  uint8  AppNumInClusters;
  (cId_t *)SampleApp_OutClusterList   //  uint8 *pAppOutClusterList;
};

// This is the Endpoint/Interface description.  It is defined here, but
// filled-in in SampleApp_Init().  Another way to go would be to fill
// in the structure here and make it a "const" (in code space).  The
// way it's defined in this sample app it is define in RAM.
endPointDesc_t SampleApp_epDesc;

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

afAddrType_t Boardcast_DstAddr;//点对点通信定义

/*********************************************************************
 * LOCAL FUNCTIONS
 */
void SampleApp_MessageMSGCB( afIncomingMSGPacket_t *pckt );
void BoardcastRequeyData( void );
/*********************************************************************
 * NETWORK LAYER CALLBACKS
 */

/*********************************************************************
 * PUBLIC FUNCTIONS
 */

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
  
 /***********串口初始化************/     
  bottom_led_init(); //初始化底部LED
  UART2RS485_Init(); //初始化串口1及RS485总线
   
  Bottom_Red();//底座灯点亮红色
  printf("i am coordinator\r\n");
 
//*************广播地址设置******************************  
  Boardcast_DstAddr.addrMode       = (afAddrMode_t)AddrBroadcast;//网络地址为广播
  Boardcast_DstAddr.endPoint       = SAMPLEAPP_ENDPOINT;         //设置目的接收端点
  Boardcast_DstAddr.addr.shortAddr = 0xFFFF;               //目的网络短地址为0xFFFF广播地址
//*************广播地址设置******************************  
//*********注册端点**************************************
  SampleApp_epDesc.endPoint     = SAMPLEAPP_ENDPOINT;
  SampleApp_epDesc.task_id      = &SampleApp_TaskID;
  SampleApp_epDesc.simpleDesc   = (SimpleDescriptionFormat_t *)&SampleApp_SimpleDesc;
  SampleApp_epDesc.latencyReq   = noLatencyReqs;

  afRegister( &SampleApp_epDesc );//注册端点

//*********注册端点**************************************  
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
            printf("coord ready!\r\n");
            // 启动定时发送READ_TEMP_HUMI_MSG_TIMEOUT秒后发送传感器数据
            osal_start_timerEx( SampleApp_TaskID,
                                BOARD_REQUERY_DATA_MSG_EVT,
                                BOARD_REQUERY_DATA_MSG_TIMEOUT );            
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
  }
  if(events&BOARD_REQUERY_DATA_MSG_EVT)
  {
   // printf("coordinator requey\r\n");
    BoardcastRequeyData();
    osal_start_timerEx( SampleApp_TaskID,
                        BOARD_REQUERY_DATA_MSG_EVT,
                        BOARD_REQUERY_DATA_MSG_TIMEOUT );
    return (events ^ BOARD_REQUERY_DATA_MSG_EVT);
  }
  return 0;
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
float pitch,roll,yaw;
uint8  Temp,Humi;
void SampleApp_MessageMSGCB( afIncomingMSGPacket_t *pkt )
{
  switch ( pkt->clusterId )
  {
    case TEMP_HUMI_CLUSTER_ID:
         Temp = pkt->cmd.Data[0];
         Humi = pkt->cmd.Data[1];
    break;    
    case MPU6050_DATA_CLUSTER_ID:
      memcpy((void*)&pitch,(const char*)&pkt->cmd.Data[0],4);
      memcpy((void*)&roll,(const char*)&pkt->cmd.Data[4],4);
      memcpy((void*)&yaw,(const char*)&pkt->cmd.Data[8],4);
      
    break;
  }
  printf("----->\r\n");
  printf("Temp  = %d\r\nHumi  = %d\r\n",Temp,Humi); 
  
  printf("Pitch = %0.2f\r\nRoll  = %0.2f\r\nYaw   = %0.2f\r\n",pitch,roll,yaw);
  printf("<-----\r\n");
}
/*
协调器广播请求网络内的设备上报参数
*/
void BoardcastRequeyData( void )
{
  uint8 dummy=0;
  static uint8 SendIndicate = 0;
  SendIndicate?Bottom_Red():Bottom_BlackOut();//每发送一次切换底座灯颜色
  SendIndicate = 1-SendIndicate;  
  if ( AF_DataRequest( &Boardcast_DstAddr, &SampleApp_epDesc,
                       BOARDCAST_REQUERY_DATA_CLUSTER_ID,
                       1,
                       &dummy,
                       &SampleApp_TransID,
                       AF_DISCV_ROUTE,
                       AF_DEFAULT_RADIUS ) == afStatus_SUCCESS )
  {
    //printf("coordinator tx sucess\r\n");
  }
}
/*********************************************************************
*********************************************************************/
