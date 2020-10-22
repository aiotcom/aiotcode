;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module LORA
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SX1276LoRaSetRFFrequency
	.globl _SPI1_ReadWriteByte
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
	.globl _power_data
	.globl _powerValue
	.globl _Bw_Frequency
	.globl _CodingRate
	.globl _SpreadingFactor
	.globl _Frequency
	.globl _LR_Version
	.globl _RF_REC_RLEN_i
	.globl _CRC_Value
	.globl _RF_EX0_STATUS
	.globl _SX1278_RLEN
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
	.globl _SX1278_Init
	.globl _LORA_Init
	.globl _SX1278Reset
	.globl _SX1276WriteBuffer
	.globl _SX1276ReadBuffer
	.globl _SX1276LoRaSetOpMode
	.globl _SX1276LoRaFsk
	.globl _SX1276LoRaSetRFPower
	.globl _SX1276LoRaSetNbTrigPeaks
	.globl _SX1276LoRaSetSpreadingFactor
	.globl _SX1276LoRaSetErrorCoding
	.globl _SX1276LoRaSetPacketCrcOn
	.globl _SX1276LoRaSetSignalBandwidth
	.globl _SX1276LoRaSetImplicitHeaderOn
	.globl _SX1276LoRaSetSymbTimeout
	.globl _SX1276LoRaSetPayloadLength
	.globl _SX1276LoRaSetMobileNode
	.globl _SX1276LORA_INT
	.globl _FUN_RF_SENDPACKET
	.globl _RF_RECEIVE
	.globl _SX1278_InteruptHandler
	.globl _Sx1278SendLong
	.globl _ProcessRecv
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
_SX1278_RLEN::
	.ds 1
_RF_EX0_STATUS::
	.ds 1
_CRC_Value::
	.ds 1
_SX1276LoRaSetRFFrequency_FreqWord_65536_559:
	.ds 4
_RF_REC_RLEN_i::
	.ds 1
_state:
	.ds 1
_LR_Version::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_Frequency::
	.ds 3
_SpreadingFactor::
	.ds 1
_CodingRate::
	.ds 1
_Bw_Frequency::
	.ds 1
_powerValue::
	.ds 1
_power_data::
	.ds 8
_Wait_FLAG:
	.ds 2
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
;Allocation info for local variables in function 'SX1278_Init'
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:6: void SX1278_Init(void)
;	-----------------------------------------
;	 function SX1278_Init
;	-----------------------------------------
_SX1278_Init:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	../../../platform/cc2530dk/LORA/LORA.c:8: P0DIR |= BV(2);// for LED 
	orl	_P0DIR,#0x04
;	../../../platform/cc2530dk/LORA/LORA.c:9: P1DIR |= BV(6);// for MOSI 	
	orl	_P1DIR,#0x40
;	../../../platform/cc2530dk/LORA/LORA.c:10: P1DIR |= BV(5);// for SCK
	orl	_P1DIR,#0x20
;	../../../platform/cc2530dk/LORA/LORA.c:11: P1DIR |= BV(0);// for CS
	orl	_P1DIR,#0x01
;	../../../platform/cc2530dk/LORA/LORA.c:13: P1DIR &= ~BV(7);// for MISO input
	anl	_P1DIR,#0x7f
;	../../../platform/cc2530dk/LORA/LORA.c:14: P1INP |= BV(7);	
	orl	_P1INP,#0x80
;	../../../platform/cc2530dk/LORA/LORA.c:16: P1DIR |= BV(1);// for RST
	orl	_P1DIR,#0x02
;	../../../platform/cc2530dk/LORA/LORA.c:18: P0DIR &= ~BV(3);// for KEY input
	anl	_P0DIR,#0xf7
;	../../../platform/cc2530dk/LORA/LORA.c:19: P0INP |= BV(3);	
	orl	_P0INP,#0x08
;	../../../platform/cc2530dk/LORA/LORA.c:21: LED_SET = 1;
;	assignBit
	setb	_P0_2
;	../../../platform/cc2530dk/LORA/LORA.c:22: SPI_SCK = 0;
;	assignBit
	clr	_P1_5
;	../../../platform/cc2530dk/LORA/LORA.c:23: SX1278_CS_L();
;	assignBit
	clr	_P1_0
;	../../../platform/cc2530dk/LORA/LORA.c:24: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPI_RW_Dly'
;------------------------------------------------------------
;n                         Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:25: static void SPI_RW_Dly(uint32_t n)
;	-----------------------------------------
;	 function SPI_RW_Dly
;	-----------------------------------------
_SPI_RW_Dly:
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	../../../platform/cc2530dk/LORA/LORA.c:27: while(n--);
00101$:
	mov	ar0,r4
	mov	ar1,r5
	mov	ar2,r6
	mov	ar3,r7
	dec	r4
	cjne	r4,#0xff,00111$
	dec	r5
	cjne	r5,#0xff,00111$
	dec	r6
	cjne	r6,#0xff,00111$
	dec	r7
00111$:
	mov	a,r0
	orl	a,r1
	orl	a,r2
	orl	a,r3
	jnz	00101$
;	../../../platform/cc2530dk/LORA/LORA.c:28: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPI1_ReadWriteByte'
;------------------------------------------------------------
;TxData                    Allocated to registers r7 
;SPI_TxData                Allocated to registers r7 
;k                         Allocated to registers 
;RetData                   Allocated to registers r6 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:29: uint8_t SPI1_ReadWriteByte(uint8_t TxData)
;	-----------------------------------------
;	 function SPI1_ReadWriteByte
;	-----------------------------------------
_SPI1_ReadWriteByte:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:32: uint8_t RetData=0;
	mov	r6,#0x00
;	../../../platform/cc2530dk/LORA/LORA.c:33: SPI_TxData = TxData;
;	../../../platform/cc2530dk/LORA/LORA.c:35: for(k=0;k<8;k++)
	mov	r5,#0x00
00107$:
;	../../../platform/cc2530dk/LORA/LORA.c:37: if(SPI_TxData&0x80)
	mov	a,r7
	jnb	acc.7,00102$
;	../../../platform/cc2530dk/LORA/LORA.c:39: SPI_MOSI = 1;
;	assignBit
	setb	_P1_6
	sjmp	00103$
00102$:
;	../../../platform/cc2530dk/LORA/LORA.c:43: SPI_MOSI = 0;
;	assignBit
	clr	_P1_6
00103$:
;	../../../platform/cc2530dk/LORA/LORA.c:45: SPI_RW_Dly(15); 		
	mov	dptr,#(0x0f&0x00ff)
	clr	a
	mov	b,a
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_SPI_RW_Dly
	mov	r1,#(_SPI_RW_Dly >> 8)
	mov	r2,#(_SPI_RW_Dly >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:46: SPI_TxData = SPI_TxData <<1;
	mov	ar4,r7
	mov	a,r4
	add	a,r4
	mov	r7,a
;	../../../platform/cc2530dk/LORA/LORA.c:47: SPI_RW_Dly(15);
	mov	dptr,#(0x0f&0x00ff)
	clr	a
	mov	b,a
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_SPI_RW_Dly
	mov	r1,#(_SPI_RW_Dly >> 8)
	mov	r2,#(_SPI_RW_Dly >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:48: SPI_SCK = 1;
