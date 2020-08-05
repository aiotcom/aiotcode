#ifndef __Rs485_H
#define __Rs485_H
#include "stm32f1xx_hal.h"

#define 		Send_REC_LEN  				500  			//定义最大接收字节数 500
#define 		Receive_REC_LEN  			500  			//定义最大接收字节数 500

/*		设备地址		*/
#define			Addr_Power						0x10			//电源盒地址
#define			Addr_LED							0x11			//LED模块地址
#define			Addr_Matrixkey				0x12			//矩阵键盘模块地址
#define			Addr_Fan							0x13			//风扇模块地址
#define			Addr_Relay						0x14			//继电器地址
#define			Addr_TFT							0x15			//TFT屏地址
#define			Addr_SHT20						0x16			//温湿度模块地址
#define			Addr_Pre							0x17			//压力传感器模块地址
#define			Addr_RFID							0x18			//RFID模块地址
#define			Addr_Gyr							0x19			//陀螺仪模块地址
#define			Addr_PIR							0x1A			//人体红外模块地址
#define			Addr_NB								0x1B			//NB-iot模块地址
#define			Addr_BLE							0x1C			//蓝牙模块地址
#define			Addr_ZigBee						0x1D			//ZigBee模块地址
#define			Addr_GPS							0x1E			//GPS模块地址
#define			Addr_WiFi							0x1F			//WiFi模块地址
#define			Addr_Ultrasonic				0x20			//超声波模块地址
#define			Addr_Motor						0x21			//步进电机模块地址
#define			Addr_PM2_5						0x22			//PM2.5模块地址
#define			Addr_IPV4							0x23			//IPV4模块地址
#define			Addr_Flame						0x24			//火焰传感器模块地址
#define			Addr_Shock						0x25			//震动传感器模块地址
#define			Addr_Heart						0x26			//心率传感器地址
#define			Addr_LF								0x27			//LF模块地址
#define			Addr_A_P							0x28			//大气压力模块地址

/*		命令码		*/

#define			Matrixkey0						0x1201		//矩阵键盘-按键0
#define			Matrixkey1						0x1211		//矩阵键盘-按键1
#define			Matrixkey2						0x1221		//矩阵键盘-按键2
#define			Matrixkey3						0x1231		//矩阵键盘-按键3
#define			Matrixkey4						0x1241		//矩阵键盘-按键4
#define			Matrixkey5						0x1251		//矩阵键盘-按键5
#define			Matrixkey6						0x1261		//矩阵键盘-按键6
#define			Matrixkey7						0x1271		//矩阵键盘-按键7
#define			Matrixkey8						0x1281		//矩阵键盘-按键8
#define			Matrixkey9						0x1291		//矩阵键盘-按键9
#define			MatrixkeyEnter				0x12A1		//矩阵键盘-按键Enter
#define			MatrixkeyCanel				0x12B1		//矩阵键盘-按键Canel
#define			MatrixkeyUP						0x12C1		//矩阵键盘-按键UP
#define			MatrixkeyDown					0x12D1		//矩阵键盘-按键Down
#define			MatrixkeyLeft					0x12E1		//矩阵键盘-按键Left
#define			MatrixkeyRight				0x12F1		//矩阵键盘-按键Right

#define			FAN_OFF								0x1310		//关闭风扇
#define			FAN_ON1								0x1311		//打开风扇-1档
#define			FAN_ON2								0x1321		//打开风扇-2档
#define			FAN_ON3								0x1331		//打开风扇-3档

#define			Relay1_ON							0x1411		//打开继电器1
#define			Relay1_OFF						0x1410		//关闭继电器1
#define			Relay2_ON							0x1421		//打开继电器2
#define			Relay2_OFF						0x1420		//关闭继电器2

#define			TFT_QueryMatrixkey		0x1501		//TFT-查询矩阵键盘
#define			TFT_QueryRFID					0x1511		//TFT-查询RFID
#define			TFT_QueryMotor				0x1521		//TFT-查询电机状态

