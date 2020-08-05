;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module rpl_icmp6
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _packetbuf_addr
	.globl _rpl_reset_dio_timer
	.globl _rpl_add_route
	.globl _rpl_find_parent
	.globl _rpl_process_dio
	.globl _rpl_get_instance
	.globl _uip_icmp6_send
	.globl _uip_ds6_nbr_lookup
	.globl _uip_ds6_nbr_add
	.globl _uip_ds6_route_lookup
	.globl _stimer_set
	.globl ___memcpy
	.globl _memset
	.globl _memcmp
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
	.globl _dis_output
	.globl _dio_output
	.globl _dao_output
	.globl _dao_ack_output
	.globl _uip_rpl_input
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
_addr:
	.ds 16
_prefix:
	.ds 16
_dio:
	.ds 87
_from:
	.ds 16
_dao_sender_addr:
	.ds 16
_dis_output_tmpaddr_65536_306:
	.ds 16
_dio_output_pos_65536_330:
	.ds 2
_dao_input_sequence_65536_342:
	.ds 2
_dao_input_instance_id_65536_342:
	.ds 1
_dao_input_lifetime_65536_342:
	.ds 1
_dao_input_prefixlen_65536_342:
	.ds 1
_dao_input_buffer_length_65536_342:
	.ds 1
_dao_input_pos_65536_342:
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_dao_sequence:
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
;Allocation info for local variables in function 'get_global_addr'
;------------------------------------------------------------
;addr                      Allocated to stack - sp -10
;i                         Allocated to registers r3 r4 
;state                     Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -7
;sloc1                     Allocated to stack - sp -5
;sloc2                     Allocated to stack - sp -3
;sloc3                     Allocated to stack - sp +3
;sloc4                     Allocated to stack - sp +6
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:106: get_global_addr(uip_ipaddr_t *addr)
;	-----------------------------------------
;	 function get_global_addr
;	-----------------------------------------
_get_global_addr:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x08
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:111: for(i = 0; i < UIP_DS6_ADDR_NB; i++) {
	mov	r3,#0x00
	mov	r4,#0x00
	mov	ar2,r3
	mov	ar7,r4
	push	ar7
	push	ar4
	push	ar3
	push	ar2
	mov	a,#0x1c
	push	acc
	clr	a
	push	acc
	mov	dpl,r3
	mov	dph,r4
	lcall	__mulint
	mov	r5,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar7
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
00109$:
;	../../../core/net/rpl/rpl-icmp6.c:112: state = uip_ds6_if.addr_list[i].state;
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,sp
	add	a,#0xfb
	mov	r1,a
	mov	a,@r0
	add	a,#(_uip_ds6_if + 0x0012)
	mov	@r1,a
	inc	r0
	mov	a,@r0
	addc	a,#((_uip_ds6_if + 0x0012) >> 8)
	inc	r1
	mov	@r1,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x11
	add	a,@r0
	mov	dpl,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/rpl/rpl-icmp6.c:113: if(uip_ds6_if.addr_list[i].isused &&
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	movx	a,@dptr
	pop	ar4
	pop	ar3
	jnz	00133$
	ljmp	00110$
00133$:
;	../../../core/net/rpl/rpl-icmp6.c:114: (state == ADDR_TENTATIVE || state == ADDR_PREFERRED)) {
	mov	r0,sp
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00104$
	mov	r0,sp
	dec	r0
	cjne	@r0,#0x01,00135$
	inc	r0
	cjne	@r0,#0x00,00135$
	sjmp	00136$
00135$:
	ljmp	00110$
00136$:
00104$:
;	../../../core/net/rpl/rpl-icmp6.c:115: if(!uip_is_addr_link_local(&uip_ds6_if.addr_list[i].ipaddr)) {
	push	ar3
	push	ar4
	mov	a,r5
	add	a,#(_uip_ds6_if + 0x0012)
	mov	r3,a
	mov	a,r6
	addc	a,#((_uip_ds6_if + 0x0012) >> 8)
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0xfe,00137$
	sjmp	00138$
00137$:
	pop	ar4
	pop	ar3
	sjmp	00101$
00138$:
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	add	a,#(_uip_ds6_if + 0x0012)
	mov	r3,a
	inc	r0
	mov	a,@r0
	addc	a,#((_uip_ds6_if + 0x0012) >> 8)
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0x80,00139$
	pop	ar4
	pop	ar3
	sjmp	00110$
00139$:
	pop	ar4
	pop	ar3
00101$:
;	../../../core/net/rpl/rpl-icmp6.c:116: memcpy(addr, &uip_ds6_if.addr_list[i].ipaddr, sizeof(uip_ipaddr_t));
	push	ar3
	push	ar4
	mov	dptr,#0x001c
	lcall	__mulint
	mov	r7,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	mov	a,r7
	add	a,#(_uip_ds6_if + 0x0012)
	mov	r7,a
	mov	a,r6
	addc	a,#((_uip_ds6_if + 0x0012) >> 8)
	mov	r6,a
	inc	r7
	cjne	r7,#0x00,00140$
	inc	r6
00140$:
	mov	r5,#0x00
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar2,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar7
	push	ar6
	push	ar5
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:117: return 1;
	mov	dptr,#0x0001
	sjmp	00111$
00110$:
;	../../../core/net/rpl/rpl-icmp6.c:111: for(i = 0; i < UIP_DS6_ADDR_NB; i++) {
	mov	a,#0x1c
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,#0x1c
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1c
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	inc	r2
	cjne	r2,#0x00,00141$
	inc	r7
00141$:
	mov	ar3,r2
	mov	ar4,r7
	clr	c
	mov	a,r2
	subb	a,#0x03
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00142$
	ljmp	00109$
00142$:
;	../../../core/net/rpl/rpl-icmp6.c:121: return 0;
	mov	dptr,#0x0000
00111$:
;	../../../core/net/rpl/rpl-icmp6.c:122: }
	mov	a,sp
	add	a,#0xf5
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get32'
;------------------------------------------------------------
;pos                       Allocated to stack - sp -11
;buffer                    Allocated to stack - sp -6
;sloc0                     Allocated to stack - sp -3
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:125: get32(uint8_t *buffer, int pos)
;	-----------------------------------------
;	 function get32
;	-----------------------------------------
_get32:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x04
;	../../../core/net/rpl/rpl-icmp6.c:127: return (uint32_t)buffer[pos] << 24 | (uint32_t)buffer[pos + 1] << 16 |
	mov	sp,a
	add	a,#0xfa
	mov	r0,a
	mov	a,sp
	add	a,#0xf5
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	mov	r2,a
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r2,a
	clr	a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	inc	r0
	inc	r0
	inc	r0
	mov	@r0,ar2
	dec	r0
	dec	r0
	dec	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x01
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,r5
	add	a,@r0
	mov	r5,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	r7,#0x00
	mov	ar4,r7
	mov	ar6,r5
	clr	a
	mov	r5,a
	mov	r7,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,r5
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	inc	r0
	orl	a,@r0
	mov	@r0,a
	mov	a,r6
	inc	r0
	orl	a,@r0
	mov	@r0,a
	mov	a,r4
	inc	r0
	orl	a,@r0
	mov	@r0,a
;	../../../core/net/rpl/rpl-icmp6.c:128: (uint32_t)buffer[pos + 2] << 8 | buffer[pos + 3];
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x02
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r3
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
	mov	r7,#0x00
	mov	r6,#0x00
	mov	ar5,r6
	mov	ar6,r7
	mov	ar7,r2
	mov	r2,#0x00
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,r2
	orl	a,@r0
	mov	@r0,a
	mov	a,r7
	inc	r0
	orl	a,@r0
	mov	@r0,a
	mov	a,r6
	inc	r0
	orl	a,@r0
	mov	@r0,a
	mov	a,r5
	inc	r0
	orl	a,@r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x03
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r4,a
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,r3
	add	a,@r0
	mov	r3,a
	mov	a,r4
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	clr	a
	mov	r7,a
	mov	r6,a
	mov	r5,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	orl	ar3,a
	inc	r0
	mov	a,@r0
	orl	ar7,a
	inc	r0
	mov	a,@r0
	orl	ar6,a
	inc	r0
	mov	a,@r0
	orl	ar5,a
	mov	dpl,r3
	mov	dph,r7
	mov	b,r6
	mov	a,r5
;	../../../core/net/rpl/rpl-icmp6.c:129: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set32'
;------------------------------------------------------------
;pos                       Allocated to stack - sp -7
;value                     Allocated to stack - sp -11
;buffer                    Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:132: set32(uint8_t *buffer, int pos, uint32_t value)
;	-----------------------------------------
;	 function set32
;	-----------------------------------------
_set32:
	push	dpl
	push	dph
	push	b
;	../../../core/net/rpl/rpl-icmp6.c:134: buffer[pos++] = value >> 24;
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,#0x01
	add	a,r3
	mov	@r0,a
	clr	a
	addc	a,r4
	inc	r0
	mov	@r0,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r3
	add	a,@r0
	mov	r3,a
	mov	a,r4
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar2,@r0
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	inc	r0
	inc	r0
	inc	r0
	mov	ar7,@r0
	mov	dpl,r3
	mov	dph,r4
	mov	b,r2
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:135: buffer[pos++] = (value >> 16) & 0xff;
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,#0x01
	add	a,r6
	mov	@r0,a
	clr	a
	addc	a,r7
	inc	r0
	mov	@r0,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	inc	r0
	inc	r0
	mov	ar4,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:136: buffer[pos++] = (value >> 8) & 0xff;
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,#0x01
	add	a,r6
	mov	@r0,a
	clr	a
	addc	a,r7
	inc	r0
	mov	@r0,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	inc	r0
	mov	ar4,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:137: buffer[pos++] = value & 0xff;
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	ar4,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:138: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get16'
;------------------------------------------------------------
;pos                       Allocated to stack - sp -7
;buffer                    Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:141: get16(uint8_t *buffer, int pos)
;	-----------------------------------------
;	 function get16
;	-----------------------------------------
_get16:
	push	dpl
	push	dph
	push	b
;	../../../core/net/rpl/rpl-icmp6.c:143: return (uint16_t)buffer[pos] << 8 | buffer[pos + 1];
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xf9
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	mov	r2,a
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r4,a
	mov	r2,#0x00
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,#0x01
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r3
	add	a,@r0
	mov	r3,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar6,@r0
	mov	dpl,r3
	mov	dph,r7
	mov	b,r6
	lcall	__gptrget
	mov	r3,a
	mov	r7,#0x00
	orl	ar2,a
	mov	a,r7
	orl	ar4,a
	mov	dpl,r2
	mov	dph,r4
;	../../../core/net/rpl/rpl-icmp6.c:144: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set16'
;------------------------------------------------------------
;pos                       Allocated to stack - sp -7
;value                     Allocated to stack - sp -9
;buffer                    Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:147: set16(uint8_t *buffer, int pos, uint16_t value)
;	-----------------------------------------
;	 function set16
;	-----------------------------------------
_set16:
	push	dpl
	push	dph
	push	b
;	../../../core/net/rpl/rpl-icmp6.c:149: buffer[pos++] = value >> 8;
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,#0x01
	add	a,r3
	mov	@r0,a
	clr	a
	addc	a,r4
	inc	r0
	mov	@r0,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r3
	add	a,@r0
	mov	r3,a
	mov	a,r4
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar2,@r0
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r3
	mov	dph,r4
	mov	b,r2
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:150: buffer[pos++] = value & 0xff;
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	ar4,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:151: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dis_input'
;------------------------------------------------------------
;instance                  Allocated to registers 
;end                       Allocated to registers 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:154: dis_input(void)
;	-----------------------------------------
;	 function dis_input
;	-----------------------------------------
_dis_input:
;	../../../core/net/rpl/rpl-icmp6.c:164: for(instance = &instance_table[0], end = instance + RPL_MAX_INSTANCES; instance < end; ++instance) {
	mov	r5,#_instance_table
	mov	r6,#(_instance_table >> 8)
	mov	r7,#0x00
00108$:
	mov	a,#(_instance_table + 0x00c5)
	push	acc
	mov	a,#((_instance_table + 0x00c5) >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jc	00129$
	ljmp	__sdcc_banked_ret
00129$:
;	../../../core/net/rpl/rpl-icmp6.c:165: if(instance->used == 1) {
	mov	a,#0x87
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r2,a
	cjne	r2,#0x01,00109$
;	../../../core/net/rpl/rpl-icmp6.c:169: if(uip_is_addr_mcast(&UIP_IP_BUF->destipaddr)) {
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0xff,00102$
;	../../../core/net/rpl/rpl-icmp6.c:171: rpl_reset_dio_timer(instance);
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_rpl_reset_dio_timer
	mov	r1,#(_rpl_reset_dio_timer >> 8)
	mov	r2,#(_rpl_reset_dio_timer >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
	sjmp	00109$
00102$:
;	../../../core/net/rpl/rpl-icmp6.c:175: dio_output(instance, &UIP_IP_BUF->srcipaddr);
	push	ar7
	push	ar6
	push	ar5
	mov	a,#(_uip_aligned_buf + 0x0008)
	push	acc
	mov	a,#((_uip_aligned_buf + 0x0008) >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_dio_output
	mov	r1,#(_dio_output >> 8)
	mov	r2,#(_dio_output >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
00109$:
;	../../../core/net/rpl/rpl-icmp6.c:164: for(instance = &instance_table[0], end = instance + RPL_MAX_INSTANCES; instance < end; ++instance) {
	mov	a,#0xc5
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
;	../../../core/net/rpl/rpl-icmp6.c:179: }
	ljmp	00108$
;------------------------------------------------------------
;Allocation info for local variables in function 'dis_output'
;------------------------------------------------------------
;addr                      Allocated to stack - sp -2
;buffer                    Allocated to registers r5 r6 r7 
;tmpaddr                   Allocated with name '_dis_output_tmpaddr_65536_306'
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:182: dis_output(uip_ipaddr_t *addr)
;	-----------------------------------------
;	 function dis_output
;	-----------------------------------------
_dis_output:
	push	dpl
	push	dph
	push	b
;	../../../core/net/rpl/rpl-icmp6.c:194: buffer = UIP_ICMP_PAYLOAD;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
	mov	a,#0x2c
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	a,r4
	add	a,#_uip_aligned_buf
	mov	r4,a
	mov	a,r3
	addc	a,#(_uip_aligned_buf >> 8)
	mov	r3,a
	mov	ar5,r4
	mov	ar6,r3
	mov	r7,#0x00
;	../../../core/net/rpl/rpl-icmp6.c:195: buffer[0] = buffer[1] = 0;
	mov	ar2,r5
	mov	ar3,r6
	mov	ar4,r7
	inc	r5
	cjne	r5,#0x00,00112$
	inc	r6
00112$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:197: if(addr == NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00105$
;	../../../core/net/rpl/rpl-icmp6.c:198: uip_create_linklocal_rplnodes_mcast(&tmpaddr);
	mov	dptr,#_dis_output_tmpaddr_65536_306
	mov	a,#0xff
	movx	@dptr,a
	mov	a,#0x02
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_dis_output_tmpaddr_65536_306 + 0x0002)
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_dis_output_tmpaddr_65536_306 + 0x0004)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_dis_output_tmpaddr_65536_306 + 0x0006)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_dis_output_tmpaddr_65536_306 + 0x0008)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_dis_output_tmpaddr_65536_306 + 0x000a)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_dis_output_tmpaddr_65536_306 + 0x000c)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_dis_output_tmpaddr_65536_306 + 0x000e)
	movx	@dptr,a
	mov	a,#0x1a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:199: addr = &tmpaddr;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,#_dis_output_tmpaddr_65536_306
	inc	r0
	mov	@r0,#(_dis_output_tmpaddr_65536_306 >> 8)
	inc	r0
	mov	@r0,#0x00
