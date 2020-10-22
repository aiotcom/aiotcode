;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module RC522
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _IC_CMT
	.globl _PcdHalt
	.globl _CalulateCRC
	.globl _PcdComMF522
	.globl _PcdAntennaOff
	.globl _PcdAntennaOn
	.globl _ClearBitMask
	.globl _SetBitMask
	.globl _WriteRawRC
	.globl _ReadRawRC
	.globl _SPI_RC522_ReadByte
	.globl _SPI_RC522_SendByte
	.globl _DataRep
	.globl _delay_us
	.globl _delay_ms
	.globl _OLED_P8x16Str
	.globl _OLED_P6x8Str
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
	.globl _InitStatus
	.globl _date1
	.globl _ucArray_ID
	.globl _pk
	.globl _IC_Card_Exist
	.globl _i
	.globl _icd
	.globl _ucComMF522Buf0
	.globl _cStatus
	.globl _ucStatusReturn
	.globl _SendData
	.globl _SendBuf
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
	.globl _RC522_Init
	.globl _RFID_GetCardID
	.globl _IC_Card_Search
	.globl _IC_Card_Write
	.globl _IC_Card_Read
	.globl _RC522_InitStatus
	.globl _PcdReset
	.globl _M500PcdConfigISOType
	.globl _PcdRequest
	.globl _PcdAnticoll
	.globl _PcdSelect
	.globl _PcdAuthState
	.globl _PcdWrite
	.globl _PcdRead
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
_SendBuf::
	.ds 40
_SendData::
	.ds 10
_ucStatusReturn::
	.ds 1
_cStatus::
	.ds 1
_ucComMF522Buf0::
	.ds 18
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_icd::
	.ds 2
_i::
	.ds 1
_IC_Card_Exist::
	.ds 1
_pk::
	.ds 6
_ucArray_ID::
	.ds 10
_date1::
	.ds 20
_InitStatus::
	.ds 1
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
;Allocation info for local variables in function 'RC522_Init'
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:30: void RC522_Init ( void )
;	-----------------------------------------
;	 function RC522_Init
;	-----------------------------------------
_RC522_Init:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	../../../platform/cc2530dk/RC522/RC522.c:32: RC522_SPI_Config ();
	mov	r0,#_RC522_SPI_Config
	mov	r1,#(_RC522_SPI_Config >> 8)
	mov	r2,#(_RC522_SPI_Config >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:34: macRC522_Reset_Disable();
;	assignBit
	setb	_P1_1
;	assignBit
	setb	_P1_1
;	../../../platform/cc2530dk/RC522/RC522.c:36: macRC522_CS_Disable();
;	assignBit
	setb	_P1_4
;	assignBit
	setb	_P1_4
;	../../../platform/cc2530dk/RC522/RC522.c:38: PcdReset();
	mov	r0,#_PcdReset
	mov	r1,#(_PcdReset >> 8)
	mov	r2,#(_PcdReset >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:39: M500PcdConfigISOType ( 'A' );//设置工作模式    
	mov	dpl,#0x41
	mov	r0,#_M500PcdConfigISOType
	mov	r1,#(_M500PcdConfigISOType >> 8)
	mov	r2,#(_M500PcdConfigISOType >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:40: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'DataRep'
;------------------------------------------------------------
;num                       Allocated to stack - sp -3
;flag                      Allocated to stack - sp -4
;flg                       Allocated to stack - sp -5
;data                      Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:53: void DataRep(unsigned char data,unsigned char num,unsigned char flag,unsigned char flg)
;	-----------------------------------------
;	 function DataRep
;	-----------------------------------------
_DataRep:
	mov	r7,dpl
;	../../../platform/cc2530dk/RC522/RC522.c:55: if(flg)
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	jnz	00188$
	ljmp	00124$
00188$:
;	../../../platform/cc2530dk/RC522/RC522.c:57: switch(data)
	cjne	r7,#0x0a,00189$
	sjmp	00101$
00189$:
	cjne	r7,#0x0b,00190$
	sjmp	00102$
00190$:
	cjne	r7,#0x0c,00191$
	sjmp	00103$
00191$:
	cjne	r7,#0x0d,00192$
	sjmp	00104$
00192$:
	cjne	r7,#0x0e,00193$
	sjmp	00105$
00193$:
	cjne	r7,#0x0f,00194$
	sjmp	00106$
00194$:
	ljmp	00107$
;	../../../platform/cc2530dk/RC522/RC522.c:59: case 0x0A:
00101$:
;	../../../platform/cc2530dk/RC522/RC522.c:60: SendData[num] = 65;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendData
	mov	dpl,a
	clr	a
	addc	a,#(_SendData >> 8)
	mov	dph,a
	mov	a,#0x41
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:61: break;
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:62: case 0x0B:
00102$:
;	../../../platform/cc2530dk/RC522/RC522.c:63: SendData[num] = 66;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendData
	mov	dpl,a
	clr	a
	addc	a,#(_SendData >> 8)
	mov	dph,a
	mov	a,#0x42
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:64: break;
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:65: case 0x0C:
00103$:
;	../../../platform/cc2530dk/RC522/RC522.c:66: SendData[num] = 67;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendData
	mov	dpl,a
	clr	a
	addc	a,#(_SendData >> 8)
	mov	dph,a
	mov	a,#0x43
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:67: break;
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:68: case 0x0D:
00104$:
;	../../../platform/cc2530dk/RC522/RC522.c:69: SendData[num] = 68;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendData
	mov	dpl,a
	clr	a
	addc	a,#(_SendData >> 8)
	mov	dph,a
	mov	a,#0x44
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:70: break;
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:71: case 0x0E:
00105$:
;	../../../platform/cc2530dk/RC522/RC522.c:72: SendData[num] = 69;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendData
	mov	dpl,a
	clr	a
	addc	a,#(_SendData >> 8)
	mov	dph,a
	mov	a,#0x45
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:73: break; 
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:74: case 0x0F:
00106$:
;	../../../platform/cc2530dk/RC522/RC522.c:75: SendData[num] = 70;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendData
	mov	dpl,a
	clr	a
	addc	a,#(_SendData >> 8)
	mov	dph,a
	mov	a,#0x46
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:76: break; 
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:77: default:
00107$:
;	../../../platform/cc2530dk/RC522/RC522.c:78: if(flag)
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	jz	00109$
;	../../../platform/cc2530dk/RC522/RC522.c:80: SendData[num] = (ucArray_ID[(num/2)]>>4)+0x30;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendData
	mov	r5,a
	clr	a
	addc	a,#(_SendData >> 8)
	mov	r6,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	ar3,@r0
	mov	r4,#0x00
	push	ar6
	push	ar5
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	dpl,r3
	mov	dph,r4
	lcall	__divsint
	mov	r3,dpl
	mov	r4,dph
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	mov	a,r3
	add	a,#_ucArray_ID
	mov	dpl,a
	mov	a,r4
	addc	a,#(_ucArray_ID >> 8)
	mov	dph,a
	movx	a,@dptr
	swap	a
	anl	a,#0x0f
	add	a,#0x30
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	movx	@dptr,a
	ljmp	__sdcc_banked_ret
00109$:
;	../../../platform/cc2530dk/RC522/RC522.c:84: SendData[num] = (ucArray_ID[(num/2)]&0x0f)+0x30;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendData
	mov	r5,a
	clr	a
	addc	a,#(_SendData >> 8)
	mov	r6,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	ar3,@r0
	mov	r4,#0x00
	push	ar6
	push	ar5
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	dpl,r3
	mov	dph,r4
	lcall	__divsint
	mov	r3,dpl
	mov	r4,dph
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	mov	a,r3
	add	a,#_ucArray_ID
	mov	dpl,a
	mov	a,r4
	addc	a,#(_ucArray_ID >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	a,#0x0f
	anl	a,r4
	add	a,#0x30
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:87: } 
	ljmp	__sdcc_banked_ret
00124$:
;	../../../platform/cc2530dk/RC522/RC522.c:91: switch(data)
	cjne	r7,#0x0a,00196$
	sjmp	00112$
00196$:
	cjne	r7,#0x0b,00197$
	sjmp	00113$
00197$:
	cjne	r7,#0x0c,00198$
	sjmp	00114$
00198$:
	cjne	r7,#0x0d,00199$
	sjmp	00115$
00199$:
	cjne	r7,#0x0e,00200$
	sjmp	00116$
00200$:
	cjne	r7,#0x0f,00201$
	sjmp	00117$
00201$:
	ljmp	00118$
;	../../../platform/cc2530dk/RC522/RC522.c:93: case 0x0A:
00112$:
;	../../../platform/cc2530dk/RC522/RC522.c:94: SendBuf[num] = 65;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendBuf
	mov	dpl,a
	clr	a
	addc	a,#(_SendBuf >> 8)
	mov	dph,a
	mov	a,#0x41
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:95: break;
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:96: case 0x0B:
00113$:
;	../../../platform/cc2530dk/RC522/RC522.c:97: SendBuf[num] = 66;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendBuf
	mov	dpl,a
	clr	a
	addc	a,#(_SendBuf >> 8)
	mov	dph,a
	mov	a,#0x42
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:98: break;
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:99: case 0x0C:
00114$:
;	../../../platform/cc2530dk/RC522/RC522.c:100: SendBuf[num] = 67;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendBuf
	mov	dpl,a
	clr	a
	addc	a,#(_SendBuf >> 8)
	mov	dph,a
	mov	a,#0x43
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:101: break;
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:102: case 0x0D:
00115$:
;	../../../platform/cc2530dk/RC522/RC522.c:103: SendBuf[num] = 68;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendBuf
	mov	dpl,a
	clr	a
	addc	a,#(_SendBuf >> 8)
	mov	dph,a
	mov	a,#0x44
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:104: break;
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:105: case 0x0E:
00116$:
;	../../../platform/cc2530dk/RC522/RC522.c:106: SendBuf[num] = 69;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendBuf
	mov	dpl,a
	clr	a
	addc	a,#(_SendBuf >> 8)
	mov	dph,a
	mov	a,#0x45
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:107: break; 
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:108: case 0x0F:
00117$:
;	../../../platform/cc2530dk/RC522/RC522.c:109: SendBuf[num] = 70;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendBuf
	mov	dpl,a
	clr	a
	addc	a,#(_SendBuf >> 8)
	mov	dph,a
	mov	a,#0x46
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:110: break; 
	ljmp	__sdcc_banked_ret
;	../../../platform/cc2530dk/RC522/RC522.c:111: default:
00118$:
;	../../../platform/cc2530dk/RC522/RC522.c:112: if(flag)
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	jz	00120$
;	../../../platform/cc2530dk/RC522/RC522.c:114: SendBuf[num] = (date1[(num/2)]>>4)+0x30;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendBuf
	mov	r6,a
	clr	a
	addc	a,#(_SendBuf >> 8)
	mov	r7,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	ar4,@r0
	mov	r5,#0x00
	push	ar7
	push	ar6
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	dpl,r4
	mov	dph,r5
	lcall	__divsint
	mov	r4,dpl
	mov	r5,dph
	dec	sp
	dec	sp
	pop	ar6
	pop	ar7
	mov	a,r4
	add	a,#_date1
	mov	dpl,a
	mov	a,r5
	addc	a,#(_date1 >> 8)
	mov	dph,a
	movx	a,@dptr
	swap	a
	anl	a,#0x0f
	add	a,#0x30
	mov	r5,a
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
	sjmp	00126$
