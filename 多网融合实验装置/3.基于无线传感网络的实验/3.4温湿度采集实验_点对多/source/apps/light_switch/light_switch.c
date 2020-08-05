/**
************************************************************
************************************************************
************************************************************
*
*	作者： 		重庆八城科技
*
*	日期： 		2019-12-27
*
*	版本： 		V2.0
*
*	说明： 		温湿度采集_点对多
*
*	修改记录：	
************************************************************
************************************************************
************************************************************
**/

#include <hal_joystick.h>
#include <hal_assert.h>
#include <hal_board.h>
#include <ioCC2530.h>
#include <hal_int.h>
#include <hal_lcd.h>
#include <hal_led.h>
#include "hal_button.h"
#include "util_lcd.h"
#include "basic_rf.h"
#include "hal_mcu.h"
#include "OLEDIIC.h"
#include "hal_rf.h"
#include "TM1640.h"
#include "stdlib.h"
#include "string.h"
#include "stdio.h"
#include "Usart.h"	
#include "delay.h"
#include "SHT20.h"
#include "OLED.h"
#include "IIC.h"

#define NUMBER  360000

// Application parameters
#define RF_CHANNEL                25      // 2.4 GHz RF channel

// BasicRF address definitions
#define PAN_ID                0x2007
#define Coordinator_ADDR      0x2520
#define Coordinator_ADDR2     0x2521
#define SHT20_ADDR            0xBEEF

#define APP_PAYLOAD_LENGTH        30
#define LIGHT_TOGGLE_CMD          0

// Application states
#define IDLE                      0
#define SEND_CMD                  1

// Application role
#define NONE                      0
#define SWITCH                    1
#define LIGHT                     2
#define APP_MODES                 2

/***********************************************************************************
* LOCAL VARIABLES
*/
static uint8 pTxData[APP_PAYLOAD_LENGTH];
static uint8 pRxData[APP_PAYLOAD_LENGTH];
static basicRfCfg_t basicRfConfig;

// Mode menu
static menuItem_t pMenuItems[] =
{
#ifdef ASSY_EXP4618_CC2420
  // Using Softbaugh 7-seg display
  " L S    ", SWITCH,
  " LIGHT  ", LIGHT
#else
  // SRF04EB and SRF05EB
  "Switch",   SWITCH,
  "Light",    LIGHT
#endif
};

static menu_t pMenu =
{
  pMenuItems,
  N_ITEMS(pMenuItems)
};


#ifdef SECURITY_CCM
// Security key
static uint8 key[]= {
    0xc0, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7,
    0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf,
};
#endif

static void SHT20_Node(void);       //温湿度节点
static void Coordinator_Node(void); //协调器节点
static void Coordinator_Node2(void);//协调器节点2

//==========================================================
//	函数名称：	SHT20_Node()
//
//	函数功能：	温湿度节点
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
static void SHT20_Node(void)
{
    long int Number = NUMBER;

    IIC_Init();           //初始化IIC 
    TM1640_Init();        //初始化TM1640
  
#ifdef ASSY_EXP4618_CC2420
    halLcdClearLine(1);
    halLcdWriteSymbol(HAL_LCD_SYMBOL_RX, 1);
#endif

    // 设置本机地址
    basicRfConfig.myAddr = SHT20_ADDR;

    if(basicRfInit(&basicRfConfig)==FAILED)
    {
      HAL_ASSERT(FALSE);
    }

    //关闭接收
    basicRfReceiveOff();

    // Main loop
    while (TRUE)
    {
        SHT2x_GetTempHumi(); 	//获取温湿度值
        send_LED_Display(0xC0,(uint16_t)g_sht2x_param.TEMP_HM,1);   //显示温度
        Number = NUMBER/2;
        while(Number--);
        send_LED_Display(0xC0,(uint16_t)g_sht2x_param.HUMI_HM,2);  //显示湿度
        Number = NUMBER/2;
        while(Number--);

        sprintf((char *)pTxData,"Temp:%d,\tHumi:%d.\r\n",(uint16_t)g_sht2x_param.TEMP_HM,(uint16_t)g_sht2x_param.HUMI_HM);

        basicRfSendPacket(Coordinator_ADDR,pTxData,APP_PAYLOAD_LENGTH);  //发送温湿度数据到协调器节点
        basicRfSendPacket(Coordinator_ADDR2,pTxData,APP_PAYLOAD_LENGTH); //发送温湿度数据到协调器节点2

        memset(pTxData,0,APP_PAYLOAD_LENGTH);

        // 让单片机进入睡眠状态。它会在中断中醒来
        halIntOff();
        halMcuSetLowPowerMode(HAL_MCU_LPM_3); 
        // interrupt enable
        halIntOn();
    }
}

