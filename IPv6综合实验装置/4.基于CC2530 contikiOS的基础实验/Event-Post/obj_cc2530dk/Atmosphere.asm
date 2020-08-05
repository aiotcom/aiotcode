;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module Atmosphere
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BMP085_Read_3B
	.globl _BMP085_Read_2B
	.globl _I2C_Read
	.globl _I2C_Write
	.globl _I2C_Read_Byte
	.globl _I2C_Write_Byte
	.globl _I2C_Check_ack
	.globl _Sendack
	.globl _I2C_Stop
	.globl _I2C_Start
	.globl _SDA_OUT
	.globl _SDA_IN
	.globl _IIC_SCL
	.globl _IIC_SDA
	.globl _Delay5us
	.globl _delay_us
	.globl _printf
	.globl _ACTIVE
	.globl _TX_BYTE
	.globl _RX_BYTE
	.globl _ERR
	.globl _FE
	.globl _SLAVE
	.globl _RE
	.globl _MODE
	.globl _T3OVFIF
	.globl _T3CH0IF
	.globl _T3CH1IF
	.globl _T4OVFIF
	.globl _T4CH0IF
	.globl _T4CH1IF
	.globl _OVFIM
	.globl _B_0
	.globl _B_1
	.globl _B_2
	.globl _B_3
	.globl _B_4
	.globl _B_5
	.globl _B_6
	.globl _B_7
	.globl _P2IF
	.globl _UTX0IF
	.globl _UTX1IF
	.globl _P1IF
	.globl _WDTIF
	.globl _ACC_0
	.globl _ACC_1
	.globl _ACC_2
	.globl _ACC_3
	.globl _ACC_4
	.globl _ACC_5
	.globl _ACC_6
	.globl _ACC_7
	.globl _P
	.globl _F1
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _DMAIF
	.globl _T1IF
	.globl _T2IF
	.globl _T3IF
	.globl _T4IF
	.globl _P0IF
	.globl _STIF
	.globl _DMAIE
	.globl _T1IE
	.globl _T2IE
	.globl _T3IE
	.globl _T4IE
	.globl _P0IE
	.globl _RFERRIE
	.globl _ADCIE
	.globl _URX0IE
	.globl _URX1IE
	.globl _ENCIE
	.globl _STIE
	.globl _EA
	.globl _P2_0
	.globl _P2_1
	.globl _P2_2
	.globl _P2_3
	.globl _P2_4
	.globl _P2_5
	.globl _P2_6
	.globl _P2_7
	.globl _ENCIF_0
	.globl _ENCIF_1
	.globl _P1_0
	.globl _P1_1
	.globl _P1_2
	.globl _P1_3
	.globl _P1_4
	.globl _P1_5
	.globl _P1_6
	.globl _P1_7
	.globl _IT0
	.globl _RFERRIF
	.globl _IT1
	.globl _URX0IF
	.globl _ADCIF
	.globl _URX1IF
	.globl _P0_0
	.globl _P0_1
	.globl _P0_2
	.globl _P0_3
	.globl _P0_4
	.globl _P0_5
	.globl _P0_6
	.globl _P0_7
	.globl _WDCTL
	.globl _U1GCR
	.globl _U1UCR
	.globl _U1BAUD
	.globl _U1DBUF
	.globl _U1CSR
	.globl _U0GCR
	.globl _U0UCR
	.globl _U0BAUD
	.globl _U0DBUF
	.globl _U0CSR
	.globl _TIMIF
	.globl _T4CC1
	.globl _T4CCTL1
	.globl _T4CC0
	.globl _T4CCTL0
	.globl _T4CTL
	.globl _T4CNT
	.globl _T3CC1
	.globl _T3CCTL1
	.globl _T3CC0
	.globl _T3CCTL0
	.globl _T3CTL
	.globl _T3CNT
	.globl _T2MSEL
	.globl _T2IRQM
	.globl _T2MOVF2
	.globl _T2MOVF1
	.globl _T2MOVF0
	.globl _T2M1
	.globl _T2M0
	.globl _T2IRQF
	.globl _T2EVTCFG
	.globl _T2CTRL
	.globl _T1STAT
	.globl _T1CCTL2
	.globl _T1CCTL1
	.globl _T1CCTL0
	.globl _T1CTL
	.globl _T1CNTH
	.globl _T1CNTL
	.globl _T1CC2H
	.globl _T1CC2L
	.globl _T1CC1H
	.globl _T1CC1L
	.globl _T1CC0H
	.globl _T1CC0L
	.globl _CLKCONSTA
	.globl _CLKCONCMD
	.globl _SLEEPSTA
	.globl _SLEEPCMD
	.globl _STLOAD
	.globl _ST2
	.globl _ST1
	.globl _ST0
	.globl _RFERRF
	.globl _RFIRQF0
	.globl _RFST
	.globl _RFD
	.globl _RFIRQF1
	.globl _PSBANK
	.globl _FMAP
	.globl _MEMCTR
	.globl __XPAGE
	.globl _MPAGE
	.globl _PMUX
	.globl _P2DIR
	.globl _P1DIR
	.globl _P0DIR
	.globl _P2INP
	.globl _P1INP
	.globl _P2SEL
	.globl _P1SEL
	.globl _P0SEL
	.globl _APCFG
	.globl _PERCFG
	.globl _P0INP
	.globl _P2IEN
	.globl _P1IEN
	.globl _P0IEN
	.globl _PICTL
	.globl _P2IFG
	.globl _P1IFG
	.globl _P0IFG
	.globl _DMAREQ
	.globl _DMAARM
	.globl _DMA0CFGH
	.globl _DMA0CFGL
	.globl _DMA1CFGH
	.globl _DMA1CFGL
	.globl _DMAIRQ
	.globl _ENCCS
	.globl _ENCDO
	.globl _ENCDI
	.globl _RNDH
	.globl _RNDL
	.globl _ADCH
	.globl _ADCL
	.globl _ADCCON3
	.globl _ADCCON2
	.globl _ADCCON1
	.globl _B
	.globl _IRCON2
	.globl _ACC
	.globl _PSW
	.globl _IRCON
	.globl _IP1
	.globl _IEN1
	.globl _IP0
	.globl _IEN0
	.globl _P2
	.globl _S1CON
	.globl _IEN2
	.globl _S0CON
	.globl _DPS
	.globl _P1
	.globl _TCON
	.globl _PCON
	.globl _DPH1
	.globl _DPL1
	.globl _DPH0
	.globl _DPL0
	.globl _SP
	.globl _P0
	.globl _delay_count
	.globl _dig_H6
	.globl _dig_H5
	.globl _dig_H4
	.globl _dig_H3
	.globl _dig_H2
	.globl _dig_H1
	.globl _dig_P9
	.globl _dig_P8
	.globl _dig_P7
	.globl _dig_P6
	.globl _dig_P5
	.globl _dig_P4
	.globl _dig_P3
	.globl _dig_P2
	.globl _dig_P1
	.globl _dig_T3
	.globl _dig_T2
	.globl _dig_T1
	.globl _t_fine
	.globl _pres_raw
	.globl _temp_raw
	.globl _hum_raw
	.globl _X_IEEE_ADDR
	.globl _X_INFOPAGE
	.globl _X_P2DIR
	.globl _X_P1DIR
	.globl _X_P0DIR
	.globl _X_U1GCR
	.globl _X_U1UCR
	.globl _X_U1BAUD
	.globl _X_U1DBUF
	.globl _X_U1CSR
	.globl _X_P2INP
	.globl _X_P1INP
	.globl _X_P2SEL
	.globl _X_P1SEL
	.globl _X_P0SEL
	.globl _X_APCFG
	.globl _X_PERCFG
	.globl _X_T4CC1
	.globl _X_T4CCTL1
	.globl _X_T4CC0
	.globl _X_T4CCTL0
	.globl _X_T4CTL
	.globl _X_T4CNT
	.globl _X_RFIRQF0
	.globl _X_T1CCTL2
	.globl _X_T1CCTL1
	.globl _X_T1CCTL0
	.globl _X_T1CTL
	.globl _X_T1CNTH
	.globl _X_T1CNTL
	.globl _X_RFST
	.globl _X_T1CC2H
	.globl _X_T1CC2L
	.globl _X_T1CC1H
	.globl _X_T1CC1L
	.globl _X_T1CC0H
	.globl _X_T1CC0L
	.globl _X_RFD
	.globl _X_TIMIF
	.globl _X_DMAREQ
	.globl _X_DMAARM
	.globl _X_DMA0CFGH
	.globl _X_DMA0CFGL
	.globl _X_DMA1CFGH
	.globl _X_DMA1CFGL
	.globl _X_DMAIRQ
	.globl _X_T3CC1
	.globl _X_T3CCTL1
	.globl _X_T3CC0
	.globl _X_T3CCTL0
	.globl _X_T3CTL
	.globl _X_T3CNT
	.globl _X_WDCTL
	.globl _X_MEMCTR
	.globl _X_CLKCONCMD
	.globl _X_U0GCR
	.globl _X_U0UCR
	.globl _X_T2MSEL
	.globl _X_U0BAUD
	.globl _X_U0DBUF
	.globl _X_RFERRF
	.globl _X_SLEEPCMD
	.globl _X_RNDH
	.globl _X_RNDL
	.globl _X_ADCH
	.globl _X_ADCL
	.globl _X_ADCCON3
	.globl _X_ADCCON2
	.globl _X_ADCCON1
	.globl _X_ENCCS
	.globl _X_ENCDO
	.globl _X_ENCDI
	.globl _X_T1STAT
	.globl _X_PMUX
	.globl _X_STLOAD
	.globl _X_P2IEN
	.globl _X_P0IEN
	.globl _X_T2IRQM
	.globl _X_T2MOVF2
	.globl _X_T2MOVF1
	.globl _X_T2MOVF0
	.globl _X_T2M1
	.globl _X_T2M0
	.globl _X_T2IRQF
	.globl _X_P2
	.globl _X_PSBANK
	.globl _X_FMAP
	.globl _X_CLKCONSTA
	.globl _X_SLEEPSTA
	.globl _X_T2EVTCFG
	.globl _X_ST2
	.globl _X_ST1
	.globl _X_ST0
	.globl _X_T2CTRL
	.globl _X__XPAGE
	.globl _X_MPAGE
	.globl _X_RFIRQF1
	.globl _X_P1
	.globl _X_P0INP
	.globl _X_P1IEN
	.globl _X_PICTL
	.globl _X_P2IFG
	.globl _X_P1IFG
	.globl _X_P0IFG
	.globl _X_U0CSR
	.globl _X_P0
	.globl _USBF5
	.globl _USBF4
	.globl _USBF3
	.globl _USBF2
	.globl _USBF1
	.globl _USBF0
	.globl _USBCNTH
	.globl _USBCNTL
	.globl _USBCNT0
	.globl _USBCSOH
	.globl _USBCSOL
	.globl _USBMAXO
	.globl _USBCSIH
	.globl _USBCSIL
	.globl _USBCS0
	.globl _USBMAXI
	.globl _USBCTRL
	.globl _USBINDEX
	.globl _USBFRMH
	.globl _USBFRML
	.globl _USBCIE
	.globl _USBOIE
	.globl _USBIIE
	.globl _USBCIF
	.globl _USBOIF
	.globl _USBIIF
	.globl _USBPOW
	.globl _USBADDR
	.globl _CSPT
	.globl _CSPZ
	.globl _CSPY
	.globl _CSPX
	.globl _CSPSTAT
	.globl _CSPCTRL
	.globl _CSPPROG23
	.globl _CSPPROG22
	.globl _CSPPROG21
	.globl _CSPPROG20
	.globl _CSPPROG19
	.globl _CSPPROG18
	.globl _CSPPROG17
	.globl _CSPPROG16
	.globl _CSPPROG15
	.globl _CSPPROG14
	.globl _CSPPROG13
	.globl _CSPPROG12
	.globl _CSPPROG11
	.globl _CSPPROG10
	.globl _CSPPROG9
	.globl _CSPPROG8
	.globl _CSPPROG7
	.globl _CSPPROG6
	.globl _CSPPROG5
	.globl _CSPPROG4
	.globl _CSPPROG3
	.globl _CSPPROG2
	.globl _CSPPROG1
	.globl _CSPPROG0
	.globl _RFC_OBS_CTRL2
	.globl _RFC_OBS_CTRL1
	.globl _RFC_OBS_CTRL0
	.globl _TXFILTCFG
	.globl _PTEST1
	.globl _PTEST0
	.globl _ATEST
	.globl _DACTEST2
	.globl _DACTEST1
	.globl _DACTEST0
	.globl _MDMTEST1
	.globl _MDMTEST0
	.globl _ADCTEST2
	.globl _ADCTEST1
	.globl _ADCTEST0
	.globl _AGCCTRL3
	.globl _AGCCTRL2
	.globl _AGCCTRL1
	.globl _AGCCTRL0
	.globl _FSCAL3
	.globl _FSCAL2
	.globl _FSCAL1
	.globl _FSCAL0
	.globl _FSCTRL
	.globl _RXCTRL
	.globl _FREQEST
	.globl _MDMCTRL1
	.globl _MDMCTRL0
	.globl _RFRND
	.globl _RFERRM
	.globl _RFIRQM1
	.globl _RFIRQM0
	.globl _TXLAST_PTR
	.globl _TXFIRST_PTR
	.globl _RXP1_PTR
	.globl _RXLAST_PTR
	.globl _RXFIRST_PTR
	.globl _TXFIFOCNT
	.globl _RXFIFOCNT
	.globl _RXFIRST
	.globl _RSSISTAT
	.globl _RSSI
	.globl _CCACTRL1
	.globl _CCACTRL0
	.globl _FSMCTRL
	.globl _FIFOPCTRL
	.globl _FSMSTAT1
	.globl _FSMSTAT0
	.globl _TXCTRL
	.globl _TXPOWER
	.globl _FREQCTRL
	.globl _FREQTUNE
	.globl _RXMASKCLR
	.globl _RXMASKSET
	.globl _RXENABLE
	.globl _FRMCTRL1
	.globl _FRMCTRL0
	.globl _SRCEXTEN2
	.globl _SRCEXTEN1
	.globl _SRCEXTEN0
	.globl _SRCSHORTEN2
	.globl _SRCSHORTEN1
	.globl _SRCSHORTEN0
	.globl _SRCMATCH
	.globl _FRMFILT1
	.globl _FRMFILT0
	.globl _SHORT_ADDR1
	.globl _SHORT_ADDR0
	.globl _PAN_ID1
	.globl _PAN_ID0
	.globl _EXT_ADDR7
	.globl _EXT_ADDR6
	.globl _EXT_ADDR5
	.globl _EXT_ADDR4
	.globl _EXT_ADDR3
	.globl _EXT_ADDR2
	.globl _EXT_ADDR1
	.globl _EXT_ADDR0
	.globl _SRCSHORTPENDEN2
	.globl _SRCSHORTPENDEN1
	.globl _SRCSHORTPENDEN0
	.globl _SRCEXTPENDEN2
	.globl _SRCEXTPENDEN1
	.globl _SRCEXTPENDEN0
	.globl _SRCRESINDEX
	.globl _SRCRESMASK2
	.globl _SRCRESMASK1
	.globl _SRCRESMASK0
	.globl _SRC_ADDR_TABLE
	.globl _TXFIFO
	.globl _RXFIFO
	.globl _RFCORE_RAM
	.globl _CMPCTL
	.globl _OPAMPS
	.globl _OPAMPC
	.globl _STCV2
	.globl _STCV1
	.globl _STCV0
	.globl _STCS
	.globl _STCC
	.globl _T1CC4H
	.globl _T1CC4L
	.globl _T1CC3H
	.globl _T1CC3L
	.globl _XX_T1CC2H
	.globl _XX_T1CC2L
	.globl _XX_T1CC1H
	.globl _XX_T1CC1L
	.globl _XX_T1CC0H
	.globl _XX_T1CC0L
	.globl _T1CCTL4
	.globl _T1CCTL3
	.globl _XX_T1CCTL2
	.globl _XX_T1CCTL1
	.globl _XX_T1CCTL0
	.globl _CLD
	.globl _IRCTL
	.globl _CHIPINFO1
	.globl _CHIPINFO0
	.globl _FWDATA
	.globl _FADDRH
	.globl _FADDRL
	.globl _FCTL
	.globl _IVCTRL
	.globl _BATTMON
	.globl _SRCRC
	.globl _DBGDATA
	.globl _TESTREG0
	.globl _CHIPID
	.globl _CHVER
	.globl _OBSSEL5
	.globl _OBSSEL4
	.globl _OBSSEL3
	.globl _OBSSEL2
	.globl _OBSSEL1
	.globl _OBSSEL0
	.globl _I2CIO
	.globl _I2CWC
	.globl _I2CADDR
	.globl _I2CDATA
	.globl _I2CSTAT
	.globl _I2CCFG
	.globl _OPAMPMC
	.globl _MONMUX
	.globl _Atmosphere_GetPress
	.globl _Atmosphere_Init
	.globl _Atmosphere_TestFunc
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL0	=	0x0082
_DPH0	=	0x0083
_DPL1	=	0x0084
_DPH1	=	0x0085
_PCON	=	0x0087
_TCON	=	0x0088
_P1	=	0x0090
_DPS	=	0x0092
_S0CON	=	0x0098
_IEN2	=	0x009a
_S1CON	=	0x009b
_P2	=	0x00a0
_IEN0	=	0x00a8
_IP0	=	0x00a9
_IEN1	=	0x00b8
_IP1	=	0x00b9
_IRCON	=	0x00c0
_PSW	=	0x00d0
_ACC	=	0x00e0
_IRCON2	=	0x00e8
_B	=	0x00f0
_ADCCON1	=	0x00b4
_ADCCON2	=	0x00b5
_ADCCON3	=	0x00b6
_ADCL	=	0x00ba
_ADCH	=	0x00bb
_RNDL	=	0x00bc
_RNDH	=	0x00bd
_ENCDI	=	0x00b1
_ENCDO	=	0x00b2
_ENCCS	=	0x00b3
_DMAIRQ	=	0x00d1
_DMA1CFGL	=	0x00d2
_DMA1CFGH	=	0x00d3
_DMA0CFGL	=	0x00d4
_DMA0CFGH	=	0x00d5
_DMAARM	=	0x00d6
_DMAREQ	=	0x00d7
_P0IFG	=	0x0089
_P1IFG	=	0x008a
_P2IFG	=	0x008b
_PICTL	=	0x008c
_P0IEN	=	0x00ab
_P1IEN	=	0x008d
_P2IEN	=	0x00ac
_P0INP	=	0x008f
_PERCFG	=	0x00f1
_APCFG	=	0x00f2
_P0SEL	=	0x00f3
_P1SEL	=	0x00f4
_P2SEL	=	0x00f5
_P1INP	=	0x00f6
_P2INP	=	0x00f7
_P0DIR	=	0x00fd
_P1DIR	=	0x00fe
_P2DIR	=	0x00ff
_PMUX	=	0x00ae
_MPAGE	=	0x0093
__XPAGE	=	0x0093
_MEMCTR	=	0x00c7
_FMAP	=	0x009f
_PSBANK	=	0x009f
_RFIRQF1	=	0x0091
_RFD	=	0x00d9
_RFST	=	0x00e1
_RFIRQF0	=	0x00e9
_RFERRF	=	0x00bf
_ST0	=	0x0095
_ST1	=	0x0096
_ST2	=	0x0097
_STLOAD	=	0x00ad
_SLEEPCMD	=	0x00be
_SLEEPSTA	=	0x009d
_CLKCONCMD	=	0x00c6
_CLKCONSTA	=	0x009e
_T1CC0L	=	0x00da
_T1CC0H	=	0x00db
_T1CC1L	=	0x00dc
_T1CC1H	=	0x00dd
_T1CC2L	=	0x00de
_T1CC2H	=	0x00df
_T1CNTL	=	0x00e2
_T1CNTH	=	0x00e3
_T1CTL	=	0x00e4
_T1CCTL0	=	0x00e5
_T1CCTL1	=	0x00e6
_T1CCTL2	=	0x00e7
_T1STAT	=	0x00af
_T2CTRL	=	0x0094
_T2EVTCFG	=	0x009c
_T2IRQF	=	0x00a1
_T2M0	=	0x00a2
_T2M1	=	0x00a3
_T2MOVF0	=	0x00a4
_T2MOVF1	=	0x00a5
_T2MOVF2	=	0x00a6
_T2IRQM	=	0x00a7
_T2MSEL	=	0x00c3
_T3CNT	=	0x00ca
_T3CTL	=	0x00cb
_T3CCTL0	=	0x00cc
_T3CC0	=	0x00cd
_T3CCTL1	=	0x00ce
_T3CC1	=	0x00cf
_T4CNT	=	0x00ea
_T4CTL	=	0x00eb
_T4CCTL0	=	0x00ec
_T4CC0	=	0x00ed
_T4CCTL1	=	0x00ee
_T4CC1	=	0x00ef
_TIMIF	=	0x00d8
_U0CSR	=	0x0086
_U0DBUF	=	0x00c1
_U0BAUD	=	0x00c2
_U0UCR	=	0x00c4
_U0GCR	=	0x00c5
_U1CSR	=	0x00f8
_U1DBUF	=	0x00f9
_U1BAUD	=	0x00fa
_U1UCR	=	0x00fb
_U1GCR	=	0x00fc
_WDCTL	=	0x00c9
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_7	=	0x0087
_P0_6	=	0x0086
_P0_5	=	0x0085
_P0_4	=	0x0084
_P0_3	=	0x0083
_P0_2	=	0x0082
_P0_1	=	0x0081
_P0_0	=	0x0080
_URX1IF	=	0x008f
_ADCIF	=	0x008d
_URX0IF	=	0x008b
_IT1	=	0x008a
_RFERRIF	=	0x0089
_IT0	=	0x0088
_P1_7	=	0x0097
_P1_6	=	0x0096
_P1_5	=	0x0095
_P1_4	=	0x0094
_P1_3	=	0x0093
_P1_2	=	0x0092
_P1_1	=	0x0091
_P1_0	=	0x0090
_ENCIF_1	=	0x0099
_ENCIF_0	=	0x0098
_P2_7	=	0x00a7
_P2_6	=	0x00a6
_P2_5	=	0x00a5
_P2_4	=	0x00a4
_P2_3	=	0x00a3
_P2_2	=	0x00a2
_P2_1	=	0x00a1
_P2_0	=	0x00a0
_EA	=	0x00af
_STIE	=	0x00ad
_ENCIE	=	0x00ac
_URX1IE	=	0x00ab
_URX0IE	=	0x00aa
_ADCIE	=	0x00a9
_RFERRIE	=	0x00a8
_P0IE	=	0x00bd
_T4IE	=	0x00bc
_T3IE	=	0x00bb
_T2IE	=	0x00ba
_T1IE	=	0x00b9
_DMAIE	=	0x00b8
_STIF	=	0x00c7
_P0IF	=	0x00c5
_T4IF	=	0x00c4
_T3IF	=	0x00c3
_T2IF	=	0x00c2
_T1IF	=	0x00c1
_DMAIF	=	0x00c0
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_F1	=	0x00d1
_P	=	0x00d0
_ACC_7	=	0x00e7
_ACC_6	=	0x00e6
_ACC_5	=	0x00e5
_ACC_4	=	0x00e4
_ACC_3	=	0x00e3
_ACC_2	=	0x00e2
_ACC_1	=	0x00e1
_ACC_0	=	0x00e0
_WDTIF	=	0x00ec
_P1IF	=	0x00eb
_UTX1IF	=	0x00ea
_UTX0IF	=	0x00e9
_P2IF	=	0x00e8
_B_7	=	0x00f7
_B_6	=	0x00f6
_B_5	=	0x00f5
_B_4	=	0x00f4
_B_3	=	0x00f3
_B_2	=	0x00f2
_B_1	=	0x00f1
_B_0	=	0x00f0
_OVFIM	=	0x00de
_T4CH1IF	=	0x00dd
_T4CH0IF	=	0x00dc
_T4OVFIF	=	0x00db
_T3CH1IF	=	0x00da
_T3CH0IF	=	0x00d9
_T3OVFIF	=	0x00d8
_MODE	=	0x00ff
_RE	=	0x00fe
_SLAVE	=	0x00fd
_FE	=	0x00fc
_ERR	=	0x00fb
_RX_BYTE	=	0x00fa
_TX_BYTE	=	0x00f9
_ACTIVE	=	0x00f8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_MONMUX	=	0x61a6
_OPAMPMC	=	0x61a6
_I2CCFG	=	0x6230
_I2CSTAT	=	0x6231
_I2CDATA	=	0x6232
_I2CADDR	=	0x6233
_I2CWC	=	0x6234
_I2CIO	=	0x6235
_OBSSEL0	=	0x6243
_OBSSEL1	=	0x6244
_OBSSEL2	=	0x6245
_OBSSEL3	=	0x6246
_OBSSEL4	=	0x6247
_OBSSEL5	=	0x6248
_CHVER	=	0x6249
_CHIPID	=	0x624a
_TESTREG0	=	0x624b
_DBGDATA	=	0x6260
_SRCRC	=	0x6262
_BATTMON	=	0x6264
_IVCTRL	=	0x6265
_FCTL	=	0x6270
_FADDRL	=	0x6271
_FADDRH	=	0x6272
_FWDATA	=	0x6273
_CHIPINFO0	=	0x6276
_CHIPINFO1	=	0x6277
_IRCTL	=	0x6281
_CLD	=	0x6290
_XX_T1CCTL0	=	0x62a0
_XX_T1CCTL1	=	0x62a1
_XX_T1CCTL2	=	0x62a2
_T1CCTL3	=	0x62a3
_T1CCTL4	=	0x62a4
_XX_T1CC0L	=	0x62a6
_XX_T1CC0H	=	0x62a7
_XX_T1CC1L	=	0x62a8
_XX_T1CC1H	=	0x62a9
_XX_T1CC2L	=	0x62aa
_XX_T1CC2H	=	0x62ab
_T1CC3L	=	0x62ac
_T1CC3H	=	0x62ad
_T1CC4L	=	0x62ae
_T1CC4H	=	0x62af
_STCC	=	0x62b0
_STCS	=	0x62b1
_STCV0	=	0x62b2
_STCV1	=	0x62b3
_STCV2	=	0x62b4
_OPAMPC	=	0x62c0
_OPAMPS	=	0x62c1
_CMPCTL	=	0x62d0
_RFCORE_RAM	=	0x6000
_RXFIFO	=	0x6000
_TXFIFO	=	0x6080
_SRC_ADDR_TABLE	=	0x6100
_SRCRESMASK0	=	0x6160
_SRCRESMASK1	=	0x6161
_SRCRESMASK2	=	0x6162
_SRCRESINDEX	=	0x6163
_SRCEXTPENDEN0	=	0x6164
_SRCEXTPENDEN1	=	0x6165
_SRCEXTPENDEN2	=	0x6166
_SRCSHORTPENDEN0	=	0x6167
_SRCSHORTPENDEN1	=	0x6168
_SRCSHORTPENDEN2	=	0x6169
_EXT_ADDR0	=	0x616a
_EXT_ADDR1	=	0x616b
_EXT_ADDR2	=	0x616c
_EXT_ADDR3	=	0x616d
_EXT_ADDR4	=	0x616e
_EXT_ADDR5	=	0x616f
_EXT_ADDR6	=	0x6170
_EXT_ADDR7	=	0x6171
_PAN_ID0	=	0x6172
_PAN_ID1	=	0x6173
_SHORT_ADDR0	=	0x6174
_SHORT_ADDR1	=	0x6175
_FRMFILT0	=	0x6180
_FRMFILT1	=	0x6181
_SRCMATCH	=	0x6182
_SRCSHORTEN0	=	0x6183
_SRCSHORTEN1	=	0x6184
_SRCSHORTEN2	=	0x6185
_SRCEXTEN0	=	0x6186
_SRCEXTEN1	=	0x6187
_SRCEXTEN2	=	0x6188
_FRMCTRL0	=	0x6189
_FRMCTRL1	=	0x618a
_RXENABLE	=	0x618b
_RXMASKSET	=	0x618c
_RXMASKCLR	=	0x618d
_FREQTUNE	=	0x618e
_FREQCTRL	=	0x618f
_TXPOWER	=	0x6190
_TXCTRL	=	0x6191
_FSMSTAT0	=	0x6192
_FSMSTAT1	=	0x6193
_FIFOPCTRL	=	0x6194
_FSMCTRL	=	0x6195
_CCACTRL0	=	0x6196
_CCACTRL1	=	0x6197
_RSSI	=	0x6198
_RSSISTAT	=	0x6199
_RXFIRST	=	0x619a
_RXFIFOCNT	=	0x619b
_TXFIFOCNT	=	0x619c
_RXFIRST_PTR	=	0x619d
_RXLAST_PTR	=	0x619e
_RXP1_PTR	=	0x619f
_TXFIRST_PTR	=	0x61a1
_TXLAST_PTR	=	0x61a2
_RFIRQM0	=	0x61a3
_RFIRQM1	=	0x61a4
_RFERRM	=	0x61a5
_RFRND	=	0x61a7
_MDMCTRL0	=	0x61a8
_MDMCTRL1	=	0x61a9
_FREQEST	=	0x61aa
_RXCTRL	=	0x61ab
_FSCTRL	=	0x61ac
_FSCAL0	=	0x61ad
_FSCAL1	=	0x61ae
_FSCAL2	=	0x61af
_FSCAL3	=	0x61b0
_AGCCTRL0	=	0x61b1
_AGCCTRL1	=	0x61b2
_AGCCTRL2	=	0x61b3
_AGCCTRL3	=	0x61b4
_ADCTEST0	=	0x61b5
_ADCTEST1	=	0x61b6
_ADCTEST2	=	0x61b7
_MDMTEST0	=	0x61b8
_MDMTEST1	=	0x61b9
_DACTEST0	=	0x61ba
_DACTEST1	=	0x61bb
_DACTEST2	=	0x61bc
_ATEST	=	0x61bd
_PTEST0	=	0x61be
_PTEST1	=	0x61bf
_TXFILTCFG	=	0x61fa
_RFC_OBS_CTRL0	=	0x61eb
_RFC_OBS_CTRL1	=	0x61ec
_RFC_OBS_CTRL2	=	0x61ed
_CSPPROG0	=	0x61c0
_CSPPROG1	=	0x61c1
_CSPPROG2	=	0x61c2
_CSPPROG3	=	0x61c3
_CSPPROG4	=	0x61c4
_CSPPROG5	=	0x61c5
_CSPPROG6	=	0x61c6
_CSPPROG7	=	0x61c7
_CSPPROG8	=	0x61c8
_CSPPROG9	=	0x61c9
_CSPPROG10	=	0x61ca
_CSPPROG11	=	0x61cb
_CSPPROG12	=	0x61cc
_CSPPROG13	=	0x61cd
_CSPPROG14	=	0x61ce
_CSPPROG15	=	0x61cf
_CSPPROG16	=	0x61d0
_CSPPROG17	=	0x61d1
_CSPPROG18	=	0x61d2
_CSPPROG19	=	0x61d3
_CSPPROG20	=	0x61d4
_CSPPROG21	=	0x61d5
_CSPPROG22	=	0x61d6
_CSPPROG23	=	0x61d7
_CSPCTRL	=	0x61e0
_CSPSTAT	=	0x61e1
_CSPX	=	0x61e2
_CSPY	=	0x61e3
_CSPZ	=	0x61e4
_CSPT	=	0x61e5
_USBADDR	=	0x6200
_USBPOW	=	0x6201
_USBIIF	=	0x6202
_USBOIF	=	0x6204
_USBCIF	=	0x6206
_USBIIE	=	0x6207
_USBOIE	=	0x6209
_USBCIE	=	0x620b
_USBFRML	=	0x620c
_USBFRMH	=	0x620d
_USBINDEX	=	0x620e
_USBCTRL	=	0x620f
_USBMAXI	=	0x6210
_USBCS0	=	0x6211
_USBCSIL	=	0x6211
_USBCSIH	=	0x6212
_USBMAXO	=	0x6213
_USBCSOL	=	0x6214
_USBCSOH	=	0x6215
_USBCNT0	=	0x6216
_USBCNTL	=	0x6216
_USBCNTH	=	0x6217
_USBF0	=	0x6220
_USBF1	=	0x6222
_USBF2	=	0x6224
_USBF3	=	0x6226
_USBF4	=	0x6228
_USBF5	=	0x622a
_X_P0	=	0x7080
_X_U0CSR	=	0x7086
_X_P0IFG	=	0x7089
_X_P1IFG	=	0x708a
_X_P2IFG	=	0x708b
_X_PICTL	=	0x708c
_X_P1IEN	=	0x708d
_X_P0INP	=	0x708f
_X_P1	=	0x7090
_X_RFIRQF1	=	0x7091
_X_MPAGE	=	0x7093
_X__XPAGE	=	0x7093
_X_T2CTRL	=	0x7094
_X_ST0	=	0x7095
_X_ST1	=	0x7096
_X_ST2	=	0x7097
_X_T2EVTCFG	=	0x709c
_X_SLEEPSTA	=	0x709d
_X_CLKCONSTA	=	0x709e
_X_FMAP	=	0x709f
_X_PSBANK	=	0x709f
_X_P2	=	0x70a0
_X_T2IRQF	=	0x70a1
_X_T2M0	=	0x70a2
_X_T2M1	=	0x70a3
_X_T2MOVF0	=	0x70a4
_X_T2MOVF1	=	0x70a5
_X_T2MOVF2	=	0x70a6
_X_T2IRQM	=	0x70a7
_X_P0IEN	=	0x70ab
_X_P2IEN	=	0x70ac
_X_STLOAD	=	0x70ad
_X_PMUX	=	0x70ae
_X_T1STAT	=	0x70af
_X_ENCDI	=	0x70b1
_X_ENCDO	=	0x70b2
_X_ENCCS	=	0x70b3
_X_ADCCON1	=	0x70b4
_X_ADCCON2	=	0x70b5
_X_ADCCON3	=	0x70b6
_X_ADCL	=	0x70ba
_X_ADCH	=	0x70bb
_X_RNDL	=	0x70bc
_X_RNDH	=	0x70bd
_X_SLEEPCMD	=	0x70be
_X_RFERRF	=	0x70bf
_X_U0DBUF	=	0x70c1
_X_U0BAUD	=	0x70c2
_X_T2MSEL	=	0x70c3
_X_U0UCR	=	0x70c4
_X_U0GCR	=	0x70c5
_X_CLKCONCMD	=	0x70c6
_X_MEMCTR	=	0x70c7
_X_WDCTL	=	0x70c9
_X_T3CNT	=	0x70ca
_X_T3CTL	=	0x70cb
_X_T3CCTL0	=	0x70cc
_X_T3CC0	=	0x70cd
_X_T3CCTL1	=	0x70ce
_X_T3CC1	=	0x70cf
_X_DMAIRQ	=	0x70d1
_X_DMA1CFGL	=	0x70d2
_X_DMA1CFGH	=	0x70d3
_X_DMA0CFGL	=	0x70d4
_X_DMA0CFGH	=	0x70d5
_X_DMAARM	=	0x70d6
_X_DMAREQ	=	0x70d7
_X_TIMIF	=	0x70d8
_X_RFD	=	0x70d9
_X_T1CC0L	=	0x70da
_X_T1CC0H	=	0x70db
_X_T1CC1L	=	0x70dc
_X_T1CC1H	=	0x70dd
_X_T1CC2L	=	0x70de
_X_T1CC2H	=	0x70df
_X_RFST	=	0x70e1
_X_T1CNTL	=	0x70e2
_X_T1CNTH	=	0x70e3
_X_T1CTL	=	0x70e4
_X_T1CCTL0	=	0x70e5
_X_T1CCTL1	=	0x70e6
_X_T1CCTL2	=	0x70e7
_X_RFIRQF0	=	0x70e9
_X_T4CNT	=	0x70ea
_X_T4CTL	=	0x70eb
_X_T4CCTL0	=	0x70ec
_X_T4CC0	=	0x70ed
_X_T4CCTL1	=	0x70ee
_X_T4CC1	=	0x70ef
_X_PERCFG	=	0x70f1
_X_APCFG	=	0x70f2
_X_P0SEL	=	0x70f3
_X_P1SEL	=	0x70f4
_X_P2SEL	=	0x70f5
_X_P1INP	=	0x70f6
_X_P2INP	=	0x70f7
_X_U1CSR	=	0x70f8
_X_U1DBUF	=	0x70f9
_X_U1BAUD	=	0x70fa
_X_U1UCR	=	0x70fb
_X_U1GCR	=	0x70fc
_X_P0DIR	=	0x70fd
_X_P1DIR	=	0x70fe
_X_P2DIR	=	0x70ff
_X_INFOPAGE	=	0x7800
_X_IEEE_ADDR	=	0x780c
_hum_raw::
	.ds 4
