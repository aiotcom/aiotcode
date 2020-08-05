#ifndef __RC522_H
#define	__RC522_H

#include "stm32f1xx.h"
#include "delay.h"

/*********************************** RC522 IO口定义*********************************************/

#define			RC522_CS_PORT								GPIOA
#define			RC522_SCK_PORT							GPIOA
#define			RC522_LED_PORT							GPIOB
#define			RC522_MOSI_PORT							GPIOA
#define			RC522_MISO_PORT							GPIOA
#define			RC522_Reset_PORT						GPIOA

#define			RC522_CS_PIN								GPIO_PIN_4
#define			RC522_LED_PIN								GPIO_PIN_14
#define			RC522_SCK_PIN								GPIO_PIN_5
#define			RC522_MOSI_PIN							GPIO_PIN_7
#define			RC522_MISO_PIN							GPIO_PIN_6	
#define			RC522_Reset_PIN							GPIO_PIN_0

#define     macRC522_CS_Enable()       	HAL_GPIO_WritePin ( RC522_CS_PORT, RC522_CS_PIN,GPIO_PIN_RESET )
#define     macRC522_CS_Disable()       HAL_GPIO_WritePin ( RC522_CS_PORT, RC522_CS_PIN,GPIO_PIN_SET )

#define     macRC522_LED_ON()           HAL_GPIO_WritePin ( RC522_LED_PORT, RC522_LED_PIN,GPIO_PIN_RESET)
#define     macRC522_LED_OFF()          HAL_GPIO_WritePin ( RC522_LED_PORT, RC522_LED_PIN,GPIO_PIN_SET )

#define     macRC522_SCK_0()            HAL_GPIO_WritePin ( RC522_SCK_PORT, RC522_SCK_PIN,GPIO_PIN_RESET)
#define     macRC522_SCK_1()            HAL_GPIO_WritePin ( RC522_SCK_PORT, RC522_SCK_PIN,GPIO_PIN_SET )

#define     macRC522_MOSI_0()           HAL_GPIO_WritePin ( RC522_MOSI_PORT, RC522_MOSI_PIN,GPIO_PIN_RESET )
#define     macRC522_MOSI_1()           HAL_GPIO_WritePin ( RC522_MOSI_PORT, RC522_MOSI_PIN,GPIO_PIN_SET )

#define     macRC522_Reset_Enable()     HAL_GPIO_WritePin ( RC522_Reset_PORT, RC522_Reset_PIN,GPIO_PIN_RESET )
#define   	macRC522_Reset_Disable()    HAL_GPIO_WritePin ( RC522_Reset_PORT, RC522_Reset_PIN,GPIO_PIN_SET )

#define     macRC522_MISO_GET()         HAL_GPIO_ReadPin ( RC522_MISO_PORT, RC522_MISO_PIN ) 

/////////////////////////////////////////////////////////////////////
//数据地址
/////////////////////////////////////////////////////////////////////
#define	Addr_125k					0xB1				// 125K数据地址
#define Addr_UHF					0xB2				// UHF数据地址
#define Addr_MF						0xB3				// 13.56数据地址
#define Addr_Books				0xB5				// 图书管理数据地址
#define Addr_EP						0xB6				// 电子钱包数据地址
#define Addr_2_4G					0xB7				// 2.4G数据地址
#define Addr_Uc						0xC0				// 上位机数据地址

/////////////////////////////////////////////////////////////////////
//125K命令字
/////////////////////////////////////////////////////////////////////
#define	FindCard_125K			0xB101			//125K RFID模块寻卡
#define	HomCard_125K			0xB102			//125K RFID模块自动寻卡
#define	UsartSend_125K		0xB103			//125K RFID模块串口发送

/////////////////////////////////////////////////////////////////////
//UHF命令字
/////////////////////////////////////////////////////////////////////
#define FindCard_UHF 			0xB201			//UHF RFID模块寻卡				
#define HomCard_UHF 			0xB202			//UHF RFID模块自动寻卡	
#define ReadPower_UHF 		0xB203			//UHF RFID模块获取功率	
#define SetPower_UHF 			0xB204			//UHF RFID模块功率设置	
#define OpenPA_UHF 				0xB205			//UHF RFID模块打开功放	
#define ClosePA_UHF 			0xB206			//UHF RFID模块关闭功放·	
#define ReadData_UHF 			0xB207			//UHF RFID模块读取	
#define WriteData_UHF 		0xB208			//UHF RFID模块写入	
#define AutKey_UHF 				0xB209			//UHF RFID模块访问密钥	
#define LockData_UHF 			0xB20A			//UHF RFID模块锁定数据	
#define UsartSend_UHF 		0xB20B			//UHF RFID模块串口发送	 
 
