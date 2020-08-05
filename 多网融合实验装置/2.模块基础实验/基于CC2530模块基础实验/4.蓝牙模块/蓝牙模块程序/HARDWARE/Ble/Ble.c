#include "Ble.h"	
#include "delay.h"
#include "Usart.h"

uint8_t BLE_AT_STA = 0;

//==========================================================
//	函数名称：	BLE_Init()
//
//	函数功能：	蓝牙初始化函数
//
//	入口参数：	MS   	1:主设备
//				0:从设备
//              
//	返回参数：	无
//
//	说明：		
//==========================================================
void BLE_Init(uint8_t MS)
{
    while(!ble_send_cmd(AT,"OK",20));			/*进入AT命令模式*/

    while(!ble_send_cmd(TXPW,"OK",50));			/*设置信号强度*/
    
    while(!ble_send_cmd(ADDR,"OK",50));			/*查询本机地址*/
    
    while(!ble_send_cmd(NAME,"OK",50));			/*修改蓝牙名称*/
    if(MS)
    {
        while(!ble_send_cmd("AT+ROLE1\r\n","OK",50));	/*设置主从*/
        while(!ble_send_cmd(CON,"OK",50));		/*连接从机MAC地址*/
    }
    else
    {
        while(!ble_send_cmd("AT+ROLE0\r\n","OK",50));	/*设置主从*/
    }
    
    BLE_AT_STA = 1;        /*AT指令发送完成标志位*/
}