00120$:
;	../../../platform/cc2530dk/RC522/RC522.c:118: SendBuf[num] = (date1[(num/2)]&0x0f)+0x30;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	add	a,#_SendBuf
	mov	r6,a
	clr	a
	addc	a,#(_SendBuf >> 8)
	mov	r7,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	ar4,@r0
	mov	r5,#0x00
	push	ar7
	push	ar6
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	dpl,r4
	mov	dph,r5
	lcall	__divsint
	mov	r4,dpl
	mov	r5,dph
	dec	sp
	dec	sp
	pop	ar6
	pop	ar7
	mov	a,r4
	add	a,#_date1
	mov	dpl,a
	mov	a,r5
	addc	a,#(_date1 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	a,#0x0f
	anl	a,r5
	add	a,#0x30
	mov	r5,a
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:121: }
00126$:
;	../../../platform/cc2530dk/RC522/RC522.c:123: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'RFID_GetCardID'
;------------------------------------------------------------
;pdata                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:135: unsigned char RFID_GetCardID(unsigned char *pdata)
;	-----------------------------------------
;	 function RFID_GetCardID
;	-----------------------------------------
_RFID_GetCardID:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../platform/cc2530dk/RC522/RC522.c:137: if(PcdRequest ( PICC_REQALL, ucArray_ID )!=MI_OK)
	push	ar7
	push	ar6
	push	ar5
	mov	a,#_ucArray_ID
	push	acc
	mov	a,#(_ucArray_ID >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,#0x52
	mov	r0,#_PcdRequest
	mov	r1,#(_PcdRequest >> 8)
	mov	r2,#(_PcdRequest >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
	cjne	r4,#0x26,00123$
	sjmp	00102$
00123$:
;	../../../platform/cc2530dk/RC522/RC522.c:139: ucStatusReturn = PcdRequest ( PICC_REQALL, ucArray_ID );
	push	ar7
	push	ar6
	push	ar5
	mov	a,#_ucArray_ID
	push	acc
	mov	a,#(_ucArray_ID >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,#0x52
	mov	r0,#_PcdRequest
	mov	r1,#(_PcdRequest >> 8)
	mov	r2,#(_PcdRequest >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dptr,#_ucStatusReturn
	mov	a,r4
	movx	@dptr,a
00102$:
;	../../../platform/cc2530dk/RC522/RC522.c:142: if ((ucStatusReturn == MI_OK ))
	mov	dptr,#_ucStatusReturn
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0x26,00124$
	sjmp	00125$
00124$:
	ljmp	00107$
00125$:
;	../../../platform/cc2530dk/RC522/RC522.c:144: if (PcdAnticoll(ucArray_ID) == MI_OK)
	mov	dptr,#_ucArray_ID
	mov	b,#0x00
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_PcdAnticoll
	mov	r1,#(_PcdAnticoll >> 8)
	mov	r2,#(_PcdAnticoll >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	cjne	r4,#0x26,00104$
;	../../../platform/cc2530dk/RC522/RC522.c:148: pdata[0] = ucArray_ID[0];
	mov	dptr,#_ucArray_ID
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:149: pdata[1] = ucArray_ID[1];
	mov	a,#0x01
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dptr,#(_ucArray_ID + 0x0001)
	movx	a,@dptr
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:150: pdata[2] = ucArray_ID[2];
	mov	a,#0x02
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dptr,#(_ucArray_ID + 0x0002)
	movx	a,@dptr
	mov	r1,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:151: pdata[3] = ucArray_ID[3];        
	mov	a,#0x03
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#(_ucArray_ID + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:152: return 1;
	mov	dpl,#0x01
	sjmp	00109$
00104$:
;	../../../platform/cc2530dk/RC522/RC522.c:157: return (unsigned char*)0;
	mov	dptr,#0x0000
	mov	b,#0x00
	sjmp	00109$
00107$:
;	../../../platform/cc2530dk/RC522/RC522.c:163: return (unsigned char*)0;
	mov	dptr,#0x0000
	mov	b,#0x00
00109$:
;	../../../platform/cc2530dk/RC522/RC522.c:165: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IC_Card_Search'
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:177: void IC_Card_Search ( void )
;	-----------------------------------------
;	 function IC_Card_Search
;	-----------------------------------------
_IC_Card_Search:
;	../../../platform/cc2530dk/RC522/RC522.c:179: if(PcdRequest ( PICC_REQALL, ucArray_ID ) != MI_OK)
	mov	a,#_ucArray_ID
	push	acc
	mov	a,#(_ucArray_ID >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,#0x52
	mov	r0,#_PcdRequest
	mov	r1,#(_PcdRequest >> 8)
	mov	r2,#(_PcdRequest >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	dec	sp
	dec	sp
	dec	sp
	cjne	r7,#0x26,00186$
	sjmp	00102$
00186$:
;	../../../platform/cc2530dk/RC522/RC522.c:181: ucStatusReturn = PcdRequest ( PICC_REQALL, ucArray_ID );//若失败再次寻卡
	mov	a,#_ucArray_ID
	push	acc
	mov	a,#(_ucArray_ID >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,#0x52
	mov	r0,#_PcdRequest
	mov	r1,#(_PcdRequest >> 8)
	mov	r2,#(_PcdRequest >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	dec	sp
	dec	sp
	dec	sp
	mov	dptr,#_ucStatusReturn
	mov	a,r7
	movx	@dptr,a
00102$:
;	../../../platform/cc2530dk/RC522/RC522.c:184: if ((ucStatusReturn == MI_OK )&&(IC_Card_Exist == 0))
	mov	dptr,#_ucStatusReturn
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x26,00187$
	sjmp	00188$
00187$:
	ljmp	00120$
00188$:
	mov	dptr,#_IC_Card_Exist
	movx	a,@dptr
	jz	00189$
	ljmp	00120$
00189$:
;	../../../platform/cc2530dk/RC522/RC522.c:186: if (PcdAnticoll(ucArray_ID) == MI_OK)  //防冲撞（当有多张卡进入读写器操作范围时，防冲突机制会从其中选择一张进行操作）
	mov	dptr,#_ucArray_ID
	mov	b,#0x00
	mov	r0,#_PcdAnticoll
	mov	r1,#(_PcdAnticoll >> 8)
	mov	r2,#(_PcdAnticoll >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	cjne	r7,#0x26,00190$
	sjmp	00191$
00190$:
	ljmp	00120$
00191$:
;	../../../platform/cc2530dk/RC522/RC522.c:188: if (PcdSelect(ucArray_ID) == MI_OK)//选择ucArray_ID的卡
	mov	dptr,#_ucArray_ID
	mov	b,#0x00
	mov	r0,#_PcdSelect
	mov	r1,#(_PcdSelect >> 8)
	mov	r2,#(_PcdSelect >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	cjne	r7,#0x26,00192$
	sjmp	00193$
00192$:
	ljmp	00120$
00193$:
;	../../../platform/cc2530dk/RC522/RC522.c:190: IC_Card_Exist = 1;
	mov	dptr,#_IC_Card_Exist
	mov	a,#0x01
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:191: if (PcdAuthState(0x61,0x5,pk,ucArray_ID) == MI_OK)//申请对卡的授权  
	mov	a,#_ucArray_ID
	push	acc
	mov	a,#(_ucArray_ID >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#_pk
	push	acc
	mov	a,#(_pk >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#0x05
	push	acc
	mov	dpl,#0x61
	mov	r0,#_PcdAuthState
	mov	r1,#(_PcdAuthState >> 8)
	mov	r2,#(_PcdAuthState >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	cjne	r7,#0x26,00194$
	sjmp	00195$
00194$:
	ljmp	00120$
00195$:
;	../../../platform/cc2530dk/RC522/RC522.c:193: if (PcdRead(0x5,date1) == MI_OK )
	mov	a,#_date1
	push	acc
	mov	a,#(_date1 >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,#0x05
	mov	r0,#_PcdRead
	mov	r1,#(_PcdRead >> 8)
	mov	r2,#(_PcdRead >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	dec	sp
	dec	sp
	dec	sp
	cjne	r7,#0x26,00196$
	sjmp	00197$
00196$:
	ljmp	00120$
00197$:
;	../../../platform/cc2530dk/RC522/RC522.c:195: for(i = 0;i < 8;i ++)
	mov	dptr,#_i
	clr	a
	movx	@dptr,a
00124$:
;	../../../platform/cc2530dk/RC522/RC522.c:197: if(i%2==0)
	mov	dptr,#_i
	movx	a,@dptr
	jb	acc.0,00104$
;	../../../platform/cc2530dk/RC522/RC522.c:199: DataRep((ucArray_ID[(i/2)]>>4),i,1,1);
	mov	dptr,#_i
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	push	ar7
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	lcall	__divsint
	mov	r5,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	pop	ar7
	mov	a,r5
	add	a,#_ucArray_ID
	mov	dpl,a
	mov	a,r6
	addc	a,#(_ucArray_ID >> 8)
	mov	dph,a
	movx	a,@dptr
	swap	a
	anl	a,#0x0f
	mov	r6,a
	mov	a,#0x01
	push	acc
	push	acc
	push	ar7
	mov	dpl,r6
	mov	r0,#_DataRep
	mov	r1,#(_DataRep >> 8)
	mov	r2,#(_DataRep >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	sjmp	00125$
00104$:
;	../../../platform/cc2530dk/RC522/RC522.c:203: DataRep((ucArray_ID[(i/2)]&0x0f),i,0,1);
	mov	dptr,#_i
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	push	ar7
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	lcall	__divsint
	mov	r5,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	pop	ar7
	mov	a,r5
	add	a,#_ucArray_ID
	mov	dpl,a
	mov	a,r6
	addc	a,#(_ucArray_ID >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	anl	ar6,#0x0f
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	push	ar7
	mov	dpl,r6
	mov	r0,#_DataRep
	mov	r1,#(_DataRep >> 8)
	mov	r2,#(_DataRep >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00125$:
;	../../../platform/cc2530dk/RC522/RC522.c:195: for(i = 0;i < 8;i ++)
	mov	dptr,#_i
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x08,00199$
00199$:
	jnc	00200$
	ljmp	00124$
00200$:
;	../../../platform/cc2530dk/RC522/RC522.c:207: for(i = 0;i < 32;i ++)
	mov	dptr,#_i
	clr	a
	movx	@dptr,a
00126$:
;	../../../platform/cc2530dk/RC522/RC522.c:209: if(i%2==0)
	mov	dptr,#_i
	movx	a,@dptr
	jb	acc.0,00108$
;	../../../platform/cc2530dk/RC522/RC522.c:211: DataRep((date1[(i/2)]>>4),i,1,0);
	mov	dptr,#_i
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	push	ar7
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	lcall	__divsint
	mov	r5,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	pop	ar7
	mov	a,r5
	add	a,#_date1
	mov	dpl,a
	mov	a,r6
	addc	a,#(_date1 >> 8)
	mov	dph,a
	movx	a,@dptr
	swap	a
	anl	a,#0x0f
	mov	r6,a
	clr	a
	push	acc
	inc	a
	push	acc
	push	ar7
	mov	dpl,r6
	mov	r0,#_DataRep
	mov	r1,#(_DataRep >> 8)
	mov	r2,#(_DataRep >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	sjmp	00127$
00108$:
;	../../../platform/cc2530dk/RC522/RC522.c:215: DataRep((date1[(i/2)]&0x0f),i,0,0);
	mov	dptr,#_i
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	push	ar7
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	lcall	__divsint
	mov	r5,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	pop	ar7
	mov	a,r5
	add	a,#_date1
	mov	dpl,a
	mov	a,r6
	addc	a,#(_date1 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	anl	ar6,#0x0f
	clr	a
	push	acc
	push	acc
	push	ar7
	mov	dpl,r6
	mov	r0,#_DataRep
	mov	r1,#(_DataRep >> 8)
	mov	r2,#(_DataRep >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00127$:
;	../../../platform/cc2530dk/RC522/RC522.c:207: for(i = 0;i < 32;i ++)
	mov	dptr,#_i
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x20,00202$
00202$:
	jnc	00203$
	ljmp	00126$
00203$:
;	../../../platform/cc2530dk/RC522/RC522.c:218: OLED_P8x16Str(28,2,"0x");
	mov	a,#___str_0
	push	acc
	mov	a,#(___str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x02
	push	acc
	mov	dpl,#0x1c
	mov	r0,#_OLED_P8x16Str
	mov	r1,#(_OLED_P8x16Str >> 8)
	mov	r2,#(_OLED_P8x16Str >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:219: OLED_P8x16Str(46,2,SendData);
	mov	a,#_SendData
	push	acc
	mov	a,#(_SendData >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#0x02
	push	acc
	mov	dpl,#0x2e
	mov	r0,#_OLED_P8x16Str
	mov	r1,#(_OLED_P8x16Str >> 8)
	mov	r2,#(_OLED_P8x16Str >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:220: OLED_P6x8Str(40,6,"0x");
	mov	a,#___str_0
	push	acc
	mov	a,#(___str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x06
	push	acc
	mov	dpl,#0x28
	mov	r0,#_OLED_P6x8Str
	mov	r1,#(_OLED_P6x8Str >> 8)
	mov	r2,#(_OLED_P6x8Str >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:221: OLED_P6x8Str(55,6,SendBuf);
	mov	a,#_SendBuf
	push	acc
	mov	a,#(_SendBuf >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#0x06
	push	acc
	mov	dpl,#0x37
	mov	r0,#_OLED_P6x8Str
	mov	r1,#(_OLED_P6x8Str >> 8)
	mov	r2,#(_OLED_P6x8Str >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