_temp_raw::
	.ds 4
_pres_raw::
	.ds 4
_t_fine::
	.ds 4
_dig_T1::
	.ds 2
_dig_T2::
	.ds 2
_dig_T3::
	.ds 2
_dig_P1::
	.ds 2
_dig_P2::
	.ds 2
_dig_P3::
	.ds 2
_dig_P4::
	.ds 2
_dig_P5::
	.ds 2
_dig_P6::
	.ds 2
_dig_P7::
	.ds 2
_dig_P8::
	.ds 2
_dig_P9::
	.ds 2
_dig_H1::
	.ds 1
_dig_H2::
	.ds 2
_dig_H3::
	.ds 1
_dig_H4::
	.ds 2
_dig_H5::
	.ds 2
_dig_H6::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_delay_count::
	.ds 4
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area BANK1   (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'delay_us'
;------------------------------------------------------------
;n                         Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:36: void delay_us(uint32_t n)
;	-----------------------------------------
;	 function delay_us
;	-----------------------------------------
_delay_us:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:38: delay_count = n*5;
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#(0x05&0x00ff)
	clr	a
	mov	b,a
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dptr,#_delay_count
	mov	a,r4
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:39: while(delay_count--);
00101$:
	mov	dptr,#_delay_count
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r4
	add	a,#0xff
	mov	r0,a
	mov	a,r5
	addc	a,#0xff
	mov	r1,a
	mov	a,r6
	addc	a,#0xff
	mov	r2,a
	mov	a,r7
	addc	a,#0xff
	mov	r3,a
	mov	dptr,#_delay_count
	mov	a,r0
	movx	@dptr,a
	mov	a,r1
	inc	dptr
	movx	@dptr,a
	mov	a,r2
	inc	dptr
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	orl	a,r5
	orl	a,r6
	orl	a,r7
	jnz	00101$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:40: } 
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Delay5us'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:41: void Delay5us(void)
;	-----------------------------------------
;	 function Delay5us
;	-----------------------------------------
_Delay5us:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:43: delay_count = 50;
	mov	dptr,#_delay_count
	mov	a,#0x32
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:44: while(delay_count--);	
00101$:
	mov	dptr,#_delay_count
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r4
	add	a,#0xff
	mov	r0,a
	mov	a,r5
	addc	a,#0xff
	mov	r1,a
	mov	a,r6
	addc	a,#0xff
	mov	r2,a
	mov	a,r7
	addc	a,#0xff
	mov	r3,a
	mov	dptr,#_delay_count
	mov	a,r0
	movx	@dptr,a
	mov	a,r1
	inc	dptr
	movx	@dptr,a
	mov	a,r2
	inc	dptr
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	orl	a,r5
	orl	a,r6
	orl	a,r7
	jnz	00101$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:45: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_SDA'