;	assignBit
	setb	_P1_5
;	../../../platform/cc2530dk/LORA/LORA.c:49: RetData = RetData <<1;	
	mov	ar4,r6
	mov	a,r4
	add	a,r4
	mov	r6,a
;	../../../platform/cc2530dk/LORA/LORA.c:50: if(SPI_MISO) 
	jnb	_P1_7,00105$
;	../../../platform/cc2530dk/LORA/LORA.c:52: RetData=RetData+0x01;
	mov	ar4,r6
	mov	a,r4
	inc	a
	mov	r6,a
00105$:
;	../../../platform/cc2530dk/LORA/LORA.c:54: SPI_SCK = 0;
;	assignBit
	clr	_P1_5
;	../../../platform/cc2530dk/LORA/LORA.c:35: for(k=0;k<8;k++)
	inc	r5
	cjne	r5,#0x08,00130$
00130$:
	jc	00107$
;	../../../platform/cc2530dk/LORA/LORA.c:56: SPI_SCK = 0;
;	assignBit
	clr	_P1_5
;	../../../platform/cc2530dk/LORA/LORA.c:57: return(RetData);       // return read byte        
	mov	dpl,r6
;	../../../platform/cc2530dk/LORA/LORA.c:58: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LORA_Init'
;------------------------------------------------------------
;freq                      Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:60: void LORA_Init(uint16_t freq)
;	-----------------------------------------
;	 function LORA_Init
;	-----------------------------------------
_LORA_Init:
	mov	r6,dpl
	mov	r7,dph
;	../../../platform/cc2530dk/LORA/LORA.c:62: SX1278_Init();
	push	ar7
	push	ar6
	mov	r0,#_SX1278_Init
	mov	r1,#(_SX1278_Init >> 8)
	mov	r2,#(_SX1278_Init >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:63: SX1278Reset();
	mov	r0,#_SX1278Reset
	mov	r1,#(_SX1278Reset >> 8)
	mov	r2,#(_SX1278Reset >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:64: SX1276LORA_INT(freq);
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_SX1276LORA_INT
	mov	r1,#(_SX1276LORA_INT >> 8)
	mov	r2,#(_SX1276LORA_INT >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:65: SX1278_RLEN = 0; 
	mov	dptr,#_SX1278_RLEN
	clr	a
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:67: if(SX1276ReadBuffer(REG_LR_VERSION) == 0x12)
	mov	dpl,#0x42
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	cjne	r7,#0x12,00103$
;	../../../platform/cc2530dk/LORA/LORA.c:69: LED_SET=0;
;	assignBit
	clr	_P0_2
;	../../../platform/cc2530dk/LORA/LORA.c:70: printf("lora on\r\n");
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
00103$:
;	../../../platform/cc2530dk/LORA/LORA.c:72: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1278Reset'
;------------------------------------------------------------
;i                         Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:87: void SX1278Reset(void)
;	-----------------------------------------
;	 function SX1278Reset
;	-----------------------------------------
_SX1278Reset:
;	../../../platform/cc2530dk/LORA/LORA.c:90: SX1278_RST_L();
;	assignBit
	clr	_P1_1
;	../../../platform/cc2530dk/LORA/LORA.c:91: i=10000;
	mov	r4,#0x10
	mov	r5,#0x27
	mov	r6,#0x00
	mov	r7,#0x00
;	../../../platform/cc2530dk/LORA/LORA.c:92: for(i=i;i>0;i--);
00104$:
	mov	a,r4
	orl	a,r5
	orl	a,r6
	orl	a,r7
	jz	00101$
	dec	r4
	cjne	r4,#0xff,00138$
	dec	r5
	cjne	r5,#0xff,00138$
	dec	r6
	cjne	r6,#0xff,00138$
	dec	r7
00138$:
	sjmp	00104$
00101$:
;	../../../platform/cc2530dk/LORA/LORA.c:93: SX1278_RST_H();
;	assignBit
	setb	_P1_1
;	../../../platform/cc2530dk/LORA/LORA.c:94: i=10000;
	mov	r4,#0x10
	mov	r5,#0x27
	mov	r6,#0x00
	mov	r7,#0x00
;	../../../platform/cc2530dk/LORA/LORA.c:95: for(i=i;i>0;i--);
00107$:
	mov	a,r4
	orl	a,r5
	orl	a,r6
	orl	a,r7
	jz	00109$
	dec	r4
	cjne	r4,#0xff,00140$
	dec	r5
	cjne	r5,#0xff,00140$
	dec	r6
	cjne	r6,#0xff,00140$
	dec	r7
00140$:
	sjmp	00107$
00109$:
;	../../../platform/cc2530dk/LORA/LORA.c:96: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276WriteBuffer'
;------------------------------------------------------------
;buffer                    Allocated to stack - sp -3
;addr                      Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:99: void SX1276WriteBuffer( unsigned char addr, unsigned char buffer)
;	-----------------------------------------
;	 function SX1276WriteBuffer
;	-----------------------------------------
_SX1276WriteBuffer:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:101: SX1278_CS_L(); //NSS = 0;选中芯片
;	assignBit
	clr	_P1_0
;	../../../platform/cc2530dk/LORA/LORA.c:102: SPI1_ReadWriteByte( addr | 0x80 );
	orl	ar7,#0x80
	mov	dpl,r7
	mov	r0,#_SPI1_ReadWriteByte
	mov	r1,#(_SPI1_ReadWriteByte >> 8)
	mov	r2,#(_SPI1_ReadWriteByte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:103: SPI1_ReadWriteByte( buffer);
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	dpl,@r0
	mov	r0,#_SPI1_ReadWriteByte
	mov	r1,#(_SPI1_ReadWriteByte >> 8)
	mov	r2,#(_SPI1_ReadWriteByte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:104: SX1278_CS_H(); //NSS = 1;
;	assignBit
	setb	_P1_0
;	../../../platform/cc2530dk/LORA/LORA.c:106: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276ReadBuffer'
;------------------------------------------------------------
;addr                      Allocated to registers r7 
;Value                     Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:109: uint8_t SX1276ReadBuffer(unsigned char addr)
;	-----------------------------------------
;	 function SX1276ReadBuffer
;	-----------------------------------------
_SX1276ReadBuffer:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:112: SX1278_CS_L(); //NSS = 0;
;	assignBit
	clr	_P1_0
;	../../../platform/cc2530dk/LORA/LORA.c:113: SPI1_ReadWriteByte( addr & 0x7f  );
	anl	ar7,#0x7f
	mov	dpl,r7
	mov	r0,#_SPI1_ReadWriteByte
	mov	r1,#(_SPI1_ReadWriteByte >> 8)
	mov	r2,#(_SPI1_ReadWriteByte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:114: Value = SPI1_ReadWriteByte(0xff);
	mov	dpl,#0xff
	mov	r0,#_SPI1_ReadWriteByte
	mov	r1,#(_SPI1_ReadWriteByte >> 8)
	mov	r2,#(_SPI1_ReadWriteByte >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:115: SX1278_CS_H();//NSS = 1;
;	assignBit
	setb	_P1_0
;	../../../platform/cc2530dk/LORA/LORA.c:116: return Value; 
	mov	dpl,r7
