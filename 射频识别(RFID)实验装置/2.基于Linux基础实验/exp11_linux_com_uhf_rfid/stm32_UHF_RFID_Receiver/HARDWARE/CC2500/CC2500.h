#ifndef __CC2500_H
#define __CC2500_H			    
/******************************************************************************

                  版权所有 (C), 2012-2022, FreeTeam

 ******************************************************************************
  文 件 名   : CC2500.h
  版 本 号   : 初稿
  作    者   : tofu
  生成日期   : 2013年7月6日
  最近修改   :
  功能描述   : CC2500.c HeaderFile
  函数列表   :
  修改历史   :
  1.日    期   : 2013年7月6日
    作    者   : tofu
    修改内容   : 创建文件

******************************************************************************/
#ifndef __CC2500_H__
#define __CC2500_H__

#ifdef __cplusplus
extern "C" {
#endif
#include "stm32f1xx.h"
    
#define CC_CSn_L       HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,GPIO_PIN_RESET)
#define CC_CSn_H       HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,GPIO_PIN_SET)
typedef const struct S_RF_SETTINGS{
    uint8_t sIOCFG2;    // GDO2 output pin configuration
    uint8_t sIOCFG1;    // 
    uint8_t sIOCFG0;    // GDO0 output pin configuration
    uint8_t sFIFOTHR;   // RXFIFO and TXFIFO thresholds.
    uint8_t sSYNC1;     // Sync word, high byte 
    uint8_t sSYNC0;     // Sync word, low byte 
    uint8_t sPKTLEN;    // Packet length.
    uint8_t sPKTCTRL1;  // Packet automation control.
    uint8_t sPKTCTRL0;  // Packet automation control.
    uint8_t sADDR;      // Device address.
    uint8_t sCHANNR;    // Channel number.    
    uint8_t sFSCTRL1;   // Frequency synthesizer control.
    uint8_t sFSCTRL0;   // Frequency synthesizer control.    
    uint8_t sFREQ2;     // Frequency control word, high byte.
    uint8_t sFREQ1;     // Frequency control word, middle byte.
    uint8_t sFREQ0;     // Frequency control word, low byte.
    uint8_t sMDMCFG4;   // Modem configuration.
    uint8_t sMDMCFG3;   // Modem configuration.
    uint8_t sMDMCFG2;   // Modem configuration.
    uint8_t sMDMCFG1;   // Modem configuration.
    uint8_t sMDMCFG0;   // Modem configuration.    
    uint8_t sDEVIATN;   // Modem deviation setting (when FSK modulation is enabled).
    uint8_t sMCSM2;     // Main Radio Control State Machine configuration 
    uint8_t sMCSM1;     // Main Radio Control State Machine configuration
    uint8_t sMCSM0;     // Main Radio Control State Machine configuration.
    uint8_t sFOCCFG;    // Frequency Offset Compensation configuration 
    uint8_t sBSCFG;     // Bit Synchronization configuration 
    uint8_t sAGCCTRL2;  // AGC control.
	uint8_t sAGCCTRL1;  // AGC control.
    uint8_t sAGCCTRL0;  // AGC control.
    uint8_t sWOREVT1;   // High byte Event 0 timeout 
    uint8_t sWOREVT0;   // Low byte Event 0 timeout 
    uint8_t sWORCTRL;   // Wake On Radio control  
    uint8_t sFREND1;    // Front end RX configuration.
    uint8_t sFREND0;    // Front end TX configuration.    
    uint8_t sFSCAL3;    // Frequency synthesizer calibration.
    uint8_t sFSCAL2;    // Frequency synthesizer calibration.
	uint8_t sFSCAL1;    // Frequency synthesizer calibration.
    uint8_t sFSCAL0;    // Frequency synthesizer calibration.
    uint8_t sRCCTRL1;   // RC oscillator configuration 
    uint8_t sRCCTRL2;   // RC oscillator configuration 
    uint8_t sFSTEST;    // Frequency synthesizer calibration control
    uint8_t sPTEST;     // Production test 
    uint8_t sAGCTEST;   // AGC test 
    uint8_t sTEST2;     // Various test settings.
    uint8_t sTEST1;     // Various test settings.
    uint8_t sTEST0;     // Various test settings.    
} RF_SETTINGS;

extern RF_SETTINGS RFSettings;

extern void CC2500_Init(void);
extern void CC2500_SetPA(void);

extern void CC2500_Disable_Interrupt(void);
extern void CC2500_Enable_Interrupt(void);

extern void CC2500_WriteStrobe(uint8_t Strobe);

extern void CC2500_ModeTx(void);
extern void CC2500_ModeRx(void);
extern void CC2500_ModeIdle(void);
extern void CC2500_ModePWRdown(void);

extern void CC2500_WaitTX_Done(void);

extern void CC2500_ClrRXFIFO(void);
extern void CC2500_ClrTXFIFO(void);

extern void CC2500_WriteByte(uint8_t Addr,uint8_t data);
extern void CC2500_BustWrite(uint8_t Addr,uint8_t * pData,uint8_t len);
extern void CC2500_WriteSettings(RF_SETTINGS * pRfSettings);

extern uint8_t   CC2500_ReadReg(uint8_t Addr);
extern uint8_t   CC2500_ReadStatus(void);
extern void CC2500_BurstRead(uint8_t Addr,uint8_t *pBuf,uint8_t Len);

extern ErrorStatus CC2500_RevPacket(uint8_t *len,uint8_t *data);
extern void CC2500_SendPacket(uint8_t len,uint8_t *data);

#ifdef __cplusplus
}
#endif

#endif /* __CC2500_H__ */


#endif



