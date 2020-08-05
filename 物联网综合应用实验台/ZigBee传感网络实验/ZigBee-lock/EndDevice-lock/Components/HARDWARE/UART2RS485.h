#ifndef __UART2RS485_H
#define __UART2RS485_H

#include "hal_types.h"
void UART2RS485_Init(void);
/*		模式控制		*/ 
#define RS485_TX_EN()	P1_3 = 1;//RS485，接收数据 		//485发送模式
#define RS485_RX_EN()	P1_3 = 0;//RS485，接收数据 	//485接收模式

/*		设备地址		*/
#define			Addr_Light						0x1001		//光照传感器地址
#define			Addr_WS							0x1101		//温湿度传感器地址
#define			Addr_Motor						0x1201		//直流电机地址
#define			Addr_Lock						0x1301		//电磁锁地址
#define			Addr_Siren						0x1401		//警报器地址
#define			Addr_Fan						0x1501		//风扇地址
#define			Addr_NULL						0xFFFF		//空地址-无对象地址时数据传入该地址

/*		命令码		*/
#define			Get_Light_Data					0x1000		//获取光照传感器数据
#define			Light_Data						0x1001		//光照传感器数据

#define			Get_WS_Data						0x1100		//获取温湿度传感器数据
#define			WS_Data							0x1101		//温湿度传感器数据

#define			Motor_OFF						0x1200		//关闭直流电机
#define			Motor_ON						0x1201		//打开直流电机

#define			Lock_OFF						0x1300		//关闭电磁锁
#define			Lock_ON							0x1301		//打开电磁锁

#define			Siren_OFF						0x1400		//关闭警报器
#define			Siren_ON						0x1401		//打开警报器

#define			Fan_OFF							0x1500		//关闭风扇
#define			Fan_ON							0x1501		//打开风扇

/*
		定义485发送数据结构体
*/
#define 		Send_REC_LEN  				200  			//定义最大接收字节数 200
#define 		Receive_REC_LEN  			200  			//定义最大接收字节数 200

#define			Receiving_Completion	0x8000		//接收完成
typedef struct
{
	uint32_t Head;					//协议帧头
	uint8_t Pack_Num;				//包序号
	uint16_t Src_Adr;				//源地址
	uint16_t Dst_Adr;				//目的地址
	uint16_t State;					//状态码
	uint8_t Data_Len;				//数据长度
	uint8_t Data[Send_REC_LEN];     //数据
	uint16_t CrcCheck;			    //CRC校验码
	uint32_t Tail;					//协议帧尾
}Send_Stack;

/*
		定义485接收数据结构体
*/
typedef struct
{
	uint32_t Head;					//协议帧头
	uint8_t Pack_Num;				//包序号
	uint16_t Src_Adr;				//源地址
	uint16_t Dst_Adr;				//目的地址
	uint16_t Command;				//命令码
	uint8_t Data_Len;				//数据长度
	uint8_t Data[Receive_REC_LEN];  //数据
	uint16_t CrcCheck;			    //CRC校验码
	uint32_t Tail;					//协议帧尾
}Receive_Stack;

/*
		声明485接收数据结构体
*/
extern Send_Stack Tx_Stack;							//485发送数据结构体
extern Receive_Stack Rx_Stack;						//485接收数据结构体

/*
		声明485发送/接收数组
*/
extern uint8_t Send_Data[Send_REC_LEN]; 			//发送缓冲,最大Send_REC_LEN个字节
extern uint8_t Receive_Data[Receive_REC_LEN]; 		//接收缓冲,最大Send_REC_LEN个字节

/*
		声明函数
*/
extern void Rs485_Init(void);  		      //初始化485
extern void Tx_Stack_Init(void);	      //485发送数据结构体初始化
extern void Rx_Stack_Init(void);	      //485接收数据结构体初始化
void Rs485_delay_ms(unsigned int nms);	  //485延时函数
extern void Rs485_Receive(uint8_t data);				//485接收函数
extern uint16_t CRC_16(void *p, int length);			//CRC_16计算函数
extern uint8_t DataHandling_485(uint16_t DesAddr);		//485数据处理
extern uint16_t calcByte(uint16_t crc, uint8_t b);		//CRC_16字节计算函数
extern void Rs485_Send(uint16_t SrcAdr,uint16_t DstAdr,uint16_t Cmd,uint8_t Len,uint8_t *pData);//485发送函数
extern void Rs485_ClearReceiveBuffer(void);
#endif