#ifndef __NFC_H__
#define __NFC_H__
 
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
#define	Spending_NFC			0xB404			//NFC RFID模块消费
#define	Top_Up_NFC				0xB405			//NFC RFID模块充值
#define	UsartSend_NFC			0xB406			//NFC RFID模块串口发送

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
#define	Balance_Nenough		0x008B			//表示余额不足

void nfc_init(void);											//初始化PN532
void nfc_close(void);
void  CleanBuffer(unsigned short num);									 	//清零 前 多少个字节的数据
void PN532_CSn_H(void);
void PN532_CSn_L(void);

unsigned char  SAMConfiguration(unsigned char mode,unsigned char timeout,unsigned char irq); 			 					//配置参数
unsigned char  nfc_InListPassiveTarget(unsigned char maxTag,unsigned char brty,unsigned char *CardID); 						//寻卡
unsigned char  nfc_PsdVerify(unsigned char AuthenticationType,unsigned char BlockNo,unsigned char * KeyData,unsigned char *SerialNum); //块验证密钥    
unsigned char  nfc_read(unsigned char BlockNO,unsigned char *BlockData);											//读块
unsigned char  nfc_write(unsigned char BlockNO,unsigned char *WriteData);										//写块
unsigned char  nfc_getIdentityID(unsigned char *identityid);											//读取身份证
unsigned char  SPI1_ReadWriteByte(unsigned char TxData);
extern   unsigned char UID[4];		   
extern   unsigned char flag_nfc_status;
extern   unsigned char UID_backup[4];
extern   unsigned char KeyBuf[6];
extern   unsigned char BlockBuf[16];

#endif /* __NFC_H__ */