;	../../../platform/cc2530dk/LORA/LORA.c:117: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetOpMode'
;------------------------------------------------------------
;opMode                    Allocated to registers r7 
;opModePrev                Allocated to registers r6 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:119: void SX1276LoRaSetOpMode( RFMode_SET opMode )
;	-----------------------------------------
;	 function SX1276LoRaSetOpMode
;	-----------------------------------------
_SX1276LoRaSetOpMode:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:122: opModePrev=SX1276ReadBuffer(REG_LR_OPMODE);  //读0x01模式寄存器
	mov	dpl,#0x01
	push	ar7
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:123: opModePrev &=0xf8;  //清零低三位
	anl	ar6,#0xf8
;	../../../platform/cc2530dk/LORA/LORA.c:124: opModePrev |= (unsigned char)opMode; //或上形参
	mov	a,r6
	orl	ar7,a
;	../../../platform/cc2530dk/LORA/LORA.c:125: SX1276WriteBuffer( REG_LR_OPMODE, opModePrev); //重新写回去	
	push	ar7
	mov	dpl,#0x01
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:126: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaFsk'
;------------------------------------------------------------
;opMode                    Allocated to registers r7 
;opModePrev                Allocated to registers r6 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:128: void SX1276LoRaFsk( Debugging_fsk_ook opMode )
;	-----------------------------------------
;	 function SX1276LoRaFsk
;	-----------------------------------------
_SX1276LoRaFsk:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:131: opModePrev=SX1276ReadBuffer(REG_LR_OPMODE); //读0x01模式寄存器
	mov	dpl,#0x01
	push	ar7
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:132: opModePrev &=0x7F; //清零最高位
	anl	ar6,#0x7f
;	../../../platform/cc2530dk/LORA/LORA.c:133: opModePrev |= (unsigned char)opMode;  //或上形参
	mov	a,r6
	orl	ar7,a
;	../../../platform/cc2530dk/LORA/LORA.c:134: SX1276WriteBuffer( REG_LR_OPMODE, opModePrev); //重新写回去		
	push	ar7
	mov	dpl,#0x01
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:135: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetRFFrequency'
;------------------------------------------------------------
;freq                      Allocated to registers r6 r7 
;factor                    Allocated to registers 
;FreqWord                  Allocated with name '_SX1276LoRaSetRFFrequency_FreqWord_65536_559'
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:137: void SX1276LoRaSetRFFrequency(uint16_t freq)
;	-----------------------------------------
;	 function SX1276LoRaSetRFFrequency
;	-----------------------------------------
_SX1276LoRaSetRFFrequency:
	mov	r6,dpl
	mov	r7,dph
;	../../../platform/cc2530dk/LORA/LORA.c:141: FreqWord = (freq*1000000)/factor;
	mov	r5,#0x00
	mov	r4,#0x00
	push	ar6
	push	ar7
	push	ar5
	push	ar4
	mov	dptr,#0x4240
	mov	b,#0x0f
	clr	a
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___slong2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,#0xd7
	push	acc
	mov	a,#0x23
	push	acc
	mov	a,#0x74
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
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2ulong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	dptr,#_SX1276LoRaSetRFFrequency_FreqWord_65536_559
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
;	../../../platform/cc2530dk/LORA/LORA.c:143: Frequency[2] = (FreqWord&0xFF);
	mov	dptr,#(_Frequency + 0x0002)
	mov	a,r4
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:144: Frequency[1] = ((FreqWord>>8)&0xFF);
	mov	dptr,#_SX1276LoRaSetRFFrequency_FreqWord_65536_559
	movx	a,@dptr
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	inc	dptr
	movx	a,@dptr
	mov	ar4,r5
	mov	dptr,#(_Frequency + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:145: Frequency[0] = ((FreqWord>>16)&0xFF);
	mov	dptr,#_SX1276LoRaSetRFFrequency_FreqWord_65536_559
	movx	a,@dptr
	inc	dptr
	movx	a,@dptr
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	ar4,r6
	mov	dptr,#_Frequency
	mov	a,r4
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:147: SX1276WriteBuffer( REG_LR_FRFMSB, Frequency[0]);  //写0x06寄存器
	push	ar4
	mov	dpl,#0x06
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:148: SX1276WriteBuffer( REG_LR_FRFMID, Frequency[1]);  //写0x07寄存器
	mov	dptr,#(_Frequency + 0x0001)
	movx	a,@dptr
	mov	r7,a
	push	ar7
	mov	dpl,#0x07
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:149: SX1276WriteBuffer( REG_LR_FRFLSB, Frequency[2]);  //写0x08寄存器
	mov	dptr,#(_Frequency + 0x0002)
	movx	a,@dptr
	mov	r7,a
	push	ar7
	mov	dpl,#0x08
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:150: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetRFPower'
;------------------------------------------------------------
;power                     Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:152: void SX1276LoRaSetRFPower(unsigned char power )
;	-----------------------------------------
;	 function SX1276LoRaSetRFPower
;	-----------------------------------------
_SX1276LoRaSetRFPower:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:158: SX1276WriteBuffer( REG_LR_PADAC, 0x87);  //high power
	push	ar7
	mov	a,#0x87
	push	acc
	mov	dpl,#0x4d
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:159: SX1276WriteBuffer( REG_LR_PACONFIG,  power_data[power] ); //若没有这一句，频谱仪几乎测不到信号,但是可以进行正常收发。
	mov	a,r7
	add	a,#_power_data
	mov	dpl,a
	clr	a
	addc	a,#(_power_data >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	push	ar7
	mov	dpl,#0x09
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:164: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetNbTrigPeaks'
;------------------------------------------------------------
;value                     Allocated to registers r7 
;RECVER_DAT                Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:166: void SX1276LoRaSetNbTrigPeaks(unsigned char value )
;	-----------------------------------------
;	 function SX1276LoRaSetNbTrigPeaks
;	-----------------------------------------
_SX1276LoRaSetNbTrigPeaks:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:169: RECVER_DAT = SX1276ReadBuffer( 0x31);  //Read RegDetectOptimize,
	mov	dpl,#0x31
	push	ar7
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:170: RECVER_DAT = ( RECVER_DAT & 0xF8 ) | value; //process;
	anl	ar6,#0xf8
	mov	a,r6
	orl	ar7,a
;	../../../platform/cc2530dk/LORA/LORA.c:171: SX1276WriteBuffer( 0x31, RECVER_DAT );  //write back;
	push	ar7
	mov	dpl,#0x31
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:172: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetSpreadingFactor'
;------------------------------------------------------------
;factor                    Allocated to registers r7 
;RECVER_DAT                Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:174: void SX1276LoRaSetSpreadingFactor(unsigned char factor )
;	-----------------------------------------
;	 function SX1276LoRaSetSpreadingFactor
;	-----------------------------------------
_SX1276LoRaSetSpreadingFactor:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:177: SX1276LoRaSetNbTrigPeaks( 3 ); //0x03-->SF7 to SF12
	mov	dpl,#0x03
	push	ar7
	mov	r0,#_SX1276LoRaSetNbTrigPeaks
	mov	r1,#(_SX1276LoRaSetNbTrigPeaks >> 8)
	mov	r2,#(_SX1276LoRaSetNbTrigPeaks >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:178: RECVER_DAT=SX1276ReadBuffer( REG_LR_MODEMCONFIG2); //读0x1E寄存器  
	mov	dpl,#0x1e
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:179: RECVER_DAT = ( RECVER_DAT & RFLR_MODEMCONFIG2_SF_MASK ) | ( factor << 4 );
	anl	ar6,#0x0f
	mov	a,r7
	swap	a
	anl	a,#0xf0
	orl	ar6,a