/////////////////////////////////////////////////////////////////////
//13.56命令字
/////////////////////////////////////////////////////////////////////
#define	FindCard_MF				0xB301			//13.56M RFID模块寻卡
#define	HomCard_MF				0xB302			//13.56M RFID模块自动寻卡
#define	AutKeyA_MF				0xB303			//13.56M RFID模块认证密钥A
#define	AutKeyB_MF				0xB304			//13.56M RFID模块认证密钥B
#define	ReadData_MF				0xB305			//13.56M RFID模块读取数据
#define	WriteData_MF			0xB306			//13.56M RFID模块写入数据
#define	UsartSend_MF			0xB307			//13.56M RFID模块串口发送

/////////////////////////////////////////////////////////////////////
//NFC命令字
/////////////////////////////////////////////////////////////////////
#define	FindCard_NFC			0xB401			//NFC RFID模块寻卡
#define	HomCard_NFC				0xB402			//NFC RFID模块自动寻卡
#define	SendCard_NFC			0xB403			//NFC RFID模块发卡
#define	Top_Up_NFC				0xB404			//NFC RFID模块充值
#define	UsartSend_NFC			0xB405			//NFC RFID模块串口发送

/////////////////////////////////////////////////////////////////////
//图书管理命令字
/////////////////////////////////////////////////////////////////////
#define FindCard_Books		0xB501			//图书管理 RFID模块寻卡
#define HomCard_Books			0xB502			//图书管理 RFID模块自动寻卡
#define Borrow_Books			0xB503			//图书管理 RFID模块借书
#define Also_Books				0xB504			//图书管理 RFID模块还书
#define UsartSend_Books		0xB505			//图书管理 RFID模块串口发送

/////////////////////////////////////////////////////////////////////
//电子钱包命令字
/////////////////////////////////////////////////////////////////////
#define FindCard_EP				0xB601			//电子钱包 RFID模块寻卡
#define HomCard_EP				0xB602			//电子钱包 RFID模块自动寻卡
#define AutKeyA_EP				0xB603			//电子钱包 RFID模块认证密钥A
#define AutKeyB_EP				0xB604			//电子钱包 RFID模块认证密钥B
#define Query_EP					0xB605			//电子钱包 RFID模块查询
#define Top_Up_EP					0xB606			//电子钱包 RFID模块充值
#define Deduction_EP			0xB607			//电子钱包 RFID模块扣费
#define UsartSend_EP			0xB608			//电子钱包 RFID模块串口发送

/////////////////////////////////////////////////////////////////////
//2.4G命令字
/////////////////////////////////////////////////////////////////////
#define Set_2_4G					0xB601			//2.4G RFID设置
#define UsartSend_2_4G		0xB602			//2.4G RFID串口发送

/////////////////////////////////////////////////////////////////////
//状态码
/////////////////////////////////////////////////////////////////////
#define	Impl_OK						0x0000			//执行成功
#define	Impl_Err					0x0001			//执行失败

/////////////////////////////////////////////////////////////////////
//数据码
/////////////////////////////////////////////////////////////////////
#define	Set_OK						0x0080			//表示参数设置成功
#define	Set_Err						0x0081			//表示参数设置失败
#define	Com_TimeOut				0x0082			//表示通讯超时
#define	Car_DissExiste		0x0083			//表示卡不存在
#define	Car_Data_Err			0x0084			//表示接收卡数据错误
#define	Unknown_Err				0x0085			//表示未知错误
#define	Init_Err					0x0086			//表示初始化错误
#define	Seq_Err						0x0087			//表示在防冲撞过程中得到错误序列号
#define	Key_Pass					0x0088			//表示密钥认证未通过
#define	Com_DissExiste		0x0089			//表示输入命令码不存在
#define	Write_Err					0x008A			//表示写操作不成功

#define   macRC522_DELAY()  delay_us (20)
/////////////////////////////////////////////////////////////////////
//MF522命令字
/////////////////////////////////////////////////////////////////////
#define PCD_IDLE              0x00               //取消当前命令
#define PCD_AUTHENT           0x0E               //验证密钥
#define PCD_RECEIVE           0x08               //接收数据
#define PCD_TRANSMIT          0x04               //发送数据
#define PCD_TRANSCEIVE        0x0C               //发送并接收数据
#define PCD_RESETPHASE        0x0F               //复位
#define PCD_CALCCRC           0x03               //CRC计算

/////////////////////////////////////////////////////////////////////
//Mifare_One卡片命令字
/////////////////////////////////////////////////////////////////////
#define PICC_REQIDL           0x26               //寻天线区内未进入休眠状态
#define PICC_REQALL           0x52               //寻天线区内全部卡
#define PICC_ANTICOLL1        0x93               //防冲撞
#define PICC_ANTICOLL2        0x95               //防冲撞
#define PICC_AUTHENT1A        0x60               //验证A密钥
#define PICC_AUTHENT1B        0x61               //验证B密钥
#define PICC_READ             0x30               //读块
#define PICC_WRITE            0xA0               //写块
#define PICC_DECREMENT        0xC0               //扣款
#define PICC_INCREMENT        0xC1               //充值
#define PICC_RESTORE          0xC2               //调块数据到缓冲区
#define PICC_TRANSFER         0xB0               //保存缓冲区中数据
#define PICC_HALT             0x50               //休眠