#define			SHT20_Temp						0x1601		//温湿度-温度
#define			SHT20_Humi						0x1611		//温湿度-湿度
#define			SHT20_Light						0x1621		//温湿度-光照强度
#define			SHT20_All							0x1631		//温湿度-全部数据

#define			Pre_Weight						0x1701		//压力-重量

#define			RFID_ID								0x1801		//RFID-卡号
#define			RFID_Block						0x1811		//RFID-块数据
#define			RFID_All							0x1821		//RFID-卡号+块数据

#define			Gyr_Angle							0x1901		//陀螺仪-角度

#define			PIR_Flag							0x1A01		//人体红外-是否检测到人体

#define			NB_SHT20							0x1B11		//NB-IoT模块获取温湿度模块数据
#define			NB_RFID								0x1B21		//NB-IoT模块获取RFID模块数据
#define			NB_TFT								0x1B31		//NB-IoT模块获取TFT模块数据

#define			GPS_Location					0x1E01		//GPS-经纬度

#define			Ultrasonic_Distance		0x2001		//超声波-距离（cm）

#define			Motor_OFF							0x2100		//步进电机-关闭
#define			Motor_ON							0x2101		//步进电机-开启
#define			Motor_Stop						0x2111		//步进电机-暂停

#define			PM2_5_Conc						0x2201		//PM2.5-PM2.5浓度

#define			Flame_Flag						0x2401		//火焰传感器-是否起火

#define			Shock_Count						0x2501		//震动-震动次数

#define			Heart_Count						0x2601		//心率-每分钟心跳次数

#define			Lf_Flag								0x2701		//Lf-卡数据

#define			A_P_Altitude					0x2801		//大气压力-海拔高度

/*		模式控制		*/ 
#define RS485_TX_EN()		 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_SET);		//485模式控制发送.
#define RS485_RX_EN()		 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_RESET);	//485模式控制接收;

/*
		定义485发送数据结构体
*/
typedef struct
{
    uint32_t Head;					//协议帧头
		uint8_t Pack_Num;				//包序号
		uint8_t Src_Adr;				//源地址
		uint8_t Dst_Adr;				//目的地址
    uint16_t State;					//状态码
		uint8_t Data_Len;				//数据长度
    uint8_t Data[500];			//数据
		uint16_t CrcCheck;			//CRC校验码
		uint32_t Tail;					//协议帧尾
}Send_Stack;

/*
		定义485接收数据结构体
*/
typedef struct
{
    uint32_t Head;					//协议帧头
		uint8_t Pack_Num;				//包序号
		uint8_t Src_Adr;				//源地址
		uint8_t Dst_Adr;				//目的地址
    uint16_t Command;				//命令码
		uint8_t Data_Len;				//数据长度
    uint8_t Data[500];			//数据
		uint16_t CrcCheck;			//CRC校验码
		uint32_t Tail;					//协议帧尾
}Receive_Stack;

extern Send_Stack Tx_Stack;														//485发送数据结构体
extern Receive_Stack Rx_Stack;												//485接收数据结构体

extern unsigned char  Send_Data[Send_REC_LEN]; 				//发送缓冲,最大Send_REC_LEN个字节
extern unsigned char  Receive_Data[Receive_REC_LEN]; 	//接收缓冲,最大Send_REC_LEN个字节

extern void Rs485_Init(void);  		//初始化485
extern void Tx_Stack_Init(void);	//485发送数据结构体初始化
extern void Rx_Stack_Init(void);	//485接收数据结构体初始化
extern void Rs485_Receive(uint8_t data);							//485接收函数
extern uint16_t CRC_16(void *p, int length);					//CRC_16计算函数
extern uint8_t DataHand_485(uint8_t DesAddr);					//485数据处理
extern uint16_t calcByte(uint16_t crc, uint8_t b);		//CRC_16字节计算函数
extern void Rs485_Send(uint8_t SrcAdr,uint8_t DstAdr,uint16_t Cmd,uint8_t Len,uint8_t *pData);			//485发送函数

#endif