;	../../../platform/cc2530dk/LORA/LORA.c:180: SX1276WriteBuffer( REG_LR_MODEMCONFIG2, RECVER_DAT );	 
	push	ar6
	mov	dpl,#0x1e
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:181: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetErrorCoding'
;------------------------------------------------------------
;value                     Allocated to registers r7 
;RECVER_DAT                Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:183: void SX1276LoRaSetErrorCoding(unsigned char value )
;	-----------------------------------------
;	 function SX1276LoRaSetErrorCoding
;	-----------------------------------------
_SX1276LoRaSetErrorCoding:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:186: RECVER_DAT=SX1276ReadBuffer( REG_LR_MODEMCONFIG1); //读0x1D寄存器
	mov	dpl,#0x1d
	push	ar7
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:187: RECVER_DAT = ( RECVER_DAT & RFLR_MODEMCONFIG1_CODINGRATE_MASK ) | ( value << 1 );
	anl	ar6,#0xf1
	mov	a,r7
	add	a,r7
	orl	ar6,a
;	../../../platform/cc2530dk/LORA/LORA.c:188: SX1276WriteBuffer( REG_LR_MODEMCONFIG1, RECVER_DAT);
	push	ar6
	mov	dpl,#0x1d
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:189: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetPacketCrcOn'
;------------------------------------------------------------
;enable                    Allocated to registers r7 
;RECVER_DAT                Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:191: void SX1276LoRaSetPacketCrcOn(uint8_t enable )
;	-----------------------------------------
;	 function SX1276LoRaSetPacketCrcOn
;	-----------------------------------------
_SX1276LoRaSetPacketCrcOn:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:194: RECVER_DAT= SX1276ReadBuffer( REG_LR_MODEMCONFIG2);  //读0x1E寄存器 
	mov	dpl,#0x1e
	push	ar7
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:195: RECVER_DAT = ( RECVER_DAT & RFLR_MODEMCONFIG2_RXPAYLOADCRC_MASK ) | ( enable << 2 );
	anl	ar6,#0xfb
	mov	a,r7
	add	a,r7
	add	a,acc
	orl	ar6,a
;	../../../platform/cc2530dk/LORA/LORA.c:196: SX1276WriteBuffer( REG_LR_MODEMCONFIG2, RECVER_DAT );
	push	ar6
	mov	dpl,#0x1e
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:197: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetSignalBandwidth'
;------------------------------------------------------------
;bw                        Allocated to registers r7 
;RECVER_DAT                Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:199: void SX1276LoRaSetSignalBandwidth(unsigned char bw )
;	-----------------------------------------
;	 function SX1276LoRaSetSignalBandwidth
;	-----------------------------------------
_SX1276LoRaSetSignalBandwidth:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:202: RECVER_DAT=SX1276ReadBuffer( REG_LR_MODEMCONFIG1);  //读0x1D寄存器
	mov	dpl,#0x1d
	push	ar7
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:203: RECVER_DAT = ( RECVER_DAT & RFLR_MODEMCONFIG1_BW_MASK ) | ( bw << 4 );
	anl	ar6,#0x0f
	mov	a,r7
	swap	a
	anl	a,#0xf0
	orl	ar6,a
;	../../../platform/cc2530dk/LORA/LORA.c:204: SX1276WriteBuffer( REG_LR_MODEMCONFIG1, RECVER_DAT );
	push	ar6
	mov	dpl,#0x1d
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:205: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetImplicitHeaderOn'
;------------------------------------------------------------
;enable                    Allocated to registers r7 
;RECVER_DAT                Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:207: void SX1276LoRaSetImplicitHeaderOn(uint8_t enable )
;	-----------------------------------------
;	 function SX1276LoRaSetImplicitHeaderOn
;	-----------------------------------------
_SX1276LoRaSetImplicitHeaderOn:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:210: RECVER_DAT=SX1276ReadBuffer( REG_LR_MODEMCONFIG1 );  //读0x1D寄存器
	mov	dpl,#0x1d
	push	ar7
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:211: RECVER_DAT = ( RECVER_DAT & RFLR_MODEMCONFIG1_IMPLICITHEADER_MASK ) | ( enable );
	anl	ar6,#0xfe
	mov	a,r6
	orl	ar7,a
;	../../../platform/cc2530dk/LORA/LORA.c:212: SX1276WriteBuffer( REG_LR_MODEMCONFIG1, RECVER_DAT );
	push	ar7
	mov	dpl,#0x1d
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:213: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetSymbTimeout'
;------------------------------------------------------------
;value                     Allocated to registers r6 r7 
;RECVER_DAT                Allocated to stack - sp -1
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:215: void SX1276LoRaSetSymbTimeout(unsigned int value )
;	-----------------------------------------
;	 function SX1276LoRaSetSymbTimeout
;	-----------------------------------------
_SX1276LoRaSetSymbTimeout:
	inc	sp
	inc	sp
	mov	r6,dpl
	mov	r7,dph
;	../../../platform/cc2530dk/LORA/LORA.c:218: RECVER_DAT[0]=SX1276ReadBuffer( REG_LR_MODEMCONFIG2 );    //读0x1E寄存器
	mov	r1,sp
	dec	r1
	mov	dpl,#0x1e
	push	ar7
	push	ar6
	push	ar1
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	pop	ar1
	mov	@r1,a
;	../../../platform/cc2530dk/LORA/LORA.c:219: RECVER_DAT[1]=SX1276ReadBuffer( REG_LR_SYMBTIMEOUTLSB );  //读0x1F寄存器
	mov	a,r1
	inc	a
	mov	r0,a
	mov	dpl,#0x1f
	push	ar1
	push	ar0
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	pop	ar0
	pop	ar1
	pop	ar6
	pop	ar7
	mov	@r0,a
;	../../../platform/cc2530dk/LORA/LORA.c:220: RECVER_DAT[0] = ( RECVER_DAT[0] & RFLR_MODEMCONFIG2_SYMBTIMEOUTMSB_MASK ) | ( ( value >> 8 ) & ~RFLR_MODEMCONFIG2_SYMBTIMEOUTMSB_MASK );
	mov	ar5,@r1
	anl	ar5,#0xfc
	mov	ar4,r7
	mov	a,#0x03
	anl	a,r4
	orl	ar5,a
	mov	@r1,ar5
;	../../../platform/cc2530dk/LORA/LORA.c:221: RECVER_DAT[1] = value & 0xFF;
	mov	@r0,ar6