00120$:
;	../../../platform/cc2530dk/RC522/RC522.c:228: if(ucStatusReturn != MI_OK)//无卡
	mov	dptr,#_ucStatusReturn
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x26,00204$
	sjmp	00128$
00204$:
;	../../../platform/cc2530dk/RC522/RC522.c:230: IC_Card_Exist = 0;
	mov	dptr,#_IC_Card_Exist
	clr	a
	movx	@dptr,a
00128$:
;	../../../platform/cc2530dk/RC522/RC522.c:232: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IC_Card_Write'
;------------------------------------------------------------
;p                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:245: unsigned char IC_Card_Write(unsigned char *p)
;	-----------------------------------------
;	 function IC_Card_Write
;	-----------------------------------------
_IC_Card_Write:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../platform/cc2530dk/RC522/RC522.c:247: if (PcdAnticoll(ucArray_ID) == MI_OK)  //防冲撞（当有多张卡进入读写器操作范围时，防冲突机制会从其中选择一张进行操作）
	mov	dptr,#_ucArray_ID
	mov	b,#0x00
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_PcdAnticoll
	mov	r1,#(_PcdAnticoll >> 8)
	mov	r2,#(_PcdAnticoll >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	cjne	r4,#0x26,00127$
	sjmp	00128$
00127$:
	ljmp	00108$
00128$:
;	../../../platform/cc2530dk/RC522/RC522.c:249: if (PcdSelect(ucArray_ID) == MI_OK)//选择ucArray_ID的卡
	mov	dptr,#_ucArray_ID
	mov	b,#0x00
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_PcdSelect
	mov	r1,#(_PcdSelect >> 8)
	mov	r2,#(_PcdSelect >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	cjne	r4,#0x26,00129$
	sjmp	00130$
00129$:
	ljmp	00108$
00130$:
;	../../../platform/cc2530dk/RC522/RC522.c:251: if (PcdAuthState(0x61,0x5,pk,ucArray_ID) == MI_OK)//申请对卡的授权  
	push	ar7
	push	ar6
	push	ar5
	mov	a,#_ucArray_ID
	push	acc
	mov	a,#(_ucArray_ID >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#_pk
	push	acc
	mov	a,#(_pk >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#0x05
	push	acc
	mov	dpl,#0x61
	mov	r0,#_PcdAuthState
	mov	r1,#(_PcdAuthState >> 8)
	mov	r2,#(_PcdAuthState >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	pop	ar5
	pop	ar6
	pop	ar7
	cjne	r4,#0x26,00108$
;	../../../platform/cc2530dk/RC522/RC522.c:253: cStatus = PcdWrite(0x5,p);
	push	ar7
	push	ar6
	push	ar5
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,#0x05
	mov	r0,#_PcdWrite
	mov	r1,#(_PcdWrite >> 8)
	mov	r2,#(_PcdWrite >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dptr,#_cStatus
	mov	a,r4
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:254: if(cStatus == MI_ERR)
	cjne	r4,#0xbb,00108$
;	../../../platform/cc2530dk/RC522/RC522.c:256: cStatus = PcdWrite(0x5,p);
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,#0x05
	mov	r0,#_PcdWrite
	mov	r1,#(_PcdWrite >> 8)
	mov	r2,#(_PcdWrite >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	dec	sp
	dec	sp
	dec	sp
	mov	dptr,#_cStatus
	mov	a,r7
	movx	@dptr,a
00108$:
;	../../../platform/cc2530dk/RC522/RC522.c:261: return cStatus;
	mov	dptr,#_cStatus
	movx	a,@dptr
	mov	r7,a
	mov	dpl,a
;	../../../platform/cc2530dk/RC522/RC522.c:262: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IC_Card_Read'
;------------------------------------------------------------
;p                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:274: void IC_Card_Read(unsigned char *p)
;	-----------------------------------------
;	 function IC_Card_Read
;	-----------------------------------------
_IC_Card_Read:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../platform/cc2530dk/RC522/RC522.c:276: PcdRead(0X5,p);
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,#0x05
	mov	r0,#_PcdRead
	mov	r1,#(_PcdRead >> 8)
	mov	r2,#(_PcdRead >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:277: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'RC522_SPI_Config'
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:289: static void RC522_SPI_Config ( void )
;	-----------------------------------------
;	 function RC522_SPI_Config
;	-----------------------------------------
_RC522_SPI_Config:
;	../../../platform/cc2530dk/RC522/RC522.c:291: P1SEL &= ~0xF2;     //设置P1.1、P1.4、P1.5、P1.6、P1.7为普通IO口  
	anl	_P1SEL,#0x0d
;	../../../platform/cc2530dk/RC522/RC522.c:292: P1DIR |= 0x72;      //P1.1、P1.4、P1.5、P1.6定义为输出   
	orl	_P1DIR,#0x72
;	../../../platform/cc2530dk/RC522/RC522.c:294: P1DIR &= ~0x80;     //按键接在P1.7口上，设P1.7为输入模式 
	anl	_P1DIR,#0x7f
;	../../../platform/cc2530dk/RC522/RC522.c:295: P1INP &= ~0x80;     //打开P1.7上拉电阻
	anl	_P1INP,#0x7f
;	../../../platform/cc2530dk/RC522/RC522.c:296: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPI_RC522_SendByte'
;------------------------------------------------------------
;byte                      Allocated to registers r7 
;counter                   Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:309: void SPI_RC522_SendByte ( unsigned char byte )
;	-----------------------------------------
;	 function SPI_RC522_SendByte
;	-----------------------------------------
_SPI_RC522_SendByte:
	mov	r7,dpl
;	../../../platform/cc2530dk/RC522/RC522.c:313: for(counter=0;counter<8;counter++)
	mov	r6,#0x00
00105$:
;	../../../platform/cc2530dk/RC522/RC522.c:315: if ( byte & 0x80 )
	mov	a,r7
	jnb	acc.7,00102$
;	../../../platform/cc2530dk/RC522/RC522.c:317: macRC522_MOSI_1 ();
;	assignBit
	setb	_P1_6
;	assignBit
	setb	_P1_6
	sjmp	00103$
00102$:
;	../../../platform/cc2530dk/RC522/RC522.c:321: macRC522_MOSI_0 ();
;	assignBit
	clr	_P1_6
;	assignBit
	clr	_P1_6
00103$:
;	../../../platform/cc2530dk/RC522/RC522.c:324: macRC522_DELAY();
	mov	dptr,#0x0014
	push	ar7
	push	ar6
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:326: macRC522_SCK_0 ();
;	assignBit
	clr	_P1_5
;	assignBit
	clr	_P1_5
;	../../../platform/cc2530dk/RC522/RC522.c:328: macRC522_DELAY();
	mov	dptr,#0x0014
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:330: macRC522_SCK_1();
;	assignBit
	setb	_P1_5
;	assignBit
	setb	_P1_5
;	../../../platform/cc2530dk/RC522/RC522.c:332: macRC522_DELAY();
	mov	dptr,#0x0014
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:334: byte <<= 1; 
	mov	ar5,r7
	mov	a,r5
	add	a,r5
	mov	r7,a
;	../../../platform/cc2530dk/RC522/RC522.c:313: for(counter=0;counter<8;counter++)
	inc	r6
	cjne	r6,#0x08,00119$
00119$:
	jc	00105$
;	../../../platform/cc2530dk/RC522/RC522.c:337: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPI_RC522_ReadByte'
;------------------------------------------------------------
;counter                   Allocated to registers 
;SPI_Data                  Allocated to stack - sp +0
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:350: unsigned char SPI_RC522_ReadByte ( void )
;	-----------------------------------------
;	 function SPI_RC522_ReadByte
;	-----------------------------------------
_SPI_RC522_ReadByte:
	inc	sp
;	../../../platform/cc2530dk/RC522/RC522.c:355: for(counter=0;counter<8;counter++)
	mov	r7,#0x00
00104$:
;	../../../platform/cc2530dk/RC522/RC522.c:357: SPI_Data <<= 1;
	mov	ar6,r5
	mov	a,r6
	add	a,r6
	mov	r5,a
;	../../../platform/cc2530dk/RC522/RC522.c:359: macRC522_SCK_0 ();
;	assignBit
	clr	_P1_5
;	assignBit
	clr	_P1_5
;	../../../platform/cc2530dk/RC522/RC522.c:362: macRC522_DELAY();
	mov	dptr,#0x0014
	push	ar7
	push	ar5
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:364: if ( macRC522_MISO_GET() == 1)
	jnb	_P1_7,00102$
;	../../../platform/cc2530dk/RC522/RC522.c:365: SPI_Data |= 0x01;
	orl	ar5,#0x01
00102$:
;	../../../platform/cc2530dk/RC522/RC522.c:369: macRC522_DELAY();
	mov	dptr,#0x0014
	push	ar7
	push	ar5
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:371: macRC522_SCK_1 ();
;	assignBit
	setb	_P1_5
;	assignBit
	setb	_P1_5
;	../../../platform/cc2530dk/RC522/RC522.c:374: macRC522_DELAY();
	mov	dptr,#0x0014
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:355: for(counter=0;counter<8;counter++)
	inc	r7
	cjne	r7,#0x08,00122$
00122$:
	jc	00104$
;	../../../platform/cc2530dk/RC522/RC522.c:378: return SPI_Data;
	mov	dpl,r5
;	../../../platform/cc2530dk/RC522/RC522.c:380: }
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ReadRawRC'
;------------------------------------------------------------
;ucAddress                 Allocated to registers r7 
;ucAddr                    Allocated to registers r7 
;ucReturn                  Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:393: unsigned char ReadRawRC ( unsigned char ucAddress )
;	-----------------------------------------
;	 function ReadRawRC
;	-----------------------------------------
_ReadRawRC:
;	../../../platform/cc2530dk/RC522/RC522.c:397: ucAddr = ( ( ucAddress << 1 ) & 0x7E ) | 0x80;
	mov	a,dpl
	add	a,dpl
	mov	r7,a
	anl	ar7,#0x7e
	orl	ar7,#0x80
;	../../../platform/cc2530dk/RC522/RC522.c:399: macRC522_CS_Enable();
;	assignBit
	clr	_P1_4
;	assignBit
	clr	_P1_4
;	../../../platform/cc2530dk/RC522/RC522.c:401: SPI_RC522_SendByte ( ucAddr );
	mov	dpl,r7
	mov	r0,#_SPI_RC522_SendByte
	mov	r1,#(_SPI_RC522_SendByte >> 8)
	mov	r2,#(_SPI_RC522_SendByte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:403: ucReturn = SPI_RC522_ReadByte ();
	mov	r0,#_SPI_RC522_ReadByte
	mov	r1,#(_SPI_RC522_ReadByte >> 8)
	mov	r2,#(_SPI_RC522_ReadByte >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
;	../../../platform/cc2530dk/RC522/RC522.c:405: macRC522_CS_Disable();
;	assignBit
	setb	_P1_4
;	assignBit
	setb	_P1_4
;	../../../platform/cc2530dk/RC522/RC522.c:407: return ucReturn;
	mov	dpl,r7
;	../../../platform/cc2530dk/RC522/RC522.c:408: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteRawRC'
;------------------------------------------------------------
;ucValue                   Allocated to stack - sp -3
;ucAddress                 Allocated to registers r7 
;ucAddr                    Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:421: void WriteRawRC ( unsigned char ucAddress, unsigned char ucValue )
;	-----------------------------------------
;	 function WriteRawRC
;	-----------------------------------------
_WriteRawRC:
;	../../../platform/cc2530dk/RC522/RC522.c:425: ucAddr = ( ucAddress << 1 ) & 0x7E;
	mov	a,dpl
	add	a,dpl
	mov	r7,a
	anl	ar7,#0x7e