;------------------------------------------------------------
;v                         Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:46: void  IIC_SDA(uint8_t v)
;	-----------------------------------------
;	 function IIC_SDA
;	-----------------------------------------
_IIC_SDA:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:48: if(v)
	mov	a,dpl
	mov	r7,a
	jz	00102$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:50: P0_0 = 1;P0_0 = 1;P0_0 = 1;
;	assignBit
	setb	_P0_0
;	assignBit
	setb	_P0_0
;	assignBit
	setb	_P0_0
	sjmp	00104$
00102$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:54: P0_0 = 0;P0_0 = 0;P0_0 = 0;
;	assignBit
	clr	_P0_0
;	assignBit
	clr	_P0_0
;	assignBit
	clr	_P0_0
00104$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:56: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_SCL'
;------------------------------------------------------------
;v                         Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:58: void  IIC_SCL(uint8_t v)             
;	-----------------------------------------
;	 function IIC_SCL
;	-----------------------------------------
_IIC_SCL:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:60: if(v)
	mov	a,dpl
	mov	r7,a
	jz	00102$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:62: P0_1 = 1;P0_1 = 1;P0_1 = 1;
;	assignBit
	setb	_P0_1
;	assignBit
	setb	_P0_1
;	assignBit
	setb	_P0_1
	sjmp	00104$
00102$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:66: P0_1 = 0;P0_1 = 0;P0_1 = 0;
;	assignBit
	clr	_P0_1
;	assignBit
	clr	_P0_1
;	assignBit
	clr	_P0_1
00104$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:68: }                                                                 
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SDA_IN'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:70: void  SDA_IN(void)   
;	-----------------------------------------
;	 function SDA_IN
;	-----------------------------------------
_SDA_IN:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:72: P0SEL &= ~0x01;
	anl	_P0SEL,#0xfe
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:73: P0DIR &= ~0x01;
	anl	_P0DIR,#0xfe
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:74: P0INP &= ~0x01;
	anl	_P0INP,#0xfe
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:75: }	
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SDA_OUT'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:76: void  SDA_OUT(void)  
;	-----------------------------------------
;	 function SDA_OUT
;	-----------------------------------------
_SDA_OUT:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:78: P0SEL &= ~0x01;
	anl	_P0SEL,#0xfe
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:79: P0DIR |= 0x01;
	orl	_P0DIR,#0x01
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:80: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_Init'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:94: static void IIC_Init(void)
;	-----------------------------------------
;	 function IIC_Init
;	-----------------------------------------
_IIC_Init:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:96: P0SEL &= ~0x03;     //设置P0.0、P0.1为普通IO口  
	anl	_P0SEL,#0xfc
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:97: P0DIR |= 0x03;      //P0.0、P0.1定义为输出    
	orl	_P0DIR,#0x03
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:98: SDA = 1;	  	  
;	assignBit
	setb	_P0_0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:99: SCL = 1;    
;	assignBit
	setb	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:100: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_Start'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:113: static void IIC_Start(void)
;	-----------------------------------------
;	 function IIC_Start
;	-----------------------------------------
_IIC_Start:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:115: SDA_OUT();     //sda线输出
	mov	r0,#_SDA_OUT
	mov	r1,#(_SDA_OUT >> 8)
	mov	r2,#(_SDA_OUT >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:116: IIC_SDA(1);	  	  
	mov	dpl,#0x01
	mov	r0,#_IIC_SDA
	mov	r1,#(_IIC_SDA >> 8)
	mov	r2,#(_IIC_SDA >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:117: IIC_SCL(1);
	mov	dpl,#0x01
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:118: delay_us(4);
	mov	dptr,#(0x04&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:119: IIC_SDA(0);//START:when CLK is high,DATA change form high to low 
	mov	dpl,#0x00
	mov	r0,#_IIC_SDA
	mov	r1,#(_IIC_SDA >> 8)
	mov	r2,#(_IIC_SDA >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:120: delay_us(4);
	mov	dptr,#(0x04&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:121: IIC_SCL(0);//钳住I2C总线，准备发送或接收数据 
	mov	dpl,#0x00
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:122: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_Stop'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:135: static void IIC_Stop(void)
;	-----------------------------------------
;	 function IIC_Stop
;	-----------------------------------------
_IIC_Stop:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:137: SDA_OUT();//sda线输出
	mov	r0,#_SDA_OUT
	mov	r1,#(_SDA_OUT >> 8)
	mov	r2,#(_SDA_OUT >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:138: IIC_SCL(0);
	mov	dpl,#0x00
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:139: IIC_SDA(0);
	mov	dpl,#0x00
	mov	r0,#_IIC_SDA
	mov	r1,#(_IIC_SDA >> 8)
	mov	r2,#(_IIC_SDA >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:140: delay_us(4); 
	mov	dptr,#(0x04&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:141: IIC_SCL(1);//STOP:when CLK is high DATA change form low to high
	mov	dpl,#0x01
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:142: delay_us(4); 
	mov	dptr,#(0x04&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:143: IIC_SDA(1);//发送I2C总线结束信号 						   	
	mov	dpl,#0x01
	mov	r0,#_IIC_SDA
	mov	r1,#(_IIC_SDA >> 8)
	mov	r2,#(_IIC_SDA >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:144: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_Wait_Ack'