;	../../../platform/cc2530dk/LORA/LORA.c:222: SX1276WriteBuffer( REG_LR_MODEMCONFIG2, RECVER_DAT[0]);
	push	ar0
	push	ar5
	mov	dpl,#0x1e
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar0
;	../../../platform/cc2530dk/LORA/LORA.c:223: SX1276WriteBuffer( REG_LR_SYMBTIMEOUTLSB, RECVER_DAT[1]);
	mov	ar7,@r0
	push	ar7
	mov	dpl,#0x1f
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:224: }
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetPayloadLength'
;------------------------------------------------------------
;value                     Allocated to registers r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:226: void SX1276LoRaSetPayloadLength(unsigned char value )
;	-----------------------------------------
;	 function SX1276LoRaSetPayloadLength
;	-----------------------------------------
_SX1276LoRaSetPayloadLength:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:228: SX1276WriteBuffer( REG_LR_PAYLOADLENGTH, value );  //写0x22寄存器
	push	ar7
	mov	dpl,#0x22
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:229: } 
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LoRaSetMobileNode'
;------------------------------------------------------------
;enable                    Allocated to registers r7 
;RECVER_DAT                Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:243: void SX1276LoRaSetMobileNode(BOOL_t enable )
;	-----------------------------------------
;	 function SX1276LoRaSetMobileNode
;	-----------------------------------------
_SX1276LoRaSetMobileNode:
	mov	r7,dpl
;	../../../platform/cc2530dk/LORA/LORA.c:246: RECVER_DAT=SX1276ReadBuffer( REG_LR_MODEMCONFIG3 );  //读0x26寄存器
	mov	dpl,#0x26
	push	ar7
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:247: RECVER_DAT = ( RECVER_DAT & RFLR_MODEMCONFIG3_MOBILE_NODE_MASK ) | ( enable << 3 );
	anl	ar6,#0xf7
	mov	a,r7
	swap	a
	rr	a
	anl	a,#0xf8
	orl	ar6,a
;	../../../platform/cc2530dk/LORA/LORA.c:248: SX1276WriteBuffer( REG_LR_MODEMCONFIG3, RECVER_DAT );
	push	ar6
	mov	dpl,#0x26
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:249: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1276LORA_INT'
;------------------------------------------------------------
;freq                      Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:251: void SX1276LORA_INT(uint16_t freq)
;	-----------------------------------------
;	 function SX1276LORA_INT
;	-----------------------------------------
_SX1276LORA_INT:
	mov	r6,dpl
	mov	r7,dph
;	../../../platform/cc2530dk/LORA/LORA.c:253: SX1276LoRaSetOpMode(Sleep_mode);  //设置睡眠模式
	mov	dpl,#0x00
	push	ar7
	push	ar6
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:254: SX1276LoRaFsk(LORA_mode);	     		// 设置扩频模式
	mov	dpl,#0x80
	mov	r0,#_SX1276LoRaFsk
	mov	r1,#(_SX1276LoRaFsk >> 8)
	mov	r2,#(_SX1276LoRaFsk >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:255: SX1276LoRaSetOpMode(Stdby_mode);  // 设置为普通模式
	mov	dpl,#0x01
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:256: SX1276WriteBuffer( REG_LR_DIOMAPPING1,GPIO_VARE_1); //写0x40寄存器,DIO引脚映射设置
	clr	a
	push	acc
	mov	dpl,#0x40
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:257: SX1276WriteBuffer( REG_LR_DIOMAPPING2,GPIO_VARE_2); //写0x41寄存器
	clr	a
	push	acc
	mov	dpl,#0x41
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:258: SX1276LoRaSetRFFrequency(freq);  			//频率设置
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_SX1276LoRaSetRFFrequency
	mov	r1,#(_SX1276LoRaSetRFFrequency >> 8)
	mov	r2,#(_SX1276LoRaSetRFFrequency >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:259: SX1276LoRaSetRFPower(powerValue); //功率设置
	mov	dptr,#_powerValue
	movx	a,@dptr
	mov	dpl,a
	mov	r0,#_SX1276LoRaSetRFPower
	mov	r1,#(_SX1276LoRaSetRFPower >> 8)
	mov	r2,#(_SX1276LoRaSetRFPower >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:260: SX1276LoRaSetSpreadingFactor(SpreadingFactor);	 		// 扩频因子设置
	mov	dptr,#_SpreadingFactor
	movx	a,@dptr
	mov	dpl,a
	mov	r0,#_SX1276LoRaSetSpreadingFactor
	mov	r1,#(_SX1276LoRaSetSpreadingFactor >> 8)
	mov	r2,#(_SX1276LoRaSetSpreadingFactor >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:261: SX1276LoRaSetErrorCoding(CodingRate);		 	//有效数据比
	mov	dptr,#_CodingRate
	movx	a,@dptr
	mov	dpl,a
	mov	r0,#_SX1276LoRaSetErrorCoding
	mov	r1,#(_SX1276LoRaSetErrorCoding >> 8)
	mov	r2,#(_SX1276LoRaSetErrorCoding >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:262: SX1276LoRaSetPacketCrcOn(true);			 			//CRC 校验打开
	mov	dpl,#0x01
	mov	r0,#_SX1276LoRaSetPacketCrcOn
	mov	r1,#(_SX1276LoRaSetPacketCrcOn >> 8)
	mov	r2,#(_SX1276LoRaSetPacketCrcOn >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:263: SX1276LoRaSetSignalBandwidth( Bw_Frequency );	 			//设置扩频带宽, 125khz
	mov	dptr,#_Bw_Frequency
	movx	a,@dptr
	mov	dpl,a
	mov	r0,#_SX1276LoRaSetSignalBandwidth
	mov	r1,#(_SX1276LoRaSetSignalBandwidth >> 8)
	mov	r2,#(_SX1276LoRaSetSignalBandwidth >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:264: SX1276LoRaSetImplicitHeaderOn(false);		 	//同步头是显性模式
	mov	dpl,#0x00
	mov	r0,#_SX1276LoRaSetImplicitHeaderOn
	mov	r1,#(_SX1276LoRaSetImplicitHeaderOn >> 8)
	mov	r2,#(_SX1276LoRaSetImplicitHeaderOn >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:265: SX1276LoRaSetPayloadLength( 0xff);
	mov	dpl,#0xff
	mov	r0,#_SX1276LoRaSetPayloadLength
	mov	r1,#(_SX1276LoRaSetPayloadLength >> 8)
	mov	r2,#(_SX1276LoRaSetPayloadLength >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:266: SX1276LoRaSetSymbTimeout( 0x3FF );
	mov	dptr,#0x03ff
	mov	r0,#_SX1276LoRaSetSymbTimeout
	mov	r1,#(_SX1276LoRaSetSymbTimeout >> 8)
	mov	r2,#(_SX1276LoRaSetSymbTimeout >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:267: SX1276LoRaSetMobileNode(true); 			 			// 低数据的优化
	mov	dpl,#0x01
	mov	r0,#_SX1276LoRaSetMobileNode
	mov	r1,#(_SX1276LoRaSetMobileNode >> 8)
	mov	r2,#(_SX1276LoRaSetMobileNode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:269: RF_RECEIVE();
	mov	r0,#_RF_RECEIVE
	mov	r1,#(_RF_RECEIVE >> 8)
	mov	r2,#(_RF_RECEIVE >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:270: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'FUN_RF_SENDPACKET'
