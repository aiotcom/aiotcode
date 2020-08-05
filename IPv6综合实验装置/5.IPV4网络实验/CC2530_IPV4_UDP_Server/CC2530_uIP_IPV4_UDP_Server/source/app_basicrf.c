#include "app_basicrf.h"
#include "stdio.h"
#include "hal_defs.h"
#include "hal_rf.h"

#define APP_PAYLOAD_LENGTH        30

static uint8 TxData[APP_PAYLOAD_LENGTH];
static uint8 RxData[APP_PAYLOAD_LENGTH];
static basicRfCfg_t basicRfConfig;
//==========================================================
//	函数名称：	void Rf_Init(uint8 rf_ch,uint16 panid,uint16 short_addr)
//
//	函数功能：	初始化 RF 通信模块
//
//	入口参数：	uint8 rf_c,       通信信道，
//              uint16 panid,     个人局域网网号
//              uint16 short_addr, 网络短地址
//
//	返回参数：	无
//
//	说明：		
//==========================================================
void Rf_Init(uint8 rf_ch,uint16 panid,uint16 short_addr)
{
    // Config basicRF
    basicRfConfig.panId      = panid;
    basicRfConfig.channel    = rf_ch;
    basicRfConfig.ackRequest = TRUE;
	basicRfConfig.myAddr     = short_addr;
    if(halRfInit()==FAILED)
    {
		printf("halRfInit failure!\r\n");
    }
	else
	{
	    if(basicRfInit(&basicRfConfig)==FAILED)
		{
		  printf("basicRfConfig failure!\r\n");
		  while(1);
		}	  
		printf("halRfInit successful!\r\n");
	}
	
   //开启接收
    basicRfReceiveOn();

}
//==========================================================
//	函数名称：	uint8_t Rf_Receive(uint8_t *precv)
//
//	函数功能：	初始化 RF 通信模块
//
//	入口参数：	uint8 *precv,接收数据的数组。
//
//	返回参数：	uint8_t，接收的数据长度，若无数据接收返回 0
//
//	说明：		
//==========================================================
uint8_t Rf_Receive(uint8_t *precv)
{
  	uint8_t len=0;
	
	if((len=basicRfReceive(precv, APP_PAYLOAD_LENGTH, NULL))>0)  //接收发送到该地址的数据
	{
		printf("%d,%d\r\n",precv[0],precv[1]);
	}
	
	return len;
}