;------------------------------------------------------------
;ucErrTime                 Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:159: static uint8_t IIC_Wait_Ack(void)
;	-----------------------------------------
;	 function IIC_Wait_Ack
;	-----------------------------------------
_IIC_Wait_Ack:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:161: uint8_t ucErrTime=0;
	mov	r7,#0x00
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:163: IIC_SDA(1);//delay_us(1);	   
	mov	dpl,#0x01
	push	ar7
	mov	r0,#_IIC_SDA
	mov	r1,#(_IIC_SDA >> 8)
	mov	r2,#(_IIC_SDA >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:164: IIC_SCL(1);//delay_us(1);	 
	mov	dpl,#0x01
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:165: while(READ_SDA())
00103$:
	jnb	_P0_0,00105$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:167: ucErrTime++;
	inc	r7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:168: if(ucErrTime>250)
	mov	a,r7
	add	a,#0xff - 0xfa
	jnc	00103$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:170: printf("not ack\r\n");
	mov	a,#___str_0
	push	acc
	mov	a,#(___str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	r0,#_printf
	mov	r1,#(_printf >> 8)
	mov	r2,#(_printf >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:171: IIC_Stop();
	mov	r0,#_IIC_Stop
	mov	r1,#(_IIC_Stop >> 8)
	mov	r2,#(_IIC_Stop >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:172: return 1;
	mov	dpl,#0x01
	sjmp	00106$
00105$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:175: IIC_SCL(0);//时钟输出0 	   
	mov	dpl,#0x00
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:176: return 0;  
	mov	dpl,#0x00
00106$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:177: } 
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_Ack'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:190: static void IIC_Ack(void)
;	-----------------------------------------
;	 function IIC_Ack
;	-----------------------------------------
_IIC_Ack:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:192: IIC_SCL(0);
	mov	dpl,#0x00
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:193: SDA_OUT();
	mov	r0,#_SDA_OUT
	mov	r1,#(_SDA_OUT >> 8)
	mov	r2,#(_SDA_OUT >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:194: IIC_SDA(0);
	mov	dpl,#0x00
	mov	r0,#_IIC_SDA
	mov	r1,#(_IIC_SDA >> 8)
	mov	r2,#(_IIC_SDA >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:195: delay_us(2);
	mov	dptr,#(0x02&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:196: IIC_SCL(1);
	mov	dpl,#0x01
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:197: delay_us(2);
	mov	dptr,#(0x02&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:198: IIC_SCL(0);
	mov	dpl,#0x00
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:199: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_NAck'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:212: static void IIC_NAck(void)
;	-----------------------------------------
;	 function IIC_NAck
;	-----------------------------------------
_IIC_NAck:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:214: IIC_SCL(0);
	mov	dpl,#0x00
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:215: SDA_OUT();
	mov	r0,#_SDA_OUT
	mov	r1,#(_SDA_OUT >> 8)
	mov	r2,#(_SDA_OUT >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:216: IIC_SDA(1);
	mov	dpl,#0x01
	mov	r0,#_IIC_SDA
	mov	r1,#(_IIC_SDA >> 8)
	mov	r2,#(_IIC_SDA >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:217: delay_us(2);
	mov	dptr,#(0x02&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:218: IIC_SCL(1);
	mov	dpl,#0x01
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:219: delay_us(2);
	mov	dptr,#(0x02&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:220: IIC_SCL(0);
	mov	dpl,#0x00
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:221: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_Send_Byte'
;------------------------------------------------------------
;txd                       Allocated to registers r7 
;t                         Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:237: static void IIC_Send_Byte(uint8_t txd)
;	-----------------------------------------
;	 function IIC_Send_Byte
;	-----------------------------------------
_IIC_Send_Byte:
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:240: SDA_OUT(); 	    
	push	ar7
	mov	r0,#_SDA_OUT
	mov	r1,#(_SDA_OUT >> 8)
	mov	r2,#(_SDA_OUT >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:241: IIC_SCL(0);//拉低时钟开始数据传输
	mov	dpl,#0x00
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:242: for(t=0;t<8;t++)
	mov	r6,#0x00
00102$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:244: IIC_SDA((txd&0x80)>>7);
	mov	ar4,r7
	anl	ar4,#0x80
	clr	a
	mov	c,acc.7
	xch	a,r4
	rlc	a
	xch	a,r4
	rlc	a
	xch	a,r4
	anl	a,#0x01
	jnb	acc.0,00111$
	orl	a,#0xfe
00111$:
	mov	dpl,r4
	push	ar7
	push	ar6
	mov	r0,#_IIC_SDA
	mov	r1,#(_IIC_SDA >> 8)
	mov	r2,#(_IIC_SDA >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:245: txd<<=1; 	  
	mov	ar5,r7
	mov	a,r5
	add	a,r5
	mov	r7,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:246: delay_us(2);   //对TEA5767这三个延时都是必须的
	mov	dptr,#(0x02&0x00ff)
	clr	a
	mov	b,a
	push	ar7
	push	ar6
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:247: IIC_SCL(1);
	mov	dpl,#0x01
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:248: delay_us(2); 
	mov	dptr,#(0x02&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:249: IIC_SCL(0);	
	mov	dpl,#0x00
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:250: delay_us(2);
	mov	dptr,#(0x02&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:242: for(t=0;t<8;t++)
	inc	r6
	cjne	r6,#0x08,00112$
00112$:
	jnc	00113$
	ljmp	00102$
00113$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:252: } 	
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IIC_Read_Byte'
;------------------------------------------------------------
;ack                       Allocated to registers r7 
;i                         Allocated to registers 
;receive                   Allocated to registers r6 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:264: static uint8_t IIC_Read_Byte(unsigned char ack)
;	-----------------------------------------
;	 function IIC_Read_Byte
;	-----------------------------------------
_IIC_Read_Byte:
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:266: unsigned char i,receive=0;
	mov	r6,#0x00
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:267: SDA_IN();//SDA设置为输入
	push	ar7
	push	ar6
	mov	r0,#_SDA_IN
	mov	r1,#(_SDA_IN >> 8)
	mov	r2,#(_SDA_IN >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:268: for(i=0;i<8;i++ )
	mov	r5,#0x00
00107$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:270: IIC_SCL(0); 
	mov	dpl,#0x00
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:271: delay_us(2);
	mov	dptr,#(0x02&0x00ff)
	clr	a
	mov	b,a
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:272: IIC_SCL(1);
	mov	dpl,#0x01
	mov	r0,#_IIC_SCL
	mov	r1,#(_IIC_SCL >> 8)
	mov	r2,#(_IIC_SCL >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:273: receive<<=1;
	mov	ar4,r6
	mov	a,r4
	add	a,r4
	mov	r6,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:274: if(READ_SDA())
	jnb	_P0_0,00102$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:276: receive++;
	inc	r6
00102$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:278: delay_us(1); 
	mov	dptr,#(0x01&0x00ff)
	clr	a
	mov	b,a
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:268: for(i=0;i<8;i++ )
	inc	r5
	cjne	r5,#0x08,00129$
00129$:
	jc	00107$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:280: if (!ack)
	mov	a,r7
	jnz	00105$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:282: IIC_NAck();//发送nACK
	push	ar6
	mov	r0,#_IIC_NAck
	mov	r1,#(_IIC_NAck >> 8)
	mov	r2,#(_IIC_NAck >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	sjmp	00106$
00105$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:286: IIC_Ack(); //发送ACK   
	push	ar6
	mov	r0,#_IIC_Ack
	mov	r1,#(_IIC_Ack >> 8)
	mov	r2,#(_IIC_Ack >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
00106$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:288: return receive;
	mov	dpl,r6
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:289: } /* */
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_Start'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:291: void I2C_Start(void)
;	-----------------------------------------
;	 function I2C_Start
;	-----------------------------------------
_I2C_Start:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:293: SDA=1;    
;	assignBit
	setb	_P0_0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:294: SCL=1;   
;	assignBit
	setb	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:295: Delay5us();
	mov	r0,#_Delay5us
	mov	r1,#(_Delay5us >> 8)
	mov	r2,#(_Delay5us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:296: SDA=0;    
;	assignBit
	clr	_P0_0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:297: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:298: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_Stop'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:301: void I2C_Stop(void)
;	-----------------------------------------
;	 function I2C_Stop
;	-----------------------------------------
_I2C_Stop:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:304: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:306: SDA=0;
;	assignBit
	clr	_P0_0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:308: SCL=1;
;	assignBit
	setb	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:310: SDA=1;
;	assignBit
	setb	_P0_0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:312: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Sendack'
;------------------------------------------------------------
;h                         Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:314: void Sendack(uint8_t h)
;	-----------------------------------------
;	 function Sendack
;	-----------------------------------------
_Sendack:
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:318: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:320: SDA=h&0x01;
	mov	a,r7
	rrc	a
	mov  b0,c
	clr	a
	rlc	a
	add	a,#0xff
	mov	_P0_0,c
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:322: SCL=1;
;	assignBit
	setb	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:324: Delay5us();
	mov	r0,#_Delay5us
	mov	r1,#(_Delay5us >> 8)
	mov	r2,#(_Delay5us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:326: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:328: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_Check_ack'
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:332: uint8_t I2C_Check_ack(void)
;	-----------------------------------------
;	 function I2C_Check_ack
;	-----------------------------------------
_I2C_Check_ack:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:336: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:338: SDA=1;
;	assignBit
	setb	_P0_0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:340: SCL=1;
;	assignBit
	setb	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:342: if(SDA==1)
	jnb	_P0_0,00102$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:346: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:347: printf("na\r\n");    
	mov	a,#___str_1
	push	acc
	mov	a,#(___str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	r0,#_printf
	mov	r1,#(_printf >> 8)
	mov	r2,#(_printf >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:348: return 0;
	mov	dpl,#0x00
	sjmp	00103$
00102$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:352: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:354: return 1;
	mov	dpl,#0x01
00103$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:356: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_Write_Byte'
;------------------------------------------------------------
;b                         Allocated to registers r7 
;e                         Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:360: void I2C_Write_Byte(uint8_t b)
;	-----------------------------------------
;	 function I2C_Write_Byte
;	-----------------------------------------
_I2C_Write_Byte:
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:364: uint8_t e=8;
	mov	r6,#0x08
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:366: while(e--)
00104$:
	mov	ar5,r6
	dec	r6
	mov	a,r5
	jz	00106$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:369: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:371: if(b&0x80)
	mov	a,r7
	jnb	acc.7,00102$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:372: SDA=1;
;	assignBit
	setb	_P0_0
	sjmp	00103$
00102$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:375: SDA=0;
;	assignBit
	clr	_P0_0
00103$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:377: b<<=1;
	mov	ar5,r7
	mov	a,r5
	add	a,r5
	mov	r7,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:379: SCL=1;
;	assignBit
	setb	_P0_1
	sjmp	00104$
00106$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:383: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:387: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_Read_Byte'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;c                         Allocated to registers r6 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:391: uint8_t I2C_Read_Byte(void)
;	-----------------------------------------
;	 function I2C_Read_Byte
;	-----------------------------------------
_I2C_Read_Byte:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:395: uint8_t i=8;
	mov	r7,#0x08
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:397: uint8_t c=0;
	mov	r6,#0x00
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:399: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:401: SDA=1;
;	assignBit
	setb	_P0_0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:403: while(i--)
00103$:
	mov	ar5,r7
	dec	r7
	mov	a,r5
	jz	00105$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:406: c<<=1;
	mov	ar5,r6
	mov	a,r5
	add	a,r5
	mov	r6,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:408: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:410: Delay5us();
	push	ar7
	push	ar6
	mov	r0,#_Delay5us
	mov	r1,#(_Delay5us >> 8)
	mov	r2,#(_Delay5us >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:412: SCL=1;
;	assignBit
	setb	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:413: SCL=1;SCL=1;    
;	assignBit
	setb	_P0_1
;	assignBit
	setb	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:414: if(SDA==1)
	jnb	_P0_0,00103$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:416: c|=0x01;
	orl	ar6,#0x01
	sjmp	00103$
00105$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:422: SCL=0;
;	assignBit
	clr	_P0_1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:424: return c;
	mov	dpl,r6
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:426: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_Write'
;------------------------------------------------------------
;REG_Address               Allocated to stack - sp -3
;REG_data                  Allocated to stack - sp -4
;Slave_Addr                Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:430: void I2C_Write(uint8_t Slave_Addr, uint8_t REG_Address,uint8_t REG_data)
;	-----------------------------------------
;	 function I2C_Write
;	-----------------------------------------
_I2C_Write:
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:434: I2C_Start();
	push	ar7
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:436: I2C_Write_Byte(Slave_Addr);
	mov	dpl,r7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:438: I2C_Write_Byte(REG_Address);
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	dpl,@r0
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:440: I2C_Write_Byte(REG_data);
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	dpl,@r0
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:442: I2C_Stop();
	mov	r0,#_I2C_Stop
	mov	r1,#(_I2C_Stop >> 8)
	mov	r2,#(_I2C_Stop >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:444: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_Read'
;------------------------------------------------------------
;REG_Address               Allocated to stack - sp -3
;Slave_Addr                Allocated to registers r7 
;REG_data                  Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:448: uint8_t I2C_Read(uint8_t Slave_Addr, uint8_t REG_Address)
;	-----------------------------------------
;	 function I2C_Read
;	-----------------------------------------
_I2C_Read:
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:454: I2C_Start();
	push	ar7
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:456: I2C_Write_Byte(Slave_Addr);
	mov	dpl,r7
	push	ar7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:458: I2C_Write_Byte(REG_Address);
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	dpl,@r0
	push	ar7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:460: I2C_Start();
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:462: I2C_Write_Byte(Slave_Addr+1);
	inc	r7
	mov	dpl,r7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:464: REG_data=I2C_Read_Byte();
	mov	r0,#_I2C_Read_Byte
	mov	r1,#(_I2C_Read_Byte >> 8)
	mov	r2,#(_I2C_Read_Byte >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:466: Sendack(1);
	mov	dpl,#0x01
	push	ar7
	mov	r0,#_Sendack
	mov	r1,#(_Sendack >> 8)
	mov	r2,#(_Sendack >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:468: I2C_Stop();
	mov	r0,#_I2C_Stop
	mov	r1,#(_I2C_Stop >> 8)
	mov	r2,#(_I2C_Stop >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:470: return REG_data;
	mov	dpl,r7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:472: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'BMP085_Read_2B'