00105$:
;	../../../core/net/rpl/rpl-icmp6.c:206: uip_icmp6_send(addr, ICMP6_RPL, RPL_CODE_DIS, 2);
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	a,#0x9b
	push	acc
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_uip_icmp6_send
	mov	r1,#(_uip_icmp6_send >> 8)
	mov	r2,#(_uip_icmp6_send >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-icmp6.c:207: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dio_input'
;------------------------------------------------------------
;buffer                    Allocated to stack - sp -5
;buffer_length             Allocated to stack - sp -2
;subopt_type               Allocated to registers r5 
;i                         Allocated to stack - sp -1
;len                       Allocated to registers r3 r4 
;nbr                       Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:210: dio_input(void)
;	-----------------------------------------
;	 function dio_input
;	-----------------------------------------
_dio_input:
	mov	a,sp
	add	a,#0x06
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:219: memset(&dio, 0, sizeof(dio));
	mov	a,#0x57
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dptr,#_dio
	mov	b,#0x00
	mov	r0,#_memset
	mov	r1,#(_memset >> 8)
	mov	r2,#(_memset >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-icmp6.c:222: dio.dag_intdoubl = RPL_DIO_INTERVAL_DOUBLINGS;
	mov	dptr,#(_dio + 0x001a)
	mov	a,#0x08
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:223: dio.dag_intmin = RPL_DIO_INTERVAL_MIN;
	mov	dptr,#(_dio + 0x001b)
	mov	a,#0x0c
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:224: dio.dag_redund = RPL_DIO_REDUNDANCY;
	mov	dptr,#(_dio + 0x001c)
	mov	a,#0x0a
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:225: dio.dag_min_hoprankinc = RPL_MIN_HOPRANKINC;
	mov	dptr,#(_dio + 0x0022)
	clr	a
	movx	@dptr,a
	inc	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:226: dio.dag_max_rankinc = RPL_MAX_RANKINC;
	mov	dptr,#(_dio + 0x0020)
	clr	a
	movx	@dptr,a
	mov	a,#0x07
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:227: dio.ocp = RPL_OF.ocp;
	mov	dptr,#(_rpl_of_etx + 0x0012)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_dio + 0x0010)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:228: dio.default_lifetime = RPL_DEFAULT_LIFETIME;
	mov	dptr,#(_dio + 0x001d)
	mov	a,#0xff
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:229: dio.lifetime_unit = RPL_DEFAULT_LIFETIME_UNIT;
	mov	dptr,#(_dio + 0x001e)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:231: uip_ipaddr_copy(&from, &UIP_IP_BUF->srcipaddr);
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	mov	a,#(_uip_aligned_buf + 0x0008)
	push	acc
	mov	a,#((_uip_aligned_buf + 0x0008) >> 8)
	push	acc
	clr	a
	push	acc
	mov	dptr,#_from
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:238: if((nbr = uip_ds6_nbr_lookup(&from)) == NULL) {
	mov	dptr,#_from
	mov	b,#0x00
	mov	r0,#_uip_ds6_nbr_lookup
	mov	r1,#(_uip_ds6_nbr_lookup >> 8)
	mov	r2,#(_uip_ds6_nbr_lookup >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,r5
	orl	a,r6
	jnz	00104$
;	../../../core/net/rpl/rpl-icmp6.c:240: packetbuf_addr(PACKETBUF_ADDR_SENDER),
	mov	dpl,#0x18
	mov	r0,#_packetbuf_addr
	mov	r1,#(_packetbuf_addr >> 8)
	mov	r2,#(_packetbuf_addr >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-icmp6.c:239: if((nbr = uip_ds6_nbr_add(&from, (uip_lladdr_t *)
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_from
	mov	b,#0x00
	mov	r0,#_uip_ds6_nbr_add
	mov	r1,#(_uip_ds6_nbr_add >> 8)
	mov	r2,#(_uip_ds6_nbr_add >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	mov	ar2,r5
	mov	ar3,r6
	mov	ar4,r7
	mov	a,r5
	orl	a,r6
	jz	00104$
;	../../../core/net/rpl/rpl-icmp6.c:243: stimer_set(&nbr->reachable, UIP_ND6_REACHABLE_TIME / 1000);
	mov	a,#0x19
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	a,#0x58
	push	acc
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_stimer_set
	mov	r1,#(_stimer_set >> 8)
	mov	r2,#(_stimer_set >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
00104$:
;	../../../core/net/rpl/rpl-icmp6.c:254: buffer_length = uip_len - uip_l3_icmp_hdr_len;
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	add	a,#0x2c
	mov	r5,a
	mov	a,r6
	clr	c
	subb	a,r5
	mov	r5,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar5
;	../../../core/net/rpl/rpl-icmp6.c:258: buffer = UIP_ICMP_PAYLOAD;
	mov	r5,#0x00
	mov	a,#0x2c
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	r7,a
	mov	a,r5
	addc	a,#(_uip_aligned_buf >> 8)
	mov	r5,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/rpl/rpl-icmp6.c:260: dio.instance_id = buffer[i++];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	dptr,#(_dio + 0x0018)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:261: dio.version = buffer[i++];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x01
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar6,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	lcall	__gptrget
	mov	dptr,#(_dio + 0x0017)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:262: dio.rank = get16(buffer, i);
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_get16
	mov	r1,#(_get16 >> 8)
	mov	r2,#(_get16 >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	mov	dptr,#(_dio + 0x0012)
	mov	a,r3
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:270: dio.grounded = buffer[i] & RPL_DIO_GROUNDED;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x04
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar6,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0x80
	mov	dptr,#(_dio + 0x0014)
	mov	a,r7
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:271: dio.mop = (buffer[i]& RPL_DIO_MOP_MASK) >> RPL_DIO_MOP_SHIFT;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0x3c
	clr	a
	rl	a
	xch	a,r7
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,r7
	xch	a,r7
	anl	a,#0x1f
	xch	a,r7
	xrl	a,r7
	xch	a,r7
	jnb	acc.4,00214$
	orl	a,#0xe0
00214$:
	mov	dptr,#(_dio + 0x0015)
	mov	a,r7
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:272: dio.preference = buffer[i++] & RPL_DIO_PREFERENCE_MASK;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	lcall	__gptrget
	mov	r2,a
	anl	ar2,#0x07
	mov	dptr,#(_dio + 0x0016)
	mov	a,r2
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:274: dio.dtsn = buffer[i++];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x05
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
	mov	dptr,#(_dio + 0x0019)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:278: memcpy(&dio.dag_id, buffer + i, sizeof(dio.dag_id));
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x08
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_dio
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:279: i += sizeof(dio.dag_id);
	mov	r0,sp
	dec	r0
	mov	@r0,#0x18
	inc	r0
	mov	@r0,#0x00
00136$:
;	../../../core/net/rpl/rpl-icmp6.c:286: for(; i < buffer_length; i += len) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar4,@r0
	mov	r5,#0x00
	mov	r0,sp
	dec	r0
	clr	c
	mov	a,@r0
	subb	a,r4
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jc	00215$
	ljmp	00134$
00215$:
;	../../../core/net/rpl/rpl-icmp6.c:287: subopt_type = buffer[i];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	r1,sp
	dec	r1
	mov	a,@r1
	add	a,@r0
	mov	r3,a
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrget
;	../../../core/net/rpl/rpl-icmp6.c:288: if(subopt_type == RPL_OPTION_PAD1) {
	mov	r5,a
;	../../../core/net/rpl/rpl-icmp6.c:289: len = 1;
	jnz	00106$
	mov	r3,#0x01
	mov	r4,a
	sjmp	00107$
00106$:
;	../../../core/net/rpl/rpl-icmp6.c:292: len = 2 + buffer[i + 1];
	push	ar5
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x01
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r5,a
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r2
	mov	dph,r5
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	mov	r7,#0x00
	mov	a,#0x02
	add	a,r2
	mov	r3,a
	clr	a
	addc	a,r7
	mov	r4,a
;	../../../core/net/rpl/rpl-icmp6.c:406: rpl_process_dio(&from, &dio);
	pop	ar5
;	../../../core/net/rpl/rpl-icmp6.c:292: len = 2 + buffer[i + 1];
00107$:
;	../../../core/net/rpl/rpl-icmp6.c:295: if(len + i > buffer_length) {
	push	ar5
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	add	a,r3
	mov	r6,a
	inc	r0
	mov	a,@r0
	addc	a,r4
	mov	r7,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	ar2,@r0
	mov	r5,#0x00
	clr	c
	mov	a,r2
	subb	a,r6
	mov	a,r5
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	pop	ar5
	jnc	00109$
;	../../../core/net/rpl/rpl-icmp6.c:298: return;
	ljmp	00138$
00109$:
;	../../../core/net/rpl/rpl-icmp6.c:303: switch(subopt_type) {
	cjne	r5,#0x02,00218$
	sjmp	00110$
00218$:
	cjne	r5,#0x03,00219$
	ljmp	00119$
00219$:
	cjne	r5,#0x04,00220$
	ljmp	00126$
00220$:
	cjne	r5,#0x08,00221$
	ljmp	00129$
00221$:
	ljmp	00137$
;	../../../core/net/rpl/rpl-icmp6.c:304: case RPL_OPTION_DAG_METRIC_CONTAINER:
00110$:
;	../../../core/net/rpl/rpl-icmp6.c:305: if(len < 6) {
	clr	c
	mov	a,r3
	subb	a,#0x06
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00112$
;	../../../core/net/rpl/rpl-icmp6.c:308: return;
	ljmp	00138$
00112$:
;	../../../core/net/rpl/rpl-icmp6.c:310: dio.mc.type = buffer[i + 2];
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,#0x02
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x0050)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:311: dio.mc.flags = buffer[i + 3] << 1;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,#0x03
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	add	a,acc
	mov	dptr,#(_dio + 0x0051)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:312: dio.mc.flags |= buffer[i + 4] >> 7;
	mov	dptr,#(_dio + 0x0051)
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,#0x04
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,r5
	add	a,@r0
	mov	r5,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar2,@r0
	mov	dpl,r5
	mov	dph,r6
	mov	b,r2
	lcall	__gptrget
	rl	a
	anl	a,#0x01
	mov	r4,a
	orl	ar7,a
	mov	dptr,#(_dio + 0x0051)
	mov	a,r7
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:313: dio.mc.aggr = (buffer[i + 4] >> 4) & 0x3;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r2
	lcall	__gptrget
	swap	a
	anl	a,#0x0f
	mov	r7,a
	anl	ar7,#0x03
	mov	dptr,#(_dio + 0x0052)
	mov	a,r7
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:314: dio.mc.prec = buffer[i + 4] & 0xf;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r2
	lcall	__gptrget
	mov	r5,a
	anl	ar5,#0x0f
	mov	dptr,#(_dio + 0x0053)
	mov	a,r5
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:315: dio.mc.length = buffer[i + 5];
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,#0x05
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	r6,a
	mov	dptr,#(_dio + 0x0054)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:317: if(dio.mc.type == RPL_DAG_MC_ETX) {
	mov	dptr,#(_dio + 0x0050)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x07,00223$
	sjmp	00224$
00223$:
	pop	ar4
	pop	ar3
	sjmp	00117$
00224$:
	pop	ar4
	pop	ar3
;	../../../core/net/rpl/rpl-icmp6.c:318: dio.mc.obj.etx = get16(buffer, i + 6);
	mov	r0,sp
	dec	r0
	mov	a,#0x06
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	push	ar4
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_get16
	mov	r1,#(_get16 >> 8)
	mov	r2,#(_get16 >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	mov	dptr,#(_dio + 0x0055)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	ljmp	00137$
00117$:
;	../../../core/net/rpl/rpl-icmp6.c:327: } else if(dio.mc.type == RPL_DAG_MC_ENERGY) {
	mov	dptr,#(_dio + 0x0050)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x02,00114$
;	../../../core/net/rpl/rpl-icmp6.c:328: dio.mc.obj.energy.flags = buffer[i + 6];
	mov	r0,sp
	dec	r0
	mov	a,#0x06
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x0055)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:329: dio.mc.obj.energy.energy_est = buffer[i + 7];
	mov	r0,sp
	dec	r0
	mov	a,#0x07
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	r6,a
	mov	dptr,#(_dio + 0x0056)
	movx	@dptr,a
	ljmp	00137$
00114$:
;	../../../core/net/rpl/rpl-icmp6.c:332: return;
	ljmp	00138$
;	../../../core/net/rpl/rpl-icmp6.c:335: case RPL_OPTION_ROUTE_INFO:
00119$:
;	../../../core/net/rpl/rpl-icmp6.c:336: if(len < 9) {
	clr	c
	mov	a,r3
	subb	a,#0x09
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00121$
;	../../../core/net/rpl/rpl-icmp6.c:339: return;
	ljmp	00138$
00121$:
;	../../../core/net/rpl/rpl-icmp6.c:343: dio.destination_prefix.length = buffer[i + 2];
	mov	r0,sp
	dec	r0
	mov	a,#0x02
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x0038)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:344: dio.destination_prefix.flags = buffer[i + 3];
	mov	r0,sp
	dec	r0
	mov	a,#0x03
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x0039)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:345: dio.destination_prefix.lifetime = get32(buffer, i + 4);
	mov	r0,sp
	dec	r0
	mov	a,#0x04
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	push	ar4
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_get32
	mov	r1,#(_get32 >> 8)
	mov	r2,#(_get32 >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	dec	sp
	dec	sp
	mov	dptr,#(_dio + 0x0034)
	mov	a,r2
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
;	../../../core/net/rpl/rpl-icmp6.c:347: if(((dio.destination_prefix.length + 7) / 8) + 8 <= len &&
	mov	dptr,#(_dio + 0x0038)
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x07
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,#0x08
	push	acc
	clr	a
	push	acc
	mov	dpl,r7
	mov	dph,r6
	lcall	__divsint
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	mov	a,#0x08
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	clr	c
	mov	a,r3
	subb	a,r6
	mov	a,r4
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00228$
	ljmp	00138$
00228$:
;	../../../core/net/rpl/rpl-icmp6.c:348: dio.destination_prefix.length <= 128) {
	mov	dptr,#(_dio + 0x0038)
	movx	a,@dptr
	mov  r7,a
	add	a,#0xff - 0x80
	jnc	00229$
	ljmp	00138$
00229$:
;	../../../core/net/rpl/rpl-icmp6.c:350: memcpy(&dio.destination_prefix.prefix, &buffer[i + 8],
	push	ar3
	push	ar4
	mov	dptr,#(_dio + 0x0038)
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x07
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	push	ar4
	push	ar3
	mov	a,#0x08
	push	acc
	clr	a
	push	acc
	mov	dpl,r7
	mov	dph,r6
	lcall	__divsint
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,#0x08
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r5,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar5,@r0
	push	ar4
	push	ar3
	push	ar6
	push	ar7
	push	ar2
	push	ar4
	push	ar5
	mov	dptr,#(_dio + 0x0024)
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar3
	pop	ar4
	pop	ar4
	pop	ar3
;	../../../core/net/rpl/rpl-icmp6.c:355: return;
	ljmp	00137$
;	../../../core/net/rpl/rpl-icmp6.c:359: case RPL_OPTION_DAG_CONF:
00126$:
;	../../../core/net/rpl/rpl-icmp6.c:360: if(len != 16) {
	cjne	r3,#0x10,00230$
	cjne	r4,#0x00,00230$
	sjmp	00128$
00230$:
;	../../../core/net/rpl/rpl-icmp6.c:363: return;
	ljmp	00138$
00128$:
;	../../../core/net/rpl/rpl-icmp6.c:367: dio.dag_intdoubl = buffer[i + 3];
	mov	r0,sp
	dec	r0
	mov	a,#0x03
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x001a)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:368: dio.dag_intmin = buffer[i + 4];
	mov	r0,sp
	dec	r0
	mov	a,#0x04
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x001b)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:369: dio.dag_redund = buffer[i + 5];
	mov	r0,sp
	dec	r0
	mov	a,#0x05
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x001c)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:370: dio.dag_max_rankinc = get16(buffer, i + 6);
	mov	r0,sp
	dec	r0
	mov	a,#0x06
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	push	ar4
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_get16
	mov	r1,#(_get16 >> 8)
	mov	r2,#(_get16 >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	mov	dptr,#(_dio + 0x0020)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:371: dio.dag_min_hoprankinc = get16(buffer, i + 8);
	mov	r0,sp
	dec	r0
	mov	a,#0x08
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	push	ar4
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_get16
	mov	r1,#(_get16 >> 8)
	mov	r2,#(_get16 >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	mov	dptr,#(_dio + 0x0022)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:372: dio.ocp = get16(buffer, i + 10);
	mov	r0,sp
	dec	r0
	mov	a,#0x0a
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	push	ar4
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_get16
	mov	r1,#(_get16 >> 8)
	mov	r2,#(_get16 >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	mov	dptr,#(_dio + 0x0010)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:374: dio.default_lifetime = buffer[i + 13];
	mov	r0,sp
	dec	r0
	mov	a,#0x0d
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x001d)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:375: dio.lifetime_unit = get16(buffer, i + 14);
	mov	r0,sp
	dec	r0
	mov	a,#0x0e
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	push	ar4
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_get16
	mov	r1,#(_get16 >> 8)
	mov	r2,#(_get16 >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	mov	dptr,#(_dio + 0x001e)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:380: break;
	ljmp	00137$
;	../../../core/net/rpl/rpl-icmp6.c:381: case RPL_OPTION_PREFIX_INFO:
00129$:
;	../../../core/net/rpl/rpl-icmp6.c:382: if(len != 32) {
	cjne	r3,#0x20,00231$
	cjne	r4,#0x00,00231$
	sjmp	00131$
00231$:
;	../../../core/net/rpl/rpl-icmp6.c:385: return;
	ljmp	00138$
00131$:
;	../../../core/net/rpl/rpl-icmp6.c:387: dio.prefix_info.length = buffer[i + 2];
	mov	r0,sp
	dec	r0
	mov	a,#0x02
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x004e)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:388: dio.prefix_info.flags = buffer[i + 3];
	mov	r0,sp
	dec	r0
	mov	a,#0x03
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#(_dio + 0x004f)
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:391: dio.prefix_info.lifetime = get32(buffer, i + 8);
	mov	r0,sp
	dec	r0
	mov	a,#0x08
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	push	ar4
	push	ar3
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_get32
	mov	r1,#(_get32 >> 8)
	mov	r2,#(_get32 >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	mov	dptr,#(_dio + 0x004a)
	mov	a,r2
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
;	../../../core/net/rpl/rpl-icmp6.c:394: memcpy(&dio.prefix_info.prefix, &buffer[i + 16], 16);
	mov	r0,sp
	dec	r0
	mov	a,#0x10
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	push	ar4
	push	ar3
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar6
	push	ar7
	push	ar5
	mov	dptr,#(_dio + 0x003a)
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar3
	pop	ar4
;	../../../core/net/rpl/rpl-icmp6.c:399: }
00137$:
;	../../../core/net/rpl/rpl-icmp6.c:286: for(; i < buffer_length; i += len) {
	mov	r0,sp
	dec	r0
	mov	a,r3
	add	a,@r0
	mov	@r0,a
	mov	a,r4
	inc	r0
	addc	a,@r0
	mov	@r0,a
	ljmp	00136$
00134$:
;	../../../core/net/rpl/rpl-icmp6.c:406: rpl_process_dio(&from, &dio);
	mov	a,#_dio
	push	acc
	mov	a,#(_dio >> 8)
	push	acc
	clr	a
	push	acc
	mov	dptr,#_from
	mov	b,#0x00
	mov	r0,#_rpl_process_dio
	mov	r1,#(_rpl_process_dio >> 8)
	mov	r2,#(_rpl_process_dio >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00138$:
;	../../../core/net/rpl/rpl-icmp6.c:407: }
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dio_output'
;------------------------------------------------------------
;uc_addr                   Allocated to stack - sp -21
;instance                  Allocated to stack - sp -15
;buffer                    Allocated to stack - sp -5
;dag                       Allocated to stack - sp -2
;__1310720008              Allocated to registers 
;sloc0                     Allocated to stack - sp -12
;sloc1                     Allocated to stack - sp -11
;sloc2                     Allocated to stack - sp -8
;pos                       Allocated with name '_dio_output_pos_65536_330'
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:410: dio_output(rpl_instance_t *instance, uip_ipaddr_t *uc_addr)
;	-----------------------------------------
;	 function dio_output
;	-----------------------------------------
_dio_output:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x0d
;	../../../core/net/rpl/rpl-icmp6.c:414: rpl_dag_t *dag = instance->current_dag;
	mov	sp,a
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x0a
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
	mov	r0,sp
	dec	r0
	dec	r0
	lcall	__gptrget
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
;	../../../core/net/rpl/rpl-icmp6.c:427: buffer = UIP_ICMP_PAYLOAD;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
	mov	a,#0x2c
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	a,r4
	add	a,#_uip_aligned_buf
	mov	r4,a
	mov	a,r3
	addc	a,#(_uip_aligned_buf >> 8)
	mov	r3,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/rpl/rpl-icmp6.c:428: buffer[pos++] = instance->instance_id;
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x86
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
	mov	r5,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:429: buffer[pos++] = dag->version;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x12
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
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:434: set16(buffer, pos, dag->rank);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1a
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	push	ar5
	push	ar6
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_set16
	mov	r1,#(_set16 >> 8)
	mov	r2,#(_set16 >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:436: pos += 2;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x02
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:438: buffer[pos] = 0;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:439: if(dag->grounded) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x13
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
	jz	00102$