;------------------------------------------------------------
;LEN                       Allocated to stack - sp -3
;RF_TRAN_P                 Allocated to registers r5 r6 r7 
;ASM_i                     Allocated to registers 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:272: void FUN_RF_SENDPACKET(unsigned char *RF_TRAN_P,unsigned char LEN)
;	-----------------------------------------
;	 function FUN_RF_SENDPACKET
;	-----------------------------------------
_FUN_RF_SENDPACKET:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../platform/cc2530dk/LORA/LORA.c:276: SX1276LoRaSetOpMode( Stdby_mode );
	mov	dpl,#0x01
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:277: SX1276WriteBuffer( REG_LR_HOPPERIOD, 0 );			//不做频率跳变
	clr	a
	push	acc
	mov	dpl,#0x24
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:278: SX1276WriteBuffer(REG_LR_IRQFLAGSMASK,IRQN_TXD_Value);	//打开发送中断
	mov	a,#0xf7
	push	acc
	mov	dpl,#0x11
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:279: SX1276WriteBuffer( REG_LR_PAYLOADLENGTH, LEN);//最大数据包
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,@r0
	push	acc
	mov	dpl,#0x22
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:280: SX1276WriteBuffer( REG_LR_FIFOTXBASEADDR, 0); //写Tx FIFO基址
	clr	a
	push	acc
	mov	dpl,#0x0e
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:281: SX1276WriteBuffer( REG_LR_FIFOADDRPTR, 0 ); 	//SPI interface address pointer in FIFO data buffer
	clr	a
	push	acc
	mov	dpl,#0x0d
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:282: SX1278_CS_L();   //开片选
;	assignBit
	clr	_P1_0
;	../../../platform/cc2530dk/LORA/LORA.c:283: SPI1_ReadWriteByte( 0x80 );
	mov	dpl,#0x80
	mov	r0,#_SPI1_ReadWriteByte
	mov	r1,#(_SPI1_ReadWriteByte >> 8)
	mov	r2,#(_SPI1_ReadWriteByte >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:284: for( ASM_i = 0; ASM_i < LEN; ASM_i++ )
	mov	r4,#0x00
00103$:
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	clr	c
	mov	a,r4
	subb	a,@r0
	jnc	00101$
;	../../../platform/cc2530dk/LORA/LORA.c:286: SPI1_ReadWriteByte( *RF_TRAN_P );RF_TRAN_P++;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	mov	r5,dpl
	mov	r6,dph
	mov	dpl,r3
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	mov	r0,#_SPI1_ReadWriteByte
	mov	r1,#(_SPI1_ReadWriteByte >> 8)
	mov	r2,#(_SPI1_ReadWriteByte >> 16)
	lcall	__sdcc_banked_call
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:284: for( ASM_i = 0; ASM_i < LEN; ASM_i++ )
	inc	r4
	sjmp	00103$
00101$:
;	../../../platform/cc2530dk/LORA/LORA.c:288: SX1278_CS_H();  //关片选
;	assignBit
	setb	_P1_0
;	../../../platform/cc2530dk/LORA/LORA.c:289: SX1276WriteBuffer(REG_LR_DIOMAPPING1,0x40);  //发射中断映射到DIO0引脚
	mov	a,#0x40
	push	acc
	mov	dpl,#0x40
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:290: SX1276WriteBuffer(REG_LR_DIOMAPPING2,0x00);
	clr	a
	push	acc
	mov	dpl,#0x41
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:291: SX1276LoRaSetOpMode( Transmitter_mode );     //设置为传输模式
	mov	dpl,#0x03
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:293: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'RF_RECEIVE'
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:294: void RF_RECEIVE (void)
;	-----------------------------------------
;	 function RF_RECEIVE
;	-----------------------------------------
_RF_RECEIVE:
;	../../../platform/cc2530dk/LORA/LORA.c:296: SX1276LoRaSetOpMode(Stdby_mode );
	mov	dpl,#0x01
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:297: SX1276WriteBuffer(REG_LR_IRQFLAGSMASK,IRQN_RXD_Value);  //0x11,打开接收中断
	mov	a,#0x9f
	push	acc
	mov	dpl,#0x11
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:298: SX1276WriteBuffer(REG_LR_HOPPERIOD,	PACKET_MIAX_Value );//0x24寄存器
	mov	a,#0xff
	push	acc
	mov	dpl,#0x24
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:299: SX1276WriteBuffer( REG_LR_DIOMAPPING1, 0X00 ); 					//DIO引脚映射设置，按默认
	clr	a
	push	acc
	mov	dpl,#0x40
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:300: SX1276WriteBuffer( REG_LR_DIOMAPPING2, 0X00 );	
	clr	a
	push	acc
	mov	dpl,#0x41
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:301: SX1276LoRaSetOpMode( Receiver_mode );  //设置为连续接收模式
	mov	dpl,#0x05
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:302: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SX1278_InteruptHandler'
;------------------------------------------------------------
;pRecv                     Allocated to stack - sp -3
;ret                       Allocated to stack - sp +0
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:346: uint8_t SX1278_InteruptHandler(uint8_t *pRecv)
;	-----------------------------------------
;	 function SX1278_InteruptHandler
;	-----------------------------------------
_SX1278_InteruptHandler:
	push	dpl
	push	dph
	push	b
	inc	sp
;	../../../platform/cc2530dk/LORA/LORA.c:349: RF_EX0_STATUS=SX1276ReadBuffer( REG_LR_IRQFLAGS ); 
	mov	dpl,#0x12
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	mov	dptr,#_RF_EX0_STATUS
	mov	a,r4
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:350: if((RF_EX0_STATUS&0x40)==0x40)  //接收完成
	anl	ar4,#0x40
	mov	r3,#0x00
	cjne	r4,#0x40,00155$
	cjne	r3,#0x00,00155$
	sjmp	00156$
00155$:
	ljmp	00116$
00156$:
;	../../../platform/cc2530dk/LORA/LORA.c:352: CRC_Value=SX1276ReadBuffer( REG_LR_MODEMCONFIG2 );
	mov	dpl,#0x1e
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	mov	dptr,#_CRC_Value
	mov	a,r4
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:353: if((CRC_Value&0x04)==0x04) //是否打开CRC校验
	anl	ar4,#0x04
	mov	r3,#0x00
	cjne	r4,#0x04,00157$
	cjne	r3,#0x00,00157$
	sjmp	00158$
00157$:
	ljmp	00105$
00158$:
;	../../../platform/cc2530dk/LORA/LORA.c:355: SX1276WriteBuffer (REG_LR_FIFOADDRPTR,0x00);
	clr	a
	push	acc
	mov	dpl,#0x0d
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:356: SX1278_RLEN = SX1276ReadBuffer(REG_LR_NBRXBYTES); //读取最后一个包的字节数
	mov	dpl,#0x13
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	dptr,#_SX1278_RLEN
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:357: SX1278_CS_L();
;	assignBit
	clr	_P1_0
;	../../../platform/cc2530dk/LORA/LORA.c:358: SPI1_ReadWriteByte( 0x00 );
	mov	dpl,#0x00
	mov	r0,#_SPI1_ReadWriteByte
	mov	r1,#(_SPI1_ReadWriteByte >> 8)
	mov	r2,#(_SPI1_ReadWriteByte >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:359: if(SX1278_RLEN > 249)  //接收不超过10个字节
	mov	dptr,#_SX1278_RLEN
	movx	a,@dptr
	mov  r4,a
	add	a,#0xff - 0xf9
	jnc	00102$
;	../../../platform/cc2530dk/LORA/LORA.c:360: SX1278_RLEN = 249;			
	mov	dptr,#_SX1278_RLEN
	mov	a,#0xf9
	movx	@dptr,a