;------------------------------------------------------------
;addr                      Allocated to registers r7 
;msb                       Allocated to registers r7 
;lsb                       Allocated to registers r6 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:473: int16_t BMP085_Read_2B(uint8_t addr)
;	-----------------------------------------
;	 function BMP085_Read_2B
;	-----------------------------------------
_BMP085_Read_2B:
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:476: I2C_Start();
	push	ar7
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:477: I2C_Write_Byte(ATMOS_DEVICE_ADDR);
	mov	dpl,#0xec
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:478: I2C_Write_Byte(addr);
	mov	dpl,r7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:479: I2C_Start();
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:480: I2C_Write_Byte(ATMOS_DEVICE_ADDR+1);
	mov	dpl,#0xed
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:481: msb=I2C_Read_Byte();
	mov	r0,#_I2C_Read_Byte
	mov	r1,#(_I2C_Read_Byte >> 8)
	mov	r2,#(_I2C_Read_Byte >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:482: Sendack(0);
	mov	dpl,#0x00
	push	ar7
	mov	r0,#_Sendack
	mov	r1,#(_Sendack >> 8)
	mov	r2,#(_Sendack >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:483: lsb=I2C_Read_Byte();
	mov	r0,#_I2C_Read_Byte
	mov	r1,#(_I2C_Read_Byte >> 8)
	mov	r2,#(_I2C_Read_Byte >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:484: Sendack(1);
	mov	dpl,#0x01
	push	ar6
	mov	r0,#_Sendack
	mov	r1,#(_Sendack >> 8)
	mov	r2,#(_Sendack >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:485: I2C_Stop();
	mov	r0,#_I2C_Stop
	mov	r1,#(_I2C_Stop >> 8)
	mov	r2,#(_I2C_Stop >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:486: return (int16_t)((msb << 8) | lsb);
	mov	ar5,r7
	clr	a
	mov	r7,a
	mov	r4,a
	mov	a,r6
	orl	ar7,a
	mov	a,r4
	orl	ar5,a
	mov	dpl,r7
	mov	dph,r5
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:487: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'BMP085_Read_3B'
;------------------------------------------------------------
;addr                      Allocated to registers r7 
;msb                       Allocated to registers r7 
;lsb                       Allocated to registers r6 
;xlsb                      Allocated to stack - sp +0
;sloc0                     Allocated to stack - sp -4
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:489: uint32_t BMP085_Read_3B(uint8_t addr)
;	-----------------------------------------
;	 function BMP085_Read_3B
;	-----------------------------------------
_BMP085_Read_3B:
	mov	a,sp
	add	a,#0x05
	mov	sp,a
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:493: I2C_Start();
	push	ar7
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:494: I2C_Write_Byte(ATMOS_DEVICE_ADDR);
	mov	dpl,#0xec
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:495: I2C_Write_Byte(addr);
	mov	dpl,r7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:496: I2C_Start();
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:497: I2C_Write_Byte(ATMOS_DEVICE_ADDR+1);
	mov	dpl,#0xed
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:498: msb=I2C_Read_Byte();
	mov	r0,#_I2C_Read_Byte
	mov	r1,#(_I2C_Read_Byte >> 8)
	mov	r2,#(_I2C_Read_Byte >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:499: Sendack(0);
	mov	dpl,#0x00
	push	ar7
	mov	r0,#_Sendack
	mov	r1,#(_Sendack >> 8)
	mov	r2,#(_Sendack >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:500: lsb=I2C_Read_Byte();
	mov	r0,#_I2C_Read_Byte
	mov	r1,#(_I2C_Read_Byte >> 8)
	mov	r2,#(_I2C_Read_Byte >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:501: Sendack(0);
	mov	dpl,#0x00
	push	ar6
	mov	r0,#_Sendack
	mov	r1,#(_Sendack >> 8)
	mov	r2,#(_Sendack >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:502: xlsb=I2C_Read_Byte();
	mov	r0,#_I2C_Read_Byte
	mov	r1,#(_I2C_Read_Byte >> 8)
	mov	r2,#(_I2C_Read_Byte >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	pop	ar6
	pop	ar7
	mov	r0,sp
	mov	@r0,ar5
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:503: Sendack(1);
	mov	dpl,#0x01
	push	ar7
	push	ar6
	mov	r0,#_Sendack
	mov	r1,#(_Sendack >> 8)
	mov	r2,#(_Sendack >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:504: I2C_Stop();
	mov	r0,#_I2C_Stop
	mov	r1,#(_I2C_Stop >> 8)
	mov	r2,#(_I2C_Stop >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:505: return (((uint32_t) msb << 16) | ((uint32_t) lsb << 8) | (uint32_t) xlsb) >> (8-1);
	clr	a
	mov	r4,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	inc	r0
	inc	r0
	inc	r0
	mov	@r0,ar4
	dec	r0
	mov	@r0,ar7
	dec	r0
	dec	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
	mov	ar4,r6
	mov	r5,#0x00
	mov	r6,#0x00
	mov	ar7,r6
	mov	ar6,r5
	mov	ar5,r4
	mov	r4,#0x00
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,r4
	orl	a,@r0
	mov	@r0,a
	mov	a,r5
	inc	r0
	orl	a,@r0
	mov	@r0,a
	mov	a,r6
	inc	r0
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	inc	r0
	orl	a,@r0
	mov	@r0,a
	mov	r0,sp
	mov	ar2,@r0
	clr	a
	mov	r3,a
	mov	r6,a
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	orl	ar2,a
	inc	r0
	mov	a,@r0
	orl	ar3,a
	inc	r0
	mov	a,@r0
	orl	ar6,a
	inc	r0
	mov	a,@r0
	orl	ar7,a
	mov	a,r3
	mov	c,acc.7
	xch	a,r2
	rlc	a
	xch	a,r2
	rlc	a
	xch	a,r2
	anl	a,#0x01
	mov	r3,a
	mov	a,r6
	add	a,r6
	orl	a,r3
	mov	r3,a
	mov	a,r7
	mov	c,acc.7
	xch	a,r6
	rlc	a
	xch	a,r6
	rlc	a
	xch	a,r6
	anl	a,#0x01
	mov	r7,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:506: }
	xch	a,r0
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'AT24CXX_ReadNumBytes'
;------------------------------------------------------------
;MemAddr                   Allocated to stack - sp -3
;pDst                      Allocated to stack - sp -6
;len                       Allocated to stack - sp -7
;DevAddr                   Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:520: static void AT24CXX_ReadNumBytes(uint8_t DevAddr,uint8_t MemAddr,uint8_t *pDst,uint8_t len)
;	-----------------------------------------
;	 function AT24CXX_ReadNumBytes
;	-----------------------------------------
_AT24CXX_ReadNumBytes:
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:523: I2C_Start(); 
	push	ar7
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:525: I2C_Write_Byte(DevAddr|0);	   
	mov	dpl,r7
	push	ar7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:526: if(/*!IIC_Wait_Ack()*/I2C_Check_ack())
	mov	r0,#_I2C_Check_ack
	mov	r1,#(_I2C_Check_ack >> 8)
	mov	r2,#(_I2C_Check_ack >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	pop	ar7
	jnz	00139$
	ljmp	00112$
00139$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:529: I2C_Write_Byte(MemAddr);
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	dpl,@r0
	push	ar7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:531: if(I2C_Check_ack())
	mov	r0,#_I2C_Check_ack
	mov	r1,#(_I2C_Check_ack >> 8)
	mov	r2,#(_I2C_Check_ack >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	pop	ar7
	jnz	00140$
	ljmp	00112$
00140$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:534: I2C_Start();
	push	ar7
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:536: I2C_Write_Byte(DevAddr|1);		
	orl	ar7,#0x01
	mov	dpl,r7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:537: if(/*!IIC_Wait_Ack()*/I2C_Check_ack())
	mov	r0,#_I2C_Check_ack
	mov	r1,#(_I2C_Check_ack >> 8)
	mov	r2,#(_I2C_Check_ack >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	jnz	00141$
	ljmp	00112$
00141$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:539: while(len)
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar4,@r0
00104$:
	mov	a,r4
	jnz	00142$
	ljmp	00112$
00142$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:542: *pDst = I2C_Read_Byte();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	mov	r0,#_I2C_Read_Byte
	mov	r1,#(_I2C_Read_Byte >> 8)
	mov	r2,#(_I2C_Read_Byte >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:543: if(len>1)
	mov	a,r4
	add	a,#0xff - 0x01
	jnc	00102$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:545: Sendack(0);
	mov	dpl,#0x00
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	mov	r0,#_Sendack
	mov	r1,#(_Sendack >> 8)
	mov	r2,#(_Sendack >> 16)
	lcall	__sdcc_banked_call
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	sjmp	00103$
00102$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:549: Sendack(1);
	mov	dpl,#0x01
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	mov	r0,#_Sendack
	mov	r1,#(_Sendack >> 8)
	mov	r2,#(_Sendack >> 16)
	lcall	__sdcc_banked_call
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
00103$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:551: pDst++;
	inc	r5
	cjne	r5,#0x00,00144$
	inc	r6
00144$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:552: len--;
	dec	r4
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:553: Delay5us();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	mov	r0,#_Delay5us
	mov	r1,#(_Delay5us >> 8)
	mov	r2,#(_Delay5us >> 16)
	lcall	__sdcc_banked_call
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	ljmp	00104$
00112$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:559: I2C_Stop();//产生一个停止条件	       
	mov	r0,#_I2C_Stop
	mov	r1,#(_I2C_Stop >> 8)
	mov	r2,#(_I2C_Stop >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:560: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'AT24CXX_WriteSingleBytes'
;------------------------------------------------------------
;MemAddr                   Allocated to stack - sp -3
;pDst                      Allocated to stack - sp -6
;DevAddr                   Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:573: static void AT24CXX_WriteSingleBytes(uint8_t DevAddr,uint8_t MemAddr,uint8_t *pDst)
;	-----------------------------------------
;	 function AT24CXX_WriteSingleBytes
;	-----------------------------------------
_AT24CXX_WriteSingleBytes:
	mov	r7,dpl
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:575: I2C_Start(); 
	push	ar7
	mov	r0,#_I2C_Start
	mov	r1,#(_I2C_Start >> 8)
	mov	r2,#(_I2C_Start >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:576: I2C_Write_Byte(DevAddr|0);   //发送器件地址0XA0,写数据 	   
	mov	dpl,r7
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:577: if(/*!IIC_Wait_Ack()*/I2C_Check_ack())
	mov	r0,#_I2C_Check_ack
	mov	r1,#(_I2C_Check_ack >> 8)
	mov	r2,#(_I2C_Check_ack >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	jz	00104$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:579: I2C_Write_Byte(MemAddr);	   
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	dpl,@r0
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:580: if(/*!IIC_Wait_Ack()*/I2C_Check_ack())
	mov	r0,#_I2C_Check_ack
	mov	r1,#(_I2C_Check_ack >> 8)
	mov	r2,#(_I2C_Check_ack >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	jz	00104$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:582: I2C_Write_Byte(*pDst);
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,a
	mov	r0,#_I2C_Write_Byte
	mov	r1,#(_I2C_Write_Byte >> 8)
	mov	r2,#(_I2C_Write_Byte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:583: I2C_Check_ack();
	mov	r0,#_I2C_Check_ack
	mov	r1,#(_I2C_Check_ack >> 8)
	mov	r2,#(_I2C_Check_ack >> 16)
	lcall	__sdcc_banked_call
00104$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:586: I2C_Stop();//产生一个停止条件	       
	mov	r0,#_I2C_Stop
	mov	r1,#(_I2C_Stop >> 8)
	mov	r2,#(_I2C_Stop >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:587: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readTrim'