;	../../../platform/cc2530dk/RC522/RC522.c:427: macRC522_CS_Enable();
;	assignBit
	clr	_P1_4
;	assignBit
	clr	_P1_4
;	../../../platform/cc2530dk/RC522/RC522.c:429: SPI_RC522_SendByte ( ucAddr );
	mov	dpl,r7
	mov	r0,#_SPI_RC522_SendByte
	mov	r1,#(_SPI_RC522_SendByte >> 8)
	mov	r2,#(_SPI_RC522_SendByte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:431: SPI_RC522_SendByte ( ucValue );
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	dpl,@r0
	mov	r0,#_SPI_RC522_SendByte
	mov	r1,#(_SPI_RC522_SendByte >> 8)
	mov	r2,#(_SPI_RC522_SendByte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:433: macRC522_CS_Disable();	
;	assignBit
	setb	_P1_4
;	assignBit
	setb	_P1_4
;	../../../platform/cc2530dk/RC522/RC522.c:435: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SetBitMask'
;------------------------------------------------------------
;ucMask                    Allocated to stack - sp -3
;ucReg                     Allocated to registers r7 
;ucTemp                    Allocated to registers r6 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:448: void SetBitMask ( unsigned char ucReg, unsigned char ucMask )  
;	-----------------------------------------
;	 function SetBitMask
;	-----------------------------------------
_SetBitMask:
;	../../../platform/cc2530dk/RC522/RC522.c:452: ucTemp = ReadRawRC ( ucReg );
	mov  r7,dpl
	push	ar7
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:454: WriteRawRC ( ucReg, ucTemp | ucMask );         // set bit mask
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	orl	ar6,a
	push	ar6
	mov	dpl,r7
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:455: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ClearBitMask'
;------------------------------------------------------------
;ucMask                    Allocated to stack - sp -3
;ucReg                     Allocated to registers r7 
;ucTemp                    Allocated to registers r6 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:469: void ClearBitMask ( unsigned char ucReg, unsigned char ucMask )  
;	-----------------------------------------
;	 function ClearBitMask
;	-----------------------------------------
_ClearBitMask:
;	../../../platform/cc2530dk/RC522/RC522.c:473: ucTemp = ReadRawRC ( ucReg );
	mov  r7,dpl
	push	ar7
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:475: WriteRawRC ( ucReg, ucTemp & ( ~ ucMask) );  // clear bit mask
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	cpl	a
	anl	ar6,a
	push	ar6
	mov	dpl,r7
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:476: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdAntennaOn'
;------------------------------------------------------------
;uc                        Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:489: void PcdAntennaOn ( void )
;	-----------------------------------------
;	 function PcdAntennaOn
;	-----------------------------------------
_PcdAntennaOn:
;	../../../platform/cc2530dk/RC522/RC522.c:493: uc = ReadRawRC ( TxControlReg );
	mov	dpl,#0x14
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	r7,a
;	../../../platform/cc2530dk/RC522/RC522.c:495: if ( ! ( uc & 0x03 ) )
	anl	a,#0x03
	jz	00110$
	sjmp	00103$
00110$:
;	../../../platform/cc2530dk/RC522/RC522.c:496: SetBitMask(TxControlReg, 0x03);	
	mov	a,#0x03
	push	acc
	mov	dpl,#0x14
	mov	r0,#_SetBitMask
	mov	r1,#(_SetBitMask >> 8)
	mov	r2,#(_SetBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
00103$:
;	../../../platform/cc2530dk/RC522/RC522.c:497: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdAntennaOff'
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:510: void PcdAntennaOff ( void )
;	-----------------------------------------
;	 function PcdAntennaOff
;	-----------------------------------------
_PcdAntennaOff:
;	../../../platform/cc2530dk/RC522/RC522.c:512: ClearBitMask ( TxControlReg, 0x03 );
	mov	a,#0x03
	push	acc
	mov	dpl,#0x14
	mov	r0,#_ClearBitMask
	mov	r1,#(_ClearBitMask >> 8)
	mov	r2,#(_ClearBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:513: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'RC522_InitStatus'
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:527: unsigned char RC522_InitStatus(void) 
;	-----------------------------------------
;	 function RC522_InitStatus
;	-----------------------------------------
_RC522_InitStatus:
;	../../../platform/cc2530dk/RC522/RC522.c:529: return InitStatus;
	mov	dptr,#_InitStatus
	movx	a,@dptr
	mov	r7,a
	mov	dpl,a
;	../../../platform/cc2530dk/RC522/RC522.c:530: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdReset'
;------------------------------------------------------------
;count                     Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:542: unsigned char  PcdReset ( void )
;	-----------------------------------------
;	 function PcdReset
;	-----------------------------------------
_PcdReset:
;	../../../platform/cc2530dk/RC522/RC522.c:544: unsigned char count=0;
	mov	r7,#0x00
;	../../../platform/cc2530dk/RC522/RC522.c:545: macRC522_Reset_Disable();
;	assignBit
	setb	_P1_1
;	assignBit
	setb	_P1_1
;	../../../platform/cc2530dk/RC522/RC522.c:547: delay_us ( 1 );
	mov	dptr,#0x0001
	push	ar7
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:549: macRC522_Reset_Enable();
;	assignBit
	clr	_P1_1
;	assignBit
	clr	_P1_1
;	../../../platform/cc2530dk/RC522/RC522.c:551: delay_us ( 1 );
	mov	dptr,#0x0001
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:553: macRC522_Reset_Disable();
;	assignBit
	setb	_P1_1
;	assignBit
	setb	_P1_1
;	../../../platform/cc2530dk/RC522/RC522.c:555: delay_us ( 1 );
	mov	dptr,#0x0001
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:557: WriteRawRC ( CommandReg, 0x0f );
	mov	a,#0x0f
	push	acc
	mov	dpl,#0x01
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:559: while ( (ReadRawRC ( CommandReg ) & 0x10 ))
00104$:
	mov	dpl,#0x01
	push	ar7
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	pop	ar7
	jnb	acc.4,00106$
;	../../../platform/cc2530dk/RC522/RC522.c:561: if((++count) < 6)
	inc	r7
	cjne	r7,#0x06,00123$
00123$:
	jnc	00106$
;	../../../platform/cc2530dk/RC522/RC522.c:563: delay_ms(100);
	mov	dptr,#0x0064
	push	ar7
	mov	r0,#_delay_ms
	mov	r1,#(_delay_ms >> 8)
	mov	r2,#(_delay_ms >> 16)
	lcall	__sdcc_banked_call
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:567: break;
	sjmp	00104$
00106$:
;	../../../platform/cc2530dk/RC522/RC522.c:570: delay_us ( 1 );
	mov	dptr,#0x0001
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:572: WriteRawRC ( ModeReg, 0x3D );           //定义发送和接收常用模式 和Mifare卡通讯，CRC初始值0x6363
	mov	a,#0x3d
	push	acc
	mov	dpl,#0x11
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:574: WriteRawRC ( TReloadRegL, 30 );         //16位定时器低位    
	mov	a,#0x1e
	push	acc
	mov	dpl,#0x2d
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:575: WriteRawRC ( TReloadRegH, 0 );	        //16位定时器高位
	clr	a
	push	acc
	mov	dpl,#0x2c
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:577: WriteRawRC ( TModeReg, 0x8D );	        //定义内部定时器的设置
	mov	a,#0x8d
	push	acc
	mov	dpl,#0x2a
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:579: WriteRawRC ( TPrescalerReg, 0x3E );	//设置定时器分频系数
	mov	a,#0x3e
	push	acc
	mov	dpl,#0x2b
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:581: WriteRawRC ( TxAutoReg, 0x40 );	        //调制发送信号为100%ASK	
	mov	a,#0x40
	push	acc
	mov	dpl,#0x15
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:582: InitStatus = 1;
	mov	dptr,#_InitStatus
	mov	a,#0x01
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:583: delay_us ( 100 ); 
	mov	dptr,#0x0064
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:584: return InitStatus;
	mov	dptr,#_InitStatus
	movx	a,@dptr
	mov	r7,a
	mov	dpl,a
;	../../../platform/cc2530dk/RC522/RC522.c:585: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'M500PcdConfigISOType'
;------------------------------------------------------------
;ucType                    Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:598: void M500PcdConfigISOType ( unsigned char ucType )
;	-----------------------------------------
;	 function M500PcdConfigISOType
;	-----------------------------------------
_M500PcdConfigISOType:
	mov	r7,dpl
;	../../../platform/cc2530dk/RC522/RC522.c:600: if ( ucType == 'A')                     //ISO14443_A
	cjne	r7,#0x41,00109$
	sjmp	00110$
00109$:
	ljmp	__sdcc_banked_ret
00110$:
;	../../../platform/cc2530dk/RC522/RC522.c:602: ClearBitMask ( Status2Reg, 0x08 );
	mov	a,#0x08
	push	acc
	mov	dpl,#0x08
	mov	r0,#_ClearBitMask
	mov	r1,#(_ClearBitMask >> 8)
	mov	r2,#(_ClearBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:604: WriteRawRC ( ModeReg, 0x3D );//3F
	mov	a,#0x3d
	push	acc
	mov	dpl,#0x11
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:606: WriteRawRC ( RxSelReg, 0x86 );//84
	mov	a,#0x86
	push	acc
	mov	dpl,#0x17
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:608: WriteRawRC( RFCfgReg, 0x7F );   //4F
	mov	a,#0x7f
	push	acc
	mov	dpl,#0x26
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:610: WriteRawRC( TReloadRegL, 30 );//tmoLength);// TReloadVal = 'h6a =tmoLength(dec) 
	mov	a,#0x1e
	push	acc
	mov	dpl,#0x2d
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:612: WriteRawRC ( TReloadRegH, 0 );
	clr	a
	push	acc
	mov	dpl,#0x2c
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:614: WriteRawRC ( TModeReg, 0x8D );
	mov	a,#0x8d
	push	acc
	mov	dpl,#0x2a
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:616: WriteRawRC ( TPrescalerReg, 0x3E );
	mov	a,#0x3e
	push	acc
	mov	dpl,#0x2b
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:618: delay_us ( 2 );
	mov	dptr,#0x0002
	mov	r0,#_delay_us
	mov	r1,#(_delay_us >> 8)
	mov	r2,#(_delay_us >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:620: PcdAntennaOn ();//开天线	
	mov	r0,#_PcdAntennaOn
	mov	r1,#(_PcdAntennaOn >> 8)
	mov	r2,#(_PcdAntennaOn >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:622: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdComMF522'
;------------------------------------------------------------
;pInData                   Allocated to stack - sp -10
;ucInLenByte               Allocated to stack - sp -11
;pOutData                  Allocated to stack - sp -14
;pOutLenBit                Allocated to stack - sp -17
;ucCommand                 Allocated to registers r7 
;cStatus                   Allocated to registers r6 
;ucIrqEn                   Allocated to stack - sp -2
;ucWaitFor                 Allocated to stack - sp -1
;ucLastBits                Allocated to registers r4 
;ucN                       Allocated to stack - sp +0
;ul                        Allocated to registers 
;sloc0                     Allocated to stack - sp -4
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:639: char PcdComMF522 ( unsigned char ucCommand, unsigned char * pInData, unsigned char ucInLenByte, unsigned char * pOutData, int * pOutLenBit )		
;	-----------------------------------------
;	 function PcdComMF522
;	-----------------------------------------
_PcdComMF522:
	mov	a,sp
	add	a,#0x05
	mov	sp,a
	mov	r7,dpl
;	../../../platform/cc2530dk/RC522/RC522.c:641: char cStatus = MI_ERR;
	mov	r6,#0xbb
;	../../../platform/cc2530dk/RC522/RC522.c:642: unsigned char ucIrqEn   = 0x00;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,#0x00
;	../../../platform/cc2530dk/RC522/RC522.c:643: unsigned char ucWaitFor = 0x00;
	mov	r0,sp
	dec	r0
	mov	@r0,#0x00
;	../../../platform/cc2530dk/RC522/RC522.c:649: switch ( ucCommand )
	cjne	r7,#0x0c,00226$
	sjmp	00102$
00226$:
	cjne	r7,#0x0e,00104$
