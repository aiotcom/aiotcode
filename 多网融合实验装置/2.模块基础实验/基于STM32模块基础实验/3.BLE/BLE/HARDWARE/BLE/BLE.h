#ifndef __BLE_H__
#define __BLE_H__

#include "stm32f1xx_hal.h"

#define	AT					"AT\r\n"
#define	TXPW				"AT+TXPW0\r\n"						//设置信号强度
#define	ROLE				"AT+ROLE1\r\n"						//设置主从1：主设备   0：从设备
#define	NAME 				"AT+NAMEBaCheng\r\n"			//修改蓝牙名称
#define	ADDR 				"AT+ADDR?\r\n"						//查询本机MAC地址
#define	CON 				"AT+CON987BF362C25D\r\n"	//连接该MAC地址的从机

extern uint8_t BLE_AT_STA;    /*AT指令发送完成标志位*/
extern void BLE_Init(uint8_t MS);//蓝牙初始化

#endif