;	../../../core/net/rpl/rpl-icmp6.c:440: buffer[pos] |= RPL_DIO_GROUNDED;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	r4,a
	orl	ar4,#0x80
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,r4
	lcall	__gptrput
00102$:
;	../../../core/net/rpl/rpl-icmp6.c:443: buffer[pos] |= instance->mop << RPL_DIO_MOP_SHIFT;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x89
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
	swap	a
	rr	a
	anl	a,#0xf8
	mov	r2,a
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	a,@r0
	orl	ar2,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:444: buffer[pos] |= dag->preference & RPL_DIO_PREFERENCE_MASK;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x14
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
	mov	r2,a
	anl	ar2,#0x07
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	a,@r0
	orl	ar2,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:445: pos++;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:447: buffer[pos++] = instance->dtsn_out;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf5
	mov	r1,a
	mov	a,r6
	add	a,@r0
	mov	@r1,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x88
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
	mov	r7,a
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:450: RPL_LOLLIPOP_INCREMENT(instance->dtsn_out);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	add	a,#0xff - 0x7f
	jnc	00121$
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x88
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
	mov	r4,a
	inc	r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
	sjmp	00122$
00121$:
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x88
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
	mov	r4,a
	inc	r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
00122$:
;	../../../core/net/rpl/rpl-icmp6.c:453: buffer[pos++] = 0; /* flags */
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:454: buffer[pos++] = 0; /* reserved */
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:456: memcpy(buffer + pos, &dag->dag_id, sizeof(dag->dag_id));
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r3
	add	a,@r0
	mov	r3,a
	mov	a,r4
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar2,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r3
	mov	dph,r4
	mov	b,r2
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:457: pos += 16;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x10
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:460: if(instance->mc.type != RPL_DAG_MC_NONE) {
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	jnz	00153$
	ljmp	00110$
00153$:
;	../../../core/net/rpl/rpl-icmp6.c:461: instance->of->update_metric_container(instance);
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x07
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x0f
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	push	ar7
	push	ar6
	push	ar5
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xeb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-icmp6.c:463: buffer[pos++] = RPL_OPTION_DAG_METRIC_CONTAINER;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,#0x02
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:464: buffer[pos++] = 6;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,#0x06
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:465: buffer[pos++] = instance->mc.type;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:466: buffer[pos++] = instance->mc.flags >> 1;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf5
	mov	r1,a
	mov	a,r6
	add	a,@r0
	mov	@r1,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x01
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
	clr	c
	rrc	a
	mov	r7,a
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:467: buffer[pos] = (instance->mc.flags & 1) << 7;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	anl	a,#0x01
	rr	a
	anl	a,#0x80
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:468: buffer[pos++] |= (instance->mc.aggr << 4) | instance->mc.prec;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x02
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
	mov	r2,a
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	a,r2
	swap	a
	anl	a,#0xf0
	mov	@r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x03
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
	mov	r2,a
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	ar4,@r0
	mov	a,r2
	orl	a,r4
	xch	a,r0
	mov	a,sp
	add	a,#0xf5
	xch	a,r0
	orl	a,@r0
	mov	r4,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:469: if(instance->mc.type == RPL_DAG_MC_ETX) {
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x07,00154$
	sjmp	00155$
00154$:
	ljmp	00107$
00155$:
;	../../../core/net/rpl/rpl-icmp6.c:470: buffer[pos++] = 2;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,#0x02
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:471: set16(buffer, pos, instance->mc.obj.etx);
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x05
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	push	ar5
	push	ar6
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_set16
	mov	r1,#(_set16 >> 8)
	mov	r2,#(_set16 >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:472: pos += 2;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x02
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	ljmp	00110$
00107$:
;	../../../core/net/rpl/rpl-icmp6.c:473: } else if(instance->mc.type == RPL_DAG_MC_ENERGY) {
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r7,a
	cjne	r7,#0x02,00156$
	sjmp	00157$
00156$:
	ljmp	00119$
00157$:
;	../../../core/net/rpl/rpl-icmp6.c:474: buffer[pos++] = 2;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,#0x02
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:475: buffer[pos++] = instance->mc.obj.energy.flags;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf5
	mov	r1,a
	mov	a,r6
	add	a,@r0
	mov	@r1,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x05
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
	mov	r7,a
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:476: buffer[pos++] = instance->mc.obj.energy.energy_est;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	inc	r2
	cjne	r2,#0x00,00158$
	inc	r3
00158$:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r2,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:480: return;
00110$:
;	../../../core/net/rpl/rpl-icmp6.c:486: buffer[pos++] = RPL_OPTION_DAG_CONF;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,#0x04
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:487: buffer[pos++] = 14;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,#0x0e
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:488: buffer[pos++] = 0; /* No Auth, PCS = 0 */
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:489: buffer[pos++] = instance->dio_intdoubl;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x8a
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
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:490: buffer[pos++] = instance->dio_intmin;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x8b
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
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:491: buffer[pos++] = instance->dio_redundancy;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x8c
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
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:492: set16(buffer, pos, instance->max_rankinc);
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x91
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	push	ar5
	push	ar6
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_set16
	mov	r1,#(_set16 >> 8)
	mov	r2,#(_set16 >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:493: pos += 2;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x02
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:494: set16(buffer, pos, instance->min_hoprankinc);
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x93
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	push	ar5
	push	ar6
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_set16
	mov	r1,#(_set16 >> 8)
	mov	r2,#(_set16 >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:495: pos += 2;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x02
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:497: set16(buffer, pos, instance->of->ocp);
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x07
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x12
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	push	ar5
	push	ar6
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_set16
	mov	r1,#(_set16 >> 8)
	mov	r2,#(_set16 >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:498: pos += 2;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x02
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:499: buffer[pos++] = 0; /* reserved */
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:500: buffer[pos++] = instance->default_lifetime;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x8d
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
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:501: set16(buffer, pos, instance->lifetime_unit);
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x95
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	push	ar5
	push	ar6
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_set16
	mov	r1,#(_set16 >> 8)
	mov	r2,#(_set16 >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:502: pos += 2;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x02
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:505: if(dag->prefix_info.length > 0) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x14
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jnz	00159$
	ljmp	00112$
00159$:
;	../../../core/net/rpl/rpl-icmp6.c:506: buffer[pos++] = RPL_OPTION_PREFIX_INFO;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,#0x08
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:507: buffer[pos++] = 30; /* always 30 bytes + 2 long */
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,#0x1e
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:508: buffer[pos++] = dag->prefix_info.length;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r4,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar2,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xf8
	mov	r1,a
	mov	a,#0x25
	add	a,@r0
	mov	@r1,a
	clr	a
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x14
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
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:509: buffer[pos++] = dag->prefix_info.flags;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r4,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar2,@r0
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x15
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
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:510: set32(buffer, pos, dag->prefix_info.lifetime);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf5
	mov	r1,a
	mov	a,#0x10
	add	a,@r0
	mov	@r1,a
	clr	a
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_set32
	mov	r1,#(_set32 >> 8)
	mov	r2,#(_set32 >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:511: pos += 4;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x04
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:512: set32(buffer, pos, dag->prefix_info.lifetime);
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_set32
	mov	r1,#(_set32 >> 8)
	mov	r2,#(_set32 >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:513: pos += 4;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x04
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:514: memset(&buffer[pos], 0, 4);
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	a,#0x04
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	r0,#_memset
	mov	r1,#(_memset >> 8)
	mov	r2,#(_memset >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-icmp6.c:515: pos += 4;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x04
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:516: memcpy(&buffer[pos], &dag->prefix_info.prefix, 16);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r3
	add	a,@r0
	mov	r3,a
	mov	a,r4
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar2,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r3
	mov	dph,r4
	mov	b,r2
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:517: pos += 16;
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dio_output_pos_65536_330
	mov	a,#0x10
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
00112$:
;	../../../core/net/rpl/rpl-icmp6.c:534: if(uc_addr == NULL) {
	mov	a,sp
	add	a,#0xeb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00117$
;	../../../core/net/rpl/rpl-icmp6.c:537: uip_create_linklocal_rplnodes_mcast(&addr);
	mov	dptr,#_addr
	mov	a,#0xff
	movx	@dptr,a
	mov	a,#0x02
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_addr + 0x0002)
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_addr + 0x0004)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_addr + 0x0006)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_addr + 0x0008)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_addr + 0x000a)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_addr + 0x000c)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_addr + 0x000e)
	movx	@dptr,a
	mov	a,#0x1a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:538: uip_icmp6_send(&addr, ICMP6_RPL, RPL_CODE_DIO, pos);
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	push	ar6
	mov	a,#0x01
	push	acc
	mov	a,#0x9b
	push	acc
	mov	dptr,#_addr
	mov	b,#0x00
	mov	r0,#_uip_icmp6_send
	mov	r1,#(_uip_icmp6_send >> 8)
	mov	r2,#(_uip_icmp6_send >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	sjmp	00119$