;	../../../platform/cc2530dk/RC522/RC522.c:652: ucIrqEn   = 0x12;		//允许错误中断请求ErrIEn  允许空闲中断IdleIEn
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,#0x12
;	../../../platform/cc2530dk/RC522/RC522.c:653: ucWaitFor = 0x10;		//认证寻卡等待时候 查询空闲中断标志位
	mov	r0,sp
	dec	r0
	mov	@r0,#0x10
;	../../../platform/cc2530dk/RC522/RC522.c:654: break;
;	../../../platform/cc2530dk/RC522/RC522.c:656: case PCD_TRANSCEIVE:		//接收发送 发送接收
	sjmp	00104$
00102$:
;	../../../platform/cc2530dk/RC522/RC522.c:657: ucIrqEn   = 0x77;		//允许TxIEn RxIEn IdleIEn LoAlertIEn ErrIEn TimerIEn
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,#0x77
;	../../../platform/cc2530dk/RC522/RC522.c:658: ucWaitFor = 0x30;		//寻卡等待时候 查询接收中断标志位与 空闲中断标志位
	mov	r0,sp
	dec	r0
	mov	@r0,#0x30
;	../../../platform/cc2530dk/RC522/RC522.c:664: }
00104$:
;	../../../platform/cc2530dk/RC522/RC522.c:666: WriteRawRC ( ComIEnReg, ucIrqEn | 0x80 );		//IRqInv置位管脚IRQ与Status1Reg的IRq位的值相反 
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x80
	orl	a,@r0
	mov	r3,a
	push	ar7
	push	ar6
	push	ar3
	mov	dpl,#0x02
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:667: ClearBitMask ( ComIrqReg, 0x80 );			//Set1该位清零时，CommIRqReg的屏蔽位清零
	mov	a,#0x80
	push	acc
	mov	dpl,#0x04
	mov	r0,#_ClearBitMask
	mov	r1,#(_ClearBitMask >> 8)
	mov	r2,#(_ClearBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:668: WriteRawRC ( CommandReg, PCD_IDLE );		//写空闲命令
	clr	a
	push	acc
	mov	dpl,#0x01
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:669: SetBitMask ( FIFOLevelReg, 0x80 );			//置位FlushBuffer清除内部FIFO的读和写指针以及ErrReg的BufferOvfl标志位被清除
	mov	a,#0x80
	push	acc
	mov	dpl,#0x0a
	mov	r0,#_SetBitMask
	mov	r1,#(_SetBitMask >> 8)
	mov	r2,#(_SetBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:671: for ( ul = 0; ul < ucInLenByte; ul ++ )
	mov	r2,#0x00
	mov	r3,#0x00
00131$:
	push	ar6
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	ar5,@r0
	mov	r6,#0x00
	clr	c
	mov	a,r2
	subb	a,r5
	mov	a,r3
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	pop	ar6
	jnc	00105$
;	../../../platform/cc2530dk/RC522/RC522.c:672: WriteRawRC ( FIFODataReg, pInData [ ul ] );    		//写数据进FIFOdata
	push	ar6
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r4,a
	mov	a,r3
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar6,@r0
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	push	ar7
	push	ar6
	push	ar3
	push	ar2
	push	ar4
	mov	dpl,#0x09
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:671: for ( ul = 0; ul < ucInLenByte; ul ++ )
	inc	r2
	cjne	r2,#0x00,00230$
	inc	r3
00230$:
	pop	ar6
	sjmp	00131$
00105$:
;	../../../platform/cc2530dk/RC522/RC522.c:674: WriteRawRC ( CommandReg, ucCommand );					//写命令
	push	ar7
	push	ar6
	push	ar7
	mov	dpl,#0x01
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:677: if ( ucCommand == PCD_TRANSCEIVE )
	cjne	r7,#0x0c,00107$
;	../../../platform/cc2530dk/RC522/RC522.c:678: SetBitMask(BitFramingReg,0x80);  				//StartSend置位启动数据发送 该位与收发命令使用时才有效
	push	ar7
	push	ar6
	mov	a,#0x80
	push	acc
	mov	dpl,#0x0d
	mov	r0,#_SetBitMask
	mov	r1,#(_SetBitMask >> 8)
	mov	r2,#(_SetBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar6
	pop	ar7
00107$:
;	../../../platform/cc2530dk/RC522/RC522.c:680: ul = 1000;//根据时钟频率调整，操作M1卡最大等待时间25ms
	mov	r4,#0xe8
	mov	r5,#0x03
;	../../../platform/cc2530dk/RC522/RC522.c:682: do 														//认证 与寻卡等待时间	
00110$:
;	../../../platform/cc2530dk/RC522/RC522.c:684: ucN = ReadRawRC ( ComIrqReg );							//查询事件中断
	mov	dpl,#0x04
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:685: ul --;
	dec	r4
	cjne	r4,#0xff,00233$
	dec	r5
00233$:
;	../../../platform/cc2530dk/RC522/RC522.c:686: } while ( ( ul != 0 ) && ( ! ( ucN & 0x01 ) ) && ( ! ( ucN & ucWaitFor ) ) );		//退出条件i=0,定时器中断，与写空闲命令
	mov	a,r4
	orl	a,r5
	jz	00156$
	mov	a,r3
	jb	acc.0,00156$
	mov	r0,sp
	dec	r0
	mov	a,@r0
	anl	a,r3
	jz	00110$
00156$:
;	../../../platform/cc2530dk/RC522/RC522.c:688: ClearBitMask ( BitFramingReg, 0x80 );					//清理允许StartSend位
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	mov	a,#0x80
	push	acc
	mov	dpl,#0x0d
	mov	r0,#_ClearBitMask
	mov	r1,#(_ClearBitMask >> 8)
	mov	r2,#(_ClearBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:690: if ( ul != 0 )
	mov	a,r4
	orl	a,r5
	jnz	00237$
	ljmp	00129$
00237$:
;	../../../platform/cc2530dk/RC522/RC522.c:692: if ( ! ( ReadRawRC ( ErrorReg ) & 0x1B ) )			//读错误标志寄存器BufferOfI CollErr ParityErr ProtocolErr
	mov	dpl,#0x06
	push	ar7
	push	ar3
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	pop	ar3
	pop	ar7
	anl	a,#0x1b
	jz	00239$
	ljmp	00126$
00239$:
;	../../../platform/cc2530dk/RC522/RC522.c:694: cStatus = MI_OK;
	mov	r6,#0x26
;	../../../platform/cc2530dk/RC522/RC522.c:696: if ( ucN & ucIrqEn & 0x01 )					//是否发生定时器中断
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	anl	a,r3
	jnb	acc.0,00114$
;	../../../platform/cc2530dk/RC522/RC522.c:697: cStatus = MI_NOTAGERR;   
	mov	r6,#0xcc
00114$:
;	../../../platform/cc2530dk/RC522/RC522.c:699: if ( ucCommand == PCD_TRANSCEIVE )
	cjne	r7,#0x0c,00241$
	sjmp	00242$
00241$:
	ljmp	00129$
00242$:
;	../../../platform/cc2530dk/RC522/RC522.c:701: ucN = ReadRawRC ( FIFOLevelReg );			//读FIFO中保存的字节数
	mov	dpl,#0x0a
	push	ar6
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	pop	ar6
	mov	r0,sp
	mov	@r0,ar7
;	../../../platform/cc2530dk/RC522/RC522.c:703: ucLastBits = ReadRawRC ( ControlReg ) & 0x07;	//最后接收到得字节的有效位数
	mov	dpl,#0x0c
	push	ar6
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	pop	ar6
	anl	ar5,#0x07
;	../../../platform/cc2530dk/RC522/RC522.c:705: if ( ucLastBits )
	mov	a,r5
	mov	r4,a
	jz	00116$
;	../../../platform/cc2530dk/RC522/RC522.c:706: * pOutLenBit = ( ucN - 1 ) * 8 + ucLastBits;   	//N个字节数减去1（最后一个字节）+最后一位的位数 读取到的数据总位数
	push	ar6
	mov	a,sp
	add	a,#0xee
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar5,@r0
	mov	r0,sp
	dec	r0
	mov	ar6,@r0
	mov	r7,#0x00
	dec	r6
	cjne	r6,#0xff,00244$
	dec	r7
00244$:
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar6
	mov	a,r7
	swap	a
	rr	a
	anl	a,#0xf8
	xch	a,@r0
	swap	a
	rr	a
	xch	a,@r0
	xrl	a,@r0
	xch	a,@r0
	anl	a,#0xf8
	xch	a,@r0
	xrl	a,@r0
	inc	r0
	mov	@r0,a
	mov	r7,#0x00
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	r4,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r5
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
	pop	ar6
	sjmp	00117$
00116$:
;	../../../platform/cc2530dk/RC522/RC522.c:708: * pOutLenBit = ucN * 8;   					//最后接收到的字节整个字节有效
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar7,@r0
	mov	r0,sp
	mov	ar2,@r0
	clr	a
	rr	a
	anl	a,#0xf8
	xch	a,r2
	swap	a
	rr	a
	xch	a,r2
	xrl	a,r2
	xch	a,r2
	anl	a,#0xf8
	xch	a,r2
	xrl	a,r2
	mov	r3,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r7
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
00117$:
;	../../../platform/cc2530dk/RC522/RC522.c:710: if ( ucN == 0 )		
	mov	r0,sp
	mov	a,@r0
	jnz	00119$
;	../../../platform/cc2530dk/RC522/RC522.c:711: ucN = 1;    
	mov	r0,sp
	mov	@r0,#0x01
00119$:
;	../../../platform/cc2530dk/RC522/RC522.c:713: if ( ucN > MAXRLEN )
	mov	r0,sp
	mov	a,@r0
	add	a,#0xff - 0x12
	jnc	00121$
;	../../../platform/cc2530dk/RC522/RC522.c:714: ucN = MAXRLEN;   
	mov	r0,sp
	mov	@r0,#0x12
00121$:
;	../../../platform/cc2530dk/RC522/RC522.c:716: for ( ul = 0; ul < ucN; ul ++ )
	mov	r5,#0x00
	mov	r7,#0x00
00134$:
	mov	r0,sp
	mov	ar3,@r0
	mov	r4,#0x00
	clr	c
	mov	a,r5
	subb	a,r3
	mov	a,r7
	xrl	a,#0x80
	mov	b,r4
	xrl	b,#0x80
	subb	a,b
	jnc	00129$
;	../../../platform/cc2530dk/RC522/RC522.c:717: pOutData [ ul ] = ReadRawRC ( FIFODataReg );   
	push	ar6
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,r5
	add	a,@r0
	mov	r2,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	dpl,#0x09
	push	ar7
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r6
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:716: for ( ul = 0; ul < ucN; ul ++ )
	inc	r5
	cjne	r5,#0x00,00248$
	inc	r7
00248$:
	pop	ar6
	sjmp	00134$
00126$:
;	../../../platform/cc2530dk/RC522/RC522.c:723: cStatus = MI_ERR;   
	mov	r6,#0xbb
00129$:
;	../../../platform/cc2530dk/RC522/RC522.c:726: SetBitMask ( ControlReg, 0x80 );           // stop timer now
	push	ar6
	mov	a,#0x80
	push	acc
	mov	dpl,#0x0c
	mov	r0,#_SetBitMask
	mov	r1,#(_SetBitMask >> 8)
	mov	r2,#(_SetBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:727: WriteRawRC ( CommandReg, PCD_IDLE ); 
	clr	a
	push	acc
	mov	dpl,#0x01
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar6
;	../../../platform/cc2530dk/RC522/RC522.c:729: return cStatus;
	mov	dpl,r6
;	../../../platform/cc2530dk/RC522/RC522.c:730: }
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdRequest'
;------------------------------------------------------------
;pTagType                  Allocated to stack - sp -28
;ucReq_code                Allocated to registers r7 
;cStatus                   Allocated to registers r7 
;ucComMF522Buf             Allocated to stack - sp -19
;ulLen                     Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -22
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:751: char PcdRequest ( unsigned char ucReq_code, unsigned char * pTagType)
;	-----------------------------------------
;	 function PcdRequest
;	-----------------------------------------
_PcdRequest:
	mov	a,sp
	add	a,#0x17
	mov	sp,a
	mov	r7,dpl