;------------------------------------------------------------
;data                      Allocated to stack - sp -31
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:598: static void readTrim(void)
;	-----------------------------------------
;	 function readTrim
;	-----------------------------------------
_readTrim:
	mov	a,sp
	add	a,#0x20
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:602: AT24CXX_ReadNumBytes(ATMOS_DEVICE_ADDR,0X88,&data[0],24);
	mov	sp,a
	add	a,#0xe1
	mov	r1,a
	mov	r5,a
	mov	r6,#0x00
	mov	r7,#0x40
	push	ar1
	mov	a,#0x18
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	a,#0x88
	push	acc
	mov	dpl,#0xec
	mov	r0,#_AT24CXX_ReadNumBytes
	mov	r1,#(_AT24CXX_ReadNumBytes >> 8)
	mov	r2,#(_AT24CXX_ReadNumBytes >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:603: AT24CXX_ReadNumBytes(ATMOS_DEVICE_ADDR,0xA1,&data[24],1);  
	mov	a,#0x18
	add	a,r1
	mov	r0,a
	mov	r5,a
	mov	r6,#0x00
	mov	r7,#0x40
	push	ar1
	push	ar0
	mov	a,#0x01
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	a,#0xa1
	push	acc
	mov	dpl,#0xec
	mov	r0,#_AT24CXX_ReadNumBytes
	mov	r1,#(_AT24CXX_ReadNumBytes >> 8)
	mov	r2,#(_AT24CXX_ReadNumBytes >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar0
	pop	ar1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:604: AT24CXX_ReadNumBytes(ATMOS_DEVICE_ADDR,0xE1,&data[25],7);
	mov	a,#0x19
	add	a,r1
	mov	r7,a
	mov	r4,a
	mov	r5,#0x00
	mov	r6,#0x40
	push	ar7
	push	ar1
	push	ar0
	mov	a,#0x07
	push	acc
	push	ar4
	push	ar5
	push	ar6
	mov	a,#0xe1
	push	acc
	mov	dpl,#0xec
	mov	r0,#_AT24CXX_ReadNumBytes
	mov	r1,#(_AT24CXX_ReadNumBytes >> 8)
	mov	r2,#(_AT24CXX_ReadNumBytes >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar0
	pop	ar1
	pop	ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:606: dig_T1 = (data[1] << 8) | data[0];
	mov	a,r1
	inc	a
	mov	r6,a
	push	ar0
	mov	r0,ar6
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	ar4,@r1
	mov	r3,#0x00
	mov	dptr,#_dig_T1
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:607: dig_T2 = (data[3] << 8) | data[2];
	mov	a,#0x03
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x02
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_T2
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:608: dig_T3 = (data[5] << 8) | data[4];
	mov	a,#0x05
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x04
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_T3
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:609: dig_P1 = (data[7] << 8) | data[6];
	mov	a,#0x07
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x06
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_P1
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:610: dig_P2 = (data[9] << 8) | data[8];
	mov	a,#0x09
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x08
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_P2
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:611: dig_P3 = (data[11]<< 8) | data[10];
	mov	a,#0x0b
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x0a
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_P3
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:612: dig_P4 = (data[13]<< 8) | data[12];
	mov	a,#0x0d
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x0c
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_P4
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:613: dig_P5 = (data[15]<< 8) | data[14];
	mov	a,#0x0f
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x0e
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_P5
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:614: dig_P6 = (data[17]<< 8) | data[16];
	mov	a,#0x11
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x10
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_P6
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:615: dig_P7 = (data[19]<< 8) | data[18];
	mov	a,#0x13
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x12
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_P7
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:616: dig_P8 = (data[21]<< 8) | data[20];
	mov	a,#0x15
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x14
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	r3,#0x00
	mov	dptr,#_dig_P8
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:617: dig_P9 = (data[23]<< 8) | data[22];
	mov	a,#0x17
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	a,#0x16
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	pop	ar0
	mov	r3,#0x00
	mov	dptr,#_dig_P9
	mov	a,r4
	orl	a,r6
	movx	@dptr,a
	mov	a,r3
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:618: dig_H1 = data[24];
	mov	dptr,#_dig_H1
	mov	a,@r0
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:619: dig_H2 = (data[26]<< 8) | data[25];
	mov	a,#0x1a
	add	a,r1
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	mov	r6,#0x00
	mov	r0,ar7
	mov	ar7,@r0
	mov	r4,#0x00
	mov	dptr,#_dig_H2
	mov	a,r7
	orl	a,r6
	movx	@dptr,a
	mov	a,r4
	orl	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:620: dig_H3 = data[27];
	mov	a,#0x1b
	add	a,r1
	mov	r0,a
	mov	dptr,#_dig_H3
	mov	a,@r0
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:621: dig_H4 = (data[28]<< 4) | (0x0F & data[29]);
	mov	a,#0x1c
	add	a,r1
	mov	r0,a
	mov	ar7,@r0
	clr	a
	xch	a,r7
	swap	a
	xch	a,r7
	xrl	a,r7
	xch	a,r7
	anl	a,#0xf0
	xch	a,r7
	xrl	a,r7
	mov	r6,a
	mov	a,#0x1d
	add	a,r1
	mov	r0,a
	mov	ar5,@r0
	mov	ar3,r5
	anl	ar3,#0x0f
	mov	r4,#0x00
	mov	dptr,#_dig_H4
	mov	a,r3
	orl	a,r7
	movx	@dptr,a
	mov	a,r4
	orl	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:622: dig_H5 = (data[30] << 4) | ((data[29] >> 4) & 0x0F);
	mov	a,#0x1e
	add	a,r1
	mov	r0,a
	mov	ar7,@r0
	clr	a
	xch	a,r7
	swap	a
	xch	a,r7
	xrl	a,r7
	xch	a,r7
	anl	a,#0xf0
	xch	a,r7
	xrl	a,r7
	mov	r6,a
	mov	a,r5
	swap	a
	anl	a,#0x0f
	mov	r5,a
	anl	ar5,#0x0f
	mov	r4,#0x00
	mov	dptr,#_dig_H5
	mov	a,r5
	orl	a,r7
	movx	@dptr,a
	mov	a,r4
	orl	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:623: dig_H6 = data[31];   
	mov	a,#0x1f
	add	a,r1
	mov	r1,a
	mov	dptr,#_dig_H6
	mov	a,@r1
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:624: }
	mov	a,sp
	add	a,#0xe0
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readData'
;------------------------------------------------------------
;pTemp                     Allocated to stack - sp -36
;pHumi                     Allocated to stack - sp -39
;pPress                    Allocated to stack - sp -30
;data                      Allocated to stack - sp -15
;i                         Allocated to stack - sp -19
;a                         Allocated to stack - sp -7
;b                         Allocated to registers r4 r3 r6 r7 
;c                         Allocated to stack - sp -3
;sloc0                     Allocated to stack - sp -27
;sloc1                     Allocated to stack - sp -23
;sloc2                     Allocated to stack - sp -19
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:636: static void readData(unsigned long *pPress,unsigned long *pTemp,unsigned long *pHumi)
;	-----------------------------------------
;	 function readData
;	-----------------------------------------
_readData:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x1c
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:640: AT24CXX_ReadNumBytes(ATMOS_DEVICE_ADDR,0xF7,&data[0],8);
	mov	sp,a
	add	a,#0xf1
	mov	r1,a
	mov	r2,a
	mov	r3,#0x00
	mov	r4,#0x40
	push	ar1
	mov	a,#0x08
	push	acc
	push	ar2
	push	ar3
	push	ar4
	cpl	a
	push	acc
	mov	dpl,#0xec
	mov	r0,#_AT24CXX_ReadNumBytes
	mov	r1,#(_AT24CXX_ReadNumBytes >> 8)
	mov	r2,#(_AT24CXX_ReadNumBytes >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar1
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:642: a = ((uint32_t)data[0] << 12);
	mov	ar4,@r1
	mov	ar2,r4
	clr	a
	mov	r3,a
	mov	r4,a
	mov	a,sp
	add	a,#0xe5
	mov	r0,a
	inc	r0
	inc	r0
	mov	@r0,ar3
	mov	a,r4
	swap	a
	anl	a,#0xf0
	xch	a,@r0
	swap	a
	xch	a,@r0
	xrl	a,@r0
	xch	a,@r0
	anl	a,#0xf0
	xch	a,@r0
	xrl	a,@r0
	inc	r0
	mov	@r0,a
	mov	a,r2
	swap	a
	anl	a,#0x0f
	dec	r0
	orl	a,@r0
	mov	@r0,a
	mov	a,r2
	swap	a
	anl	a,#0xf0
	dec	r0
	mov	@r0,a
	dec	r0
	mov	@r0,#0x00
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:643: b = ((uint32_t)data[1] << 4);
	mov	a,r1
	inc	a
	mov	r0,a
	mov	ar6,@r0
	mov	ar5,r6
	clr	a
	mov	r6,a
	mov	r4,a
	swap	a
	anl	a,#0xf0
	xch	a,r4
	swap	a
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	anl	a,#0xf0
	xch	a,r4
	xrl	a,r4
	mov	r7,a
	mov	a,r6
	swap	a
	anl	a,#0x0f
	orl	a,r4
	mov	r4,a
	mov	a,r6
	swap	a
	anl	a,#0xf0
	xch	a,r5
	swap	a
	xch	a,r5
	xrl	a,r5
	xch	a,r5
	anl	a,#0xf0
	xch	a,r5
	xrl	a,r5
	mov	r6,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:644: c = (data[2] >> 4);
	mov	a,#0x02
	add	a,r1
	mov	r0,a
	mov	a,@r0
	swap	a
	anl	a,#0x0f
	mov	r3,a
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:645: *pPress = a|b|c;
	mov	a,sp
	add	a,#0xe5
	mov	r0,a
	mov	a,@r0
	orl	ar5,a
	inc	r0
	mov	a,@r0
	orl	ar6,a
	inc	r0
	mov	a,@r0
	orl	ar4,a
	inc	r0
	mov	a,@r0
	orl	ar7,a
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	a,@r0
	orl	ar5,a
	inc	r0
	mov	a,@r0
	orl	ar6,a
	inc	r0
	mov	a,@r0
	orl	ar4,a
	inc	r0
	mov	a,@r0
	orl	ar7,a
	mov	a,sp
	add	a,#0xe2
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:647: a = ((uint32_t)data[3] << 12);
	mov	a,#0x03
	add	a,r1
	mov	r0,a
	mov	ar7,@r0
	clr	a
	mov	r6,a
	mov	r5,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	inc	r0
	inc	r0
	mov	@r0,ar6
	mov	a,r5
	swap	a
	anl	a,#0xf0
	xch	a,@r0
	swap	a
	xch	a,@r0
	xrl	a,@r0
	xch	a,@r0
	anl	a,#0xf0
	xch	a,@r0
	xrl	a,@r0
	inc	r0
	mov	@r0,a
	mov	a,r7
	swap	a
	anl	a,#0x0f
	dec	r0
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	swap	a
	anl	a,#0xf0
	dec	r0
	mov	@r0,a
	dec	r0
	mov	@r0,#0x00
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:648: b = ((uint32_t)data[4] << 4);
	mov	a,#0x04
	add	a,r1
	mov	r0,a
	mov	ar3,@r0
	mov	ar2,r3
	clr	a
	mov	r3,a
	mov	r6,a
	swap	a
	anl	a,#0xf0
	xch	a,r6
	swap	a
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	anl	a,#0xf0
	xch	a,r6
	xrl	a,r6
	mov	r7,a
	mov	a,r3
	swap	a
	anl	a,#0x0f
	orl	a,r6
	mov	r6,a
	mov	ar4,r2
	mov	a,r3
	swap	a
	anl	a,#0xf0
	xch	a,r4
	swap	a
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	anl	a,#0xf0
	xch	a,r4
	xrl	a,r4
	mov	r3,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:649: c = (data[5] >> 4);
	mov	a,#0x05
	add	a,r1
	mov	r0,a
	mov	a,@r0
	swap	a
	anl	a,#0x0f
	mov	r5,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:650: *pTemp = a|b|c;
	mov	a,sp
	add	a,#0xdc
	mov	r0,a
	push	ar1
	mov	a,sp
	add	a,#0xec
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	pop	ar1
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,r4
	orl	a,@r0
	mov	r4,a
	mov	a,r3
	inc	r0
	orl	a,@r0
	mov	r5,a
	mov	a,r6
	inc	r0
	orl	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	orl	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	orl	ar4,a
	inc	r0
	mov	a,@r0
	orl	ar5,a
	inc	r0
	mov	a,@r0
	orl	ar6,a
	inc	r0
	mov	a,@r0
	orl	ar7,a
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:652: *pHumi  = ((uint32_t)data[6] << 8) | data[7];
	mov	a,sp
	add	a,#0xd9
	mov	r0,a
	push	ar1
	mov	a,sp
	add	a,#0xec
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	pop	ar1
	mov	a,#0x06
	add	a,r1
	mov	r0,a
	mov	ar4,@r0
	mov	ar2,r4
	clr	a
	mov	r3,a
	mov	r4,a
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	inc	r0
	inc	r0
	inc	r0
	mov	@r0,ar4
	dec	r0
	mov	@r0,ar3
	dec	r0
	mov	@r0,ar2
	dec	r0
	mov	@r0,#0x00
	mov	a,#0x07
	add	a,r1
	mov	r1,a
	mov	ar6,@r1
	mov	ar5,r6
	clr	a
	mov	r6,a
	mov	r4,a
	mov	r7,a
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	a,@r0
	orl	ar5,a
	inc	r0
	mov	a,@r0
	orl	ar6,a
	inc	r0
	mov	a,@r0
	orl	ar4,a
	inc	r0
	mov	a,@r0
	orl	ar7,a
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:653: }
	mov	a,sp
	add	a,#0xe1
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'calibration_T'
;------------------------------------------------------------
;adc_T                     Allocated to stack - sp -15
;var1                      Allocated to stack - sp -3
;var2                      Allocated to registers r4 r5 r6 r7 
;T                         Allocated to registers r4 r5 r6 r7 
;sloc0                     Allocated to stack - sp -11
;sloc1                     Allocated to stack - sp -7
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:664: static signed  long calibration_T(signed  long adc_T)
;	-----------------------------------------
;	 function calibration_T
;	-----------------------------------------
_calibration_T:
	push	dpl
	push	dph
	push	b
	push	acc
	mov	a,sp
	add	a,#0x0c
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:668: var1 = ((((adc_T >> 3) - ((signed  long)dig_T1<<1))) * ((signed  long)dig_T2)) >> 11;
	mov	sp,a
	add	a,#0xf1
	mov	r0,a
	mov	a,sp
	add	a,#0xf5
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	mov	a,@r0
	swap	a
	rl	a
	xch	a,@r1
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,@r1
	xch	a,@r1
	anl	a,#0x1f
	xch	a,@r1
	xrl	a,@r1
	xch	a,@r1
	inc	r1
	mov	@r1,a
	inc	r0
	mov	a,@r0
	swap	a
	rl	a
	anl	a,#0xe0
	orl	a,@r1
	mov	@r1,a
	mov	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	mov	a,@r0
	swap	a
	rl	a
	xch	a,@r1
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,@r1
	xch	a,@r1
	anl	a,#0x1f
	xch	a,@r1
	xrl	a,@r1
	xch	a,@r1
	jnb	acc.4,00103$
	orl	a,#0xe0
00103$:
	inc	r1
	mov	@r1,a
	mov	dptr,#_dig_T1
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,@r0
	add	a,@r0
	mov	r2,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r3,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r6,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r7,a
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,@r0
	clr	c
	subb	a,r2
	mov	@r0,a
	inc	r0
	mov	a,@r0
	subb	a,r3
	mov	@r0,a
	inc	r0
	mov	a,@r0
	subb	a,r6
	mov	@r0,a
	inc	r0
	mov	a,@r0
	subb	a,r7
	mov	@r0,a
	mov	dptr,#_dig_T2
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xfd
	mov	r0,a
	mov	@r0,ar5
	mov	a,r6
	swap	a
	rl	a
	xch	a,@r0
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,@r0
	xch	a,@r0
	anl	a,#0x1f
	xch	a,@r0
	xrl	a,@r0
	xch	a,@r0
	inc	r0
	mov	@r0,a
	mov	a,r7
	swap	a
	rl	a
	anl	a,#0xe0
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	swap	a
	rl	a
	anl	a,#0x1f
	jnb	acc.4,00104$
	orl	a,#0xe0
00104$:
	inc	r0
	mov	@r0,a
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:669: var2 = (((((adc_T >> 4) - ((signed  long)dig_T1)) * ((adc_T>>4) - ((signed  long)dig_T1))) >> 12) * ((signed  int)dig_T3)) >> 14;
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	a,@r0
	swap	a
	xch	a,r2
	swap	a
	anl	a,#0x0f
	xrl	a,r2
	xch	a,r2
	anl	a,#0x0f
	xch	a,r2
	xrl	a,r2
	xch	a,r2
	mov	r3,a
	inc	r0
	mov	a,@r0
	swap	a
	anl	a,#0xf0
	orl	a,r3
	mov	r3,a
	mov	ar6,@r0
	inc	r0
	mov	a,@r0
	swap	a
	xch	a,r6
	swap	a
	anl	a,#0x0f
	xrl	a,r6
	xch	a,r6
	anl	a,#0x0f
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	jnb	acc.3,00105$
	orl	a,#0xf0
00105$:
	mov	r7,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,r2
	clr	c
	subb	a,@r0
	mov	r2,a
	mov	a,r3
	inc	r0
	subb	a,@r0
	mov	r3,a
	mov	a,r6
	inc	r0
	subb	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	subb	a,@r0
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	mov	a,r7
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xf9
	mov	r0,a
	mov	@r0,ar5
	mov	a,r6
	swap	a
	xch	a,@r0
	swap	a
	anl	a,#0x0f
	xrl	a,@r0
	xch	a,@r0
	anl	a,#0x0f
	xch	a,@r0
	xrl	a,@r0
	xch	a,@r0
	inc	r0
	mov	@r0,a
	mov	a,r7
	swap	a
	anl	a,#0xf0
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	swap	a
	anl	a,#0x0f
	jnb	acc.3,00106$
	orl	a,#0xf0
00106$:
	inc	r0
	mov	@r0,a
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
	mov	dptr,#_dig_T3
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	ar4,r5
	mov	a,r6
	mov	c,acc.7
	xch	a,r4
	rlc	a
	xch	a,r4
	rlc	a
	mov	c,acc.7
	xch	a,r4
	rlc	a
	xch	a,r4
	rlc	a
	xch	a,r4
	anl	a,#0x03
	mov	r5,a
	mov	a,r7
	add	a,r7
	add	a,acc
	orl	a,r5
	mov	r5,a
	mov	a,r7
	rl	a
	rl	a
	anl	a,#0x03
	jnb	acc.1,00107$
	orl	a,#0xfc