//==========================================================
//	函数名称：	Coordinator_Node()
//
//	函数功能：	协调器节点
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
static void Coordinator_Node(void)
{
    uint8_t i = 0,Temp_Count = 0,Humi_Count = 0,Temp_Flag = 0,Humi_Flag = 0,Temp_Data[30],Humi_Data[30];
  
    OLED_IIC_Init();  //初始化OLED屏IIC
    OLED_Init();      //初始化OLED屏
    OLED_Init_UI();   //初始化屏幕显示
   
    // 设置本机地址
    basicRfConfig.myAddr = Coordinator_ADDR;
    
    if(basicRfInit(&basicRfConfig)==FAILED) 
    {
      HAL_ASSERT(FALSE);
    }

    pTxData[0] = LIGHT_TOGGLE_CMD;

    //开启接收
    basicRfReceiveOn();

    //程序进入死循环
    while (TRUE)
    {
        if(basicRfReceive(pRxData, APP_PAYLOAD_LENGTH, NULL)>0)  //接收发送到该地址的数据
        {
          Temp_Count = 0,Humi_Count = 0,Temp_Flag = 0,Humi_Flag = 0;
          
          UR0SendString(pRxData); //将数据发送到串口显示
          
          for(i=0;i<APP_PAYLOAD_LENGTH;i++)
          {
             //温度数据
            if(pRxData[i] == ',')
              Temp_Flag = 2;
            
            if(Temp_Flag == 1)
            {
              Temp_Data[Temp_Count] = pRxData[i];
              Temp_Count++;
            }
            
            if(pRxData[i] == ':' && Temp_Flag == 0)
              Temp_Flag = 1;

            //湿度数据
            if(Temp_Flag == 2)
            {
              if(pRxData[i] == '.')
                Humi_Flag = 2;
              
              if(Humi_Flag == 1)
              {
                Humi_Data[Humi_Count] = pRxData[i];
                Humi_Count++;
              }
              
              if(pRxData[i] == ':')
                Humi_Flag = 1;
            }
          }

          Temp_Data[2] = '\0';Humi_Data[2] = '\0';
          OLED_P8x16Str(45,3,Temp_Data);
          OLED_P8x16Str(45,6,Humi_Data);
          memset(Temp_Data,'\0',30);
          memset(Humi_Data,'\0',30);
        }
    }
}

//==========================================================
//	函数名称：	Coordinator_Node2()
//
//	函数功能：	协调器节点2
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：		
//==========================================================
static void Coordinator_Node2(void)
{
    uint8_t i = 0,Temp_Count = 0,Humi_Count = 0,Temp_Flag = 0,Humi_Flag = 0,Temp_Data[30],Humi_Data[30];

    OLED_IIC_Init();  //初始化OLED屏IIC
    OLED_Init();      //初始化OLED屏
    OLED_Init_UI();   //初始化屏幕显示
    OLED_P8x16Str(90,1,"2");

    // 设置本机地址
    basicRfConfig.myAddr = Coordinator_ADDR2;
    
    if(basicRfInit(&basicRfConfig)==FAILED) 
    {
      HAL_ASSERT(FALSE);
    }

    pTxData[0] = LIGHT_TOGGLE_CMD;

    //开启接收
    basicRfReceiveOn();

    //程序进入死循环
    while (TRUE)
    {
        if(basicRfReceive(pRxData, APP_PAYLOAD_LENGTH, NULL)>0)  //接收发送到该地址的数据
        {
          Temp_Count = 0,Humi_Count = 0,Temp_Flag = 0,Humi_Flag = 0;
          
          UR0SendString(pRxData); //将数据发送到串口显示
          
          for(i=0;i<APP_PAYLOAD_LENGTH;i++)
          {
             //温度数据
            if(pRxData[i] == ',')
              Temp_Flag = 2;
            
            if(Temp_Flag == 1)
            {
              Temp_Data[Temp_Count] = pRxData[i];
              Temp_Count++;
            }
            
            if(pRxData[i] == ':' && Temp_Flag == 0)
              Temp_Flag = 1;

            //湿度数据
            if(Temp_Flag == 2)
            {
              if(pRxData[i] == '.')
                Humi_Flag = 2;
              
              if(Humi_Flag == 1)
              {
                Humi_Data[Humi_Count] = pRxData[i];
                Humi_Count++;
              }
              
              if(pRxData[i] == ':')
                Humi_Flag = 1;
            }
          }

          Temp_Data[2] = '\0';Humi_Data[2] = '\0';
          OLED_P8x16Str(45,3,Temp_Data);
          OLED_P8x16Str(45,6,Humi_Data);
          memset(Temp_Data,'\0',30);
          memset(Humi_Data,'\0',30);
        }
    }
}

//==========================================================
//	函数名称：	main()
//
//	函数功能：	程序入口函数
//
//	入口参数：	无
//
//	返回参数：	无
//
//	说明：	        
//==========================================================
void main(void)
{
    uint8 appMode = NONE; //不设置模块的模式
    
    Init_Uart0();         //初始化串口0
    
    // Config basicRF
    basicRfConfig.panId = PAN_ID;
    basicRfConfig.channel = RF_CHANNEL;
    basicRfConfig.ackRequest = TRUE;
#ifdef SECURITY_CCM //密钥安全通信，本例程不加密
    basicRfConfig.securityKey = key; 
#endif

    // Initalise board peripherals 初始化外围设备
    halBoardInit();
    halJoystickInit();

    // Initalise hal_rf 硬件抽象层的 rf 进行初始化
    if(halRfInit()==FAILED)
    {
      HAL_ASSERT(FALSE);
    }

    /******选择性下载程序，协调器节点和温湿度节点******/

    SHT20_Node();       //温湿度节点
    //Coordinator_Node();   //协调器节点
    //Coordinator_Node2();  //协调器节点2

    HAL_ASSERT(FALSE);
}