;	../../../platform/cc2530dk/RC522/RC522.c:757: ClearBitMask ( Status2Reg, 0x08 );	//清理指示MIFARECyptol单元接通以及所有卡的数据通信被加密的情况
	push	ar7
	mov	a,#0x08
	push	acc
	mov	dpl,#0x08
	mov	r0,#_ClearBitMask
	mov	r1,#(_ClearBitMask >> 8)
	mov	r2,#(_ClearBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:758: WriteRawRC ( BitFramingReg, 0x07 );	//	发送的最后一个字节的 七位
	mov	a,#0x07
	push	acc
	mov	dpl,#0x0d
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:759: SetBitMask ( TxControlReg, 0x03 );	//TX1,TX2管脚的输出信号传递经发送调制的13.56的能量载波信号
	mov	a,#0x03
	push	acc
	mov	dpl,#0x14
	mov	r0,#_SetBitMask
	mov	r1,#(_SetBitMask >> 8)
	mov	r2,#(_SetBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:761: ucComMF522Buf [ 0 ] = ucReq_code;		//存入 卡片命令字
	mov	a,sp
	add	a,#0xed
	mov	r1,a
	mov	@r1,ar7
;	../../../platform/cc2530dk/RC522/RC522.c:763: cStatus = PcdComMF522 ( PCD_TRANSCEIVE,	ucComMF522Buf, 1, ucComMF522Buf, & ulLen );	//寻卡  
	mov	r7,sp
	dec	r7
	mov	r6,#0x00
	mov	r5,#0x40
	mov	ar4,r1
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x40
	mov	ar4,r1
	mov	r3,#0x00
	mov	r2,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#0x01
	push	acc
	push	ar4
	push	ar3
	push	ar2
	mov	dpl,#0x0c
	mov	r0,#_PcdComMF522
	mov	r1,#(_PcdComMF522 >> 8)
	mov	r2,#(_PcdComMF522 >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:765: if ( ( cStatus == MI_OK ) && ( ulLen == 0x10 ) )	//寻卡成功返回卡类型 
	cjne	r7,#0x26,00102$
	mov	r0,sp
	dec	r0
	cjne	@r0,#0x10,00102$
	inc	r0
	cjne	@r0,#0x00,00102$
;	../../../platform/cc2530dk/RC522/RC522.c:767: * pTagType = ucComMF522Buf [ 0 ];
	mov	a,sp
	add	a,#0xe4
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	mov	a,sp
	add	a,#0xed
	mov	r1,a
	mov	ar3,@r1
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:768: * ( pTagType + 1 ) = ucComMF522Buf [ 1 ];
	inc	r4
	cjne	r4,#0x00,00119$
	inc	r5
00119$:
	inc	r1
	mov	ar3,@r1
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
	sjmp	00103$
00102$:
;	../../../platform/cc2530dk/RC522/RC522.c:772: cStatus = MI_ERR;
	mov	r7,#0xbb
00103$:
;	../../../platform/cc2530dk/RC522/RC522.c:775: return cStatus; 
	mov	dpl,r7
;	../../../platform/cc2530dk/RC522/RC522.c:776: }
	mov	a,sp
	add	a,#0xe9
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdAnticoll'
;------------------------------------------------------------
;pSnr                      Allocated to stack - sp -26
;cStatus                   Allocated to registers r7 
;uc                        Allocated to registers 
;ucSnr_check               Allocated to stack - sp -20
;ucComMF522Buf             Allocated to stack - sp -19
;ulLen                     Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -23
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:789: char PcdAnticoll ( unsigned char * pSnr )
;	-----------------------------------------
;	 function PcdAnticoll
;	-----------------------------------------
_PcdAnticoll:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x18
;	../../../platform/cc2530dk/RC522/RC522.c:792: unsigned char uc, ucSnr_check = 0;
	mov	sp,a
	add	a,#0xec
	mov	r0,a
	mov	@r0,#0x00
;	../../../platform/cc2530dk/RC522/RC522.c:797: ClearBitMask ( Status2Reg, 0x08 );		//清MFCryptol On位 只有成功执行MFAuthent命令后，该位才能置位
	mov	a,#0x08
	push	acc
	mov	dpl,#0x08
	mov	r0,#_ClearBitMask
	mov	r1,#(_ClearBitMask >> 8)
	mov	r2,#(_ClearBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:798: WriteRawRC ( BitFramingReg, 0x00);		//清理寄存器 停止收发
	clr	a
	push	acc
	mov	dpl,#0x0d
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:799: ClearBitMask ( CollReg, 0x80 );			//清ValuesAfterColl所有接收的位在冲突后被清除
	mov	a,#0x80
	push	acc
	mov	dpl,#0x0e
	mov	r0,#_ClearBitMask
	mov	r1,#(_ClearBitMask >> 8)
	mov	r2,#(_ClearBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:801: ucComMF522Buf [ 0 ] = 0x93;	//卡片防冲突命令
	mov	a,sp
	add	a,#0xed
	mov	r1,a
	mov	@r1,#0x93
;	../../../platform/cc2530dk/RC522/RC522.c:802: ucComMF522Buf [ 1 ] = 0x20;
	mov	a,r1
	inc	a
	mov	r0,a
	mov	@r0,#0x20
;	../../../platform/cc2530dk/RC522/RC522.c:804: cStatus = PcdComMF522 ( PCD_TRANSCEIVE, ucComMF522Buf, 2, ucComMF522Buf, & ulLen);//与卡片通信
	mov	r3,sp
	dec	r3
	mov	ar2,r3
	mov	r3,#0x00
	mov	r7,#0x40
	mov	ar6,r1
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	@r0,ar6
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x40
	mov	ar6,r1
	mov	r5,#0x00
	mov	r4,#0x40
	push	ar2
	push	ar3
	push	ar7
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#0x02
	push	acc
	push	ar6
	push	ar5
	push	ar4
	mov	dpl,#0x0c
	mov	r0,#_PcdComMF522
	mov	r1,#(_PcdComMF522 >> 8)
	mov	r2,#(_PcdComMF522 >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:806: if ( cStatus == MI_OK)		//通信成功
	cjne	r7,#0x26,00105$
;	../../../platform/cc2530dk/RC522/RC522.c:808: for ( uc = 0; uc < 4; uc ++ )
	mov	r6,#0x00
	mov	a,sp
	add	a,#0xed
	mov	r5,a
00106$:
;	../../../platform/cc2530dk/RC522/RC522.c:810: * ( pSnr + uc )  = ucComMF522Buf [ uc ];			//读出UID
	push	ar7
	mov	a,sp
	add	a,#0xe5
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	a,r6
	add	a,r5
	mov	r1,a
	mov	ar7,@r1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r7
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:811: ucSnr_check ^= ucComMF522Buf [ uc ];
	mov	ar7,@r1
	mov	a,sp
	add	a,#0xeb
	mov	r0,a
	mov	a,r7
	xrl	a,@r0
	mov	@r0,a
;	../../../platform/cc2530dk/RC522/RC522.c:808: for ( uc = 0; uc < 4; uc ++ )
	inc	r6
	cjne	r6,#0x04,00133$
00133$:
	pop	ar7
	jc	00106$
;	../../../platform/cc2530dk/RC522/RC522.c:814: if ( ucSnr_check != ucComMF522Buf [ uc ] )
	mov	a,sp
	add	a,#0xed
	mov	r5,a
	add	a,r6
	mov	r1,a
	mov	ar6,@r1
	mov	a,sp
	add	a,#0xec
	mov	r0,a
	mov	a,@r0
	cjne	a,ar6,00135$
	sjmp	00105$
00135$:
;	../../../platform/cc2530dk/RC522/RC522.c:816: cStatus = MI_ERR; 
	mov	r7,#0xbb
00105$:
;	../../../platform/cc2530dk/RC522/RC522.c:821: SetBitMask ( CollReg, 0x80 );
	push	ar7
	mov	a,#0x80
	push	acc
	mov	dpl,#0x0e
	mov	r0,#_SetBitMask
	mov	r1,#(_SetBitMask >> 8)
	mov	r2,#(_SetBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:824: return cStatus;
	mov	dpl,r7
;	../../../platform/cc2530dk/RC522/RC522.c:827: }
	mov	a,sp
	add	a,#0xe5
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'CalulateCRC'
;------------------------------------------------------------
;ucLen                     Allocated to stack - sp -6
;pOutData                  Allocated to stack - sp -9
;pIndata                   Allocated to stack - sp -2
;uc                        Allocated to registers 
;ucN                       Allocated to registers r6 
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:842: void CalulateCRC ( unsigned char * pIndata, unsigned char ucLen, unsigned char * pOutData )
;	-----------------------------------------
;	 function CalulateCRC
;	-----------------------------------------
_CalulateCRC:
	push	dpl
	push	dph
	push	b
;	../../../platform/cc2530dk/RC522/RC522.c:847: ClearBitMask(DivIrqReg,0x04);
	mov	a,#0x04
	push	acc
	mov	dpl,#0x05
	mov	r0,#_ClearBitMask
	mov	r1,#(_ClearBitMask >> 8)
	mov	r2,#(_ClearBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:849: WriteRawRC(CommandReg,PCD_IDLE);
	clr	a
	push	acc
	mov	dpl,#0x01
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:851: SetBitMask(FIFOLevelReg,0x80);
	mov	a,#0x80
	push	acc
	mov	dpl,#0x0a
	mov	r0,#_SetBitMask
	mov	r1,#(_SetBitMask >> 8)
	mov	r2,#(_SetBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:853: for ( uc = 0; uc < ucLen; uc ++)
	mov	r4,#0x00
00107$:
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	clr	c
	mov	a,r4
	subb	a,@r0
	jnc	00101$
;	../../../platform/cc2530dk/RC522/RC522.c:854: WriteRawRC ( FIFODataReg, * ( pIndata + uc ) );   
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r4
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	push	ar4
	push	ar2
	mov	dpl,#0x09
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar4
;	../../../platform/cc2530dk/RC522/RC522.c:853: for ( uc = 0; uc < ucLen; uc ++)
	inc	r4
	sjmp	00107$
00101$:
;	../../../platform/cc2530dk/RC522/RC522.c:856: WriteRawRC ( CommandReg, PCD_CALCCRC );
	mov	a,#0x03
	push	acc
	mov	dpl,#0x01
	mov	r0,#_WriteRawRC
	mov	r1,#(_WriteRawRC >> 8)
	mov	r2,#(_WriteRawRC >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:858: uc = 0xFF;
	mov	r7,#0xff
;	../../../platform/cc2530dk/RC522/RC522.c:860: do 
00103$:
;	../../../platform/cc2530dk/RC522/RC522.c:862: ucN = ReadRawRC ( DivIrqReg );
	mov	dpl,#0x05
	push	ar7
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:863: uc --;
	dec	r7
;	../../../platform/cc2530dk/RC522/RC522.c:864: } while ( ( uc != 0 ) && ! ( ucN & 0x04 ) );
	mov	a,r7
	jz	00105$
	mov	a,r6
	jnb	acc.2,00103$
00105$:
;	../../../platform/cc2530dk/RC522/RC522.c:866: pOutData [ 0 ] = ReadRawRC ( CRCResultRegL );
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	dpl,#0x22
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:867: pOutData [ 1 ] = ReadRawRC ( CRCResultRegM );
	inc	r5
	cjne	r5,#0x00,00136$
	inc	r6
00136$:
	mov	dpl,#0x21
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:870: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdSelect'
;------------------------------------------------------------
;pSnr                      Allocated to stack - sp -6
;ucN                       Allocated to registers r7 
;uc                        Allocated to registers 
;ulLen                     Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -3
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:884: char PcdSelect ( unsigned char * pSnr )
;	-----------------------------------------
;	 function PcdSelect
;	-----------------------------------------
_PcdSelect:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x04
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:891: ucComMF522Buf0 [ 0 ] = PICC_ANTICOLL1;
	mov	dptr,#_ucComMF522Buf0
	mov	a,#0x93
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:892: ucComMF522Buf0 [ 1 ] = 0x70;
	mov	dptr,#(_ucComMF522Buf0 + 0x0001)
	mov	a,#0x70
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:893: ucComMF522Buf0 [ 6 ] = 0;
	mov	dptr,#(_ucComMF522Buf0 + 0x0006)
	clr	a
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:895: for ( uc = 0; uc < 4; uc ++ )
	mov	r4,#0x00