00117$:
;	../../../core/net/rpl/rpl-icmp6.c:544: uip_icmp6_send(uc_addr, ICMP6_RPL, RPL_CODE_DIO, pos);
	mov	dptr,#_dio_output_pos_65536_330
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	push	ar6
	mov	a,#0x01
	push	acc
	mov	a,#0x9b
	push	acc
	mov	a,sp
	add	a,#0xe8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_uip_icmp6_send
	mov	r1,#(_uip_icmp6_send >> 8)
	mov	r2,#(_uip_icmp6_send >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00119$:
;	../../../core/net/rpl/rpl-icmp6.c:547: }
	mov	a,sp
	add	a,#0xf0
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dao_input'
;------------------------------------------------------------
;dag                       Allocated to stack - sp -8
;instance                  Allocated to stack - sp -5
;buffer                    Allocated to stack - sp -2
;flags                     Allocated to stack - sp -19
;subopt_type               Allocated to registers r7 
;pathcontrol               Allocated to registers 
;pathsequence              Allocated to registers 
;rep                       Allocated to stack - sp -18
;len                       Allocated to registers r3 r2 
;i                         Allocated to stack - sp -15
;learned_from              Allocated to stack - sp -13
;p                         Allocated to stack - sp -11
;sloc0                     Allocated to stack - sp -29
;sloc1                     Allocated to stack - sp -26
;sloc2                     Allocated to stack - sp -23
;sequence                  Allocated with name '_dao_input_sequence_65536_342'
;instance_id               Allocated with name '_dao_input_instance_id_65536_342'
;lifetime                  Allocated with name '_dao_input_lifetime_65536_342'
;prefixlen                 Allocated with name '_dao_input_prefixlen_65536_342'
;buffer_length             Allocated with name '_dao_input_buffer_length_65536_342'
;pos                       Allocated with name '_dao_input_pos_65536_342'
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:550: dao_input(void)
;	-----------------------------------------
;	 function dao_input
;	-----------------------------------------
_dao_input:
	mov	a,sp
	add	a,#0x1e
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:571: prefixlen = 0;
	mov	dptr,#_dao_input_prefixlen_65536_342
	clr	a
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:573: uip_ipaddr_copy(&dao_sender_addr, &UIP_IP_BUF->srcipaddr);
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	mov	a,#(_uip_aligned_buf + 0x0008)
	push	acc
	mov	a,#((_uip_aligned_buf + 0x0008) >> 8)
	push	acc
	clr	a
	push	acc
	mov	dptr,#_dao_sender_addr
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:580: buffer = UIP_ICMP_PAYLOAD;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	mov	a,#0x2c
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r5
	add	a,#_uip_aligned_buf
	mov	r5,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	r6,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/rpl/rpl-icmp6.c:581: buffer_length = uip_len - uip_l3_icmp_hdr_len;
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	a,#0x2c
	add	a,r7
	mov	r7,a
	mov	dptr,#_dao_input_buffer_length_65536_342
	mov	a,r2
	clr	c
	subb	a,r7
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:584: instance_id = buffer[pos++];
	mov	dptr,#_dao_input_pos_65536_342
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r7,a
	mov	dptr,#_dao_input_instance_id_65536_342
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:586: instance = rpl_get_instance(instance_id);
	mov	dpl,r7
	mov	r0,#_rpl_get_instance
	mov	r1,#(_rpl_get_instance >> 8)
	mov	r2,#(_rpl_get_instance >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-icmp6.c:587: if(instance == NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00102$