00107$:
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:671: t_fine = var1 + var2;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	r4,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	r5,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	dptr,#_t_fine
	mov	a,r4
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:672: T = (t_fine * 5 + 128) >> 8;
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#(0x05&0x00ff)
	clr	a
	mov	b,a
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x80
	add	a,r4
	clr	a
	addc	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	ar4,r5
	mov	ar5,r6
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:673: return T; 
	mov	r7,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:674: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf0
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'calibration_P'
;------------------------------------------------------------
;adc_P                     Allocated to stack - sp -27
;var1                      Allocated to stack - sp -11
;var2                      Allocated to stack - sp -7
;P                         Allocated to stack - sp -3
;sloc0                     Allocated to stack - sp -23
;sloc1                     Allocated to stack - sp -19
;sloc2                     Allocated to stack - sp -15
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:685: static unsigned  long calibration_P(signed  long adc_P)
;	-----------------------------------------
;	 function calibration_P
;	-----------------------------------------
_calibration_P:
	push	dpl
	push	dph
	push	b
	push	acc
	mov	a,sp
	add	a,#0x18
	mov	sp,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:689: var1 = (((signed  long)t_fine)>>1) - (signed  long)64000;
	mov	dptr,#_t_fine
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	c,acc.7
	rrc	a
	mov	r7,a
	mov	a,r6
	rrc	a
	mov	r6,a
	mov	a,r3
	rrc	a
	mov	r3,a
	mov	a,r2
	rrc	a
	mov	r2,a
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	@r0,ar2
	mov	a,r3
	add	a,#0x06
	inc	r0
	mov	@r0,a
	mov	a,r6
	addc	a,#0xff
	inc	r0
	mov	@r0,a
	mov	a,r7
	addc	a,#0xff
	inc	r0
	mov	@r0,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:690: var2 = (((var1>>2) * (var1>>2)) >> 11) * ((signed  long)dig_P6);
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	inc	r0
	inc	r0
	inc	r0
	mov	a,@r0
	mov	c,acc.7
	rrc	a
	mov	r7,a
	dec	r0
	mov	a,@r0
	rrc	a
	mov	r6,a
	dec	r0
	mov	a,@r0
	rrc	a
	mov	r5,a
	dec	r0
	mov	a,@r0
	rrc	a
	mov	r4,a
	mov	a,r7
	mov	c,acc.7
	rrc	a
	mov	r7,a
	mov	a,r6
	rrc	a
	mov	r6,a
	mov	a,r5
	rrc	a
	mov	r5,a
	mov	a,r4
	rrc	a
	mov	r4,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	__mullong
	xch	a,r0
	mov	a,sp
	add	a,#0xe9
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xed
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	inc	r0
	mov	a,@r0
	mov	@r1,a
	inc	r0
	mov	a,@r0
	swap	a
	rl	a
	xch	a,@r1
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,@r1
	xch	a,@r1
	anl	a,#0x1f
	xch	a,@r1
	xrl	a,@r1
	xch	a,@r1
	inc	r1
	mov	@r1,a
	inc	r0
	mov	a,@r0
	swap	a
	rl	a
	anl	a,#0xe0
	orl	a,@r1
	mov	@r1,a
	mov	a,@r0
	swap	a
	rl	a
	anl	a,#0x1f
	jnb	acc.4,00118$
	orl	a,#0xe0
00118$:
	inc	r1
	mov	@r1,a
	rlc	a
	subb	a,acc
	inc	r1
	mov	@r1,a
	mov	dptr,#_dig_P6
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	xch	a,r0
	mov	a,sp
	add	a,#0xed
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:691: var2 = var2 + ((var1*((signed  long)dig_P5))<<1);
	mov	dptr,#_dig_P5
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xe5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	add	a,r4
	mov	r4,a
	mov	a,r5
	rlc	a
	mov	r5,a
	mov	a,r6
	rlc	a
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r7,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	r4,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	r5,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:692: var2 = (var2>>2)+(((signed  long)dig_P4)<<16);
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,r7
	mov	c,acc.7
	rrc	a
	inc	r0
	inc	r0
	inc	r0
	mov	@r0,a
	mov	a,r6
	rrc	a
	dec	r0
	mov	@r0,a
	mov	a,r5
	rrc	a
	dec	r0
	mov	@r0,a
	mov	a,r4
	rrc	a
	dec	r0
	mov	@r0,a
	inc	r0
	inc	r0
	inc	r0
	mov	a,@r0
	mov	c,acc.7
	rrc	a
	mov	@r0,a
	dec	r0
	mov	a,@r0
	rrc	a
	mov	@r0,a
	dec	r0
	mov	a,@r0
	rrc	a
	mov	@r0,a
	dec	r0
	mov	a,@r0
	rrc	a
	mov	@r0,a
	mov	dptr,#_dig_P4
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	ar7,r3
	mov	ar6,r2
	clr	a
	mov	r2,a
	mov	r3,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r3
	inc	r0
	addc	a,@r0
	mov	r3,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:693: var1 = (((dig_P3 * (((var1>>2)*(var1>>2)) >> 13)) >>3) + ((((signed  long)dig_P2) * var1)>>1))>>18;
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	inc	r0
	mov	a,@r0
	mov	@r1,a
	inc	r0
	mov	a,@r0
	swap	a
	rr	a
	xch	a,@r1
	swap	a
	rr	a
	anl	a,#0x07
	xrl	a,@r1
	xch	a,@r1
	anl	a,#0x07
	xch	a,@r1
	xrl	a,@r1
	xch	a,@r1
	inc	r1
	mov	@r1,a
	inc	r0
	mov	a,@r0
	swap	a
	rr	a
	anl	a,#0xf8
	orl	a,@r1
	mov	@r1,a
	mov	a,@r0
	swap	a
	rr	a
	anl	a,#0x07
	jnb	acc.2,00119$
	orl	a,#0xf8
00119$:
	inc	r1
	mov	@r1,a
	rlc	a
	subb	a,acc
	inc	r1
	mov	@r1,a
	mov	dptr,#_dig_P3
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xf1
	mov	r0,a
	mov	@r0,ar4
	mov	a,r5
	swap	a
	rl	a
	xch	a,@r0
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,@r0
	xch	a,@r0
	anl	a,#0x1f
	xch	a,@r0
	xrl	a,@r0
	xch	a,@r0
	inc	r0
	mov	@r0,a
	mov	a,r6
	swap	a
	rl	a
	anl	a,#0xe0
	orl	a,@r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar6
	mov	a,r7
	swap	a
	rl	a
	xch	a,@r0
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,@r0
	xch	a,@r0
	anl	a,#0x1f
	xch	a,@r0
	xrl	a,@r0
	xch	a,@r0
	jnb	acc.4,00120$
	orl	a,#0xe0
00120$:
	inc	r0
	mov	@r0,a
	mov	dptr,#_dig_P2
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	mov	a,r7
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r7
	mov	c,acc.7
	rrc	a
	mov	r7,a
	mov	a,r6
	rrc	a
	mov	r6,a
	mov	a,r5
	rrc	a
	mov	r5,a
	mov	a,r4
	rrc	a
	mov	r4,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	ar4,r6
	mov	c,acc.7
	rrc	a
	xch	a,r4
	rrc	a
	xch	a,r4
	mov	c,acc.7
	rrc	a
	xch	a,r4
	rrc	a
	xch	a,r4
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:694: var1 = ((((32768+var1))*((signed  long)dig_P1))>>15);
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	@r0,ar4
	mov	a,#0x80
	add	a,r5
	inc	r0
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	clr	a
	addc	a,r7
	inc	r0
	mov	@r0,a
	mov	dptr,#_dig_P1
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	r6,#0x00
	mov	r7,#0x00
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xf5
	mov	r0,a
	mov	@r0,ar5
	mov	a,r6
	mov	c,acc.7
	xch	a,@r0
	rlc	a
	xch	a,@r0
	rlc	a
	xch	a,@r0
	anl	a,#0x01
	inc	r0
	mov	@r0,a
	mov	a,r7
	add	a,r7
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	rl	a
	anl	a,#0x01
	jnb	acc.0,00121$
	orl	a,#0xfe
00121$:
	inc	r0
	mov	@r0,a
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:695: if (var1 == 0)
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	inc	r0
	orl	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00102$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:697: return 0;
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	ljmp	00106$
00102$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:699: P = (((unsigned  long)(((signed  long)1048576)-adc_P)-(var2>>12)))*3125;
	mov	a,sp
	add	a,#0xe5
	mov	r0,a
	clr	a
	clr	c
	subb	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	subb	a,@r0
	mov	r3,a
	mov	a,#0x10
	inc	r0
	subb	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	subb	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	a,@r0
	swap	a
	xch	a,r4
	swap	a
	anl	a,#0x0f
	xrl	a,r4
	xch	a,r4
	anl	a,#0x0f
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	mov	r5,a
	inc	r0
	mov	a,@r0
	swap	a
	anl	a,#0xf0
	orl	a,r5
	mov	r5,a
	mov	a,@r0
	swap	a
	anl	a,#0x0f
	jnb	acc.3,00123$
	orl	a,#0xf0
00123$:
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,@r0
	clr	c
	subb	a,r4
	mov	r4,a
	inc	r0
	mov	a,@r0
	subb	a,r5
	mov	r5,a
	inc	r0
	mov	a,@r0
	subb	a,r6
	mov	r6,a
	inc	r0
	mov	a,@r0
	subb	a,r7
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0c35
	clr	a
	mov	b,a
	lcall	__mullong
	xch	a,r0
	mov	a,sp
	add	a,#0xed
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:700: if(P<0x80000000)
	mov	sp,a
	add	a,#0xf1
	mov	r0,a
	clr	c
	inc	r0
	inc	r0
	inc	r0
	mov	a,@r0
	subb	a,#0x80
	jnc	00104$
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:702: P = (P << 1) / ((unsigned  long) var1);   
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,sp
	add	a,#0xed
	mov	r1,a
	mov	a,@r0
	add	a,@r0
	mov	@r1,a
	inc	r0
	mov	a,@r0
	rlc	a
	inc	r1
	mov	@r1,a
	inc	r0
	mov	a,@r0
	rlc	a
	inc	r1
	mov	@r1,a
	inc	r0
	mov	a,@r0
	rlc	a
	inc	r1
	mov	@r1,a
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__divulong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xfd
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	sjmp	00105$
00104$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:706: P = (P / (unsigned  long)var1) * 2;    
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__divulong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xfd
	mov	r0,a
	mov	a,r4
	add	a,r4
	mov	@r0,a
	mov	a,r5
	rlc	a
	inc	r0
	mov	@r0,a
	mov	a,r6
	rlc	a
	inc	r0
	mov	@r0,a
	mov	a,r7
	rlc	a
	inc	r0
	mov	@r0,a
00105$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:708: var1 = (((signed  long)dig_P9) * ((signed  long)(((P>>3) * (P>>3))>>13)))>>12;
	mov	dptr,#_dig_P9
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	mov	a,r3
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	a,@r0
	swap	a
	rl	a
	xch	a,r4
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,r4
	xch	a,r4
	anl	a,#0x1f
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	mov	r5,a
	inc	r0
	mov	a,@r0
	swap	a
	rl	a
	anl	a,#0xe0
	orl	a,r5
	mov	r5,a
	mov	ar6,@r0
	inc	r0
	mov	a,@r0
	swap	a
	rl	a
	xch	a,r6
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,r6
	xch	a,r6
	anl	a,#0x1f
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	ar4,r5
	mov	a,r6
	swap	a
	rr	a
	xch	a,r4
	swap	a
	rr	a
	anl	a,#0x07
	xrl	a,r4
	xch	a,r4
	anl	a,#0x07
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	mov	r5,a
	mov	a,r7
	swap	a
	rr	a
	anl	a,#0xf8
	orl	a,r5
	mov	r5,a
	mov	a,r7
	swap	a
	rr	a
	anl	a,#0x07
	mov	r6,a
	mov	r7,#0x00
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xf1
	mov	r0,a
	mov	@r0,ar5
	mov	a,r6
	swap	a
	xch	a,@r0
	swap	a
	anl	a,#0x0f
	xrl	a,@r0
	xch	a,@r0
	anl	a,#0x0f
	xch	a,@r0
	xrl	a,@r0
	xch	a,@r0
	inc	r0
	mov	@r0,a
	mov	a,r7
	swap	a
	anl	a,#0xf0
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	swap	a
	anl	a,#0x0f
	jnb	acc.3,00125$
	orl	a,#0xf0
00125$:
	inc	r0
	mov	@r0,a
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:709: var2 = (((signed  long)(P>>2)) * ((signed  long)dig_P8))>>13;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	inc	r0
	inc	r0
	inc	r0
	mov	a,@r0
	clr	c
	rrc	a
	mov	r7,a
	dec	r0
	mov	a,@r0
	rrc	a
	mov	r6,a
	dec	r0
	mov	a,@r0
	rrc	a
	mov	r3,a
	dec	r0
	mov	a,@r0
	rrc	a
	mov	r2,a
	mov	a,r7
	clr	c
	rrc	a
	mov	r7,a
	mov	a,r6
	rrc	a
	mov	r6,a
	mov	a,r3
	rrc	a
	mov	r3,a
	mov	a,r2
	rrc	a
	mov	r2,a
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	mov	dptr,#_dig_P8
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	ar4,r5
	mov	a,r6
	swap	a
	rr	a
	xch	a,r4
	swap	a
	rr	a
	anl	a,#0x07
	xrl	a,r4
	xch	a,r4
	anl	a,#0x07
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	mov	r5,a
	mov	a,r7
	swap	a
	rr	a
	anl	a,#0xf8
	orl	a,r5
	mov	r5,a
	mov	a,r7
	swap	a
	rr	a
	anl	a,#0x07
	jnb	acc.2,00126$
	orl	a,#0xf8
00126$:
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:710: P = (unsigned  long)((signed  long)P + ((var1 + var2 + dig_P7) >> 4));
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,sp
	add	a,#0xe9
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	@r0,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	@r0,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	@r0,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	@r0,a
	mov	dptr,#_dig_P7
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r3
	inc	r0
	addc	a,@r0
	mov	r3,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,r3
	swap	a
	xch	a,r2
	swap	a
	anl	a,#0x0f
	xrl	a,r2
	xch	a,r2
	anl	a,#0x0f
	xch	a,r2
	xrl	a,r2
	xch	a,r2
	mov	r3,a
	mov	a,r6
	swap	a
	anl	a,#0xf0
	orl	a,r3
	mov	r3,a
	mov	a,r7
	swap	a
	xch	a,r6
	swap	a
	anl	a,#0x0f
	xrl	a,r6
	xch	a,r6
	anl	a,#0x0f
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	jnb	acc.3,00127$
	orl	a,#0xf0
00127$:
	mov	r7,a
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r3
	inc	r0
	addc	a,@r0
	mov	r3,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:711: return P;
	mov	r7,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