00106$:
;	../../../platform/cc2530dk/RC522/RC522.c:897: ucComMF522Buf0 [ uc + 2 ] = * ( pSnr + uc );
	mov	ar3,r4
	inc	r3
	inc	r3
	mov	a,r3
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,r3
	add	a,#_ucComMF522Buf0
	mov	@r0,a
	mov	a,r2
	addc	a,#(_ucComMF522Buf0 >> 8)
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	mov	a,r3
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:898: ucComMF522Buf0 [ 6 ] ^= * ( pSnr + uc );
	mov	dptr,#(_ucComMF522Buf0 + 0x0006)
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	xrl	ar3,a
	mov	dptr,#(_ucComMF522Buf0 + 0x0006)
	mov	a,r3
	movx	@dptr,a
;	../../../platform/cc2530dk/RC522/RC522.c:895: for ( uc = 0; uc < 4; uc ++ )
	inc	r4
	cjne	r4,#0x04,00131$
00131$:
	jc	00106$
;	../../../platform/cc2530dk/RC522/RC522.c:901: CalulateCRC ( ucComMF522Buf0, 7, & ucComMF522Buf0 [ 7 ] );
	mov	a,#(_ucComMF522Buf0 + 0x0007)
	push	acc
	mov	a,#((_ucComMF522Buf0 + 0x0007) >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#0x07
	push	acc
	mov	dptr,#_ucComMF522Buf0
	mov	b,#0x00
	mov	r0,#_CalulateCRC
	mov	r1,#(_CalulateCRC >> 8)
	mov	r2,#(_CalulateCRC >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:903: ClearBitMask ( Status2Reg, 0x08 );
	mov	a,#0x08
	push	acc
	mov	dpl,#0x08
	mov	r0,#_ClearBitMask
	mov	r1,#(_ClearBitMask >> 8)
	mov	r2,#(_ClearBitMask >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/RC522/RC522.c:905: ucN = PcdComMF522 ( PCD_TRANSCEIVE, ucComMF522Buf0, 9, ucComMF522Buf0, & ulLen );
	mov	r7,sp
	dec	r7
	mov	r6,#0x00
	mov	r5,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	a,#_ucComMF522Buf0
	push	acc
	mov	a,#(_ucComMF522Buf0 >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,#0x09
	push	acc
	mov	a,#_ucComMF522Buf0
	push	acc
	mov	a,#(_ucComMF522Buf0 >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,#0x0c
	mov	r0,#_PcdComMF522
	mov	r1,#(_PcdComMF522 >> 8)
	mov	r2,#(_PcdComMF522 >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:907: if ( ( ucN == MI_OK ) && ( ulLen == 0x18 ) )
	cjne	r7,#0x26,00103$
	mov	r0,sp
	dec	r0
	cjne	@r0,#0x18,00103$
	inc	r0
	cjne	@r0,#0x00,00103$
;	../../../platform/cc2530dk/RC522/RC522.c:908: ucN = MI_OK;  
	mov	r7,#0x26
	sjmp	00104$
00103$:
;	../../../platform/cc2530dk/RC522/RC522.c:910: ucN = MI_ERR;    
	mov	r7,#0xbb
00104$:
;	../../../platform/cc2530dk/RC522/RC522.c:912: return ucN;
	mov	dpl,r7
;	../../../platform/cc2530dk/RC522/RC522.c:914: }
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdAuthState'
;------------------------------------------------------------
;ucAddr                    Allocated to stack - sp -26
;pKey                      Allocated to stack - sp -29
;pSnr                      Allocated to stack - sp -32
;ucAuth_mode               Allocated to registers r7 
;cStatus                   Allocated to registers r7 
;uc                        Allocated to registers 
;ucComMF522Buf             Allocated to stack - sp -19
;ulLen                     Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -22
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:932: char PcdAuthState ( unsigned char ucAuth_mode, unsigned char ucAddr, unsigned char * pKey, unsigned char * pSnr )
;	-----------------------------------------
;	 function PcdAuthState
;	-----------------------------------------
_PcdAuthState:
	mov	a,sp
	add	a,#0x17
;	../../../platform/cc2530dk/RC522/RC522.c:939: ucComMF522Buf [ 0 ] = ucAuth_mode;
	mov	sp,a
	mov	r7,dpl
	add	a,#0xed
	mov	r1,a
	mov	@r1,ar7
;	../../../platform/cc2530dk/RC522/RC522.c:940: ucComMF522Buf [ 1 ] = ucAddr;
	mov	a,r1
	inc	a
	mov	r0,a
	mov	a,sp
	add	a,#0xe6
	mov	r1,a
	mov	a,@r1
	mov	@r0,a
;	../../../platform/cc2530dk/RC522/RC522.c:942: for ( uc = 0; uc < 6; uc ++ )
	mov	r7,#0x00
	mov	a,sp
	add	a,#0xed
	mov	r6,a
00106$:
;	../../../platform/cc2530dk/RC522/RC522.c:943: ucComMF522Buf [ uc + 2 ] = * ( pKey + uc );   
	mov	ar5,r7
	mov	a,#0x02
	add	a,r5
	add	a,r6
	mov	r1,a
	mov	a,sp
	add	a,#0xe3
	mov	r0,a
	mov	a,r7
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrget
	mov	r3,a
	mov	@r1,a
;	../../../platform/cc2530dk/RC522/RC522.c:942: for ( uc = 0; uc < 6; uc ++ )
	inc	r7
	cjne	r7,#0x06,00139$
00139$:
	jc	00106$
;	../../../platform/cc2530dk/RC522/RC522.c:945: for ( uc = 0; uc < 6; uc ++ )
	mov	r7,#0x00
	mov	a,sp
	add	a,#0xed
	mov	r6,a
00108$:
;	../../../platform/cc2530dk/RC522/RC522.c:946: ucComMF522Buf [ uc + 8 ] = * ( pSnr + uc );   
	mov	ar5,r7
	mov	a,#0x08
	add	a,r5
	add	a,r6
	mov	r1,a
	mov	a,sp
	add	a,#0xe0
	mov	r0,a
	mov	a,r7
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrget
	mov	@r1,a
;	../../../platform/cc2530dk/RC522/RC522.c:945: for ( uc = 0; uc < 6; uc ++ )
	inc	r7
	cjne	r7,#0x06,00141$
00141$:
	jc	00108$
;	../../../platform/cc2530dk/RC522/RC522.c:948: cStatus = PcdComMF522 ( PCD_AUTHENT, ucComMF522Buf, 12, ucComMF522Buf, & ulLen );
	mov	r7,sp
	dec	r7
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	@r0,ar7
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x40
	mov	a,sp
	add	a,#0xed
	mov	r4,a
	mov	r2,a
	mov	r3,#0x00
	mov	r7,#0x40
	mov	r6,#0x00
	mov	r5,#0x40
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	push	ar2
	push	ar3
	push	ar7
	mov	a,#0x0c
	push	acc
	push	ar4
	push	ar6
	push	ar5
	mov	dpl,#0x0e
	mov	r0,#_PcdComMF522
	mov	r1,#(_PcdComMF522 >> 8)
	mov	r2,#(_PcdComMF522 >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:950: if ( ( cStatus != MI_OK ) || ( ! ( ReadRawRC ( Status2Reg ) & 0x08 ) ) )
	cjne	r7,#0x26,00103$
	mov	dpl,#0x08
	push	ar7
	mov	r0,#_ReadRawRC
	mov	r1,#(_ReadRawRC >> 8)
	mov	r2,#(_ReadRawRC >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	pop	ar7
	jb	acc.3,00104$
00103$:
;	../../../platform/cc2530dk/RC522/RC522.c:951: cStatus = MI_ERR;   
	mov	r7,#0xbb
00104$:
;	../../../platform/cc2530dk/RC522/RC522.c:953: return cStatus;
	mov	dpl,r7
;	../../../platform/cc2530dk/RC522/RC522.c:955: }
	mov	a,sp
	add	a,#0xe9
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdWrite'
;------------------------------------------------------------
;pData                     Allocated to stack - sp -28
;ucAddr                    Allocated to registers r7 
;cStatus                   Allocated to registers r7 
;uc                        Allocated to registers 
;ucComMF522Buf             Allocated to stack - sp -19
;ulLen                     Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -22
;sloc1                     Allocated to stack - sp +4
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:969: char PcdWrite ( unsigned char ucAddr, unsigned char * pData )
;	-----------------------------------------
;	 function PcdWrite
;	-----------------------------------------
_PcdWrite:
	mov	a,sp
	add	a,#0x17
;	../../../platform/cc2530dk/RC522/RC522.c:976: ucComMF522Buf [ 0 ] = PICC_WRITE;
	mov	sp,a
	mov	r7,dpl
	add	a,#0xed
	mov	r1,a
	mov	@r1,#0xa0
;	../../../platform/cc2530dk/RC522/RC522.c:977: ucComMF522Buf [ 1 ] = ucAddr;
	mov	a,r1
	inc	a
	mov	r0,a
	mov	@r0,ar7
;	../../../platform/cc2530dk/RC522/RC522.c:979: CalulateCRC ( ucComMF522Buf, 2, & ucComMF522Buf [ 2 ] );
	mov	a,#0x02
	add	a,r1
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	ar4,r1
	mov	r3,#0x00
	mov	r2,#0x40
	push	ar1
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0x02
	push	acc
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	r0,#_CalulateCRC
	mov	r1,#(_CalulateCRC >> 8)
	mov	r2,#(_CalulateCRC >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
;	../../../platform/cc2530dk/RC522/RC522.c:981: cStatus = PcdComMF522 ( PCD_TRANSCEIVE, ucComMF522Buf, 4, ucComMF522Buf, & ulLen );
	mov	r7,sp
	dec	r7
	mov	r6,#0x00
	mov	r5,#0x40
	mov	ar4,r1
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x40
	mov	ar4,r1
	mov	r3,#0x00
	mov	r2,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#0x04
	push	acc
	push	ar4
	push	ar3
	push	ar2
	mov	dpl,#0x0c
	mov	r0,#_PcdComMF522
	mov	r1,#(_PcdComMF522 >> 8)
	mov	r2,#(_PcdComMF522 >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:983: if ( ( cStatus != MI_OK ) || ( ulLen != 4 ) || ( ( ucComMF522Buf [ 0 ] & 0x0F ) != 0x0A ) )
	cjne	r7,#0x26,00101$
	mov	r0,sp
	dec	r0
	cjne	@r0,#0x04,00101$
	inc	r0
	cjne	@r0,#0x00,00101$
	mov	a,sp
	add	a,#0xed
	mov	r1,a
	mov	ar6,@r1
	anl	ar6,#0x0f
	mov	r5,#0x00
	cjne	r6,#0x0a,00149$
	cjne	r5,#0x00,00149$
	sjmp	00102$
00149$:
00101$:
;	../../../platform/cc2530dk/RC522/RC522.c:984: cStatus = MI_ERR;   
	mov	r7,#0xbb
00102$:
;	../../../platform/cc2530dk/RC522/RC522.c:986: if ( cStatus == MI_OK )
	cjne	r7,#0x26,00150$
	sjmp	00151$
00150$:
	ljmp	00111$
00151$:
;	../../../platform/cc2530dk/RC522/RC522.c:989: for ( uc = 0; uc < 16; uc ++ )
	mov	r6,#0x00
	mov	a,sp
	add	a,#0xed
	mov	r5,a
00112$:
;	../../../platform/cc2530dk/RC522/RC522.c:990: ucComMF522Buf [ uc ] = * ( pData + uc );  
	mov	a,r6
	add	a,r5
	mov	r1,a
	mov	a,sp
	add	a,#0xe4
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	@r1,a
;	../../../platform/cc2530dk/RC522/RC522.c:989: for ( uc = 0; uc < 16; uc ++ )
	inc	r6
	cjne	r6,#0x10,00152$
00152$:
	jc	00112$