00102$:
;	../../../platform/cc2530dk/LORA/LORA.c:361: for(RF_REC_RLEN_i=0;RF_REC_RLEN_i<SX1278_RLEN;RF_REC_RLEN_i++)
	mov	dptr,#_RF_REC_RLEN_i
	clr	a
	movx	@dptr,a
00119$:
	mov	dptr,#_RF_REC_RLEN_i
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_SX1278_RLEN
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,r4
	subb	a,r3
	jnc	00103$
;	../../../platform/cc2530dk/LORA/LORA.c:363: pRecv[RF_REC_RLEN_i]=SPI1_ReadWriteByte(0xff);		
	mov	dptr,#_RF_REC_RLEN_i
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	r4,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar2,@r0
	mov	dpl,#0xff
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_SPI1_ReadWriteByte
	mov	r1,#(_SPI1_ReadWriteByte >> 8)
	mov	r2,#(_SPI1_ReadWriteByte >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	pop	ar2
	pop	ar3
	pop	ar4
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	a,r7
	lcall	__gptrput
;	../../../platform/cc2530dk/LORA/LORA.c:361: for(RF_REC_RLEN_i=0;RF_REC_RLEN_i<SX1278_RLEN;RF_REC_RLEN_i++)
	mov	dptr,#_RF_REC_RLEN_i
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	sjmp	00119$
00103$:
;	../../../platform/cc2530dk/LORA/LORA.c:365: SX1278_CS_H();
;	assignBit
	setb	_P1_0
00105$:
;	../../../platform/cc2530dk/LORA/LORA.c:367: SX1276LoRaSetOpMode( Stdby_mode );
	mov	dpl,#0x01
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:368: SX1276WriteBuffer(REG_LR_IRQFLAGSMASK, IRQN_RXD_Value);  //打开发送中断
	mov	a,#0x9f
	push	acc
	mov	dpl,#0x11
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:369: SX1276WriteBuffer(REG_LR_HOPPERIOD,    PACKET_MIAX_Value);
	mov	a,#0xff
	push	acc
	mov	dpl,#0x24
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:370: SX1276WriteBuffer( REG_LR_DIOMAPPING1, 0X00 );
	clr	a
	push	acc
	mov	dpl,#0x40
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:371: SX1276WriteBuffer( REG_LR_DIOMAPPING2, 0x00 );	
	clr	a
	push	acc
	mov	dpl,#0x41
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:372: SX1276LoRaSetOpMode( Receiver_mode );
	mov	dpl,#0x05
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:374: ret = INT_FLG_RX_DONE;
	mov	r7,#0x01
	ljmp	00117$
00116$:
;	../../../platform/cc2530dk/LORA/LORA.c:376: else if((RF_EX0_STATUS&0x08)==0x08)  //发射完成
	mov	dptr,#_RF_EX0_STATUS
	movx	a,@dptr
	mov	r6,a
	anl	ar6,#0x08
	mov	r5,#0x00
	cjne	r6,#0x08,00113$
	cjne	r5,#0x00,00113$
;	../../../platform/cc2530dk/LORA/LORA.c:378: SX1276LoRaSetOpMode( Stdby_mode );
	mov	dpl,#0x01
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:379: SX1276WriteBuffer(REG_LR_IRQFLAGSMASK,IRQN_RXD_Value);	//打开发送中断
	mov	a,#0x9f
	push	acc
	mov	dpl,#0x11
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:380: SX1276WriteBuffer(REG_LR_HOPPERIOD,   PACKET_MIAX_Value );
	mov	a,#0xff
	push	acc
	mov	dpl,#0x24
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:381: SX1276WriteBuffer( REG_LR_DIOMAPPING1, 0X00 );
	clr	a
	push	acc
	mov	dpl,#0x40
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:382: SX1276WriteBuffer( REG_LR_DIOMAPPING2, 0x00 );	
	clr	a
	push	acc
	mov	dpl,#0x41
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:383: SX1276LoRaSetOpMode( Receiver_mode );
	mov	dpl,#0x05
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:385: ret = INT_FLG_TX_DONE;
	mov	r7,#0x02
	ljmp	00117$
00113$:
;	../../../platform/cc2530dk/LORA/LORA.c:387: else if((RF_EX0_STATUS&0x04)==0x04)  //cad完成
	mov	dptr,#_RF_EX0_STATUS
	movx	a,@dptr
	mov	r6,a
	anl	ar6,#0x04
	mov	r5,#0x00
	cjne	r6,#0x04,00163$
	cjne	r5,#0x00,00163$
	sjmp	00164$
00163$:
	ljmp	00110$
00164$:
;	../../../platform/cc2530dk/LORA/LORA.c:389: if((RF_EX0_STATUS&0x01)==0x01)
	mov	dptr,#_RF_EX0_STATUS
	movx	a,@dptr
	mov	r6,a
	anl	ar6,#0x01
	mov	r5,#0x00
	cjne	r6,#0x01,00107$
	cjne	r5,#0x00,00107$
;	../../../platform/cc2530dk/LORA/LORA.c:392: SX1276LoRaSetOpMode( Stdby_mode );
	mov	dpl,#0x01
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:393: SX1276WriteBuffer(REG_LR_IRQFLAGSMASK,IRQN_RXD_Value);	//打开发送中断
	mov	a,#0x9f
	push	acc
	mov	dpl,#0x11
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:394: SX1276WriteBuffer(REG_LR_HOPPERIOD,   PACKET_MIAX_Value );
	mov	a,#0xff
	push	acc
	mov	dpl,#0x24
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:395: SX1276WriteBuffer( REG_LR_DIOMAPPING1, 0X02 );
	mov	a,#0x02
	push	acc
	mov	dpl,#0x40
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:396: SX1276WriteBuffer( REG_LR_DIOMAPPING2, 0x00 );	
	clr	a
	push	acc
	mov	dpl,#0x41
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:397: SX1276LoRaSetOpMode( Receiver_mode );
	mov	dpl,#0x05
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:399: ret = INT_FLG_CAD_DONE;
	mov	r7,#0x03
	ljmp	00117$
00107$:
;	../../../platform/cc2530dk/LORA/LORA.c:404: SX1276LoRaSetOpMode( Stdby_mode );
	mov	dpl,#0x01
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:405: SX1276WriteBuffer(REG_LR_IRQFLAGSMASK,	IRQN_SEELP_Value);	//打开发送中断
	mov	a,#0xff
	push	acc
	mov	dpl,#0x11
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:406: SX1276WriteBuffer( REG_LR_DIOMAPPING1, 0X00 );
	clr	a
	push	acc
	mov	dpl,#0x40
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:407: SX1276WriteBuffer( REG_LR_DIOMAPPING2, 0X00 );	
	clr	a
	push	acc
	mov	dpl,#0x41
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:408: SX1276LoRaSetOpMode( Sleep_mode );
	mov	dpl,#0x00
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:410: ret = INT_FLG_CAD_FAIL;
	mov	r7,#0x04
	sjmp	00117$