/////////////////////////////////////////////////////////////////////
//MF522 FIFO长度定义
/////////////////////////////////////////////////////////////////////
#define DEF_FIFO_LENGTH       64                 //FIFO size=64byte
#define MAXRLEN  18

/////////////////////////////////////////////////////////////////////
//MF522寄存器定义
////////////////////////////////////////////////////// ///////////////
// PAGE 0
#define     RFU00                 0x00    
#define     CommandReg            0x01    
#define     ComIEnReg             0x02    
#define     DivlEnReg             0x03    
#define     ComIrqReg             0x04    
#define     DivIrqReg             0x05
#define     ErrorReg              0x06    
#define     Status1Reg            0x07    
#define     Status2Reg            0x08    
#define     FIFODataReg           0x09
#define     FIFOLevelReg          0x0A
#define     WaterLevelReg         0x0B
#define     ControlReg            0x0C
#define     BitFramingReg         0x0D
#define     CollReg               0x0E
#define     RFU0F                 0x0F
// PAGE 1     
#define     RFU10                 0x10
#define     ModeReg               0x11
#define     TxModeReg             0x12
#define     RxModeReg             0x13
#define     TxControlReg          0x14
#define     TxAutoReg             0x15
#define     TxSelReg              0x16
#define     RxSelReg              0x17
#define     RxThresholdReg        0x18
#define     DemodReg              0x19
#define     RFU1A                 0x1A
#define     RFU1B                 0x1B
#define     MifareReg             0x1C
#define     RFU1D                 0x1D
#define     RFU1E                 0x1E
#define     SerialSpeedReg        0x1F
// PAGE 2    
#define     RFU20                 0x20  
#define     CRCResultRegM         0x21
#define     CRCResultRegL         0x22
#define     RFU23                 0x23
#define     ModWidthReg           0x24
#define     RFU25                 0x25
#define     RFCfgReg              0x26
#define     GsNReg                0x27
#define     CWGsCfgReg            0x28
#define     ModGsCfgReg           0x29
#define     TModeReg              0x2A
#define     TPrescalerReg         0x2B
#define     TReloadRegH           0x2C
#define     TReloadRegL           0x2D
#define     TCounterValueRegH     0x2E
#define     TCounterValueRegL     0x2F
// PAGE 3      
#define     RFU30                 0x30
#define     TestSel1Reg           0x31
#define     TestSel2Reg           0x32
#define     TestPinEnReg          0x33
#define     TestPinValueReg       0x34
#define     TestBusReg            0x35
#define     AutoTestReg           0x36
#define     VersionReg            0x37
#define     AnalogTestReg         0x38
#define     TestDAC1Reg           0x39  
#define     TestDAC2Reg           0x3A   
#define     TestADCReg            0x3B   
#define     RFU3C                 0x3C   
#define     RFU3D                 0x3D   
#define     RFU3E                 0x3E   
#define     RFU3F		  		  			0x3F

/////////////////////////////////////////////////////////////////////
//和MF522通讯时返回的错误代码
/////////////////////////////////////////////////////////////////////
#define 	MI_OK                 0x26
#define 	MI_NOTAGERR           0xcc
#define 	MI_ERR                0xbb

/*********************************** RC522 函数宏定义*********************************************/

extern unsigned char ucArray_ID[10];	//HF_RFID-ID
extern unsigned char Block_Date[20];	//HF_RFID-Data
extern unsigned char Data_Send[30];		//HF_RFID-ID+Data
void RC522_Init( void );
uint8_t SearchCard(void);
uint8_t IC_Card_Search(uint8_t *carid,uint8_t *blockdata);
extern uint8_t IC_Card_Exist;
void IC_Card_Read(uint8_t *p);
uint8_t IC_Card_Write(uint8_t *p);
uint8_t Verification_Key( unsigned char ucAuth_mode, unsigned char ucAddr, unsigned char * pKey);
#define          macDummy_Data              0x00

void             PcdReset                   ( void );                       						//复位
void             M500PcdConfigISOType       ( unsigned char type );                    	//工作方式
char             PcdRequest                 ( unsigned char req_code, unsigned char * pTagType ); //寻卡
char             PcdAnticoll                ( unsigned char * pSnr);                   	//读卡号
char PcdRead ( unsigned char ucAddr, unsigned char * pData );
char PcdWrite ( unsigned char ucAddr, unsigned char * pData );
char PcdSelect ( unsigned char * pSnr );
char PcdAuthState ( unsigned char ucAuth_mode, unsigned char ucAddr, unsigned char * pKey, unsigned char * pSnr );

#endif /* __RC522_CONFIG_H */