;	../../../platform/cc2530dk/RC522/RC522.c:992: CalulateCRC ( ucComMF522Buf, 16, & ucComMF522Buf [ 16 ] );
	mov	a,sp
	add	a,#0xed
	mov	r6,a
	add	a,#0x10
	mov	r5,a
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x40
	mov	ar2,r6
	mov	r4,#0x00
	mov	r5,#0x40
	push	ar6
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
	mov	a,#0x10
	push	acc
	mov	dpl,r2
	mov	dph,r4
	mov	b,r5
	mov	r0,#_CalulateCRC
	mov	r1,#(_CalulateCRC >> 8)
	mov	r2,#(_CalulateCRC >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar6
;	../../../platform/cc2530dk/RC522/RC522.c:994: cStatus = PcdComMF522 ( PCD_TRANSCEIVE, ucComMF522Buf, 18, ucComMF522Buf, & ulLen );
	mov	r5,sp
	dec	r5
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x40
	mov	ar2,r6
	mov	r7,#0x00
	mov	r4,#0x40
	mov	ar3,r6
	mov	r5,#0x00
	mov	r6,#0x40
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	push	ar2
	push	ar7
	push	ar4
	mov	a,#0x12
	push	acc
	push	ar3
	push	ar5
	push	ar6
	mov	dpl,#0x0c
	mov	r0,#_PcdComMF522
	mov	r1,#(_PcdComMF522 >> 8)
	mov	r2,#(_PcdComMF522 >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
	mov	ar7,r6
;	../../../platform/cc2530dk/RC522/RC522.c:996: if ( ( cStatus != MI_OK ) || ( ulLen != 4 ) || ( ( ucComMF522Buf [ 0 ] & 0x0F ) != 0x0A ) )
	cjne	r7,#0x26,00106$
	mov	r0,sp
	dec	r0
	cjne	@r0,#0x04,00106$
	inc	r0
	cjne	@r0,#0x00,00106$
	mov	a,sp
	add	a,#0xed
	mov	r1,a
	mov	ar6,@r1
	anl	ar6,#0x0f
	mov	r5,#0x00
	cjne	r6,#0x0a,00158$
	cjne	r5,#0x00,00158$
	sjmp	00111$
00158$:
00106$:
;	../../../platform/cc2530dk/RC522/RC522.c:997: cStatus = MI_ERR;   
	mov	r7,#0xbb
00111$:
;	../../../platform/cc2530dk/RC522/RC522.c:1001: return cStatus;
	mov	dpl,r7
;	../../../platform/cc2530dk/RC522/RC522.c:1003: }
	mov	a,sp
	add	a,#0xe9
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdRead'
;------------------------------------------------------------
;pData                     Allocated to stack - sp -28
;ucAddr                    Allocated to registers r7 
;cStatus                   Allocated to registers r7 
;uc                        Allocated to registers 
;ucComMF522Buf             Allocated to stack - sp -19
;ulLen                     Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -22
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:1017: char PcdRead ( unsigned char ucAddr, unsigned char * pData )
;	-----------------------------------------
;	 function PcdRead
;	-----------------------------------------
_PcdRead:
	mov	a,sp
	add	a,#0x17
;	../../../platform/cc2530dk/RC522/RC522.c:1024: ucComMF522Buf [ 0 ] = PICC_READ;
	mov	sp,a
	mov	r7,dpl
	add	a,#0xed
	mov	r1,a
	mov	@r1,#0x30
;	../../../platform/cc2530dk/RC522/RC522.c:1025: ucComMF522Buf [ 1 ] = ucAddr;
	mov	a,r1
	inc	a
	mov	r0,a
	mov	@r0,ar7
;	../../../platform/cc2530dk/RC522/RC522.c:1027: CalulateCRC ( ucComMF522Buf, 2, & ucComMF522Buf [ 2 ] );
	mov	a,#0x02
	add	a,r1
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	ar4,r1
	mov	r3,#0x00
	mov	r2,#0x40
	push	ar1
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0x02
	push	acc
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	r0,#_CalulateCRC
	mov	r1,#(_CalulateCRC >> 8)
	mov	r2,#(_CalulateCRC >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
;	../../../platform/cc2530dk/RC522/RC522.c:1029: cStatus = PcdComMF522 ( PCD_TRANSCEIVE, ucComMF522Buf, 4, ucComMF522Buf, & ulLen );
	mov	r7,sp
	dec	r7
	mov	r6,#0x00
	mov	r5,#0x40
	mov	ar4,r1
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x40
	mov	ar4,r1
	mov	r3,#0x00
	mov	r2,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#0x04
	push	acc
	push	ar4
	push	ar3
	push	ar2
	mov	dpl,#0x0c
	mov	r0,#_PcdComMF522
	mov	r1,#(_PcdComMF522 >> 8)
	mov	r2,#(_PcdComMF522 >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:1031: if ( ( cStatus == MI_OK ) && ( ulLen == 0x90 ) )
	cjne	r7,#0x26,00103$
	mov	r0,sp
	dec	r0
	cjne	@r0,#0x90,00103$
	inc	r0
	cjne	@r0,#0x00,00103$
;	../../../platform/cc2530dk/RC522/RC522.c:1033: for ( uc = 0; uc < 16; uc ++ )
	mov	r6,#0x00
	mov	a,sp
	add	a,#0xed
	mov	r5,a
00106$:
;	../../../platform/cc2530dk/RC522/RC522.c:1034: * ( pData + uc ) = ucComMF522Buf [ uc ];   
	push	ar7
	mov	a,sp
	add	a,#0xe3
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	a,r6
	add	a,r5
	mov	r1,a
	mov	ar7,@r1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r7
	lcall	__gptrput
;	../../../platform/cc2530dk/RC522/RC522.c:1033: for ( uc = 0; uc < 16; uc ++ )
	inc	r6
	cjne	r6,#0x10,00131$
00131$:
	pop	ar7
	jc	00106$
	sjmp	00104$
00103$:
;	../../../platform/cc2530dk/RC522/RC522.c:1038: cStatus = MI_ERR;   
	mov	r7,#0xbb
00104$:
;	../../../platform/cc2530dk/RC522/RC522.c:1040: return cStatus;
	mov	dpl,r7
;	../../../platform/cc2530dk/RC522/RC522.c:1042: }
	mov	a,sp
	add	a,#0xe9
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PcdHalt'
;------------------------------------------------------------
;ucComMF522Buf             Allocated to stack - sp -19
;ulLen                     Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -22
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:1055: char PcdHalt( void )
;	-----------------------------------------
;	 function PcdHalt
;	-----------------------------------------
_PcdHalt:
	mov	a,sp
	add	a,#0x17
;	../../../platform/cc2530dk/RC522/RC522.c:1060: ucComMF522Buf [ 0 ] = PICC_HALT;
	mov	sp,a
	add	a,#0xed
	mov	r1,a
	mov	@r1,#0x50
;	../../../platform/cc2530dk/RC522/RC522.c:1061: ucComMF522Buf [ 1 ] = 0;
	mov	a,r1
	inc	a
	mov	r0,a
	mov	@r0,#0x00
;	../../../platform/cc2530dk/RC522/RC522.c:1063: CalulateCRC ( ucComMF522Buf, 2, & ucComMF522Buf [ 2 ] );
	mov	a,#0x02
	add	a,r1
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	ar4,r1
	mov	r3,#0x00
	mov	r2,#0x40
	push	ar1
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0x02
	push	acc
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	r0,#_CalulateCRC
	mov	r1,#(_CalulateCRC >> 8)
	mov	r2,#(_CalulateCRC >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
;	../../../platform/cc2530dk/RC522/RC522.c:1064: PcdComMF522 ( PCD_TRANSCEIVE, ucComMF522Buf, 4, ucComMF522Buf, & ulLen );
	mov	r7,sp
	dec	r7
	mov	r6,#0x00
	mov	r5,#0x40
	mov	ar4,r1
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x40
	mov	ar4,r1
	mov	r3,#0x00
	mov	r2,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#0x04
	push	acc
	push	ar4
	push	ar3
	push	ar2
	mov	dpl,#0x0c
	mov	r0,#_PcdComMF522
	mov	r1,#(_PcdComMF522 >> 8)
	mov	r2,#(_PcdComMF522 >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	../../../platform/cc2530dk/RC522/RC522.c:1066: return MI_OK;
	mov	dpl,#0x26
;	../../../platform/cc2530dk/RC522/RC522.c:1068: }
	mov	a,sp
	add	a,#0xe9
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IC_CMT'
;------------------------------------------------------------
;KEY                       Allocated to stack - sp -9
;RW                        Allocated to stack - sp -10
;Dat                       Allocated to stack - sp -13
;UID                       Allocated to registers r5 r6 r7 
;ucArray_ID                Allocated to stack - sp -3
;------------------------------------------------------------
;	../../../platform/cc2530dk/RC522/RC522.c:1071: void IC_CMT ( unsigned char * UID, unsigned char * KEY, unsigned char RW, unsigned char * Dat )
;	-----------------------------------------
;	 function IC_CMT
;	-----------------------------------------
_IC_CMT:
	mov	a,sp
	add	a,#0x04
	mov	sp,a
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../platform/cc2530dk/RC522/RC522.c:1073: unsigned char ucArray_ID [ 4 ] = { 0 };//先后存放IC卡的类型和UID(IC卡序列号)
	mov	a,sp
	add	a,#0xfd
	mov	r1,a
	mov	@r1,#0x00
	mov	a,r1
	inc	a
	mov	r0,a
	mov	@r0,#0x00
	mov	a,#0x02
	add	a,r1
	mov	r0,a
	mov	@r0,#0x00
	mov	a,#0x03
	add	a,r1
	mov	r0,a
	mov	@r0,#0x00
;	../../../platform/cc2530dk/RC522/RC522.c:1076: PcdRequest ( 0x52, ucArray_ID );//寻卡
	mov	ar4,r1
	mov	r3,#0x00
	mov	r2,#0x40
	push	ar7
	push	ar6
	push	ar5
	push	ar1
	push	ar4
	push	ar3
	push	ar2
	mov	dpl,#0x52
	mov	r0,#_PcdRequest
	mov	r1,#(_PcdRequest >> 8)
	mov	r2,#(_PcdRequest >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar1
;	../../../platform/cc2530dk/RC522/RC522.c:1078: PcdAnticoll ( ucArray_ID );//防冲撞
	mov	ar4,r1
	mov	r3,#0x00
	mov	r2,#0x40
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	r0,#_PcdAnticoll
	mov	r1,#(_PcdAnticoll >> 8)
	mov	r2,#(_PcdAnticoll >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:1080: PcdSelect ( UID );//选定卡
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_PcdSelect
	mov	r1,#(_PcdSelect >> 8)
	mov	r2,#(_PcdSelect >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/RC522/RC522.c:1082: PcdAuthState ( 0x60, 0x10, KEY, UID );//校验
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#0x10
	push	acc
	mov	dpl,#0x60
	mov	r0,#_PcdAuthState
	mov	r1,#(_PcdAuthState >> 8)
	mov	r2,#(_PcdAuthState >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xf9
;	../../../platform/cc2530dk/RC522/RC522.c:1085: if ( RW )//读写选择，1是读，0是写
	mov	sp,a
	add	a,#0xf6
	mov	r0,a
	mov	a,@r0
	jz	00102$
;	../../../platform/cc2530dk/RC522/RC522.c:1086: PcdRead ( 0x10, Dat );
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x10
	mov	r0,#_PcdRead
	mov	r1,#(_PcdRead >> 8)
	mov	r2,#(_PcdRead >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	sjmp	00103$
00102$:
;	../../../platform/cc2530dk/RC522/RC522.c:1089: PcdWrite ( 0x10, Dat );
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x10
	mov	r0,#_PcdWrite
	mov	r1,#(_PcdWrite >> 8)
	mov	r2,#(_PcdWrite >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00103$:
;	../../../platform/cc2530dk/RC522/RC522.c:1092: PcdHalt ();
	mov	r0,#_PcdHalt
	mov	r1,#(_PcdHalt >> 8)
	mov	r2,#(_PcdHalt >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/RC522/RC522.c:1094: }
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "0x"
	.db 0x00
	.area XINIT   (CODE)
__xinit__icd:
	.byte #0x00,#0x00	;  0
__xinit__i:
	.db #0x00	; 0
__xinit__IC_Card_Exist:
	.db #0x00	; 0
__xinit__pk:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
__xinit__ucArray_ID:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__date1:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__InitStatus:
	.db #0x00	; 0
	.area CABS    (ABS,CODE)