00110$:
;	../../../platform/cc2530dk/LORA/LORA.c:415: SX1276LoRaSetOpMode( Stdby_mode );
	mov	dpl,#0x01
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
;	../../../platform/cc2530dk/LORA/LORA.c:416: SX1276WriteBuffer(REG_LR_IRQFLAGSMASK,IRQN_RXD_Value);	//打开发送中断
	mov	a,#0x9f
	push	acc
	mov	dpl,#0x11
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:417: SX1276WriteBuffer(REG_LR_HOPPERIOD,   PACKET_MIAX_Value );
	mov	a,#0xff
	push	acc
	mov	dpl,#0x24
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:418: SX1276WriteBuffer( REG_LR_DIOMAPPING1, 0X02 );
	mov	a,#0x02
	push	acc
	mov	dpl,#0x40
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:419: SX1276WriteBuffer( REG_LR_DIOMAPPING2, 0x00 );	
	clr	a
	push	acc
	mov	dpl,#0x41
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:420: SX1276LoRaSetOpMode( Receiver_mode );
	mov	dpl,#0x05
	mov	r0,#_SX1276LoRaSetOpMode
	mov	r1,#(_SX1276LoRaSetOpMode >> 8)
	mov	r2,#(_SX1276LoRaSetOpMode >> 16)
	lcall	__sdcc_banked_call
00117$:
;	../../../platform/cc2530dk/LORA/LORA.c:423: SX1276WriteBuffer( REG_LR_IRQFLAGS, 0xff  );
	push	ar7
	mov	a,#0xff
	push	acc
	mov	dpl,#0x12
	mov	r0,#_SX1276WriteBuffer
	mov	r1,#(_SX1276WriteBuffer >> 8)
	mov	r2,#(_SX1276WriteBuffer >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	pop	ar7
;	../../../platform/cc2530dk/LORA/LORA.c:425: return ret;
	mov	dpl,r7
;	../../../platform/cc2530dk/LORA/LORA.c:427: }
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Sx1278SendLong'
;------------------------------------------------------------
;LEN                       Allocated to stack - sp -3
;RF_TRAN_P                 Allocated to registers r5 r6 r7 
;Irq_flag                  Allocated to registers r7 
;ret                       Allocated to registers r4 
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:431: uint8_t Sx1278SendLong(unsigned char *RF_TRAN_P,unsigned char LEN)
;	-----------------------------------------
;	 function Sx1278SendLong
;	-----------------------------------------
_Sx1278SendLong:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../platform/cc2530dk/LORA/LORA.c:433: uint8_t  Irq_flag=0,ret=0xff;
	mov	r4,#0xff
;	../../../platform/cc2530dk/LORA/LORA.c:435: switch(state)
	mov	dptr,#_state
	movx	a,@dptr
	mov	r3,a
	jz	00101$
	cjne	r3,#0x01,00139$
	sjmp	00102$
00139$:
	cjne	r3,#0x02,00140$
	ljmp	00108$
00140$:
	ljmp	00111$
;	../../../platform/cc2530dk/LORA/LORA.c:437: case 0:
00101$:
;	../../../platform/cc2530dk/LORA/LORA.c:438: FUN_RF_SENDPACKET(RF_TRAN_P,LEN); //发射数据	
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_FUN_RF_SENDPACKET
	mov	r1,#(_FUN_RF_SENDPACKET >> 8)
	mov	r2,#(_FUN_RF_SENDPACKET >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../platform/cc2530dk/LORA/LORA.c:439: Wait_FLAG = 10;
	mov	dptr,#_Wait_FLAG
	mov	a,#0x0a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:440: state = 1;
	mov	dptr,#_state
	inc	a
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:441: ret = 1;
	mov	r4,#0x01
;	../../../platform/cc2530dk/LORA/LORA.c:442: break;
	ljmp	00111$
;	../../../platform/cc2530dk/LORA/LORA.c:444: case 1:
00102$:
;	../../../platform/cc2530dk/LORA/LORA.c:445: Irq_flag=SX1276ReadBuffer( REG_LR_IRQFLAGS );
	mov	dpl,#0x12
	push	ar4
	mov	r0,#_SX1276ReadBuffer
	mov	r1,#(_SX1276ReadBuffer >> 8)
	mov	r2,#(_SX1276ReadBuffer >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	pop	ar4
;	../../../platform/cc2530dk/LORA/LORA.c:446: if((Irq_flag&0x08) != 0x08)
	anl	ar7,#0x08
	mov	r6,#0x00
	cjne	r7,#0x08,00141$
	cjne	r6,#0x00,00141$
	sjmp	00106$
00141$:
;	../../../platform/cc2530dk/LORA/LORA.c:448: Wait_FLAG--;
	mov	dptr,#_Wait_FLAG
	movx	a,@dptr
	add	a,#0xff
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0xff
	mov	r7,a
	mov	dptr,#_Wait_FLAG
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:449: if(!Wait_FLAG)
	mov	dptr,#_Wait_FLAG
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00111$
;	../../../platform/cc2530dk/LORA/LORA.c:451: state = 0;
	mov	dptr,#_state
	clr	a
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:452: ret = 0;
	mov	r4,#0x00
	sjmp	00111$
00106$:
;	../../../platform/cc2530dk/LORA/LORA.c:457: Wait_FLAG = 5;
	mov	dptr,#_Wait_FLAG
	mov	a,#0x05
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:458: state = 2;
	mov	dptr,#_state
	mov	a,#0x02
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:459: ret = 3;
	mov	r4,#0x03
;	../../../platform/cc2530dk/LORA/LORA.c:461: break;
;	../../../platform/cc2530dk/LORA/LORA.c:462: case 2:
	sjmp	00111$
00108$:
;	../../../platform/cc2530dk/LORA/LORA.c:463: if((--Wait_FLAG)==0)
	mov	dptr,#_Wait_FLAG
	movx	a,@dptr
	add	a,#0xff
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0xff
	mov	r7,a
	mov	dptr,#_Wait_FLAG
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_Wait_FLAG
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00111$
;	../../../platform/cc2530dk/LORA/LORA.c:465: state = 0;
	mov	dptr,#_state
	clr	a
	movx	@dptr,a
;	../../../platform/cc2530dk/LORA/LORA.c:466: ret   = 0;
	mov	r4,#0x00
;	../../../platform/cc2530dk/LORA/LORA.c:469: }
00111$:
;	../../../platform/cc2530dk/LORA/LORA.c:471: return ret;
	mov	dpl,r4
;	../../../platform/cc2530dk/LORA/LORA.c:472: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ProcessRecv'
;------------------------------------------------------------
;	../../../platform/cc2530dk/LORA/LORA.c:474: void ProcessRecv(void)
;	-----------------------------------------
;	 function ProcessRecv
;	-----------------------------------------
_ProcessRecv:
;	../../../platform/cc2530dk/LORA/LORA.c:483: }
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "lora on"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area XINIT   (CODE)
__xinit__Frequency:
	.db #0x6c	; 108	'l'
	.db #0x80	; 128
	.db #0x00	; 0
__xinit__SpreadingFactor:
	.db #0x0b	; 11
__xinit__CodingRate:
	.db #0x02	; 2
__xinit__Bw_Frequency:
	.db #0x07	; 7
__xinit__powerValue:
	.db #0x07	; 7
__xinit__power_data:
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x86	; 134
	.db #0x89	; 137
	.db #0x8c	; 140
	.db #0x8f	; 143
__xinit__Wait_FLAG:
	.byte #0x0a,#0x00	; 10
	.area CABS    (ABS,CODE)