;	../../../core/net/rpl/rpl-icmp6.c:590: return;
	ljmp	00136$
00102$:
;	../../../core/net/rpl/rpl-icmp6.c:593: lifetime = instance->default_lifetime;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x8d
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
	mov	dptr,#_dao_input_lifetime_65536_342
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:595: flags = buffer[pos++];
	mov	dptr,#_dao_input_pos_65536_342
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dao_input_pos_65536_342
	mov	a,#0x01
	add	a,r3
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r3
	add	a,@r0
	mov	r3,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar2,@r0
	mov	dpl,r3
	mov	dph,r7
	mov	b,r2
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
;	../../../core/net/rpl/rpl-icmp6.c:597: pos++;
	mov	dptr,#_dao_input_pos_65536_342
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:598: sequence = buffer[pos++];
	mov	dptr,#_dao_input_pos_65536_342
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_dao_input_pos_65536_342
	mov	a,#0x01
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r3
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	__gptrget
	mov	dptr,#_dao_input_sequence_65536_342
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:600: dag = instance->current_dag;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0a
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
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
;	../../../core/net/rpl/rpl-icmp6.c:602: if(flags & RPL_DAO_D_FLAG) {
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	a,@r0
	jnb	acc.6,00106$
;	../../../core/net/rpl/rpl-icmp6.c:603: if(memcmp(&dag->dag_id, &buffer[pos], sizeof(dag->dag_id))) {
	mov	dptr,#_dao_input_pos_65536_342
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r3
	add	a,@r0
	mov	r3,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar2,@r0
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar3
	push	ar7
	push	ar2
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	r0,#_memcmp
	mov	r1,#(_memcmp >> 8)
	mov	r2,#(_memcmp >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	mov	a,r6
	orl	a,r7
	jz	00104$
;	../../../core/net/rpl/rpl-icmp6.c:605: return;
	ljmp	00136$
00104$:
;	../../../core/net/rpl/rpl-icmp6.c:607: pos += 16;
	mov	dptr,#_dao_input_pos_65536_342
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_dao_input_pos_65536_342
	mov	a,#0x10
	add	a,r3
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
00106$:
;	../../../core/net/rpl/rpl-icmp6.c:613: i = pos;
	mov	dptr,#_dao_input_pos_65536_342
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar7
00134$:
;	../../../core/net/rpl/rpl-icmp6.c:614: for(; i < buffer_length; i += len) {
	mov	dptr,#_dao_input_buffer_length_65536_342
	movx	a,@dptr
	mov	r2,a
	mov	r6,#0x00
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,r2
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	00243$
	ljmp	00113$
00243$:
;	../../../core/net/rpl/rpl-icmp6.c:615: subopt_type = buffer[i];
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	mov	r2,a
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	__gptrget
;	../../../core/net/rpl/rpl-icmp6.c:616: if(subopt_type == RPL_OPTION_PAD1) {
	mov	r7,a
;	../../../core/net/rpl/rpl-icmp6.c:617: len = 1;
	jnz	00108$
	mov	r3,#0x01
	mov	r2,a
	sjmp	00109$
00108$:
;	../../../core/net/rpl/rpl-icmp6.c:620: len = 2 + buffer[i + 1];
	push	ar7
	mov	a,sp
	add	a,#0xf0
	mov	r0,a
	mov	a,#0x01
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	r6,a
	mov	r7,#0x00
	mov	a,#0x02
	add	a,r6
	mov	r3,a
	clr	a
	addc	a,r7
	mov	r2,a
;	../../../core/net/rpl/rpl-icmp6.c:695: dao_ack_output(instance, &dao_sender_addr, sequence);
	pop	ar7
;	../../../core/net/rpl/rpl-icmp6.c:620: len = 2 + buffer[i + 1];
00109$:
;	../../../core/net/rpl/rpl-icmp6.c:623: switch(subopt_type) {
	cjne	r7,#0x05,00245$
	sjmp	00110$
00245$:
	cjne	r7,#0x06,00246$
	ljmp	00111$
00246$:
	ljmp	00135$
;	../../../core/net/rpl/rpl-icmp6.c:624: case RPL_OPTION_TARGET:
00110$:
;	../../../core/net/rpl/rpl-icmp6.c:626: prefixlen = buffer[i + 3];
	push	ar3
	push	ar2
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	a,#0x03
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	dptr,#_dao_input_prefixlen_65536_342
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:627: memset(&prefix, 0, sizeof(prefix));
	push	ar3
	push	ar2
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dptr,#_prefix
	mov	b,#0x00
	mov	r0,#_memset
	mov	r1,#(_memset >> 8)
	mov	r2,#(_memset >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-icmp6.c:628: memcpy(&prefix, buffer + i + 4, (prefixlen + 7) / CHAR_BIT);
	mov	dptr,#_dao_input_prefixlen_65536_342
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x07
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,#0x08
	push	acc
	clr	a
	push	acc
	mov	dpl,r7
	mov	dph,r6
	lcall	__divsint
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,sp
	add	a,#0xef
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	mov	r3,a
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar5,@r0
	mov	a,#0x04
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	push	ar3
	push	ar2
	push	ar6
	push	ar7
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#_prefix
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar2
	pop	ar3
;	../../../core/net/rpl/rpl-icmp6.c:629: break;
	pop	ar2
	pop	ar3
;	../../../core/net/rpl/rpl-icmp6.c:630: case RPL_OPTION_TRANSIT:
	sjmp	00135$
00111$:
;	../../../core/net/rpl/rpl-icmp6.c:634: lifetime = buffer[i + 5];
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x05
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,r6
	add	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__gptrget
	mov	r6,a
	mov	dptr,#_dao_input_lifetime_65536_342
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:637: }
00135$:
;	../../../core/net/rpl/rpl-icmp6.c:614: for(; i < buffer_length; i += len) {
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,r3
	add	a,@r0
	mov	@r0,a
	mov	a,r2
	inc	r0
	addc	a,@r0
	mov	@r0,a
	ljmp	00134$
00113$:
;	../../../core/net/rpl/rpl-icmp6.c:645: rep = uip_ds6_route_lookup(&prefix);
	mov	dptr,#_prefix
	mov	b,#0x00
	mov	r0,#_uip_ds6_route_lookup
	mov	r1,#(_uip_ds6_route_lookup >> 8)
	mov	r2,#(_uip_ds6_route_lookup >> 16)
	lcall	__sdcc_banked_call
	xch	a,r0
	mov	a,sp
	add	a,#0xe3
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
;	../../../core/net/rpl/rpl-icmp6.c:647: if(lifetime == RPL_ZERO_LIFETIME) {
	mov	dptr,#_dao_input_lifetime_65536_342
	movx	a,@dptr
	jz	00247$
	ljmp	00119$
00247$:
;	../../../core/net/rpl/rpl-icmp6.c:649: if(rep != NULL && rep->state.saved_lifetime == 0 && rep->length == prefixlen) {
	mov	a,sp
	add	a,#0xe3
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00248$
	ljmp	00136$
00248$:
	mov	a,sp
	add	a,#0xe3
	mov	r0,a
	mov	a,#0x25
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	a,#0x04
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,r2
	orl	a,r3
	orl	a,r4
	orl	a,r7
	jz	00249$
	ljmp	00136$
00249$:
	mov	a,sp
	add	a,#0xe3
	mov	r0,a
	mov	a,#0x23
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
	mov	r5,a
	mov	dptr,#_dao_input_prefixlen_65536_342
	movx	a,@dptr
	mov	r7,a
	mov	a,r5
	cjne	a,ar7,00250$
	sjmp	00251$
00250$:
	ljmp	00136$
00251$:
;	../../../core/net/rpl/rpl-icmp6.c:653: rep->state.saved_lifetime = rep->state.lifetime;
	mov	a,sp
	add	a,#0xe3
	mov	r0,a
	mov	a,sp
	add	a,#0xe6
	mov	r1,a
	mov	a,#0x25
	add	a,@r0
	mov	@r1,a
	clr	a
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	a,sp
	add	a,#0xe3
	mov	r1,a
	mov	a,#0x04
	add	a,@r0
	mov	@r1,a
	clr	a
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,sp
	add	a,#0xe3
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:654: rep->state.lifetime = DAO_EXPIRATION_TIMEOUT;
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,#0x3c
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:656: return;
	ljmp	00136$
00119$:
;	../../../core/net/rpl/rpl-icmp6.c:659: learned_from = uip_is_addr_mcast(&dao_sender_addr) ?
	mov	dptr,#_dao_sender_addr
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xff,00138$
;	../../../core/net/rpl/rpl-icmp6.c:660: RPL_ROUTE_FROM_MULTICAST_DAO : RPL_ROUTE_FROM_UNICAST_DAO;
	mov	r6,#0x02
	mov	r7,#0x00
	sjmp	00139$
00138$:
	mov	r6,#0x01
	mov	r7,#0x00
00139$:
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-icmp6.c:662: if(learned_from == RPL_ROUTE_FROM_UNICAST_DAO) {
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	cjne	@r0,#0x01,00254$
	inc	r0
	cjne	@r0,#0x00,00254$
	sjmp	00255$
00254$:
	ljmp	00124$
00255$:
;	../../../core/net/rpl/rpl-icmp6.c:664: p = rpl_find_parent(dag, &dao_sender_addr);
	mov	a,#_dao_sender_addr
	push	acc
	mov	a,#(_dao_sender_addr >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_find_parent
	mov	r1,#(_rpl_find_parent >> 8)
	mov	r2,#(_rpl_find_parent >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r4,dph
	mov	r5,b
	dec	sp
	dec	sp
	dec	sp
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
;	../../../core/net/rpl/rpl-icmp6.c:667: if(p != NULL && DAG_RANK(p->rank, instance) < DAG_RANK(dag->rank, instance)) {
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00256$
	ljmp	00124$
00256$:
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x1d
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x93
	add	a,@r0
	mov	r4,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r4
	mov	dph,r5
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	push	ar5
	push	ar4
	push	ar4
	push	ar5
	mov	dpl,r2
	mov	dph,r6
	lcall	__divuint
	xch	a,r0
	mov	a,sp
	add	a,#0xe2
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	dec	sp
	dec	sp
	pop	ar4
	pop	ar5
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x1a
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	push	ar4
	push	ar5
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,r6
	inc	r0
	mov	a,@r0
	subb	a,r7
	jnc	00124$
;	../../../core/net/rpl/rpl-icmp6.c:670: p->rank = INFINITE_RANK;
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x1d
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
	mov	a,#0xff
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:671: p->updated = 1;
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x21
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
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:672: return;
	ljmp	00136$
00124$:
;	../../../core/net/rpl/rpl-icmp6.c:676: rep = rpl_add_route(dag, &prefix, prefixlen, &dao_sender_addr);
	mov	dptr,#_dao_input_prefixlen_65536_342
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	a,#_dao_sender_addr
	push	acc
	mov	a,#(_dao_sender_addr >> 8)
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar4
	mov	a,#_prefix
	push	acc
	mov	a,#(_prefix >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xf0
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_add_route
	mov	r1,#(_rpl_add_route >> 8)
	mov	r2,#(_rpl_add_route >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r4,dph
	mov	r5,b
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
	add	a,#0xee
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
;	../../../core/net/rpl/rpl-icmp6.c:677: if(rep == NULL) {
	mov	a,sp
	add	a,#0xee
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00126$
;	../../../core/net/rpl/rpl-icmp6.c:680: return;
	ljmp	00136$
00126$:
;	../../../core/net/rpl/rpl-icmp6.c:683: rep->state.lifetime = RPL_LIFETIME(instance, lifetime);
	mov	a,sp
	add	a,#0xee
	mov	r0,a
	mov	a,sp
	add	a,#0xe6
	mov	r1,a
	mov	a,#0x25
	add	a,@r0
	mov	@r1,a
	clr	a
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x95
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
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
	mov	dptr,#_dao_input_lifetime_65536_342
	movx	a,@dptr
	mov	r2,a
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
	push	ar2
	push	ar5
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
	mov	r6,dph
	mov	r5,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xe6
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
	inc	dptr
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:684: rep->state.learned_from = learned_from;
	mov	a,sp
	add	a,#0xee
	mov	r0,a
	mov	a,#0x25
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x0b
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	ar4,@r0
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:686: if(learned_from == RPL_ROUTE_FROM_UNICAST_DAO) {
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	cjne	@r0,#0x01,00259$
	inc	r0
	cjne	@r0,#0x00,00259$
	sjmp	00260$
00259$:
	ljmp	00136$
00260$:
;	../../../core/net/rpl/rpl-icmp6.c:687: if(dag->preferred_parent) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x17
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,r5
	orl	a,r6
	jz	00128$
;	../../../core/net/rpl/rpl-icmp6.c:691: uip_icmp6_send(&dag->preferred_parent->addr,
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x17
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x0d
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#_dao_input_buffer_length_65536_342
	movx	a,@dptr
	push	acc
	mov	a,#0x02
	push	acc
	mov	a,#0x9b
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_uip_icmp6_send
	mov	r1,#(_uip_icmp6_send >> 8)
	mov	r2,#(_uip_icmp6_send >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00128$:
;	../../../core/net/rpl/rpl-icmp6.c:694: if(flags & RPL_DAO_K_FLAG) {
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	a,@r0
	jnb	acc.7,00136$
;	../../../core/net/rpl/rpl-icmp6.c:695: dao_ack_output(instance, &dao_sender_addr, sequence);
	mov	dptr,#_dao_input_sequence_65536_342
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	push	ar6
	mov	a,#_dao_sender_addr
	push	acc
	mov	a,#(_dao_sender_addr >> 8)
	push	acc
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_dao_ack_output
	mov	r1,#(_dao_ack_output >> 8)
	mov	r2,#(_dao_ack_output >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
00136$:
;	../../../core/net/rpl/rpl-icmp6.c:698: }
	mov	a,sp
	add	a,#0xe2
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dao_output'
;------------------------------------------------------------
;lifetime                  Allocated to stack - sp -12
;n                         Allocated to stack - sp -8
;dag                       Allocated to stack - sp -5
;instance                  Allocated to registers r5 r3 r4 
;buffer                    Allocated to stack - sp -2
;prefixlen                 Allocated to registers 
;pos                       Allocated to registers 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:701: dao_output(rpl_parent_t *n, uint8_t lifetime)
;	-----------------------------------------
;	 function dao_output
;	-----------------------------------------
_dao_output:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x06
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:711: if(get_global_addr(&prefix) == 0) {
	mov	dptr,#_prefix
	mov	b,#0x00
	mov	r0,#_get_global_addr
	mov	r1,#(_get_global_addr >> 8)
	mov	r2,#(_get_global_addr >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00102$
;	../../../core/net/rpl/rpl-icmp6.c:713: return;
	ljmp	00103$
00102$:
;	../../../core/net/rpl/rpl-icmp6.c:716: dag = n->dag;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x03
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
;	../../../core/net/rpl/rpl-icmp6.c:717: instance = dag->instance;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1c
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
;	../../../core/net/rpl/rpl-icmp6.c:723: buffer = UIP_ICMP_PAYLOAD;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x2c
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	r7,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	r6,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/rpl/rpl-icmp6.c:725: RPL_LOLLIPOP_INCREMENT(dao_sequence);
	mov	dptr,#_dao_sequence
	movx	a,@dptr
	add	a,#0xff - 0x7f
	jnc	00105$
	mov	dptr,#_dao_sequence
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	sjmp	00106$
00105$:
	mov	dptr,#_dao_sequence
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
00106$:
;	../../../core/net/rpl/rpl-icmp6.c:728: buffer[pos++] = instance->instance_id;
	mov	a,#0x86
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r2,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:729: buffer[pos] = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x01
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
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:731: buffer[pos] |= RPL_DAO_D_FLAG;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x40
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:737: buffer[pos++] = 0; /* reserved */
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x02
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
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:738: buffer[pos++] = dao_sequence;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x03
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_dao_sequence
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:740: memcpy(buffer + pos, &dag->dag_id, sizeof(dag->dag_id));
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x04
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:746: buffer[pos++] = RPL_OPTION_TARGET;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x14
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
	mov	a,#0x05
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:747: buffer[pos++] = 2 + ((prefixlen + 7) / CHAR_BIT);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x15
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
	mov	a,#0x12
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:748: buffer[pos++] = 0; /* reserved */
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x16
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
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:749: buffer[pos++] = prefixlen;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x17
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
	mov	a,#0x80
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:750: memcpy(buffer + pos, &prefix, (prefixlen + 7) / CHAR_BIT);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x18
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	mov	a,#_prefix
	push	acc
	mov	a,#(_prefix >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/rpl/rpl-icmp6.c:754: buffer[pos++] = RPL_OPTION_TRANSIT;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x28
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
	mov	a,#0x06
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:755: buffer[pos++] = 4;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x29
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
	mov	a,#0x04
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:756: buffer[pos++] = 0; /* flags - ignored */
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x2a
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
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:757: buffer[pos++] = 0; /* path control - ignored */
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x2b
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
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:758: buffer[pos++] = 0; /* path seq - ignored */
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x2c
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
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:759: buffer[pos++] = lifetime;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x2d
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
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:767: uip_icmp6_send(&n->addr, ICMP6_RPL, RPL_CODE_DAO, pos);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x0d
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x2e
	push	acc
	mov	a,#0x02
	push	acc
	mov	a,#0x9b
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_uip_icmp6_send
	mov	r1,#(_uip_icmp6_send >> 8)
	mov	r2,#(_uip_icmp6_send >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00103$:
;	../../../core/net/rpl/rpl-icmp6.c:768: }
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dao_ack_input'
;------------------------------------------------------------
;buffer                    Allocated to registers 
;buffer_length             Allocated to registers 
;instance_id               Allocated to registers 
;sequence                  Allocated to registers 
;status                    Allocated to registers 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:771: dao_ack_input(void)
;	-----------------------------------------
;	 function dao_ack_input
;	-----------------------------------------
_dao_ack_input:
;	../../../core/net/rpl/rpl-icmp6.c:784: status = buffer[3];
;	../../../core/net/rpl/rpl-icmp6.c:790: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dao_ack_output'
;------------------------------------------------------------
;dest                      Allocated to stack - sp -5
;sequence                  Allocated to stack - sp -6
;instance                  Allocated to registers r5 r6 r7 
;buffer                    Allocated to registers r4 r3 r2 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:793: dao_ack_output(rpl_instance_t *instance, uip_ipaddr_t *dest, uint8_t sequence)
;	-----------------------------------------
;	 function dao_ack_output
;	-----------------------------------------
_dao_ack_output:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-icmp6.c:801: buffer = UIP_ICMP_PAYLOAD;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
	mov	a,#0x2c
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	a,r4
	add	a,#_uip_aligned_buf
	mov	r4,a
	mov	a,r3
	addc	a,#(_uip_aligned_buf >> 8)
	mov	r3,a
	mov	r2,#0x00
;	../../../core/net/rpl/rpl-icmp6.c:803: buffer[0] = instance->instance_id;
	mov	a,#0x86
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:804: buffer[1] = 0;
	mov	a,#0x01
	add	a,r4
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r2
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:805: buffer[2] = sequence;
	mov	a,#0x02
	add	a,r4
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r2
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:806: buffer[3] = 0;
	mov	a,#0x03
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-icmp6.c:808: uip_icmp6_send(dest, ICMP6_RPL, RPL_CODE_DAO_ACK, 4);
	mov	a,#0x04
	push	acc
	dec	a
	push	acc
	mov	a,#0x9b
	push	acc
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_uip_icmp6_send
	mov	r1,#(_uip_icmp6_send >> 8)
	mov	r2,#(_uip_icmp6_send >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-icmp6.c:809: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_rpl_input'
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-icmp6.c:812: uip_rpl_input(void)
;	-----------------------------------------
;	 function uip_rpl_input
;	-----------------------------------------
_uip_rpl_input:
;	../../../core/net/rpl/rpl-icmp6.c:815: switch(UIP_ICMP_BUF->icode) {
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x28
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	r7,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	r6,a
	mov	dpl,r7
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	mov  r7,a
	add	a,#0xff - 0x03
	jc	00106$
	mov	a,r7
	add	a,r7
;	../../../core/net/rpl/rpl-icmp6.c:816: case RPL_CODE_DIO:
	mov	dptr,#00114$
	jmp	@a+dptr
00114$:
	sjmp	00102$
	sjmp	00101$
	sjmp	00103$
	sjmp	00104$
00101$:
;	../../../core/net/rpl/rpl-icmp6.c:817: dio_input();
	mov	r0,#_dio_input
	mov	r1,#(_dio_input >> 8)
	mov	r2,#(_dio_input >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-icmp6.c:818: break;
;	../../../core/net/rpl/rpl-icmp6.c:819: case RPL_CODE_DIS:
	sjmp	00106$
00102$:
;	../../../core/net/rpl/rpl-icmp6.c:820: dis_input();
	mov	r0,#_dis_input
	mov	r1,#(_dis_input >> 8)
	mov	r2,#(_dis_input >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-icmp6.c:821: break;
;	../../../core/net/rpl/rpl-icmp6.c:822: case RPL_CODE_DAO:
	sjmp	00106$
00103$:
;	../../../core/net/rpl/rpl-icmp6.c:823: dao_input();
	mov	r0,#_dao_input
	mov	r1,#(_dao_input >> 8)
	mov	r2,#(_dao_input >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-icmp6.c:824: break;
;	../../../core/net/rpl/rpl-icmp6.c:825: case RPL_CODE_DAO_ACK:
	sjmp	00106$
00104$:
;	../../../core/net/rpl/rpl-icmp6.c:826: dao_ack_input();
	mov	r0,#_dao_ack_input
	mov	r1,#(_dao_ack_input >> 8)
	mov	r2,#(_dao_ack_input >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-icmp6.c:831: }
00106$:
;	../../../core/net/rpl/rpl-icmp6.c:833: uip_len = 0;
	mov	dptr,#_uip_len
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-icmp6.c:834: }
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
__xinit__dao_sequence:
	.db #0xf0	; 240
	.area CABS    (ABS,CODE)
