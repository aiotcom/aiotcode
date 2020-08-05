#ifndef __UART2RS485_H
#define __UART2RS485_H

#include "hal_types.h"
#define			Addr_Light						0x1001		//光照传感器地址
#define			Addr_WS							0x1101		//温湿度传感器地址
#define			Addr_Motor						0x1201		//直流电机地址
#define			Addr_Lock						0x1301		//电磁锁地址
#define			Addr_Siren						0x1401		//警报器地址
#define			Addr_Fan						0x1501		//风扇地址
#define         Addr_LED                        0x1601      //LED  
#define			Addr_PIR						0x1701		//人体红外
#define			Addr_NULL						0xFFFF		//空地址-无对象地址时数据传入该地址

void UART2RS485_Init(void);
#endif