00106$:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:712: }
	xch	a,r0
	mov	a,sp
	add	a,#0xe4
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'calibration_H'
;------------------------------------------------------------
;adc_H                     Allocated to stack - sp -15
;v_x1                      Allocated to registers r4 r5 r6 r7 
;sloc0                     Allocated to stack - sp -11
;sloc1                     Allocated to stack - sp -7
;sloc2                     Allocated to stack - sp -3
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:723: static unsigned long calibration_H(signed  long adc_H)
;	-----------------------------------------
;	 function calibration_H
;	-----------------------------------------
_calibration_H:
	push	dpl
	push	dph
	push	b
	push	acc
	mov	a,sp
	add	a,#0x0c
	mov	sp,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:727: v_x1 = (t_fine - ((signed  long)76800));
	mov	dptr,#_t_fine
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	@r0,ar2
	mov	a,r3
	add	a,#0xd4
	inc	r0
	mov	@r0,a
	mov	a,r6
	addc	a,#0xfe
	inc	r0
	mov	@r0,a
	mov	a,r7
	addc	a,#0xff
	inc	r0
	mov	@r0,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:728: v_x1 = (((((adc_H << 14) -(((signed  long)dig_H4) << 20) - (((signed  long)dig_H5) * v_x1)) + 
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,sp
	add	a,#0xf9
	mov	r1,a
	inc	r0
	mov	a,@r0
	inc	r1
	inc	r1
	mov	@r1,a
	inc	r0
	mov	a,@r0
	anl	a,#0x03
	mov	c,acc.0
	xch	a,@r1
	rrc	a
	xch	a,@r1
	rrc	a
	mov	c,acc.0
	xch	a,@r1
	rrc	a
	xch	a,@r1
	rrc	a
	xch	a,@r1
	inc	r1
	mov	@r1,a
	dec	r0
	dec	r0
	mov	a,@r0
	rr	a
	rr	a
	anl	a,#0x3f
	dec	r1
	orl	a,@r1
	mov	@r1,a
	mov	a,@r0
	rr	a
	rr	a
	anl	a,#0xc0
	dec	r1
	mov	@r1,a
	dec	r1
	mov	@r1,#0x00
	mov	dptr,#_dig_H4
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	ar6,r2
	mov	a,r3
	swap	a
	anl	a,#0xf0
	xch	a,r6
	swap	a
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	anl	a,#0xf0
	xch	a,r6
	xrl	a,r6
	mov	r7,a
	clr	a
	mov	r2,a
	mov	r3,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,@r0
	clr	c
	subb	a,r2
	mov	@r0,a
	inc	r0
	mov	a,@r0
	subb	a,r3
	mov	@r0,a
	inc	r0
	mov	a,@r0
	subb	a,r6
	mov	@r0,a
	inc	r0
	mov	a,@r0
	subb	a,r7
	mov	@r0,a
	mov	dptr,#_dig_H5
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xf9
	mov	r0,a
	mov	a,@r0
	clr	c
	subb	a,r4
	inc	r0
	mov	a,@r0
	subb	a,r5
	mov	r5,a
	inc	r0
	mov	a,@r0
	subb	a,r6
	mov	r6,a
	inc	r0
	mov	a,@r0
	subb	a,r7
	mov	r7,a
	mov	a,#0x40
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	@r0,ar5
	mov	a,r6
	mov	c,acc.7
	xch	a,@r0
	rlc	a
	xch	a,@r0
	rlc	a
	xch	a,@r0
	anl	a,#0x01
	inc	r0
	mov	@r0,a
	mov	a,r7
	add	a,r7
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	rl	a
	anl	a,#0x01
	jnb	acc.0,00117$
	orl	a,#0xfe
00117$:
	inc	r0
	mov	@r0,a
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:729: ((signed  long)16384)) >> 15) * (((((((v_x1 * ((signed  long)dig_H6)) >> 10) * 
	mov	dptr,#_dig_H6
	movx	a,@dptr
	mov	r2,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	r6,a
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xfd
	mov	r0,a
	mov	@r0,ar5
	mov	a,r6
	clr	c
	rrc	a
	xch	a,@r0
	rrc	a
	xch	a,@r0
	clr	c
	rrc	a
	xch	a,@r0
	rrc	a
	xch	a,@r0
	inc	r0
	mov	@r0,a
	mov	a,r7
	rr	a
	rr	a
	anl	a,#0xc0
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	mov	c,acc.7
	rrc	a
	mov	c,acc.7
	rrc	a
	inc	r0
	mov	@r0,a
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:730: (((v_x1 * ((signed  long)dig_H3)) >> 11) + ((signed  long) 32768))) >> 10) + (( signed  long)2097152)) * 
	mov	dptr,#_dig_H3
	movx	a,@dptr
	mov	r2,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	r6,a
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	ar4,r5
	mov	a,r6
	swap	a
	rl	a
	xch	a,r4
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,r4
	xch	a,r4
	anl	a,#0x1f
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	mov	r5,a
	mov	a,r7
	swap	a
	rl	a
	anl	a,#0xe0
	orl	a,r5
	mov	r5,a
	mov	a,r7
	swap	a
	rl	a
	anl	a,#0x1f
	jnb	acc.4,00118$
	orl	a,#0xe0
00118$:
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	a,#0x80
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	ar4,r5
	mov	a,r6
	clr	c
	rrc	a
	xch	a,r4
	rrc	a
	xch	a,r4
	clr	c
	rrc	a
	xch	a,r4
	rrc	a
	xch	a,r4
	mov	r5,a
	mov	a,r7
	rr	a
	rr	a
	anl	a,#0xc0
	orl	a,r5
	mov	r5,a
	mov	a,r7
	mov	c,acc.7
	rrc	a
	mov	c,acc.7
	rrc	a
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	mov	a,#0x20
	add	a,r6
	inc	r0
	mov	@r0,a
	clr	a
	addc	a,r7
	inc	r0
	mov	@r0,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:731: ((signed  long) dig_H2) + 8192) >> 14));
	mov	dptr,#_dig_H2
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x20
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	ar4,r5
	mov	a,r6
	mov	c,acc.7
	xch	a,r4
	rlc	a
	xch	a,r4
	rlc	a
	mov	c,acc.7
	xch	a,r4
	rlc	a
	xch	a,r4
	rlc	a
	xch	a,r4
	anl	a,#0x03
	mov	r5,a
	mov	a,r7
	add	a,r7
	add	a,acc
	orl	a,r5
	mov	r5,a
	mov	a,r7
	rl	a
	rl	a
	anl	a,#0x03
	jnb	acc.1,00119$
	orl	a,#0xfc
00119$:
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	xch	a,r0
	mov	a,sp
	add	a,#0xf9
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:732: v_x1 = (v_x1 - (((((v_x1 >> 15) * (v_x1 >> 15)) >> 7) * ((signed  long)dig_H1)) >> 4));
	mov	sp,a
	add	a,#0xfd
	mov	r0,a
	inc	r0
	mov	ar2,@r0
	inc	r0
	mov	a,@r0
	mov	c,acc.7
	xch	a,r2
	rlc	a
	xch	a,r2
	rlc	a
	xch	a,r2
	anl	a,#0x01
	mov	r3,a
	inc	r0
	mov	a,@r0
	add	a,@r0
	orl	a,r3
	mov	r3,a
	mov	a,@r0
	rl	a
	anl	a,#0x01
	jnb	acc.0,00120$
	orl	a,#0xfe
00120$:
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	mov	a,r7
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xf9
	mov	r0,a
	mov	@r0,ar4
	mov	a,r5
	mov	c,acc.7
	xch	a,@r0
	rlc	a
	xch	a,@r0
	rlc	a
	xch	a,@r0
	anl	a,#0x01
	inc	r0
	mov	@r0,a
	mov	a,r6
	add	a,r6
	orl	a,@r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar6
	mov	a,r7
	mov	c,acc.7
	xch	a,@r0
	rlc	a
	xch	a,@r0
	rlc	a
	xch	a,@r0
	anl	a,#0x01
	jnb	acc.0,00121$
	orl	a,#0xfe
00121$:
	inc	r0
	mov	@r0,a
	mov	dptr,#_dig_H1
	movx	a,@dptr
	mov	r2,a
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	r6,a
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r5
	swap	a
	xch	a,r4
	swap	a
	anl	a,#0x0f
	xrl	a,r4
	xch	a,r4
	anl	a,#0x0f
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	mov	r5,a
	mov	a,r6
	swap	a
	anl	a,#0xf0
	orl	a,r5
	mov	r5,a
	mov	a,r7
	swap	a
	xch	a,r6
	swap	a
	anl	a,#0x0f
	xrl	a,r6
	xch	a,r6
	anl	a,#0x0f
	xch	a,r6
	xrl	a,r6
	xch	a,r6
	jnb	acc.3,00122$
	orl	a,#0xf0
00122$:
	mov	r7,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	clr	c
	subb	a,r4
	mov	r4,a
	inc	r0
	mov	a,@r0
	subb	a,r5
	mov	r5,a
	inc	r0
	mov	a,@r0
	subb	a,r6
	mov	r6,a
	inc	r0
	mov	a,@r0
	subb	a,r7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:733: v_x1 = (v_x1 < 0 ? 0 : v_x1);
	mov	r7,a
	jnb	acc.7,00103$
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
	sjmp	00104$
00103$:
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
00104$:
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:734: v_x1 = (v_x1 > 419430400 ? 419430400 : v_x1);
	clr	c
	clr	a
	subb	a,r4
	clr	a
	subb	a,r5
	clr	a
	subb	a,r6
	mov	a,#(0x19 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00105$
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,#0x19
	sjmp	00106$
00105$:
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
00106$:
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:735: return (unsigned  long)(v_x1 >> 12);   
	mov	ar4,r5
	mov	a,r6
	swap	a
	xch	a,r4
	swap	a
	anl	a,#0x0f
	xrl	a,r4
	xch	a,r4
	anl	a,#0x0f
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	mov	r5,a
	mov	a,r7
	swap	a
	anl	a,#0xf0
	orl	a,r5
	mov	r5,a
	mov	a,r7
	swap	a
	anl	a,#0x0f
	jnb	acc.3,00125$
	orl	a,#0xf0
00125$:
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:736: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf0
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Atmosphere_GetPress'
;------------------------------------------------------------
;temp_act                  Allocated to registers 
;press_act                 Allocated to registers r4 r5 r6 r7 
;hum_act                   Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:747: float Atmosphere_GetPress(void)
;	-----------------------------------------
;	 function Atmosphere_GetPress
;	-----------------------------------------
_Atmosphere_GetPress:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:751: readData(&pres_raw,&temp_raw,&hum_raw);//从寄存器读出温度、湿度、压力
	mov	a,#_hum_raw
	push	acc
	mov	a,#(_hum_raw >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#_temp_raw
	push	acc
	mov	a,#(_temp_raw >> 8)
	push	acc
	clr	a
	push	acc
	mov	dptr,#_pres_raw
	mov	b,#0x00
	mov	r0,#_readData
	mov	r1,#(_readData >> 8)
	mov	r2,#(_readData >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:753: press_act = (float)calibration_P(pres_raw) / 100.0;
	mov	dptr,#_pres_raw
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	r0,#_calibration_P
	mov	r1,#(_calibration_P >> 8)
	mov	r2,#(_calibration_P >> 16)
	lcall	__sdcc_banked_call
	lcall	___ulong2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	clr	a
	push	acc
	push	acc
	mov	a,#0xc8
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:755: return press_act;
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:756: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Atmosphere_Init'
;------------------------------------------------------------
;osrs_t                    Allocated to registers 
;osrs_p                    Allocated to registers 
;osrs_h                    Allocated to registers 
;mode                      Allocated to registers 
;t_sb                      Allocated to registers 
;filter                    Allocated to registers 
;spi3w_en                  Allocated to registers 
;ctrl_meas_reg             Allocated to stack - sp -2
;config_reg                Allocated to stack - sp -1
;ctrl_hum_reg              Allocated to stack - sp +0
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:768: void Atmosphere_Init(void)
;	-----------------------------------------
;	 function Atmosphere_Init
;	-----------------------------------------
_Atmosphere_Init:
	inc	sp
	inc	sp
	inc	sp
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:778: uint8_t ctrl_meas_reg = (osrs_t << 5) | (osrs_p << 2) | mode;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,#0x27
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:779: uint8_t config_reg    = (t_sb << 5) | (filter << 2) | spi3w_en;
	mov	r0,sp
	dec	r0
	mov	@r0,#0xa0
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:780: uint8_t ctrl_hum_reg  = osrs_h; 
	mov	r0,sp
	mov	@r0,#0x01
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:782: IIC_Init(); //初始化IIC
	mov	r0,#_IIC_Init
	mov	r1,#(_IIC_Init >> 8)
	mov	r2,#(_IIC_Init >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:784: AT24CXX_WriteSingleBytes(ATMOS_DEVICE_ADDR,0xF2,&ctrl_hum_reg);
	mov	r7,sp
	mov	r6,#0x00
	mov	r5,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0xf2
	push	acc
	mov	dpl,#0xec
	mov	r0,#_AT24CXX_WriteSingleBytes
	mov	r1,#(_AT24CXX_WriteSingleBytes >> 8)
	mov	r2,#(_AT24CXX_WriteSingleBytes >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:785: AT24CXX_WriteSingleBytes(ATMOS_DEVICE_ADDR,0xF4,&ctrl_meas_reg);
	mov	sp,a
	add	a,#0xfe
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0xf4
	push	acc
	mov	dpl,#0xec
	mov	r0,#_AT24CXX_WriteSingleBytes
	mov	r1,#(_AT24CXX_WriteSingleBytes >> 8)
	mov	r2,#(_AT24CXX_WriteSingleBytes >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:786: AT24CXX_WriteSingleBytes(ATMOS_DEVICE_ADDR,0xF5,&config_reg);    
	mov	r7,sp
	dec	r7
	mov	r6,#0x00
	mov	r5,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0xf5
	push	acc
	mov	dpl,#0xec
	mov	r0,#_AT24CXX_WriteSingleBytes
	mov	r1,#(_AT24CXX_WriteSingleBytes >> 8)
	mov	r2,#(_AT24CXX_WriteSingleBytes >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:788: readTrim(); //获取修正值  
	mov	r0,#_readTrim
	mov	r1,#(_readTrim >> 8)
	mov	r2,#(_readTrim >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:789: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Atmosphere_TestFunc'
;------------------------------------------------------------
;temp_act                  Allocated to registers 
;press_act                 Allocated to registers 
;hum_act                   Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:800: uint8_t Atmosphere_TestFunc(void)
;	-----------------------------------------
;	 function Atmosphere_TestFunc
;	-----------------------------------------
_Atmosphere_TestFunc:
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:804: readData(&pres_raw,&temp_raw,&hum_raw);//从寄存器读出温度、湿度、压力
	mov	a,#_hum_raw
	push	acc
	mov	a,#(_hum_raw >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#_temp_raw
	push	acc
	mov	a,#(_temp_raw >> 8)
	push	acc
	clr	a
	push	acc
	mov	dptr,#_pres_raw
	mov	b,#0x00
	mov	r0,#_readData
	mov	r1,#(_readData >> 8)
	mov	r2,#(_readData >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:806: temp_act  = (float)calibration_T(temp_raw) / 100.0;
	mov	dptr,#_temp_raw
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	r0,#_calibration_T
	mov	r1,#(_calibration_T >> 8)
	mov	r2,#(_calibration_T >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:807: press_act = (float)calibration_P(pres_raw) / 100.0;
	mov	dptr,#_pres_raw
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	r0,#_calibration_P
	mov	r1,#(_calibration_P >> 8)
	mov	r2,#(_calibration_P >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:808: hum_act   = (float)calibration_H(hum_raw) / 1024.0;	
	mov	dptr,#_hum_raw
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	r0,#_calibration_H
	mov	r1,#(_calibration_H >> 8)
	mov	r2,#(_calibration_H >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:811: return 0;
	mov	dpl,#0x00
;	../../../platform/cc2530dk/Atmosphere/Atmosphere.c:812: }
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "not ack"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_1:
	.ascii "na"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area XINIT   (CODE)
__xinit__delay_count:
	.byte #0x00,#0x00,#0x00,#0x00	; 0
	.area CABS    (ABS,CODE)
