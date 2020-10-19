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

#if defined ( MT_TASK )
  #include "MT.h"
  #include "MT_TASK.h"
#endif

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

#define SEND_TEMP_HUMI_MSG_EVT      0x0001 
#define SEND_TEMP_HUMI_MSG_TIMEOUT  0x2000

#define READ_TEMP_HUMI_MSG_EVT      0x0002
#define READ_TEMP_HUMI_MSG_TIMEOUT  0x1000

void Group_SendTemperature(void);
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
  SampleApp_ProcessEvent
};

const uint8 tasksCnt = sizeof( tasksArr ) / sizeof( tasksArr[0] );
uint16 *tasksEvents;
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
  SampleApp_Init( taskID );
}
/*********************************************************************
 * MACROS
 */

/*********************************************************************
 * CONSTANTS
 */

/*********************************************************************
 * TYPEDEFS
 */

/*********************************************************************
 * GLOBAL VARIABLES
 */

// This list should be filled with Application specific Cluster IDs.
const cId_t SampleApp_OutClusterList[1] =
{
  TEMP_HUMI_CLUSTER_ID
};

const SimpleDescriptionFormat_t SampleApp_SimpleDesc =
{
  SAMPLEAPP_ENDPOINT,              //  int Endpoint;
  SAMPLEAPP_PROFID,                //  uint16 AppProfId[2];
  SAMPLEAPP_DEVICEID,              //  uint16 AppDeviceId[2];
  SAMPLEAPP_DEVICE_VERSION,        //  int   AppDevVer:4;
  SAMPLEAPP_FLAGS,                 //  int   AppFlags:4;
  0,                               //  uint8  AppNumInClusters;
  (cId_t *)NULL,                   //  uint8 *pAppInClusterList;
  1,                               //  uint8  AppNumInClusters;
  (cId_t *)SampleApp_OutClusterList //  uint8 *pAppOutClusterList;
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

afAddrType_t SampleApp_Periodic_DstAddr;
afAddrType_t SampleApp_Flash_DstAddr;

afAddrType_t Point_To_Point_DstAddr;//点对点通信定义

afAddrType_t Group_DstAddr;//网蜂组播通信定义

//设置两个组 SampleApp_Group WEBEE_Group
aps_Group_t SampleApp_Group;
aps_Group_t WEBEE_Group; 

#define WEBEE_GROUP       0x0002      //网蜂组播号2
#define SAMPLE_APP_GROUNP 0x0001      //网蜂组播号1

uint8 SendIndicate = 1;
uint8 ReadTempHumiControl = 1;//ReadTempHumiControl=0 读温度 ;=1 读湿度
/*********************************************************************
 * LOCAL FUNCTIONS
 */
void SampleApp_MessageMSGCB( afIncomingMSGPacket_t *pckt );
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
  printf("i am coordinator\r\n");
  SHT2x_Init();       //初始化温度传感器   
  bottom_led_init(); //初始化底部LED
  UART2RS485_Init(); //使能UART1、RS485 
  Bottom_Blue();
//***************设置组播通信目的地址参数****************************** 
  Group_DstAddr.addrMode = (afAddrMode_t)afAddrGroup;
  Group_DstAddr.endPoint = SAMPLEAPP_ENDPOINT;    
  Group_DstAddr.addr.shortAddr = SAMPLE_APP_GROUNP;//WEBEE_GROUP; //加入WEBEE_GROUP    
  SampleApp_Group.ID = SAMPLE_APP_GROUNP;//加入到SAMPLE_APP_GROUP组ID
  osal_memcpy( SampleApp_Group.name, "Group 1", 7  );//组名称   
  aps_AddGroup( SAMPLEAPP_ENDPOINT, &SampleApp_Group ); 
//*********注册端点**************************************

  SampleApp_epDesc.endPoint     = SAMPLEAPP_ENDPOINT;
  SampleApp_epDesc.task_id      = &SampleApp_TaskID;
  SampleApp_epDesc.simpleDesc   = (SimpleDescriptionFormat_t *)&SampleApp_SimpleDesc;
  SampleApp_epDesc.latencyReq   = noLatencyReqs;

  afRegister( &SampleApp_epDesc );
  osal_start_timerEx( SampleApp_TaskID, READ_TEMP_HUMI_MSG_EVT,READ_TEMP_HUMI_MSG_TIMEOUT); //启动读温湿度 
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
          }
          if (  (SampleApp_NwkState == DEV_ROUTER)
              ||(SampleApp_NwkState == DEV_END_DEVICE) )
          {
            //设置读温湿度传感器值，读出的数据保存在变量发送时再将数据读出来。
            osal_set_event( SampleApp_TaskID,
                            READ_TEMP_HUMI_MSG_EVT);
            // 启动定时发送READ_TEMP_HUMI_MSG_TIMEOUT秒后发送传感器数据
            osal_start_timerEx( SampleApp_TaskID,
                              SEND_TEMP_HUMI_MSG_EVT,
                              SEND_TEMP_HUMI_MSG_TIMEOUT );
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

  if(events & READ_TEMP_HUMI_MSG_EVT )
  {
    printf("read temp and humi\r\n");
    ReadTempHumiControl?(SHT2x_ReadTemp()):(SHT2x_ReadHumi());//读温湿度值并显示
    ReadTempHumiControl = 1 - ReadTempHumiControl;
    
    osal_start_timerEx( SampleApp_TaskID, READ_TEMP_HUMI_MSG_EVT,READ_TEMP_HUMI_MSG_TIMEOUT);
    
    return (events ^ READ_TEMP_HUMI_MSG_EVT);
  }
  if ( events & SEND_TEMP_HUMI_MSG_EVT )
  {//发送温湿度数据
    SendIndicate = 1-SendIndicate;
    SendIndicate?Bottom_Blue():Bottom_BlackOut();
    
    Group_SendTemperature();
    osal_start_timerEx( SampleApp_TaskID, SEND_TEMP_HUMI_MSG_EVT,
        (SEND_TEMP_HUMI_MSG_TIMEOUT + (osal_rand() & 0x00FF)) );

    // return unprocessed events
    return (events ^ SEND_TEMP_HUMI_MSG_EVT);
  }

  // Discard unknown events
  return 0;
}
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
void SampleApp_MessageMSGCB( afIncomingMSGPacket_t *pkt )
{
  switch ( pkt->clusterId )
  {   
  }
}
void Group_SendTemperature( void )
{
  uint8 sendbuf[2];
  sendbuf[0] = SHT2x_GetTemp();//获取温度值
  sendbuf[1] = SHT2x_GetHumi();//获取湿度值  
  
  if ( AF_DataRequest( &Group_DstAddr, &SampleApp_epDesc,
                       TEMP_HUMI_CLUSTER_ID,
                       2,
                       sendbuf,
                       &SampleApp_TransID,
                       AF_DISCV_ROUTE,
                       AF_DEFAULT_RADIUS ) == afStatus_SUCCESS )
  {
    printf("tx sucess\r\n");
  }
}
/*********************************************************************
*********************************************************************/
