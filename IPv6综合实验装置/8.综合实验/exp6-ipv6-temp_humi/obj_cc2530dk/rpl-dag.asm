;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module rpl_dag
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rpl_add_dag
	.globl _rpl_set_default_instance
	.globl _memb_free
	.globl _memb_alloc
	.globl _rpl_reset_dio_timer
	.globl _rpl_schedule_dao
	.globl _rpl_remove_routes_by_nexthop
	.globl _rpl_remove_routes
	.globl _dao_output
	.globl _uip_ds6_set_addr_iid
	.globl _uip_ds6_addr_lookup
	.globl _uip_ds6_addr_rm
	.globl _uip_ds6_addr_add
	.globl _uip_ds6_defrt_rm
	.globl _uip_ds6_defrt_add
	.globl _list_item_next
	.globl _list_length
	.globl _list_remove
	.globl _list_add
	.globl _list_head
	.globl _list_init
	.globl _ctimer_stop
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
	.globl _default_instance
	.globl _instance_table
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
	.globl _rpl_set_root
	.globl _rpl_repair_root
	.globl _rpl_set_prefix
	.globl _rpl_set_default_route
	.globl _rpl_alloc_instance
	.globl _rpl_alloc_dag
	.globl _rpl_free_instance
	.globl _rpl_free_dag
	.globl _rpl_add_parent
	.globl _rpl_find_parent
	.globl _rpl_find_parent_any_dag
	.globl _rpl_select_dag
	.globl _rpl_select_parent
	.globl _rpl_remove_parent
	.globl _rpl_nullify_parent
	.globl _rpl_move_parent
	.globl _rpl_get_any_dag
	.globl _rpl_get_instance
	.globl _rpl_find_of
	.globl _rpl_join_instance
	.globl _rpl_local_repair
	.globl _rpl_recalculate_ranks
	.globl _rpl_process_parent_event
	.globl _rpl_process_dio
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
_parent_memb_memb_count:
	.ds 16
_parent_memb_memb_mem:
	.ds 544
_instance_table::
	.ds 197
_default_instance::
	.ds 3
_rpl_find_parent_any_dag_p_65536_610:
	.ds 3
_rpl_find_parent_any_dag_dag_65536_610:
	.ds 3
_rpl_find_parent_any_dag_end_65536_610:
	.ds 3
_rpl_select_dag_last_parent_65536_618:
	.ds 3
_rpl_select_dag_dag_65536_618:
	.ds 3
_rpl_select_dag_end_65536_618:
	.ds 3
_rpl_select_dag_best_dag_65536_618:
	.ds 3
_rpl_select_dag_old_rank_65536_618:
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_parent_memb:
	.ds 10
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
;Allocation info for local variables in function 'lollipop_greater_than'
;------------------------------------------------------------
;b                         Allocated to stack - sp -4
;a                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:92: lollipop_greater_than(int a, int b)
;	-----------------------------------------
;	 function lollipop_greater_than
;	-----------------------------------------
_lollipop_greater_than:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r6,dpl
	mov	r7,dph
;	../../../core/net/rpl/rpl-dag.c:95: if(a > RPL_LOLLIPOP_CIRCULAR_REGION && b <= RPL_LOLLIPOP_CIRCULAR_REGION) {
	clr	c
	mov	a,#0x7f
	subb	a,r6
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00102$
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	clr	c
	mov	a,#0x7f
	subb	a,@r0
	mov	a,#(0x00 ^ 0x80)
	inc	r0
	mov	b,@r0
	xrl	b,#0x80
	subb	a,b
	jc	00102$
;	../../../core/net/rpl/rpl-dag.c:96: return (RPL_LOLLIPOP_MAX_VALUE + 1 + b - a) > RPL_LOLLIPOP_SEQUENCE_WINDOWS;
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	ar4,@r0
	mov	a,#0x01
	inc	r0
	add	a,@r0
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,r6
	mov	r4,a
	mov	a,r5
	subb	a,r7
	mov	r5,a
	clr	c
	mov	a,#0x10
	subb	a,r4
	mov	a,#(0x00 ^ 0x80)
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	clr	a
	rlc	a
	mov	r4,a
	mov	r5,#0x00
	mov	dpl,r4
	mov	dph,r5
	sjmp	00104$
00102$:
;	../../../core/net/rpl/rpl-dag.c:100: return (a > b && (a - b) < RPL_LOLLIPOP_SEQUENCE_WINDOWS) ||
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,r6
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00111$
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,r6
	clr	c
	subb	a,@r0
	mov	r4,a
	mov	a,r7
	inc	r0
	subb	a,@r0
	mov	r5,a
	clr	c
	mov	a,r4
	subb	a,#0x10
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	00107$
00111$:
;	../../../core/net/rpl/rpl-dag.c:101: (a < b && (b - a) > (RPL_LOLLIPOP_CIRCULAR_REGION + 1-
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	clr	c
	mov	a,r6
	subb	a,@r0
	mov	a,r7
	xrl	a,#0x80
	inc	r0
	mov	b,@r0
	xrl	b,#0x80
	subb	a,b
	jnc	00106$
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	clr	c
	subb	a,r6
	mov	r6,a
	inc	r0
	mov	a,@r0
	subb	a,r7
	mov	r7,a
	clr	c
	mov	a,#0x70
	subb	a,r6
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jc	00107$
00106$:
;	assignBit
	clr	b0
	sjmp	00108$
00107$:
;	assignBit
	setb	b0
00108$:
	mov	c,b0
	clr	a
	rlc	a
	mov	r6,a
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
00104$:
;	../../../core/net/rpl/rpl-dag.c:103: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'remove_parents'
;------------------------------------------------------------
;minimum_rank              Allocated to stack - sp -7
;dag                       Allocated to registers r5 r6 r7 
;p                         Allocated to registers r2 r3 r4 
;p2                        Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:107: remove_parents(rpl_dag_t *dag, rpl_rank_t minimum_rank)
;	-----------------------------------------
;	 function remove_parents
;	-----------------------------------------
_remove_parents:
	inc	sp
	inc	sp
	inc	sp
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:114: for(p = list_head(dag->parents); p != NULL; p = p2) {
	mov	a,#0x22
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	pop	ar5
	pop	ar6
	pop	ar7
00105$:
	mov	a,r2
	orl	a,r3
	jnz	00121$
	ljmp	00107$
00121$:
;	../../../core/net/rpl/rpl-dag.c:115: p2 = p->next;
	push	ar5
	push	ar6
	push	ar7
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
;	../../../core/net/rpl/rpl-dag.c:116: if(p->rank >= minimum_rank) {
	mov	a,#0x1d
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	clr	c
	mov	a,r5
	subb	a,@r0
	mov	a,r6
	inc	r0
	subb	a,@r0
	pop	ar7
	pop	ar6
	pop	ar5
	jc	00106$
;	../../../core/net/rpl/rpl-dag.c:117: rpl_remove_parent(dag, p);
	push	ar7
	push	ar6
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_remove_parent
	mov	r1,#(_rpl_remove_parent >> 8)
	mov	r2,#(_rpl_remove_parent >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
00106$:
;	../../../core/net/rpl/rpl-dag.c:114: for(p = list_head(dag->parents); p != NULL; p = p2) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	ljmp	00105$
00107$:
;	../../../core/net/rpl/rpl-dag.c:120: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'nullify_parents'
;------------------------------------------------------------
;minimum_rank              Allocated to stack - sp -7
;dag                       Allocated to registers r5 r6 r7 
;p                         Allocated to registers r2 r3 r4 
;p2                        Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:123: nullify_parents(rpl_dag_t *dag, rpl_rank_t minimum_rank)
;	-----------------------------------------
;	 function nullify_parents
;	-----------------------------------------
_nullify_parents:
	inc	sp
	inc	sp
	inc	sp
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:130: for(p = list_head(dag->parents); p != NULL; p = p2) {
	mov	a,#0x22
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	pop	ar5
	pop	ar6
	pop	ar7
00105$:
	mov	a,r2
	orl	a,r3
	jnz	00121$
	ljmp	00107$
00121$:
;	../../../core/net/rpl/rpl-dag.c:131: p2 = p->next;
	push	ar5
	push	ar6
	push	ar7
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
;	../../../core/net/rpl/rpl-dag.c:132: if(p->rank >= minimum_rank) {
	mov	a,#0x1d
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	clr	c
	mov	a,r5
	subb	a,@r0
	mov	a,r6
	inc	r0
	subb	a,@r0
	pop	ar7
	pop	ar6
	pop	ar5
	jc	00106$
;	../../../core/net/rpl/rpl-dag.c:133: rpl_nullify_parent(dag, p);
	push	ar7
	push	ar6
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_nullify_parent
	mov	r1,#(_rpl_nullify_parent >> 8)
	mov	r2,#(_rpl_nullify_parent >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
00106$:
;	../../../core/net/rpl/rpl-dag.c:130: for(p = list_head(dag->parents); p != NULL; p = p2) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	ljmp	00105$
00107$:
;	../../../core/net/rpl/rpl-dag.c:136: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'remove_worst_parent'
;------------------------------------------------------------
;min_worst_rank            Allocated to stack - sp -13
;dag                       Allocated to stack - sp -8
;p                         Allocated to stack - sp -5
;worst                     Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:139: remove_worst_parent(rpl_dag_t *dag, rpl_rank_t min_worst_rank)
;	-----------------------------------------
;	 function remove_worst_parent
;	-----------------------------------------
_remove_worst_parent:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x06
	mov	sp,a
;	../../../core/net/rpl/rpl-dag.c:146: worst = NULL;
	mov	r0,sp
	dec	r0
	dec	r0
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/rpl/rpl-dag.c:147: for(p = list_head(dag->parents); p != NULL; p = list_item_next(p)) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x22
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x17
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
00110$:
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00138$
	ljmp	00105$
00138$:
;	../../../core/net/rpl/rpl-dag.c:148: if(p != dag->preferred_parent &&
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00111$
;	../../../core/net/rpl/rpl-dag.c:149: (worst == NULL || p->rank > worst->rank)) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00101$
	push	ar2
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x1d
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1d
	add	a,@r0
	mov	r3,a
	clr	a
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
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	clr	c
	mov	a,r3
	subb	a,r5
	mov	a,r4
	subb	a,r6
	pop	ar4
	pop	ar3
	pop	ar2
	jnc	00111$
00101$:
;	../../../core/net/rpl/rpl-dag.c:150: worst = p;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	r1,sp
	dec	r1
	dec	r1
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
00111$:
;	../../../core/net/rpl/rpl-dag.c:147: for(p = list_head(dag->parents); p != NULL; p = list_item_next(p)) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_list_item_next
	mov	r1,#(_list_item_next >> 8)
	mov	r2,#(_list_item_next >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	pop	ar2
	pop	ar3
	pop	ar4
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	ljmp	00110$
00105$:
;	../../../core/net/rpl/rpl-dag.c:154: if(worst != NULL && worst->rank > min_worst_rank) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00112$
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1d
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
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,r5
	inc	r0
	mov	a,@r0
	subb	a,r6
	jnc	00112$
;	../../../core/net/rpl/rpl-dag.c:155: rpl_remove_parent(dag, worst);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_remove_parent
	mov	r1,#(_rpl_remove_parent >> 8)
	mov	r2,#(_rpl_remove_parent >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00112$:
;	../../../core/net/rpl/rpl-dag.c:157: }
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'should_send_dao'
;------------------------------------------------------------
;dio                       Allocated to stack - sp -5
;p                         Allocated to stack - sp -8
;instance                  Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:160: should_send_dao(rpl_instance_t *instance, rpl_dio_t *dio, rpl_parent_t *p)
;	-----------------------------------------
;	 function should_send_dao
;	-----------------------------------------
_should_send_dao:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:163: if(instance->mop == RPL_MOP_NO_DOWNWARD_ROUTES) {
	mov	a,#0x89
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
	jnz	00102$
;	../../../core/net/rpl/rpl-dag.c:164: return 0;
	mov	dptr,#0x0000
	ljmp	__sdcc_banked_ret
00102$:
;	../../../core/net/rpl/rpl-dag.c:167: return p == instance->current_dag->preferred_parent &&
	mov	a,#0x0a
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
	mov	a,#0x17
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
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jnz	00105$
;	../../../core/net/rpl/rpl-dag.c:168: (lollipop_greater_than(dio->dtsn, p->dtsn));
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x20
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
	mov	r7,#0x00
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar6,@r0
	mov	a,#0x19
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r6
	lcall	__gptrget
	mov	r3,a
	mov	r6,#0x00
	push	ar5
	push	ar7
	mov	dpl,r3
	mov	dph,r6
	mov	r0,#_lollipop_greater_than
	mov	r1,#(_lollipop_greater_than >> 8)
	mov	r2,#(_lollipop_greater_than >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	mov	a,r6
	orl	a,r7
	jnz	00106$
00105$:
;	assignBit
	clr	b0
	sjmp	00107$
00106$:
;	assignBit
	setb	b0
00107$:
	mov	c,b0
	clr	a
	rlc	a
	mov	r6,a
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
;	../../../core/net/rpl/rpl-dag.c:169: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'acceptable_rank'
;------------------------------------------------------------
;rank                      Allocated to stack - sp -11
;dag                       Allocated to stack - sp -6
;sloc0                     Allocated to stack - sp -3
;sloc1                     Allocated to stack - sp -1
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:172: acceptable_rank(rpl_dag_t *dag, rpl_rank_t rank)
;	-----------------------------------------
;	 function acceptable_rank
;	-----------------------------------------
_acceptable_rank:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x04
;	../../../core/net/rpl/rpl-dag.c:174: return rank != INFINITE_RANK &&
	mov	sp,a
	add	a,#0xf5
	mov	r0,a
	cjne	@r0,#0xff,00118$
	inc	r0
	cjne	@r0,#0xff,00118$
	setb	c
	sjmp	00119$
00118$:
	clr	c
00119$:
	mov	b0,c
	jnc	00120$
	ljmp	00103$
00120$:
;	../../../core/net/rpl/rpl-dag.c:175: ((dag->instance->max_rankinc == 0) ||
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,#0x1c
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x91
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
	orl	a,r2
	jnz	00121$
	ljmp	00104$
00121$:
;	../../../core/net/rpl/rpl-dag.c:176: DAG_RANK(rank, dag->instance) <= DAG_RANK(dag->min_rank + dag->instance->max_rankinc, dag->instance));
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,#0x1c
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x93
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	push	ar4
	push	ar3
	push	ar2
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf0
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	lcall	__divuint
	xch	a,r0
	mov	a,sp
	add	a,#0xfa
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,#0x10
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
	mov	a,#0x91
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
	mov	a,r2
	add	a,r5
	mov	r5,a
	mov	a,r3
	addc	a,r6
	mov	r6,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	lcall	__divuint
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	mov	r0,sp
	dec	r0
	clr	c
	mov	a,r6
	subb	a,@r0
	mov	a,r7
	inc	r0
	subb	a,@r0
	mov	b0,c
	jnc	00104$
00103$:
;	assignBit
	clr	b0
	sjmp	00105$
00104$:
;	assignBit
	setb	b0
00105$:
	mov	c,b0
	clr	a
	rlc	a
	mov	r6,a
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
;	../../../core/net/rpl/rpl-dag.c:177: }
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_dag'
;------------------------------------------------------------
;dag_id                    Allocated to stack - sp -13
;instance_id               Allocated to registers r7 
;instance                  Allocated to registers r2 r3 r4 
;dag                       Allocated to stack - sp -2
;i                         Allocated to registers r6 r7 
;sloc0                     Allocated to stack - sp -7
;sloc1                     Allocated to stack - sp -5
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:180: get_dag(uint8_t instance_id, uip_ipaddr_t *dag_id)
;	-----------------------------------------
;	 function get_dag
;	-----------------------------------------
_get_dag:
	mov	a,sp
	add	a,#0x08
	mov	sp,a
;	../../../core/net/rpl/rpl-dag.c:186: instance = rpl_get_instance(instance_id);
	mov	r0,#_rpl_get_instance
	mov	r1,#(_rpl_get_instance >> 8)
	mov	r2,#(_rpl_get_instance >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	ar2,r5
	mov	ar3,r6
	mov	ar4,r7
;	../../../core/net/rpl/rpl-dag.c:187: if(instance == NULL) {
	mov	a,r5
	orl	a,r6
;	../../../core/net/rpl/rpl-dag.c:188: return NULL;
	jnz	00102$
	mov	dptr,#0x0000
	mov	b,a
	ljmp	00109$
00102$:
;	../../../core/net/rpl/rpl-dag.c:191: for(i = 0; i < RPL_MAX_DAG_PER_INSTANCE; ++i) {
	clr	a
	mov	r6,a
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0d
	add	a,r2
	mov	@r0,a
	clr	a
	addc	a,r3
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar4
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	mov	a,#0x3b
	push	acc
	clr	a
	push	acc
	mov	dpl,r6
	mov	dph,r7
	lcall	__mulint
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
00107$:
;	../../../core/net/rpl/rpl-dag.c:192: dag = &instance->dag_table[i];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r2,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar5,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
;	../../../core/net/rpl/rpl-dag.c:193: if(dag->used && uip_ipaddr_cmp(&dag->dag_id, dag_id)) {
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,#0x15
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
	pop	ar7
	pop	ar6
	jz	00108$
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar2
	push	ar6
	push	ar7
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
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
	pop	ar7
	pop	ar6
	jnz	00108$
;	../../../core/net/rpl/rpl-dag.c:194: return dag;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	sjmp	00109$
00108$:
;	../../../core/net/rpl/rpl-dag.c:191: for(i = 0; i < RPL_MAX_DAG_PER_INSTANCE; ++i) {
	mov	a,#0x3b
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00134$
	inc	r0
	inc	@r0
00134$:
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,#0x02
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00135$
	ljmp	00107$
00135$:
;	../../../core/net/rpl/rpl-dag.c:198: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00109$:
;	../../../core/net/rpl/rpl-dag.c:199: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_set_root'
;------------------------------------------------------------
;dag_id                    Allocated to stack - sp -14
;instance_id               Allocated to registers r7 
;dag                       Allocated to stack - sp -5
;instance                  Allocated to stack - sp -2
;version                   Allocated to registers r5 
;sloc0                     Allocated to stack - sp -8
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:202: rpl_set_root(uint8_t instance_id, uip_ipaddr_t *dag_id)
;	-----------------------------------------
;	 function rpl_set_root
;	-----------------------------------------
_rpl_set_root:
	mov	a,sp
	add	a,#0x09
	mov	sp,a
	mov	r7,dpl
;	../../../core/net/rpl/rpl-dag.c:208: version = RPL_LOLLIPOP_INIT;
	mov	r6,#0xf0
;	../../../core/net/rpl/rpl-dag.c:209: dag = get_dag(instance_id, dag_id);
	push	ar7
	push	ar6
	mov	a,sp
	add	a,#0xf0
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r7
	mov	r0,#_get_dag
	mov	r1,#(_get_dag >> 8)
	mov	r2,#(_get_dag >> 16)
	lcall	__sdcc_banked_call
	xch	a,r0
	mov	a,sp
	add	a,#0xf3
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	dec	sp
	dec	sp
	dec	sp
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:210: if(dag != NULL) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00144$
	ljmp	00104$
00144$:
;	../../../core/net/rpl/rpl-dag.c:211: version = dag->version;
	push	ar7
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	a,#0x12
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r2
	mov	dph,r5
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
;	../../../core/net/rpl/rpl-dag.c:212: RPL_LOLLIPOP_INCREMENT(version);
	clr	c
	mov	a,#0x7f
	subb	a,r5
	pop	ar7
	jnc	00112$
	mov	a,r5
	inc	a
	mov	r6,a
	sjmp	00113$
00112$:
	mov	a,r5
	inc	a
	mov	r6,a
00113$:
;	../../../core/net/rpl/rpl-dag.c:214: if(dag == dag->instance->current_dag) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x1c
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
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	mov	a,#0x0a
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00147$
	sjmp	00102$
00147$:
;	../../../core/net/rpl/rpl-dag.c:215: dag->instance->current_dag = NULL;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x1c
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
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	mov	a,#0x0a
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
00102$:
;	../../../core/net/rpl/rpl-dag.c:217: rpl_free_dag(dag);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	push	ar7
	push	ar6
	mov	r0,#_rpl_free_dag
	mov	r1,#(_rpl_free_dag >> 8)
	mov	r2,#(_rpl_free_dag >> 16)
	lcall	__sdcc_banked_call
	pop	ar6
	pop	ar7
00104$:
;	../../../core/net/rpl/rpl-dag.c:220: dag = rpl_alloc_dag(instance_id, dag_id);
	push	ar6
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
	mov	dpl,r7
	mov	r0,#_rpl_alloc_dag
	mov	r1,#(_rpl_alloc_dag >> 8)
	mov	r2,#(_rpl_alloc_dag >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	mov	r5,dph
	mov	r7,b
	dec	sp
	dec	sp
	dec	sp
	pop	ar6
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:221: if(dag == NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
;	../../../core/net/rpl/rpl-dag.c:223: return NULL;
	jnz	00106$
	mov	dptr,#0x0000
	mov	b,a
	ljmp	00110$
00106$:
;	../../../core/net/rpl/rpl-dag.c:226: instance = dag->instance;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1c
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
;	../../../core/net/rpl/rpl-dag.c:228: dag->version = version;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x12
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
	mov	a,r6
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:229: dag->joined = 1;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
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
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:230: dag->grounded = RPL_GROUNDED;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
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
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:231: instance->mop = RPL_MOP_DEFAULT;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x89
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
	mov	a,#0x02
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:232: instance->of = &RPL_OF;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	a,#_rpl_of_etx
	lcall	__gptrput
	inc	dptr
	mov	a,#(_rpl_of_etx >> 8)
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:233: dag->preferred_parent = NULL;
	mov	a,sp
	add	a,#0xfb
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
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:235: memcpy(&dag->dag_id, dag_id, sizeof(dag->dag_id));
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
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
;	../../../core/net/rpl/rpl-dag.c:237: instance->dio_intdoubl = RPL_DIO_INTERVAL_DOUBLINGS;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x8a
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
	mov	a,#0x08
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:238: instance->dio_intmin = RPL_DIO_INTERVAL_MIN;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x8b
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
	mov	a,#0x0c
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:241: instance->dio_intcurrent = RPL_DIO_INTERVAL_MIN +
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x8e
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
	mov	a,#0x14
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:243: instance->dio_redundancy = RPL_DIO_REDUNDANCY;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x8c
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
	mov	a,#0x0a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:244: instance->max_rankinc = RPL_MAX_RANKINC;
	mov	r0,sp
	dec	r0
	dec	r0
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
	clr	a
	lcall	__gptrput
	inc	dptr
	mov	a,#0x07
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:245: instance->min_hoprankinc = RPL_MIN_HOPRANKINC;
	mov	r0,sp
	dec	r0
	dec	r0
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
	clr	a
	lcall	__gptrput
	inc	dptr
	inc	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:246: instance->default_lifetime = RPL_DEFAULT_LIFETIME;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	a,#0xff
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:247: instance->lifetime_unit = RPL_DEFAULT_LIFETIME_UNIT;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x95
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
	mov	a,#0xff
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:249: dag->rank = ROOT_RANK(instance);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1a
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:251: if(instance->current_dag != dag && instance->current_dag != NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0a
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jnz	00149$
	ljmp	00108$
00149$:
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0a
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
	jz	00108$
;	../../../core/net/rpl/rpl-dag.c:253: rpl_remove_routes(instance->current_dag);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0a
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
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_rpl_remove_routes
	mov	r1,#(_rpl_remove_routes >> 8)
	mov	r2,#(_rpl_remove_routes >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:255: instance->current_dag->joined = 0;
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
	mov	a,#0x16
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
00108$:
;	../../../core/net/rpl/rpl-dag.c:258: instance->current_dag = dag;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0a
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
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:259: instance->dtsn_out = RPL_LOLLIPOP_INIT;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	a,#0xf0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:260: instance->of->update_metric_container(instance);
	mov	r0,sp
	dec	r0
	dec	r0
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
	add	a,#0xf8
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
;	../../../core/net/rpl/rpl-dag.c:261: default_instance = instance;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dptr,#_default_instance
	mov	a,@r0
	movx	@dptr,a
	inc	r0
	mov	a,@r0
	inc	dptr
	movx	@dptr,a
	inc	r0
	mov	a,@r0
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-dag.c:269: rpl_reset_dio_timer(instance);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_reset_dio_timer
	mov	r1,#(_rpl_reset_dio_timer >> 8)
	mov	r2,#(_rpl_reset_dio_timer >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:271: return dag;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
00110$:
;	../../../core/net/rpl/rpl-dag.c:272: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_repair_root'
;------------------------------------------------------------
;instance_id               Allocated to registers r7 
;instance                  Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:275: rpl_repair_root(uint8_t instance_id)
;	-----------------------------------------
;	 function rpl_repair_root
;	-----------------------------------------
_rpl_repair_root:
	inc	sp
	inc	sp
	inc	sp
;	../../../core/net/rpl/rpl-dag.c:279: instance = rpl_get_instance(instance_id);
	mov	r0,#_rpl_get_instance
	mov	r1,#(_rpl_get_instance >> 8)
	mov	r2,#(_rpl_get_instance >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:280: if(instance == NULL ||
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00101$
;	../../../core/net/rpl/rpl-dag.c:281: instance->current_dag->rank != ROOT_RANK(instance)) {
	mov	r0,sp
	dec	r0
	dec	r0
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
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x1a
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
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x93
	add	a,@r0
	mov	r4,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	a,r2
	cjne	a,ar4,00123$
	mov	a,r3
	cjne	a,ar6,00123$
	sjmp	00102$
00123$:
00101$:
;	../../../core/net/rpl/rpl-dag.c:282: return 0;
	mov	dptr,#0x0000
	ljmp	00104$
00102$:
;	../../../core/net/rpl/rpl-dag.c:285: RPL_LOLLIPOP_INCREMENT(instance->current_dag->version);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0a
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
	add	a,#0xff - 0x7f
	jnc	00106$
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0a
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
	mov	r4,a
	inc	r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
	sjmp	00107$
00106$:
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0a
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
	mov	r4,a
	inc	r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
00107$:
;	../../../core/net/rpl/rpl-dag.c:286: RPL_LOLLIPOP_INCREMENT(instance->dtsn_out);
	mov	r0,sp
	dec	r0
	dec	r0
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
	add	a,#0xff - 0x7f
	jnc	00108$
	mov	r0,sp
	dec	r0
	dec	r0
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
	sjmp	00109$
00108$:
	mov	r0,sp
	dec	r0
	dec	r0
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
00109$:
;	../../../core/net/rpl/rpl-dag.c:287: rpl_reset_dio_timer(instance);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_reset_dio_timer
	mov	r1,#(_rpl_reset_dio_timer >> 8)
	mov	r2,#(_rpl_reset_dio_timer >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:288: return 1;
	mov	dptr,#0x0001
00104$:
;	../../../core/net/rpl/rpl-dag.c:289: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set_ip_from_prefix'
;------------------------------------------------------------
;prefix                    Allocated to stack - sp -10
;ipaddr                    Allocated to stack - sp -4
;sloc0                     Allocated to stack - sp -1
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:292: set_ip_from_prefix(uip_ipaddr_t *ipaddr, rpl_prefix_t *prefix)
;	-----------------------------------------
;	 function set_ip_from_prefix
;	-----------------------------------------
_set_ip_from_prefix:
	push	dpl
	push	dph
	push	b
	inc	sp
	inc	sp
;	../../../core/net/rpl/rpl-dag.c:294: memset(ipaddr, 0, sizeof(uip_ipaddr_t));
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_memset
	mov	r1,#(_memset >> 8)
	mov	r2,#(_memset >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:295: memcpy(ipaddr, &prefix->prefix, (prefix->length + 7) / 8);
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x14
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	r7,#0x00
	mov	a,#0x07
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r7
	mov	r7,a
	push	ar4
	push	ar3
	push	ar2
	mov	a,#0x08
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r7
	lcall	__divsint
	xch	a,r0
	mov	a,sp
	add	a,#0xfa
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	r0,sp
	dec	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	push	ar2
	push	ar3
	push	ar4
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
;	../../../core/net/rpl/rpl-dag.c:296: uip_ds6_set_addr_iid(ipaddr, &uip_lladdr);
	mov	a,#_uip_lladdr
	push	acc
	mov	a,#(_uip_lladdr >> 8)
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
	mov	r0,#_uip_ds6_set_addr_iid
	mov	r1,#(_uip_ds6_set_addr_iid >> 8)
	mov	r2,#(_uip_ds6_set_addr_iid >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:297: }
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'check_prefix'
;------------------------------------------------------------
;new_prefix                Allocated to stack - sp -26
;last_prefix               Allocated to stack - sp -20
;ipaddr                    Allocated to stack - sp -15
;rep                       Allocated to registers r2 r3 r4 
;sloc0                     Allocated to stack - sp -17
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:300: check_prefix(rpl_prefix_t *last_prefix, rpl_prefix_t *new_prefix)
;	-----------------------------------------
;	 function check_prefix
;	-----------------------------------------
_check_prefix:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x12
;	../../../core/net/rpl/rpl-dag.c:305: if(last_prefix != NULL && new_prefix != NULL &&
	mov	sp,a
	add	a,#0xec
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00153$
	ljmp	00102$
00153$:
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00154$
	ljmp	00102$
00154$:
;	../../../core/net/rpl/rpl-dag.c:306: last_prefix->length == new_prefix->length &&
	mov	a,sp
	add	a,#0xec
	mov	r0,a
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
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x14
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	mov	a,r2
	cjne	a,ar3,00155$
	sjmp	00156$
00155$:
	ljmp	00102$
00156$:
;	../../../core/net/rpl/rpl-dag.c:307: uip_ipaddr_prefixcmp(&last_prefix->prefix, &new_prefix->prefix, new_prefix->length) &&
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x14
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	swap	a
	rl	a
	anl	a,#0x1f
	mov	r5,a
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,#0x00
	mov	a,sp
	add	a,#0xec
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
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
	jnz	00102$
;	../../../core/net/rpl/rpl-dag.c:308: last_prefix->flags == new_prefix->flags) {
	mov	a,sp
	add	a,#0xec
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
	mov	r5,a
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x15
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar4,00102$
;	../../../core/net/rpl/rpl-dag.c:310: return;
	ljmp	00115$
00102$:
;	../../../core/net/rpl/rpl-dag.c:313: if(last_prefix != NULL) {
	mov	a,sp
	add	a,#0xec
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00110$
;	../../../core/net/rpl/rpl-dag.c:314: set_ip_from_prefix(&ipaddr, last_prefix);
	mov	a,sp
	add	a,#0xf1
	mov	r7,a
	mov	r4,a
	mov	r5,#0x00
	mov	r6,#0x40
	push	ar7
	mov	a,sp
	add	a,#0xeb
	mov	r0,a
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
	mov	r0,#_set_ip_from_prefix
	mov	r1,#(_set_ip_from_prefix >> 8)
	mov	r2,#(_set_ip_from_prefix >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:315: rep = uip_ds6_addr_lookup(&ipaddr);
	mov	r6,#0x00
	mov	r5,#0x40
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	r0,#_uip_ds6_addr_lookup
	mov	r1,#(_uip_ds6_addr_lookup >> 8)
	mov	r2,#(_uip_ds6_addr_lookup >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	ar2,r5
	mov	ar3,r6
	mov	ar4,r7
;	../../../core/net/rpl/rpl-dag.c:316: if(rep != NULL) {
	mov	a,r5
	orl	a,r6
	jz	00110$
;	../../../core/net/rpl/rpl-dag.c:320: uip_ds6_addr_rm(rep);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_uip_ds6_addr_rm
	mov	r1,#(_uip_ds6_addr_rm >> 8)
	mov	r2,#(_uip_ds6_addr_rm >> 16)
	lcall	__sdcc_banked_call
00110$:
;	../../../core/net/rpl/rpl-dag.c:324: if(new_prefix != NULL) {
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00162$
	ljmp	00115$
00162$:
;	../../../core/net/rpl/rpl-dag.c:325: set_ip_from_prefix(&ipaddr, new_prefix);
	mov	a,sp
	add	a,#0xf1
	mov	r7,a
	mov	r4,a
	mov	r5,#0x00
	mov	r6,#0x40
	push	ar7
	mov	a,sp
	add	a,#0xe5
	mov	r0,a
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
	mov	r0,#_set_ip_from_prefix
	mov	r1,#(_set_ip_from_prefix >> 8)
	mov	r2,#(_set_ip_from_prefix >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:326: if(uip_ds6_addr_lookup(&ipaddr) == NULL) {
	mov	r6,#0x00
	mov	r5,#0x40
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	r0,#_uip_ds6_addr_lookup
	mov	r1,#(_uip_ds6_addr_lookup >> 8)
	mov	r2,#(_uip_ds6_addr_lookup >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,r5
	orl	a,r6
	jnz	00115$
;	../../../core/net/rpl/rpl-dag.c:330: uip_ds6_addr_add(&ipaddr, 0, ADDR_AUTOCONF);
	mov	a,sp
	add	a,#0xf1
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	r0,#_uip_ds6_addr_add
	mov	r1,#(_uip_ds6_addr_add >> 8)
	mov	r2,#(_uip_ds6_addr_add >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
00115$:
;	../../../core/net/rpl/rpl-dag.c:333: }
	mov	a,sp
	add	a,#0xeb
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_set_prefix'
;------------------------------------------------------------
;prefix                    Allocated to stack - sp -13
;len                       Allocated to stack - sp -15
;dag                       Allocated to stack - sp -7
;sloc0                     Allocated to stack - sp -4
;sloc1                     Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:336: rpl_set_prefix(rpl_dag_t *dag, uip_ipaddr_t *prefix, unsigned len)
;	-----------------------------------------
;	 function rpl_set_prefix
;	-----------------------------------------
_rpl_set_prefix:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x05
;	../../../core/net/rpl/rpl-dag.c:338: if(len > 128) {
	mov	sp,a
	add	a,#0xf1
	mov	r0,a
	clr	c
	mov	a,#0x80
	subb	a,@r0
	clr	a
	inc	r0
	subb	a,@r0
	jnc	00102$
;	../../../core/net/rpl/rpl-dag.c:339: return 0;
	mov	dptr,#0x0000
	ljmp	00103$
00102$:
;	../../../core/net/rpl/rpl-dag.c:342: memset(&dag->prefix_info.prefix, 0, sizeof(dag->prefix_info.prefix));
	mov	a,sp
	add	a,#0xf9
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
	mov	ar5,r2
	mov	ar6,r3
	mov	ar7,r4
	push	ar4
	push	ar3
	push	ar2
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_memset
	mov	r1,#(_memset >> 8)
	mov	r2,#(_memset >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/net/rpl/rpl-dag.c:343: memcpy(&dag->prefix_info.prefix, prefix, (len + 7) / 8);
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,#0x07
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
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
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
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
;	../../../core/net/rpl/rpl-dag.c:344: dag->prefix_info.length = len;
	mov	sp,a
	add	a,#0xf9
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
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x14
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	ar4,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:345: dag->prefix_info.flags = UIP_ND6_RA_FLAG_AUTONOMOUS;
	mov	a,#0x15
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0x40
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:349: check_prefix(NULL, &dag->prefix_info);
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x00
	mov	r0,#_check_prefix
	mov	r1,#(_check_prefix >> 8)
	mov	r2,#(_check_prefix >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:350: return 1;
	mov	dptr,#0x0001
00103$:
;	../../../core/net/rpl/rpl-dag.c:351: }
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_set_default_route'
;------------------------------------------------------------
;from                      Allocated to stack - sp -15
;instance                  Allocated to stack - sp -9
;sloc0                     Allocated to stack - sp -6
;sloc1                     Allocated to stack - sp -3
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:354: rpl_set_default_route(rpl_instance_t *instance, uip_ipaddr_t *from)
;	-----------------------------------------
;	 function rpl_set_default_route
;	-----------------------------------------
_rpl_set_default_route:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x07
;	../../../core/net/rpl/rpl-dag.c:356: if(instance->def_route != NULL) {
	mov	sp,a
	add	a,#0xf7
	mov	r0,a
	mov	a,#0x83
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,r2
	orl	a,r3
	jz	00102$
;	../../../core/net/rpl/rpl-dag.c:360: uip_ds6_defrt_rm(instance->def_route);
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	a,#0x83
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
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_uip_ds6_defrt_rm
	mov	r1,#(_uip_ds6_defrt_rm >> 8)
	mov	r2,#(_uip_ds6_defrt_rm >> 16)
	lcall	__sdcc_banked_call
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/net/rpl/rpl-dag.c:361: instance->def_route = NULL;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:382: return 1;
;	../../../core/net/rpl/rpl-dag.c:361: instance->def_route = NULL;
00102$:
;	../../../core/net/rpl/rpl-dag.c:364: if(from != NULL) {
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00129$
	ljmp	00108$
00129$:
;	../../../core/net/rpl/rpl-dag.c:368: instance->def_route = uip_ds6_defrt_add(from,
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	a,sp
	add	a,#0xfa
	mov	r1,a
	mov	a,#0x83
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
;	../../../core/net/rpl/rpl-dag.c:369: RPL_LIFETIME(instance,
	mov	a,sp
	add	a,#0xf7
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
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,#0x00
	inc	r0
	mov	@r0,#0x00
	mov	a,sp
	add	a,#0xf7
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
	mov	r2,a
	mov	r7,#0x00
	mov	r6,#0x00
	mov	r5,#0x00
	push	ar2
	push	ar7
	push	ar6
	push	ar5
;	../../../core/net/rpl/rpl-dag.c:368: instance->def_route = uip_ds6_defrt_add(from,
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
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
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
	mov	r0,#_uip_ds6_defrt_add
	mov	r1,#(_uip_ds6_defrt_add >> 8)
	mov	r2,#(_uip_ds6_defrt_add >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	add	a,#0xfa
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
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:371: if(instance->def_route == NULL) {
	mov	a,r5
	orl	a,r6
	jnz	00109$
;	../../../core/net/rpl/rpl-dag.c:372: return 0;
	mov	dptr,#0x0000
	sjmp	00110$
00108$:
;	../../../core/net/rpl/rpl-dag.c:376: if(instance->def_route != NULL) {
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	a,#0x83
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
	jz	00109$
;	../../../core/net/rpl/rpl-dag.c:377: uip_ds6_defrt_rm(instance->def_route);
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	a,#0x83
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_uip_ds6_defrt_rm
	mov	r1,#(_uip_ds6_defrt_rm >> 8)
	mov	r2,#(_uip_ds6_defrt_rm >> 16)
	lcall	__sdcc_banked_call
00109$:
;	../../../core/net/rpl/rpl-dag.c:382: return 1;
	mov	dptr,#0x0001
00110$:
;	../../../core/net/rpl/rpl-dag.c:383: }
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_alloc_instance'
;------------------------------------------------------------
;instance_id               Allocated to stack - sp -6
;instance                  Allocated to stack - sp -5
;end                       Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:386: rpl_alloc_instance(uint8_t instance_id)
;	-----------------------------------------
;	 function rpl_alloc_instance
;	-----------------------------------------
_rpl_alloc_instance:
	push	dpl
	mov	a,sp
	add	a,#0x06
;	../../../core/net/rpl/rpl-dag.c:390: for(instance = &instance_table[0], end = instance + RPL_MAX_INSTANCES;
	mov	sp,a
	add	a,#0xfb
	mov	r0,a
	mov	@r0,#_instance_table
	inc	r0
	mov	@r0,#(_instance_table >> 8)
	inc	r0
	mov	@r0,#0x00
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	r1,sp
	dec	r1
	dec	r1
	mov	a,#0xc5
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
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar7,@r0
00105$:
;	../../../core/net/rpl/rpl-dag.c:391: instance < end; ++instance) {
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	b,r7
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jc	00121$
	ljmp	00103$
00121$:
;	../../../core/net/rpl/rpl-dag.c:392: if(instance->used == 0) {
	mov	a,#0x87
	add	a,r2
	mov	r4,a
	clr	a
	addc	a,r3
	mov	r5,a
	mov	ar6,r7
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	jz	00122$
	ljmp	00106$
00122$:
;	../../../core/net/rpl/rpl-dag.c:393: memset(instance, 0, sizeof(*instance));
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	mov	a,#0xc5
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	r0,#_memset
	mov	r1,#(_memset >> 8)
	mov	r2,#(_memset >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:394: instance->instance_id = instance_id;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x86
	add	a,@r0
	mov	r4,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar6,@r0
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:395: instance->def_route = NULL;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x83
	add	a,@r0
	mov	r4,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar6,@r0
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:396: instance->used = 1;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x87
	add	a,@r0
	mov	r4,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar6,@r0
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:397: return instance;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	sjmp	00107$
00106$:
;	../../../core/net/rpl/rpl-dag.c:391: instance < end; ++instance) {
	mov	a,#0xc5
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar7
	ljmp	00105$
00103$:
;	../../../core/net/rpl/rpl-dag.c:400: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00107$:
;	../../../core/net/rpl/rpl-dag.c:401: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_alloc_dag'
;------------------------------------------------------------
;dag_id                    Allocated to stack - sp -14
;instance_id               Allocated to registers r7 
;dag                       Allocated to stack - sp -2
;end                       Allocated to stack - sp -5
;instance                  Allocated to stack - sp -8
;sloc0                     Allocated to stack - sp +2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:404: rpl_alloc_dag(uint8_t instance_id, uip_ipaddr_t *dag_id)
;	-----------------------------------------
;	 function rpl_alloc_dag
;	-----------------------------------------
_rpl_alloc_dag:
	mov	a,sp
	add	a,#0x09
	mov	sp,a
;	../../../core/net/rpl/rpl-dag.c:409: instance = rpl_get_instance(instance_id);
	mov  r7,dpl
	push	ar7
	mov	r0,#_rpl_get_instance
	mov	r1,#(_rpl_get_instance >> 8)
	mov	r2,#(_rpl_get_instance >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	pop	ar7
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
;	../../../core/net/rpl/rpl-dag.c:410: if(instance == NULL) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00104$
;	../../../core/net/rpl/rpl-dag.c:411: instance = rpl_alloc_instance(instance_id);
	mov	dpl,r7
	mov	r0,#_rpl_alloc_instance
	mov	r1,#(_rpl_alloc_instance >> 8)
	mov	r2,#(_rpl_alloc_instance >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:412: if(instance == NULL) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
;	../../../core/net/rpl/rpl-dag.c:414: return NULL;
	jnz	00104$
	mov	dptr,#0x0000
	mov	b,a
	ljmp	00114$
00104$:
;	../../../core/net/rpl/rpl-dag.c:418: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	r1,sp
	dec	r1
	dec	r1
	mov	a,#0x0d
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
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
	mov	r1,a
	mov	a,#0x76
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
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
00112$:
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
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
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jc	00138$
	ljmp	00110$
00138$:
;	../../../core/net/rpl/rpl-dag.c:419: if(!dag->used) {
	mov	a,#0x15
	add	a,r4
	mov	r2,a
	clr	a
	addc	a,r5
	mov	r3,a
	mov	ar7,r6
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	__gptrget
	jz	00139$
	ljmp	00113$
00139$:
;	../../../core/net/rpl/rpl-dag.c:420: memset(dag, 0, sizeof(*dag));
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x3b
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	mov	r0,#_memset
	mov	r1,#(_memset >> 8)
	mov	r2,#(_memset >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:421: LIST_STRUCT_INIT(dag, parents);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x22
	add	a,@r0
	mov	r6,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar4,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1f
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r6
	mov	dph,r5
	mov	b,r4
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	mov	r0,#_list_init
	mov	r1,#(_list_init >> 8)
	mov	r2,#(_list_init >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:422: dag->used = 1;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x15
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
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:423: dag->rank = INFINITE_RANK;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	a,#0xff
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:424: dag->min_rank = INFINITE_RANK;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x10
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
	mov	a,#0xff
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:425: dag->instance = instance;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1c
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
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:426: return dag;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	sjmp	00114$
00113$:
;	../../../core/net/rpl/rpl-dag.c:418: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	a,#0x3b
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	ljmp	00112$
00110$:
;	../../../core/net/rpl/rpl-dag.c:431: rpl_free_instance(instance);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_free_instance
	mov	r1,#(_rpl_free_instance >> 8)
	mov	r2,#(_rpl_free_instance >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:432: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00114$:
;	../../../core/net/rpl/rpl-dag.c:433: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_set_default_instance'
;------------------------------------------------------------
;instance                  Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:436: rpl_set_default_instance(rpl_instance_t *instance)
;	-----------------------------------------
;	 function rpl_set_default_instance
;	-----------------------------------------
_rpl_set_default_instance:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:438: default_instance = instance;
	mov	dptr,#_default_instance
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-dag.c:439: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_free_instance'
;------------------------------------------------------------
;instance                  Allocated to registers r5 r6 r7 
;dag                       Allocated to registers r2 r3 r4 
;end                       Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:442: rpl_free_instance(rpl_instance_t *instance)
;	-----------------------------------------
;	 function rpl_free_instance
;	-----------------------------------------
_rpl_free_instance:
	inc	sp
	inc	sp
	inc	sp
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:450: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	a,#0x0d
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x76
	add	a,r2
	mov	@r0,a
	clr	a
	addc	a,r3
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar4
00107$:
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	b,r4
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jnc	00103$
;	../../../core/net/rpl/rpl-dag.c:451: if(dag->used) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,#0x15
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	pop	ar7
	pop	ar6
	pop	ar5
	jz	00108$
;	../../../core/net/rpl/rpl-dag.c:452: rpl_free_dag(dag);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_rpl_free_dag
	mov	r1,#(_rpl_free_dag >> 8)
	mov	r2,#(_rpl_free_dag >> 16)
	lcall	__sdcc_banked_call
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
00108$:
;	../../../core/net/rpl/rpl-dag.c:450: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	a,#0x3b
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	sjmp	00107$
00103$:
;	../../../core/net/rpl/rpl-dag.c:456: rpl_set_default_route(instance, NULL);
	push	ar7
	push	ar6
	push	ar5
	clr	a
	push	acc
	push	acc
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_set_default_route
	mov	r1,#(_rpl_set_default_route >> 8)
	mov	r2,#(_rpl_set_default_route >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:458: ctimer_stop(&instance->dio_timer);
	mov	a,#0x99
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_ctimer_stop
	mov	r1,#(_ctimer_stop >> 8)
	mov	r2,#(_ctimer_stop >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:459: ctimer_stop(&instance->dao_timer);
	mov	a,#0xaf
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_ctimer_stop
	mov	r1,#(_ctimer_stop >> 8)
	mov	r2,#(_ctimer_stop >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:461: if(default_instance == instance) {
	mov	dptr,#_default_instance
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00131$
	sjmp	00105$
00131$:
;	../../../core/net/rpl/rpl-dag.c:462: default_instance = NULL;
	mov	dptr,#_default_instance
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
00105$:
;	../../../core/net/rpl/rpl-dag.c:465: instance->used = 0;
	mov	a,#0x87
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:466: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_free_dag'
;------------------------------------------------------------
;dag                       Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:469: rpl_free_dag(rpl_dag_t *dag)
;	-----------------------------------------
;	 function rpl_free_dag
;	-----------------------------------------
_rpl_free_dag:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:471: if(dag->joined) {
	mov	a,#0x16
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
	jnz	00115$
	ljmp	00104$
00115$:
;	../../../core/net/rpl/rpl-dag.c:475: dag->joined = 0;
	mov	a,#0x16
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:478: rpl_remove_routes(dag);
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_rpl_remove_routes
	mov	r1,#(_rpl_remove_routes >> 8)
	mov	r2,#(_rpl_remove_routes >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:481: if((dag->prefix_info.flags & UIP_ND6_RA_FLAG_AUTONOMOUS)) {
	mov	a,#0x25
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	a,#0x15
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	jnb	acc.6,00102$
;	../../../core/net/rpl/rpl-dag.c:482: check_prefix(&dag->prefix_info, NULL);
	mov	a,#0x25
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	push	ar7
	push	ar6
	push	ar5
	clr	a
	push	acc
	push	acc
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_check_prefix
	mov	r1,#(_check_prefix >> 8)
	mov	r2,#(_check_prefix >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
00102$:
;	../../../core/net/rpl/rpl-dag.c:485: remove_parents(dag, 0);
	push	ar7
	push	ar6
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_remove_parents
	mov	r1,#(_remove_parents >> 8)
	mov	r2,#(_remove_parents >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
00104$:
;	../../../core/net/rpl/rpl-dag.c:487: dag->used = 0;
	mov	a,#0x15
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:488: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_add_parent'
;------------------------------------------------------------
;dio                       Allocated to stack - sp -14
;addr                      Allocated to stack - sp -17
;dag                       Allocated to stack - sp -8
;p                         Allocated to stack - sp -2
;sloc0                     Allocated to stack - sp -5
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:491: rpl_add_parent(rpl_dag_t *dag, rpl_dio_t *dio, uip_ipaddr_t *addr)
;	-----------------------------------------
;	 function rpl_add_parent
;	-----------------------------------------
_rpl_add_parent:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x06
;	../../../core/net/rpl/rpl-dag.c:495: if(RPL_PARENT_COUNT(dag) == RPL_MAX_PARENTS_PER_DAG) {
	mov	sp,a
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x22
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_list_length
	mov	r1,#(_list_length >> 8)
	mov	r2,#(_list_length >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r4,dph
	cjne	r3,#0x08,00102$
	cjne	r4,#0x00,00102$
;	../../../core/net/rpl/rpl-dag.c:496: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
	ljmp	00105$
00102$:
;	../../../core/net/rpl/rpl-dag.c:499: p = memb_alloc(&parent_memb);
	mov	dptr,#_parent_memb
	mov	b,#0x00
	mov	r0,#_memb_alloc
	mov	r1,#(_memb_alloc >> 8)
	mov	r2,#(_memb_alloc >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
;	../../../core/net/rpl/rpl-dag.c:500: if(p == NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
;	../../../core/net/rpl/rpl-dag.c:502: return NULL;
	jnz	00104$
	mov	dptr,#0x0000
	mov	b,a
	ljmp	00105$
00104$:
;	../../../core/net/rpl/rpl-dag.c:504: memcpy(&p->addr, addr, sizeof(p->addr));
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0d
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
;	../../../core/net/rpl/rpl-dag.c:505: p->dag = dag;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:506: p->rank = dio->rank;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
	mov	r1,a
	mov	a,#0x1d
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
	add	a,#0xf2
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x12
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
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
	inc	dptr
	mov	a,r6
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:507: p->dtsn = dio->dtsn;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
	mov	r1,a
	mov	a,#0x20
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
	mov	a,#0x19
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
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
;	../../../core/net/rpl/rpl-dag.c:508: p->link_metric = INITIAL_LINK_METRIC;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1f
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
	mov	a,#0x50
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:509: memcpy(&p->mc, &dio->mc, sizeof(p->mc));
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x06
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	push	ar2
	push	ar3
	push	ar4
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
;	../../../core/net/rpl/rpl-dag.c:510: list_add(dag->parents, p);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x22
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
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_list_add
	mov	r1,#(_list_add >> 8)
	mov	r2,#(_list_add >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:511: return p;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
00105$:
;	../../../core/net/rpl/rpl-dag.c:512: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_find_parent'
;------------------------------------------------------------
;addr                      Allocated to stack - sp -8
;dag                       Allocated to registers r5 r6 r7 
;p                         Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:515: rpl_find_parent(rpl_dag_t *dag, uip_ipaddr_t *addr)
;	-----------------------------------------
;	 function rpl_find_parent
;	-----------------------------------------
_rpl_find_parent:
	inc	sp
	inc	sp
	inc	sp
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:519: for(p = list_head(dag->parents); p != NULL; p = p->next) {
	mov	a,#0x22
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
00105$:
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00103$
;	../../../core/net/rpl/rpl-dag.c:520: if(uip_ipaddr_cmp(&p->addr, addr)) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0d
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
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
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
	jnz	00106$
;	../../../core/net/rpl/rpl-dag.c:521: return p;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	sjmp	00107$
00106$:
;	../../../core/net/rpl/rpl-dag.c:519: for(p = list_head(dag->parents); p != NULL; p = p->next) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	dec	r0
	dec	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	ljmp	00105$
00103$:
;	../../../core/net/rpl/rpl-dag.c:524: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00107$:
;	../../../core/net/rpl/rpl-dag.c:525: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'find_parent_dag'
;------------------------------------------------------------
;addr                      Allocated to stack - sp -14
;instance                  Allocated to registers r5 r6 r7 
;p                         Allocated to stack - sp -5
;dag                       Allocated to registers r5 r6 r7 
;end                       Allocated to stack - sp -2
;sloc0                     Allocated to stack - sp -8
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:529: find_parent_dag(rpl_instance_t *instance, uip_ipaddr_t *addr)
;	-----------------------------------------
;	 function find_parent_dag
;	-----------------------------------------
_find_parent_dag:
	mov	a,sp
	add	a,#0x09
	mov	sp,a
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:534: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	a,#0x0d
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x76
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	ar2,r5
	mov	ar3,r6
	mov	ar4,r7
00111$:
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	b,r4
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jc	00139$
	ljmp	00106$
00139$:
;	../../../core/net/rpl/rpl-dag.c:535: if(dag->used) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,#0x15
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	pop	ar7
	pop	ar6
	pop	ar5
	jnz	00140$
	ljmp	00112$
00140$:
;	../../../core/net/rpl/rpl-dag.c:536: for(p = list_head(dag->parents); p != NULL; p = p->next) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,#0x22
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	pop	ar2
	pop	ar3
	pop	ar4
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:543: return NULL;
	pop	ar7
	pop	ar6
	pop	ar5
;	../../../core/net/rpl/rpl-dag.c:536: for(p = list_head(dag->parents); p != NULL; p = p->next) {
00108$:
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00141$
	ljmp	00112$
00141$:
;	../../../core/net/rpl/rpl-dag.c:537: if(uip_ipaddr_cmp(&p->addr, addr)) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	a,sp
	add	a,#0xf5
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
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_memcmp
	mov	r1,#(_memcmp >> 8)
	mov	r2,#(_memcmp >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	mov	a,r6
	orl	a,r7
	pop	ar7
	pop	ar6
	pop	ar5
	jnz	00109$
;	../../../core/net/rpl/rpl-dag.c:538: return dag;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	sjmp	00113$
00109$:
;	../../../core/net/rpl/rpl-dag.c:536: for(p = list_head(dag->parents); p != NULL; p = p->next) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	dec	r0
	dec	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	ljmp	00108$
00112$:
;	../../../core/net/rpl/rpl-dag.c:534: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	a,#0x3b
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	ar5,r2
	mov	ar6,r3
	mov	ar7,r4
	ljmp	00111$
00106$:
;	../../../core/net/rpl/rpl-dag.c:543: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00113$:
;	../../../core/net/rpl/rpl-dag.c:544: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_find_parent_any_dag'
;------------------------------------------------------------
;addr                      Allocated to stack - sp -5
;instance                  Allocated to registers r5 r6 r7 
;p                         Allocated with name '_rpl_find_parent_any_dag_p_65536_610'
;dag                       Allocated with name '_rpl_find_parent_any_dag_dag_65536_610'
;end                       Allocated with name '_rpl_find_parent_any_dag_end_65536_610'
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:547: rpl_find_parent_any_dag(rpl_instance_t *instance, uip_ipaddr_t *addr)
;	-----------------------------------------
;	 function rpl_find_parent_any_dag
;	-----------------------------------------
_rpl_find_parent_any_dag:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:552: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	a,#0x0d
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#_rpl_find_parent_any_dag_dag_65536_610
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_rpl_find_parent_any_dag_end_65536_610
	mov	a,#0x76
	add	a,r5
	movx	@dptr,a
	clr	a
	addc	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
00111$:
	mov	dptr,#_rpl_find_parent_any_dag_dag_65536_610
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_rpl_find_parent_any_dag_end_65536_610
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jc	00139$
	ljmp	00106$
00139$:
;	../../../core/net/rpl/rpl-dag.c:553: if(dag->used) {
	mov	dptr,#_rpl_find_parent_any_dag_dag_65536_610
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x15
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jnz	00140$
	ljmp	00112$
00140$:
;	../../../core/net/rpl/rpl-dag.c:554: for(p = list_head(dag->parents); p != NULL; p = p->next) {
	mov	dptr,#_rpl_find_parent_any_dag_dag_65536_610
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x22
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	dptr,#_rpl_find_parent_any_dag_p_65536_610
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
00108$:
	mov	dptr,#_rpl_find_parent_any_dag_p_65536_610
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00141$
	ljmp	00112$
00141$:
;	../../../core/net/rpl/rpl-dag.c:555: if(uip_ipaddr_cmp(&p->addr, addr)) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_rpl_find_parent_any_dag_p_65536_610
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	a,#0x0d
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
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
	jnz	00109$
;	../../../core/net/rpl/rpl-dag.c:556: return p;
	mov	dptr,#_rpl_find_parent_any_dag_p_65536_610
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	sjmp	00113$
00109$:
;	../../../core/net/rpl/rpl-dag.c:554: for(p = list_head(dag->parents); p != NULL; p = p->next) {
	mov	dptr,#_rpl_find_parent_any_dag_p_65536_610
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
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
	mov	dptr,#_rpl_find_parent_any_dag_p_65536_610
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	ljmp	00108$
00112$:
;	../../../core/net/rpl/rpl-dag.c:552: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	dptr,#_rpl_find_parent_any_dag_dag_65536_610
	movx	a,@dptr
	add	a,#0x3b
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	ljmp	00111$
00106$:
;	../../../core/net/rpl/rpl-dag.c:561: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00113$:
;	../../../core/net/rpl/rpl-dag.c:562: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_select_dag'
;------------------------------------------------------------
;p                         Allocated to stack - sp -11
;instance                  Allocated to stack - sp -5
;sloc0                     Allocated to stack - sp -2
;last_parent               Allocated with name '_rpl_select_dag_last_parent_65536_618'
;dag                       Allocated with name '_rpl_select_dag_dag_65536_618'
;end                       Allocated with name '_rpl_select_dag_end_65536_618'
;best_dag                  Allocated with name '_rpl_select_dag_best_dag_65536_618'
;old_rank                  Allocated with name '_rpl_select_dag_old_rank_65536_618'
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:565: rpl_select_dag(rpl_instance_t *instance, rpl_parent_t *p)
;	-----------------------------------------
;	 function rpl_select_dag
;	-----------------------------------------
_rpl_select_dag:
	push	dpl
	push	dph
	push	b
	inc	sp
	inc	sp
	inc	sp
;	../../../core/net/rpl/rpl-dag.c:571: old_rank = instance->current_dag->rank;
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
	mov	ar4,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x1a
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
	mov	dptr,#_rpl_select_dag_old_rank_65536_618
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-dag.c:572: last_parent = instance->current_dag->preferred_parent;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x17
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
	mov	dptr,#_rpl_select_dag_last_parent_65536_618
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-dag.c:574: best_dag = instance->current_dag;
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
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-dag.c:575: if(best_dag->rank != ROOT_RANK(instance)) {
	mov	a,#0x1a
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
	mov	a,sp
	add	a,#0xfb
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
	mov	a,r2
	cjne	a,ar5,00237$
	mov	a,r3
	cjne	a,ar6,00237$
	ljmp	00117$
00237$:
;	../../../core/net/rpl/rpl-dag.c:576: if(rpl_select_parent(p->dag) != NULL) {
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x03
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_select_parent
	mov	r1,#(_rpl_select_parent >> 8)
	mov	r2,#(_rpl_select_parent >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,r5
	orl	a,r6
	jnz	00238$
	ljmp	00114$
00238$:
;	../../../core/net/rpl/rpl-dag.c:577: if(p->dag != best_dag) {
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x03
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
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jnz	00239$
	ljmp	00117$
00239$:
;	../../../core/net/rpl/rpl-dag.c:578: best_dag = instance->of->best_dag(best_dag, p->dag);
	mov	a,sp
	add	a,#0xfb
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
	mov	a,#0x09
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
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x03
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
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
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	dec	sp
	dec	sp
	dec	sp
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	ljmp	00117$
00114$:
;	../../../core/net/rpl/rpl-dag.c:580: } else if(p->dag == best_dag) {
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x03
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
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00241$
	ljmp	00117$
00241$:
;	../../../core/net/rpl/rpl-dag.c:581: best_dag = NULL;
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-dag.c:582: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	a,sp
	add	a,#0xfb
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
	mov	dptr,#_rpl_select_dag_dag_65536_618
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_rpl_select_dag_end_65536_618
	mov	a,#0x76
	add	a,r5
	movx	@dptr,a
	clr	a
	addc	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,sp
	add	a,#0xfb
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
00143$:
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_rpl_select_dag_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_rpl_select_dag_end_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	pop	ar7
	pop	ar6
	pop	ar5
	jc	00242$
	ljmp	00117$
00242$:
;	../../../core/net/rpl/rpl-dag.c:583: if(dag->used && dag->preferred_parent != NULL && dag->preferred_parent->rank != INFINITE_RANK) {
	mov	dptr,#_rpl_select_dag_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	a,#0x15
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	jnz	00243$
	ljmp	00144$
00243$:
	mov	dptr,#_rpl_select_dag_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	a,#0x17
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
	mov	a,r2
	orl	a,r3
	jnz	00244$
	ljmp	00144$
00244$:
	mov	dptr,#_rpl_select_dag_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	a,#0x17
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
	mov	a,#0x1d
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
	cjne	r2,#0xff,00245$
	cjne	r3,#0xff,00245$
	ljmp	00144$
00245$:
;	../../../core/net/rpl/rpl-dag.c:584: if(best_dag == NULL) {
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00104$
;	../../../core/net/rpl/rpl-dag.c:585: best_dag = dag;
	mov	dptr,#_rpl_select_dag_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	ljmp	00144$
00104$:
;	../../../core/net/rpl/rpl-dag.c:587: best_dag = instance->of->best_dag(best_dag, dag);
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x09
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
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	push	ar7
	push	ar6
	push	ar5
	mov	dptr,#_rpl_select_dag_dag_65536_618
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	../../../core/net/rpl/rpl-dag.c:652: return best_dag;
	pop	ar7
	pop	ar6
	pop	ar5
;	../../../core/net/rpl/rpl-dag.c:587: best_dag = instance->of->best_dag(best_dag, dag);
00144$:
;	../../../core/net/rpl/rpl-dag.c:582: for(dag = &instance->dag_table[0], end = dag + RPL_MAX_DAG_PER_INSTANCE; dag < end; ++dag) {
	mov	dptr,#_rpl_select_dag_dag_65536_618
	movx	a,@dptr
	add	a,#0x3b
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	ljmp	00143$
00117$:
;	../../../core/net/rpl/rpl-dag.c:594: if(best_dag == NULL) {
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
;	../../../core/net/rpl/rpl-dag.c:596: return NULL;
	jnz	00119$
	mov	dptr,#0x0000
	mov	b,a
	ljmp	00145$
00119$:
;	../../../core/net/rpl/rpl-dag.c:599: if(instance->current_dag != best_dag) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0a
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
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jnz	00248$
	ljmp	00126$
00248$:
;	../../../core/net/rpl/rpl-dag.c:601: rpl_remove_routes(instance->current_dag);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0a
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_remove_routes
	mov	r1,#(_rpl_remove_routes >> 8)
	mov	r2,#(_rpl_remove_routes >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:607: if(best_dag->prefix_info.flags & UIP_ND6_RA_FLAG_AUTONOMOUS) {
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x3a
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jnb	acc.6,00123$
;	../../../core/net/rpl/rpl-dag.c:608: check_prefix(&instance->current_dag->prefix_info, &best_dag->prefix_info);
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x25
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
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
	mov	ar4,@r0
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
	mov	a,#0x25
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_check_prefix
	mov	r1,#(_check_prefix >> 8)
	mov	r2,#(_check_prefix >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	ljmp	00124$
00123$:
;	../../../core/net/rpl/rpl-dag.c:609: } else if(instance->current_dag->prefix_info.flags & UIP_ND6_RA_FLAG_AUTONOMOUS) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0a
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
	mov	a,#0x3a
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
	jnb	acc.6,00124$
;	../../../core/net/rpl/rpl-dag.c:610: check_prefix(&instance->current_dag->prefix_info, NULL);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0a
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
	mov	a,#0x25
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	push	acc
	push	acc
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_check_prefix
	mov	r1,#(_check_prefix >> 8)
	mov	r2,#(_check_prefix >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00124$:
;	../../../core/net/rpl/rpl-dag.c:613: best_dag->joined = 1;
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x16
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:614: instance->current_dag->joined = 0;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0a
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
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x16
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:615: instance->current_dag = best_dag;
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
00126$:
;	../../../core/net/rpl/rpl-dag.c:618: instance->of->update_metric_container(instance);
	mov	a,sp
	add	a,#0xfb
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
	add	a,#0xf5
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
;	../../../core/net/rpl/rpl-dag.c:620: best_dag->rank = instance->of->calculate_rank(best_dag->preferred_parent, 0);
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1a
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x07
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x0c
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
	mov	a,#0x17
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
	push	ar4
	clr	a
	push	acc
	push	acc
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	dec	sp
	dec	sp
	pop	ar4
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
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:621: if(best_dag->rank < best_dag->min_rank) {
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x1a
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	a,#0x10
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
	clr	c
	mov	a,r2
	subb	a,r5
	mov	a,r3
	subb	a,r6
	jnc	00133$
;	../../../core/net/rpl/rpl-dag.c:622: best_dag->min_rank = best_dag->rank;
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x10
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	a,#0x1a
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
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
	ljmp	00134$
00133$:
;	../../../core/net/rpl/rpl-dag.c:623: } else if(!acceptable_rank(best_dag, best_dag->rank)) {
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x1a
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	push	ar2
	push	ar3
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_acceptable_rank
	mov	r1,#(_acceptable_rank >> 8)
	mov	r2,#(_acceptable_rank >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	mov	a,r6
	orl	a,r7
	jz	00252$
	ljmp	00134$
00252$:
;	../../../core/net/rpl/rpl-dag.c:625: instance->current_dag->preferred_parent = NULL;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0a
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
	mov	a,#0x17
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:626: if(instance->mop != RPL_MOP_NO_DOWNWARD_ROUTES && last_parent != NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x89
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
	jz	00128$
	mov	dptr,#_rpl_select_dag_last_parent_65536_618
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00128$
;	../../../core/net/rpl/rpl-dag.c:628: dao_output(last_parent, RPL_ZERO_LIFETIME);
	mov	dptr,#_rpl_select_dag_last_parent_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_dao_output
	mov	r1,#(_dao_output >> 8)
	mov	r2,#(_dao_output >> 16)
	lcall	__sdcc_banked_call
	dec	sp
00128$:
;	../../../core/net/rpl/rpl-dag.c:630: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
	ljmp	00145$
00134$:
;	../../../core/net/rpl/rpl-dag.c:633: if(best_dag->preferred_parent != last_parent) {
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x17
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
	mov	dptr,#_rpl_select_dag_last_parent_65536_618
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jnz	00255$
	ljmp	00141$
00255$:
;	../../../core/net/rpl/rpl-dag.c:634: rpl_set_default_route(instance, &best_dag->preferred_parent->addr);
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x17
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
	mov	a,#0x0d
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_set_default_route
	mov	r1,#(_rpl_set_default_route >> 8)
	mov	r2,#(_rpl_set_default_route >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:638: if(instance->mop != RPL_MOP_NO_DOWNWARD_ROUTES) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x89
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
	jnz	00256$
	ljmp	00138$
00256$:
;	../../../core/net/rpl/rpl-dag.c:639: if(last_parent != NULL) {
	mov	dptr,#_rpl_select_dag_last_parent_65536_618
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00136$
;	../../../core/net/rpl/rpl-dag.c:641: dao_output(last_parent, RPL_ZERO_LIFETIME);
	mov	dptr,#_rpl_select_dag_last_parent_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_dao_output
	mov	r1,#(_dao_output >> 8)
	mov	r2,#(_dao_output >> 16)
	lcall	__sdcc_banked_call
	dec	sp
00136$:
;	../../../core/net/rpl/rpl-dag.c:644: RPL_LOLLIPOP_INCREMENT(instance->dtsn_out);
	mov	a,sp
	add	a,#0xfb
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
	add	a,#0xff - 0x7f
	jnc	00147$
	mov	a,sp
	add	a,#0xfb
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
	sjmp	00148$
00147$:
	mov	a,sp
	add	a,#0xfb
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
00148$:
;	../../../core/net/rpl/rpl-dag.c:645: rpl_schedule_dao(instance);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_schedule_dao
	mov	r1,#(_rpl_schedule_dao >> 8)
	mov	r2,#(_rpl_schedule_dao >> 16)
	lcall	__sdcc_banked_call
00138$:
;	../../../core/net/rpl/rpl-dag.c:647: rpl_reset_dio_timer(instance);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_reset_dio_timer
	mov	r1,#(_rpl_reset_dio_timer >> 8)
	mov	r2,#(_rpl_reset_dio_timer >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:648: } else if(best_dag->rank != old_rank) {
00141$:
;	../../../core/net/rpl/rpl-dag.c:652: return best_dag;
	mov	dptr,#_rpl_select_dag_best_dag_65536_618
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
00145$:
;	../../../core/net/rpl/rpl-dag.c:653: }
	xch	a,r0
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_select_parent'
;------------------------------------------------------------
;dag                       Allocated to stack - sp -8
;p                         Allocated to stack - sp -5
;best                      Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:656: rpl_select_parent(rpl_dag_t *dag)
;	-----------------------------------------
;	 function rpl_select_parent
;	-----------------------------------------
_rpl_select_parent:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x06
	mov	sp,a
;	../../../core/net/rpl/rpl-dag.c:660: best = NULL;
	mov	r0,sp
	dec	r0
	dec	r0
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/rpl/rpl-dag.c:661: for(p = list_head(dag->parents); p != NULL; p = p->next) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x22
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x1c
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
00111$:
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00135$
	ljmp	00107$
00135$:
;	../../../core/net/rpl/rpl-dag.c:662: if(p->rank == INFINITE_RANK) {
	push	ar2
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x1d
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	cjne	r2,#0xff,00136$
	cjne	r3,#0xff,00136$
	pop	ar4
	pop	ar3
	pop	ar2
	ljmp	00112$
00136$:
	pop	ar4
	pop	ar3
	pop	ar2
;	../../../core/net/rpl/rpl-dag.c:664: } else if(best == NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00102$
;	../../../core/net/rpl/rpl-dag.c:665: best = p;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	r1,sp
	dec	r1
	dec	r1
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
	ljmp	00112$
00102$:
;	../../../core/net/rpl/rpl-dag.c:667: best = dag->instance->of->best_parent(best, p);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x07
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
	mov	a,#0x06
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
	push	ar4
	push	ar3
	push	ar2
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
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
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	dec	sp
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
00112$:
;	../../../core/net/rpl/rpl-dag.c:661: for(p = list_head(dag->parents); p != NULL; p = p->next) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	dec	r0
	dec	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	ljmp	00111$
00107$:
;	../../../core/net/rpl/rpl-dag.c:671: if(best != NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00109$
;	../../../core/net/rpl/rpl-dag.c:672: dag->preferred_parent = best;
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
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
00109$:
;	../../../core/net/rpl/rpl-dag.c:675: return best;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
;	../../../core/net/rpl/rpl-dag.c:676: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_remove_parent'
;------------------------------------------------------------
;parent                    Allocated to stack - sp -5
;dag                       Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:679: rpl_remove_parent(rpl_dag_t *dag, rpl_parent_t *parent)
;	-----------------------------------------
;	 function rpl_remove_parent
;	-----------------------------------------
_rpl_remove_parent:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:681: rpl_nullify_parent(dag, parent);
	push	ar7
	push	ar6
	push	ar5
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_nullify_parent
	mov	r1,#(_rpl_nullify_parent >> 8)
	mov	r2,#(_rpl_nullify_parent >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:687: list_remove(dag->parents, parent);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x22
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
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_list_remove
	mov	r1,#(_list_remove >> 8)
	mov	r2,#(_list_remove >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:688: memb_free(&parent_memb, parent);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_parent_memb
	mov	b,#0x00
	mov	r0,#_memb_free
	mov	r1,#(_memb_free >> 8)
	mov	r2,#(_memb_free >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:689: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_nullify_parent'
;------------------------------------------------------------
;parent                    Allocated to stack - sp -5
;dag                       Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:692: rpl_nullify_parent(rpl_dag_t *dag, rpl_parent_t *parent)
;	-----------------------------------------
;	 function rpl_nullify_parent
;	-----------------------------------------
_rpl_nullify_parent:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:694: if(parent == dag->preferred_parent) {
	mov	a,#0x17
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00122$
	ljmp	__sdcc_banked_ret
00122$:
;	../../../core/net/rpl/rpl-dag.c:695: dag->preferred_parent = NULL;
	mov	a,#0x17
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:696: dag->rank = INFINITE_RANK;
	mov	a,#0x1a
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0xff
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:697: if(dag->joined) {
	mov	a,#0x16
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
	jnz	00123$
	ljmp	__sdcc_banked_ret
00123$:
;	../../../core/net/rpl/rpl-dag.c:698: if(dag->instance->def_route != NULL) {
	mov	a,#0x1c
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x83
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
	mov	a,r2
	orl	a,r3
	jnz	00124$
	ljmp	00102$
00124$:
;	../../../core/net/rpl/rpl-dag.c:702: uip_ds6_defrt_rm(dag->instance->def_route);
	mov	a,#0x1c
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x83
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
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_uip_ds6_defrt_rm
	mov	r1,#(_uip_ds6_defrt_rm >> 8)
	mov	r2,#(_uip_ds6_defrt_rm >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:703: dag->instance->def_route = NULL;
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
	mov	a,#0x83
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
00102$:
;	../../../core/net/rpl/rpl-dag.c:705: dao_output(parent, RPL_ZERO_LIFETIME);
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_dao_output
	mov	r1,#(_dao_output >> 8)
	mov	r2,#(_dao_output >> 16)
	lcall	__sdcc_banked_call
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:712: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_move_parent'
;------------------------------------------------------------
;dag_dst                   Allocated to stack - sp -5
;parent                    Allocated to stack - sp -8
;dag_src                   Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:715: rpl_move_parent(rpl_dag_t *dag_src, rpl_dag_t *dag_dst, rpl_parent_t *parent)
;	-----------------------------------------
;	 function rpl_move_parent
;	-----------------------------------------
_rpl_move_parent:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:717: if(parent == dag_src->preferred_parent) {
	mov	a,#0x17
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00128$
	ljmp	00107$
00128$:
;	../../../core/net/rpl/rpl-dag.c:718: dag_src->preferred_parent = NULL;
	mov	a,#0x17
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:719: dag_src->rank = INFINITE_RANK;
	mov	a,#0x1a
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0xff
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:720: if(dag_src->joined && dag_src->instance->def_route != NULL) {
	mov	a,#0x16
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
	jnz	00129$
	ljmp	00108$
00129$:
	mov	a,#0x1c
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x83
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
	mov	a,r2
	orl	a,r3
	jnz	00130$
	ljmp	00108$
00130$:
;	../../../core/net/rpl/rpl-dag.c:725: uip_ds6_defrt_rm(dag_src->instance->def_route);
	mov	a,#0x1c
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x83
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_uip_ds6_defrt_rm
	mov	r1,#(_uip_ds6_defrt_rm >> 8)
	mov	r2,#(_uip_ds6_defrt_rm >> 16)
	lcall	__sdcc_banked_call
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:726: dag_src->instance->def_route = NULL;
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
	mov	a,#0x83
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	pop	ar7
	pop	ar6
	pop	ar5
	sjmp	00108$
00107$:
;	../../../core/net/rpl/rpl-dag.c:728: } else if(dag_src->joined) {
	mov	a,#0x16
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
	jz	00108$
;	../../../core/net/rpl/rpl-dag.c:730: rpl_remove_routes_by_nexthop(&parent->addr, dag_src);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x0d
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	push	ar7
	push	ar6
	push	ar5
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_rpl_remove_routes_by_nexthop
	mov	r1,#(_rpl_remove_routes_by_nexthop >> 8)
	mov	r2,#(_rpl_remove_routes_by_nexthop >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
00108$:
;	../../../core/net/rpl/rpl-dag.c:737: list_remove(dag_src->parents, parent);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x22
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
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_list_remove
	mov	r1,#(_list_remove >> 8)
	mov	r2,#(_list_remove >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:738: parent->dag = dag_dst;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x03
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:739: list_add(dag_dst->parents, parent);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x22
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
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_list_add
	mov	r1,#(_list_add >> 8)
	mov	r2,#(_list_add >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:740: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_get_any_dag'
;------------------------------------------------------------
;i                         Allocated to registers r6 r7 
;sloc0                     Allocated to stack - sp -6
;sloc1                     Allocated to stack - sp -4
;sloc2                     Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:743: rpl_get_any_dag(void)
;	-----------------------------------------
;	 function rpl_get_any_dag
;	-----------------------------------------
_rpl_get_any_dag:
	mov	a,sp
	add	a,#0x07
	mov	sp,a
;	../../../core/net/rpl/rpl-dag.c:747: for(i = 0; i < RPL_MAX_INSTANCES; ++i) {
	mov	r6,#0x00
	mov	r7,#0x00
	mov	ar4,r6
	mov	ar5,r7
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	mov	a,#0xc5
	push	acc
	clr	a
	push	acc
	mov	dpl,r6
	mov	dph,r7
	lcall	__mulint
	xch	a,r0
	mov	a,sp
	add	a,#0xf6
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	dec	sp
	dec	sp
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,sp
	add	a,#0xfa
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
00105$:
;	../../../core/net/rpl/rpl-dag.c:748: if(instance_table[i].used && instance_table[i].current_dag->joined) {
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	add	a,#_instance_table
	mov	r6,a
	inc	r0
	mov	a,@r0
	addc	a,#(_instance_table >> 8)
	mov	r7,a
	mov	a,#0x87
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	pop	ar7
	pop	ar6
	jnz	00125$
	ljmp	00106$
00125$:
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,@r0
	add	a,#_instance_table
	mov	r6,a
	inc	r0
	mov	a,@r0
	addc	a,#(_instance_table >> 8)
	mov	r7,a
	mov	a,#0x0a
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,r7
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x16
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r3
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	pop	ar7
	pop	ar6
	jz	00106$
;	../../../core/net/rpl/rpl-dag.c:749: return instance_table[i].current_dag;
	push	ar6
	push	ar7
	mov	dptr,#0x00c5
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	dec	sp
	dec	sp
	mov	a,r2
	add	a,#_instance_table
	mov	r2,a
	mov	a,r3
	addc	a,#(_instance_table >> 8)
	mov	r3,a
	mov	a,#0x0a
	add	a,r2
	mov	dpl,a
	clr	a
	addc	a,r3
	mov	dph,a
	mov	r0,sp
	dec	r0
	dec	r0
	movx	a,@dptr
	mov	@r0,a
	inc	dptr
	movx	a,@dptr
	inc	r0
	mov	@r0,a
	inc	dptr
	movx	a,@dptr
	inc	r0
	mov	@r0,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	sjmp	00107$
00106$:
;	../../../core/net/rpl/rpl-dag.c:747: for(i = 0; i < RPL_MAX_INSTANCES; ++i) {
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,#0xc5
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,#0xc5
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	inc	r4
	cjne	r4,#0x00,00127$
	inc	r5
00127$:
	mov	ar6,r4
	mov	ar7,r5
	clr	c
	mov	a,r4
	subb	a,#0x01
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00128$
	ljmp	00105$
00128$:
;	../../../core/net/rpl/rpl-dag.c:752: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00107$:
;	../../../core/net/rpl/rpl-dag.c:753: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_get_instance'
;------------------------------------------------------------
;instance_id               Allocated to registers r7 
;i                         Allocated to registers r5 r6 
;sloc0                     Allocated to stack - sp -8
;sloc1                     Allocated to stack - sp -6
;sloc2                     Allocated to stack - sp -4
;sloc3                     Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:756: rpl_get_instance(uint8_t instance_id)
;	-----------------------------------------
;	 function rpl_get_instance
;	-----------------------------------------
_rpl_get_instance:
	mov	a,sp
	add	a,#0x09
	mov	sp,a
	mov	r7,dpl
;	../../../core/net/rpl/rpl-dag.c:760: for(i = 0; i < RPL_MAX_INSTANCES; ++i) {
	mov	r5,#0x00
	mov	r6,#0x00
	mov	ar3,r5
	mov	ar4,r6
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	mov	a,#0xc5
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	lcall	__mulint
	xch	a,r0
	mov	a,sp
	add	a,#0xf1
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xfa
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
00105$:
;	../../../core/net/rpl/rpl-dag.c:761: if(instance_table[i].used && instance_table[i].instance_id == instance_id) {
	push	ar7
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,@r0
	add	a,#_instance_table
	mov	r2,a
	inc	r0
	mov	a,@r0
	addc	a,#(_instance_table >> 8)
	mov	r7,a
	mov	a,#0x87
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	dpl,r2
	mov	dph,r7
	movx	a,@dptr
	pop	ar7
	jz	00106$
	push	ar5
	push	ar6
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	a,@r0
	add	a,#_instance_table
	mov	r2,a
	inc	r0
	mov	a,@r0
	addc	a,#(_instance_table >> 8)
	mov	r6,a
	mov	a,#0x86
	add	a,r2
	mov	dpl,a
	clr	a
	addc	a,r6
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	cjne	a,ar7,00126$
	sjmp	00127$
00126$:
	pop	ar6
	pop	ar5
	sjmp	00106$
00127$:
;	../../../core/net/rpl/rpl-dag.c:762: return &instance_table[i];
	mov	dptr,#0x00c5
	lcall	__mulint
	mov	r7,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,r7
	add	a,#_instance_table
	mov	@r0,a
	mov	a,r6
	addc	a,#(_instance_table >> 8)
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	r1,sp
	dec	r1
	dec	r1
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	inc	r1
	mov	@r1,#0x00
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	sjmp	00107$
00106$:
;	../../../core/net/rpl/rpl-dag.c:760: for(i = 0; i < RPL_MAX_INSTANCES; ++i) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0xc5
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,#0xc5
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	inc	r3
	cjne	r3,#0x00,00128$
	inc	r4
00128$:
	mov	ar5,r3
	mov	ar6,r4
	clr	c
	mov	a,r3
	subb	a,#0x01
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00129$
	ljmp	00105$
00129$:
;	../../../core/net/rpl/rpl-dag.c:765: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00107$:
;	../../../core/net/rpl/rpl-dag.c:766: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_find_of'
;------------------------------------------------------------
;ocp                       Allocated to stack - sp -6
;i                         Allocated to registers r4 r5 
;sloc0                     Allocated to stack - sp -4
;sloc1                     Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:769: rpl_find_of(rpl_ocp_t ocp)
;	-----------------------------------------
;	 function rpl_find_of
;	-----------------------------------------
_rpl_find_of:
	push	dpl
	push	dph
	mov	a,sp
	add	a,#0x05
	mov	sp,a
;	../../../core/net/rpl/rpl-dag.c:773: for(i = 0;
	mov	r4,#0x00
	mov	r5,#0x00
	mov	ar2,r4
	mov	ar3,r5
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	mov	a,#0x03
	push	acc
	clr	a
	push	acc
	mov	dpl,r4
	mov	dph,r5
	lcall	__mulint
	xch	a,r0
	mov	a,sp
	add	a,#0xf6
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
00104$:
;	../../../core/net/rpl/rpl-dag.c:776: if(objective_functions[i]->ocp == ocp) {
	push	ar4
	push	ar5
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,@r0
	add	a,#_objective_functions
	mov	dpl,a
	inc	r0
	mov	a,@r0
	addc	a,#(_objective_functions >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	mov	a,#0x12
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	cjne	a,ar4,00120$
	inc	r0
	mov	a,@r0
	cjne	a,ar5,00120$
	sjmp	00121$
00120$:
	pop	ar5
	pop	ar4
	sjmp	00105$
00121$:
;	../../../core/net/rpl/rpl-dag.c:777: return objective_functions[i];
	mov	dptr,#0x0003
	lcall	__mulint
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	mov	a,r6
	add	a,#_objective_functions
	mov	dpl,a
	mov	a,r7
	addc	a,#(_objective_functions >> 8)
	mov	dph,a
	mov	r0,sp
	dec	r0
	dec	r0
	clr	a
	movc	a,@a+dptr
	mov	@r0,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	inc	r0
	mov	@r0,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	inc	r0
	mov	@r0,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	sjmp	00106$
00105$:
;	../../../core/net/rpl/rpl-dag.c:775: i++) {
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,#0x03
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	inc	r2
	cjne	r2,#0x00,00122$
	inc	r3
00122$:
	mov	ar4,r2
	mov	ar5,r3
;	../../../core/net/rpl/rpl-dag.c:774: i < sizeof(objective_functions) / sizeof(objective_functions[0]);
	clr	c
	mov	a,r2
	subb	a,#0x01
	mov	a,r3
	subb	a,#0x00
	jnc	00123$
	ljmp	00104$
00123$:
;	../../../core/net/rpl/rpl-dag.c:781: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00106$:
;	../../../core/net/rpl/rpl-dag.c:782: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_join_instance'
;------------------------------------------------------------
;dio                       Allocated to stack - sp -24
;from                      Allocated to stack - sp -18
;instance                  Allocated to stack - sp -8
;dag                       Allocated to stack - sp -5
;p                         Allocated to stack - sp -2
;of                        Allocated to stack - sp -15
;sloc0                     Allocated to stack - sp -15
;sloc1                     Allocated to stack - sp -12
;sloc2                     Allocated to stack - sp -9
;sloc3                     Allocated to stack - sp +4
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:785: rpl_join_instance(uip_ipaddr_t *from, rpl_dio_t *dio)
;	-----------------------------------------
;	 function rpl_join_instance
;	-----------------------------------------
_rpl_join_instance:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x10
;	../../../core/net/rpl/rpl-dag.c:792: dag = rpl_alloc_dag(dio->instance_id, &dio->dag_id);
	mov	sp,a
	add	a,#0xe8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x18
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	r0,#_rpl_alloc_dag
	mov	r1,#(_rpl_alloc_dag >> 8)
	mov	r2,#(_rpl_alloc_dag >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	dec	sp
	dec	sp
	dec	sp
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:793: if(dag == NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00102$
;	../../../core/net/rpl/rpl-dag.c:795: return;
	ljmp	00113$
00102$:
;	../../../core/net/rpl/rpl-dag.c:798: instance = dag->instance;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1c
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
;	../../../core/net/rpl/rpl-dag.c:800: p = rpl_add_parent(dag, dio, from);
	mov	a,sp
	add	a,#0xee
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xe5
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_add_parent
	mov	r1,#(_rpl_add_parent >> 8)
	mov	r2,#(_rpl_add_parent >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	r6,dph
	mov	r5,b
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar5
;	../../../core/net/rpl/rpl-dag.c:804: if(p == NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00104$
;	../../../core/net/rpl/rpl-dag.c:806: instance->used = 0;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x87
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
;	../../../core/net/rpl/rpl-dag.c:807: return;
	ljmp	00113$
00104$:
;	../../../core/net/rpl/rpl-dag.c:809: p->dtsn = dio->dtsn;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x20
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
	add	a,#0xe8
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x19
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
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:814: of = rpl_find_of(dio->ocp);
	mov	a,#0x10
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
	mov	dpl,r5
	mov	dph,r6
	mov	r0,#_rpl_find_of
	mov	r1,#(_rpl_find_of >> 8)
	mov	r2,#(_rpl_find_of >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:815: if(of == NULL) {
	mov	a,r5
	orl	a,r6
	jnz	00106$
;	../../../core/net/rpl/rpl-dag.c:818: rpl_remove_parent(dag, p);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_remove_parent
	mov	r1,#(_rpl_remove_parent >> 8)
	mov	r2,#(_rpl_remove_parent >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:819: instance->used = 0;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x87
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
;	../../../core/net/rpl/rpl-dag.c:820: return;
	ljmp	00113$
00106$:
;	../../../core/net/rpl/rpl-dag.c:825: if(dio->prefix_info.flags & UIP_ND6_RA_FLAG_AUTONOMOUS) {
	mov	a,sp
	add	a,#0xe8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x4f
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	jnb	acc.6,00108$
;	../../../core/net/rpl/rpl-dag.c:826: check_prefix(NULL, &dio->prefix_info);
	mov	a,sp
	add	a,#0xe8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x3a
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	push	ar2
	push	ar3
	push	ar4
	mov	dptr,#0x0000
	mov	b,#0x00
	mov	r0,#_check_prefix
	mov	r1,#(_check_prefix >> 8)
	mov	r2,#(_check_prefix >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00108$:
;	../../../core/net/rpl/rpl-dag.c:829: dag->joined = 1;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x16
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
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:830: dag->preference = dio->preference;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf4
	mov	r1,a
	mov	a,#0x14
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
	add	a,#0xe8
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x16
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
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:831: dag->grounded = dio->grounded;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf4
	mov	r1,a
	mov	a,#0x13
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
	mov	a,#0x14
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
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:832: dag->version = dio->version;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf4
	mov	r1,a
	mov	a,#0x12
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
	mov	a,#0x17
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
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:834: instance->of = of;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf4
	mov	r1,a
	mov	a,#0x07
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
	add	a,#0xf4
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,@r1
	lcall	__gptrput
	inc	dptr
	inc	r1
	mov	a,@r1
	lcall	__gptrput
	inc	dptr
	inc	r1
	mov	a,@r1
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:835: instance->mop = dio->mop;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x89
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
	mov	a,#0x15
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
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:836: instance->current_dag = dag;
	mov	a,sp
	add	a,#0xf8
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:837: instance->dtsn_out = RPL_LOLLIPOP_INIT;
	mov	a,sp
	add	a,#0xf8
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
	mov	a,#0xf0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:839: instance->max_rankinc = dio->dag_max_rankinc;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x91
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
	mov	a,#0x20
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	a,sp
	add	a,#0xf1
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
;	../../../core/net/rpl/rpl-dag.c:840: instance->min_hoprankinc = dio->dag_min_hoprankinc;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x93
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
	mov	a,#0x22
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	a,sp
	add	a,#0xf1
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
;	../../../core/net/rpl/rpl-dag.c:841: instance->dio_intdoubl = dio->dag_intdoubl;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x8a
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
	mov	a,#0x1a
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,sp
	add	a,#0xf7
	mov	r1,a
	mov	a,@r1
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:842: instance->dio_intmin = dio->dag_intmin;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x8b
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
	mov	a,#0x1b
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
	mov	r4,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:843: instance->dio_intcurrent = instance->dio_intmin + instance->dio_intdoubl;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x8e
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
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	add	a,r4
	mov	r4,a
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:844: instance->dio_redundancy = dio->dag_redund;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x8c
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
	mov	a,#0x1c
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
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:845: instance->default_lifetime = dio->default_lifetime;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x8d
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
	mov	a,#0x1d
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
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:846: instance->lifetime_unit = dio->lifetime_unit;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,sp
	add	a,#0xf1
	mov	r1,a
	mov	a,#0x95
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
	mov	a,#0x1e
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	a,sp
	add	a,#0xf1
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
;	../../../core/net/rpl/rpl-dag.c:848: memcpy(&dag->dag_id, &dio->dag_id, sizeof(dio->dag_id));
	mov	ar2,r5
	mov	ar3,r6
	mov	ar4,r7
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xec
	mov	r0,a
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
	mov	b,r4
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:851: memcpy(&dag->prefix_info, &dio->prefix_info, sizeof(rpl_prefix_t));
	mov	a,#0x3a
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,sp
	add	a,#0xfb
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
	mov	a,#0x16
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
;	../../../core/net/rpl/rpl-dag.c:853: dag->preferred_parent = p;
	mov	sp,a
	add	a,#0xfb
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
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:854: instance->of->update_metric_container(instance);
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
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
	add	a,#0xf2
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
;	../../../core/net/rpl/rpl-dag.c:855: dag->rank = instance->of->calculate_rank(p, 0);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1a
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x07
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x0c
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
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	clr	a
	push	acc
	push	acc
	push	ar2
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xf5
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
	mov	r2,dpl
	mov	r3,dph
	dec	sp
	dec	sp
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:857: dag->min_rank = dag->rank;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x10
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
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:859: if(default_instance == NULL) {
	mov	dptr,#_default_instance
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00110$
;	../../../core/net/rpl/rpl-dag.c:860: default_instance = instance;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dptr,#_default_instance
	mov	a,@r0
	movx	@dptr,a
	inc	r0
	mov	a,@r0
	inc	dptr
	movx	@dptr,a
	inc	r0
	mov	a,@r0
	inc	dptr
	movx	@dptr,a
00110$:
;	../../../core/net/rpl/rpl-dag.c:870: rpl_reset_dio_timer(instance);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_reset_dio_timer
	mov	r1,#(_rpl_reset_dio_timer >> 8)
	mov	r2,#(_rpl_reset_dio_timer >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:871: rpl_set_default_route(instance, from);
	mov	a,sp
	add	a,#0xee
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_set_default_route
	mov	r1,#(_rpl_set_default_route >> 8)
	mov	r2,#(_rpl_set_default_route >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:873: if(instance->mop != RPL_MOP_NO_DOWNWARD_ROUTES) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x89
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
	jz	00113$
;	../../../core/net/rpl/rpl-dag.c:874: rpl_schedule_dao(instance);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_schedule_dao
	mov	r1,#(_rpl_schedule_dao >> 8)
	mov	r2,#(_rpl_schedule_dao >> 16)
	lcall	__sdcc_banked_call
00113$:
;	../../../core/net/rpl/rpl-dag.c:878: }
	mov	a,sp
	add	a,#0xed
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_add_dag'
;------------------------------------------------------------
;dio                       Allocated to stack - sp -22
;from                      Allocated to stack - sp -16
;instance                  Allocated to stack - sp -8
;dag                       Allocated to stack - sp -5
;previous_dag              Allocated to registers r4 r3 r2 
;p                         Allocated to stack - sp -2
;of                        Allocated to registers r4 r3 r2 
;sloc0                     Allocated to stack - sp -13
;sloc1                     Allocated to stack - sp -10
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:882: rpl_add_dag(uip_ipaddr_t *from, rpl_dio_t *dio)
;	-----------------------------------------
;	 function rpl_add_dag
;	-----------------------------------------
_rpl_add_dag:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x0e
;	../../../core/net/rpl/rpl-dag.c:889: dag = rpl_alloc_dag(dio->instance_id, &dio->dag_id);
	mov	sp,a
	add	a,#0xea
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x18
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	r0,#_rpl_alloc_dag
	mov	r1,#(_rpl_alloc_dag >> 8)
	mov	r2,#(_rpl_alloc_dag >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	dec	sp
	dec	sp
	dec	sp
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:890: if(dag == NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00102$
;	../../../core/net/rpl/rpl-dag.c:892: return;
	ljmp	00120$
00102$:
;	../../../core/net/rpl/rpl-dag.c:895: instance = dag->instance;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1c
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
;	../../../core/net/rpl/rpl-dag.c:897: previous_dag = find_parent_dag(instance, from);
	mov	a,sp
	add	a,#0xf0
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_find_parent_dag
	mov	r1,#(_find_parent_dag >> 8)
	mov	r2,#(_find_parent_dag >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	r6,dph
	mov	r5,b
	dec	sp
	dec	sp
	dec	sp
	mov	ar4,r7
	mov	ar3,r6
	mov	ar2,r5
;	../../../core/net/rpl/rpl-dag.c:898: if(previous_dag == NULL) {
	mov	a,r4
	orl	a,r3
	jnz	00108$
;	../../../core/net/rpl/rpl-dag.c:902: p = rpl_add_parent(dag, dio, from);
	mov	a,sp
	add	a,#0xf0
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
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
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_add_parent
	mov	r1,#(_rpl_add_parent >> 8)
	mov	r2,#(_rpl_add_parent >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	r6,dph
	mov	r5,b
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar5
;	../../../core/net/rpl/rpl-dag.c:903: if(p == NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00172$
	ljmp	00109$
00172$:
;	../../../core/net/rpl/rpl-dag.c:905: dag->used = 0;
	mov	a,sp
	add	a,#0xfb
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
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:906: return;
	ljmp	00120$
00108$:
;	../../../core/net/rpl/rpl-dag.c:910: p = rpl_find_parent(previous_dag, from);
	push	ar4
	push	ar3
	push	ar2
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	r0,#_rpl_find_parent
	mov	r1,#(_rpl_find_parent >> 8)
	mov	r2,#(_rpl_find_parent >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	dec	sp
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:911: if(p != NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00109$
;	../../../core/net/rpl/rpl-dag.c:912: rpl_move_parent(previous_dag, dag, p);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	r0,#_rpl_move_parent
	mov	r1,#(_rpl_move_parent >> 8)
	mov	r2,#(_rpl_move_parent >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
00109$:
;	../../../core/net/rpl/rpl-dag.c:918: of = rpl_find_of(dio->ocp);
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x10
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
	mov	dpl,r5
	mov	dph,r6
	mov	r0,#_rpl_find_of
	mov	r1,#(_rpl_find_of >> 8)
	mov	r2,#(_rpl_find_of >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	ar4,r5
	mov	ar3,r6
	mov	ar2,r7
;	../../../core/net/rpl/rpl-dag.c:919: if(of != instance->of ||
	mov	a,sp
	add	a,#0xf8
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
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00175$
	ljmp	00110$
00175$:
;	../../../core/net/rpl/rpl-dag.c:920: instance->mop != dio->mop ||
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x89
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
	add	a,#0xea
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x15
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar4,00176$
	sjmp	00177$
00176$:
	ljmp	00110$
00177$:
;	../../../core/net/rpl/rpl-dag.c:921: instance->max_rankinc != dio->dag_max_rankinc ||
	mov	a,sp
	add	a,#0xf8
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
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x20
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar3,00178$
	mov	a,r6
	cjne	a,ar4,00178$
	sjmp	00179$
00178$:
	ljmp	00110$
00179$:
;	../../../core/net/rpl/rpl-dag.c:922: instance->min_hoprankinc != dio->dag_min_hoprankinc ||
	mov	a,sp
	add	a,#0xf8
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
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x22
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar3,00180$
	mov	a,r6
	cjne	a,ar4,00180$
	sjmp	00181$
00180$:
	ljmp	00110$
00181$:
;	../../../core/net/rpl/rpl-dag.c:923: instance->dio_intdoubl != dio->dag_intdoubl ||
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x8a
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
	add	a,#0xea
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x1a
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar4,00182$
	sjmp	00183$
00182$:
	ljmp	00110$
00183$:
;	../../../core/net/rpl/rpl-dag.c:924: instance->dio_intmin != dio->dag_intmin ||
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x8b
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
	add	a,#0xea
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x1b
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar4,00184$
	sjmp	00185$
00184$:
	ljmp	00110$
00185$:
;	../../../core/net/rpl/rpl-dag.c:925: instance->dio_redundancy != dio->dag_redund ||
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x8c
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
	add	a,#0xea
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x1c
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar4,00186$
	sjmp	00187$
00186$:
	ljmp	00110$
00187$:
;	../../../core/net/rpl/rpl-dag.c:926: instance->default_lifetime != dio->default_lifetime ||
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x8d
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
	add	a,#0xea
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x1d
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar4,00110$
;	../../../core/net/rpl/rpl-dag.c:927: instance->lifetime_unit != dio->lifetime_unit) {
	mov	a,sp
	add	a,#0xf8
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
	mov	a,sp
	add	a,#0xea
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x1e
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar3,00190$
	mov	a,r6
	cjne	a,ar4,00190$
	sjmp	00111$
00190$:
00110$:
;	../../../core/net/rpl/rpl-dag.c:930: rpl_remove_parent(dag, p);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_remove_parent
	mov	r1,#(_rpl_remove_parent >> 8)
	mov	r2,#(_rpl_remove_parent >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:931: dag->used = 0;
	mov	a,sp
	add	a,#0xfb
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
	clr	a
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:932: return;
	ljmp	00120$
00111$:
;	../../../core/net/rpl/rpl-dag.c:935: dag->used = 1;
	mov	a,sp
	add	a,#0xfb
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
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:936: dag->grounded = dio->grounded;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf3
	mov	r1,a
	mov	a,#0x13
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
	add	a,#0xea
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x14
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:937: dag->preference = dio->preference;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf3
	mov	r1,a
	mov	a,#0x14
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
	mov	a,#0x16
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:938: dag->version = dio->version;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf3
	mov	r1,a
	mov	a,#0x12
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
	mov	a,#0x17
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:940: memcpy(&dag->dag_id, &dio->dag_id, sizeof(dio->dag_id));
	mov	ar5,r2
	mov	ar6,r3
	mov	ar7,r4
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	push	ar4
	push	ar3
	push	ar2
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xee
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
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
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/net/rpl/rpl-dag.c:943: memcpy(&dag->prefix_info, &dio->prefix_info, sizeof(rpl_prefix_t));
	mov	a,#0x3a
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	mov	a,sp
	add	a,#0xfb
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
	push	ar4
	push	ar3
	push	ar2
	mov	a,#0x16
	push	acc
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xee
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
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
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/net/rpl/rpl-dag.c:945: dag->preferred_parent = p;
	mov	a,sp
	add	a,#0xfb
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
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:946: dag->rank = instance->of->calculate_rank(p, 0);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf3
	mov	r1,a
	mov	a,#0x1a
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
	mov	a,#0x0c
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
	push	ar4
	push	ar3
	push	ar2
	clr	a
	push	acc
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf3
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
	xch	a,r0
	mov	a,sp
	add	a,#0xee
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,sp
	add	a,#0xf3
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,sp
	add	a,#0xf6
	mov	r1,a
	mov	a,@r1
	lcall	__gptrput
	inc	dptr
	inc	r1
	mov	a,@r1
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:947: dag->min_rank = dag->rank; /* So far this is the lowest rank we know of. */
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x10
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
	add	a,#0xf6
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:956: rpl_process_parent_event(instance, p);
	push	ar4
	push	ar3
	push	ar2
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_process_parent_event
	mov	r1,#(_rpl_process_parent_event >> 8)
	mov	r2,#(_rpl_process_parent_event >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/net/rpl/rpl-dag.c:957: p->dtsn = dio->dtsn;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x20
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x19
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
00120$:
;	../../../core/net/rpl/rpl-dag.c:958: }
	mov	a,sp
	add	a,#0xef
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'global_repair'
;------------------------------------------------------------
;dag                       Allocated to stack - sp -17
;dio                       Allocated to stack - sp -20
;from                      Allocated to stack - sp -11
;p                         Allocated to stack - sp -2
;sloc0                     Allocated to stack - sp -8
;sloc1                     Allocated to stack - sp -5
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:962: global_repair(uip_ipaddr_t *from, rpl_dag_t *dag, rpl_dio_t *dio)
;	-----------------------------------------
;	 function global_repair
;	-----------------------------------------
_global_repair:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x09
	mov	sp,a
;	../../../core/net/rpl/rpl-dag.c:966: remove_parents(dag, 0);
	clr	a
	push	acc
	push	acc
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_remove_parents
	mov	r1,#(_remove_parents >> 8)
	mov	r2,#(_remove_parents >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:967: dag->version = dio->version;
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x12
	add	a,r2
	mov	@r0,a
	clr	a
	addc	a,r3
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar4
	mov	a,sp
	add	a,#0xec
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x17
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
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r5
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:968: dag->instance->of->reset(dag);
	mov	a,#0x1c
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
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
	mov	a,#0x07
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
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:969: dag->min_rank = INFINITE_RANK;
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x10
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0xff
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:970: RPL_LOLLIPOP_INCREMENT(dag->instance->dtsn_out);
	mov	a,#0x1c
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
	mov	a,#0x88
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	add	a,#0xff - 0x7f
	jnc	00106$
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x1c
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
	mov	a,#0x88
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
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
	sjmp	00107$
00106$:
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x1c
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
	mov	a,#0x88
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
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
00107$:
;	../../../core/net/rpl/rpl-dag.c:972: p = rpl_add_parent(dag, dio, from);
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
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_add_parent
	mov	r1,#(_rpl_add_parent >> 8)
	mov	r2,#(_rpl_add_parent >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:973: if(p == NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00102$
;	../../../core/net/rpl/rpl-dag.c:975: dag->rank = INFINITE_RANK;
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x1a
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0xff
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	ljmp	00104$
00102$:
;	../../../core/net/rpl/rpl-dag.c:977: dag->rank = dag->instance->of->calculate_rank(p, 0);
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x1a
	add	a,r2
	mov	@r0,a
	clr	a
	addc	a,r3
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar4
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1c
	add	a,r2
	mov	@r0,a
	clr	a
	addc	a,r3
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar4
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x07
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
	mov	a,#0x0c
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
	push	ar4
	push	ar3
	push	ar2
	clr	a
	push	acc
	push	acc
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
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar7
	mov	a,sp
	add	a,#0xf8
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
;	../../../core/net/rpl/rpl-dag.c:978: dag->min_rank = dag->rank;
	mov	a,#0x10
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:979: rpl_process_parent_event(dag->instance, p);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_process_parent_event
	mov	r1,#(_rpl_process_parent_event >> 8)
	mov	r2,#(_rpl_process_parent_event >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00104$:
;	../../../core/net/rpl/rpl-dag.c:986: }
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_local_repair'
;------------------------------------------------------------
;instance                  Allocated to registers r5 r6 r7 
;i                         Allocated to registers r4 r3 
;sloc0                     Allocated to stack - sp -11
;sloc1                     Allocated to stack - sp -8
;sloc2                     Allocated to stack - sp -6
;sloc3                     Allocated to stack - sp -4
;sloc4                     Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:989: rpl_local_repair(rpl_instance_t *instance)
;	-----------------------------------------
;	 function rpl_local_repair
;	-----------------------------------------
_rpl_local_repair:
	mov	a,sp
	add	a,#0x0c
	mov	sp,a
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:994: for(i = 0; i < RPL_MAX_DAG_PER_INSTANCE; i++) {
	mov	r4,#0x00
	mov	r3,#0x00
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0d
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xf5
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
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar3
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0x3b
	push	acc
	clr	a
	push	acc
	mov	dpl,r4
	mov	dph,r3
	lcall	__mulint
	xch	a,r0
	mov	a,sp
	add	a,#0xf5
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,sp
	add	a,#0xfc
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
00104$:
;	../../../core/net/rpl/rpl-dag.c:995: if(instance->dag_table[i].used) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	a,sp
	add	a,#0xf9
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	mov	r5,a
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x15
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	pop	ar7
	pop	ar6
	pop	ar5
	jz	00105$
;	../../../core/net/rpl/rpl-dag.c:996: instance->dag_table[i].rank = INFINITE_RANK;
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf7
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	mov	r5,a
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x1a
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0xff
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:997: nullify_parents(&instance->dag_table[i], 0);
	push	ar7
	push	ar6
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_nullify_parents
	mov	r1,#(_nullify_parents >> 8)
	mov	r2,#(_nullify_parents >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:1001: rpl_reset_dio_timer(instance);
	pop	ar7
	pop	ar6
	pop	ar5
;	../../../core/net/rpl/rpl-dag.c:997: nullify_parents(&instance->dag_table[i], 0);
00105$:
;	../../../core/net/rpl/rpl-dag.c:994: for(i = 0; i < RPL_MAX_DAG_PER_INSTANCE; i++) {
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,#0x3b
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,#0x3b
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00122$
	inc	r0
	inc	@r0
00122$:
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,#0x02
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00123$
	ljmp	00104$
00123$:
;	../../../core/net/rpl/rpl-dag.c:1001: rpl_reset_dio_timer(instance);
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_reset_dio_timer
	mov	r1,#(_rpl_reset_dio_timer >> 8)
	mov	r2,#(_rpl_reset_dio_timer >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:1004: }
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_recalculate_ranks'
;------------------------------------------------------------
;instance                  Allocated to registers 
;end                       Allocated to registers 
;p                         Allocated to stack - sp -2
;i                         Allocated to registers r3 r4 
;sloc0                     Allocated to stack - sp -12
;sloc1                     Allocated to stack - sp -9
;sloc2                     Allocated to stack - sp -6
;sloc3                     Allocated to stack - sp -4
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:1007: rpl_recalculate_ranks(void)
;	-----------------------------------------
;	 function rpl_recalculate_ranks
;	-----------------------------------------
_rpl_recalculate_ranks:
	mov	a,sp
	add	a,#0x0d
	mov	sp,a
;	../../../core/net/rpl/rpl-dag.c:1018: for(instance = &instance_table[0], end = instance + RPL_MAX_INSTANCES; instance < end; ++instance) {
	mov	r5,#_instance_table
	mov	r6,#(_instance_table >> 8)
	mov	r7,#0x00
00118$:
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
	jc	00156$
	ljmp	00120$
00156$:
;	../../../core/net/rpl/rpl-dag.c:1019: if(instance->used) {
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
	jnz	00157$
	ljmp	00119$
00157$:
;	../../../core/net/rpl/rpl-dag.c:1020: for(i = 0; i < RPL_MAX_DAG_PER_INSTANCE; i++) {
	clr	a
	mov	r3,a
	mov	r4,a
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	a,#0x0d
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	a,sp
	add	a,#0xf7
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
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0x3b
	push	acc
	clr	a
	push	acc
	mov	dpl,r3
	mov	dph,r4
	lcall	__mulint
	mov	r3,dpl
	mov	r4,dph
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
00115$:
;	../../../core/net/rpl/rpl-dag.c:1021: if(instance->dag_table[i].used) {
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,sp
	add	a,#0xfa
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
	mov	a,#0x15
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	pop	ar4
	pop	ar3
	jnz	00158$
	ljmp	00116$
00158$:
;	../../../core/net/rpl/rpl-dag.c:1022: for(p = list_head(instance->dag_table[i].parents); p != NULL; p = p->next) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	a,r3
	add	a,@r0
	mov	r2,a
	mov	a,r4
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,#0x22
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	push	ar4
	push	ar3
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	pop	ar3
	pop	ar4
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:1018: for(instance = &instance_table[0], end = instance + RPL_MAX_INSTANCES; instance < end; ++instance) {
	pop	ar7
	pop	ar6
	pop	ar5
;	../../../core/net/rpl/rpl-dag.c:1022: for(p = list_head(instance->dag_table[i].parents); p != NULL; p = p->next) {
00113$:
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00159$
	ljmp	00116$
00159$:
;	../../../core/net/rpl/rpl-dag.c:1023: if(p->updated) {
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,#0x21
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
	pop	ar4
	pop	ar3
	jz	00114$
;	../../../core/net/rpl/rpl-dag.c:1024: p->updated = 0;
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,#0x21
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
;	../../../core/net/rpl/rpl-dag.c:1025: if(!rpl_process_parent_event(instance, p)) {
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_process_parent_event
	mov	r1,#(_rpl_process_parent_event >> 8)
	mov	r2,#(_rpl_process_parent_event >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:1033: break;
	pop	ar4
	pop	ar3
	sjmp	00116$
00114$:
;	../../../core/net/rpl/rpl-dag.c:1022: for(p = list_head(instance->dag_table[i].parents); p != NULL; p = p->next) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	dec	r0
	dec	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	ljmp	00113$
00116$:
;	../../../core/net/rpl/rpl-dag.c:1020: for(i = 0; i < RPL_MAX_DAG_PER_INSTANCE; i++) {
	mov	a,#0x3b
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,#0x3b
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00161$
	inc	r0
	inc	@r0
00161$:
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,#0x02
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00162$
	ljmp	00115$
00162$:
00119$:
;	../../../core/net/rpl/rpl-dag.c:1018: for(instance = &instance_table[0], end = instance + RPL_MAX_INSTANCES; instance < end; ++instance) {
	mov	a,#0xc5
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	ljmp	00118$
00120$:
;	../../../core/net/rpl/rpl-dag.c:1040: }
	mov	a,sp
	add	a,#0xf3
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_process_parent_event'
;------------------------------------------------------------
;p                         Allocated to stack - sp -10
;instance                  Allocated to stack - sp -4
;old_rank                  Allocated to registers 
;return_value              Allocated to stack - sp -1
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:1043: rpl_process_parent_event(rpl_instance_t *instance, rpl_parent_t *p)
;	-----------------------------------------
;	 function rpl_process_parent_event
;	-----------------------------------------
_rpl_process_parent_event:
	push	dpl
	push	dph
	push	b
	inc	sp
	inc	sp
;	../../../core/net/rpl/rpl-dag.c:1049: return_value = 1;
	mov	r0,sp
	dec	r0
	mov	@r0,#0x01
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/rpl/rpl-dag.c:1051: if(!acceptable_rank(p->dag, p->rank)) {
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x1d
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x03
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
	push	ar5
	push	ar6
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_acceptable_rank
	mov	r1,#(_acceptable_rank >> 8)
	mov	r2,#(_acceptable_rank >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	mov	a,r6
	orl	a,r7
	jz	00122$
	ljmp	00105$
00122$:
;	../../../core/net/rpl/rpl-dag.c:1055: if(p != instance->current_dag->preferred_parent) {
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,#0x0a
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
	mov	a,#0x17
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
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00102$
;	../../../core/net/rpl/rpl-dag.c:1056: rpl_nullify_parent(p->dag, p);
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x03
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_rpl_nullify_parent
	mov	r1,#(_rpl_nullify_parent >> 8)
	mov	r2,#(_rpl_nullify_parent >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:1057: return 0;
	mov	dptr,#0x0000
	ljmp	00108$
00102$:
;	../../../core/net/rpl/rpl-dag.c:1059: rpl_nullify_parent(p->dag, p);
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x03
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_rpl_nullify_parent
	mov	r1,#(_rpl_nullify_parent >> 8)
	mov	r2,#(_rpl_nullify_parent >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:1060: return_value = 0;
	mov	r0,sp
	dec	r0
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
00105$:
;	../../../core/net/rpl/rpl-dag.c:1064: if(rpl_select_dag(instance, p) == NULL) {
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_select_dag
	mov	r1,#(_rpl_select_dag >> 8)
	mov	r2,#(_rpl_select_dag >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	dec	sp
	dec	sp
	dec	sp
	mov	a,r5
	orl	a,r6
	jnz	00107$
;	../../../core/net/rpl/rpl-dag.c:1067: rpl_local_repair(instance);
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_local_repair
	mov	r1,#(_rpl_local_repair >> 8)
	mov	r2,#(_rpl_local_repair >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:1068: return 0;
	mov	dptr,#0x0000
	sjmp	00108$
00107$:
;	../../../core/net/rpl/rpl-dag.c:1086: return return_value;
	mov	r0,sp
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
00108$:
;	../../../core/net/rpl/rpl-dag.c:1087: }
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rpl_process_dio'
;------------------------------------------------------------
;dio                       Allocated to stack - sp -14
;from                      Allocated to registers r5 r6 r7 
;instance                  Allocated to stack - sp -2
;dag                       Allocated to stack - sp -8
;previous_dag              Allocated to registers r4 r3 r2 
;p                         Allocated to stack - sp -5
;sloc0                     Allocated to stack - sp +7
;------------------------------------------------------------
;	../../../core/net/rpl/rpl-dag.c:1090: rpl_process_dio(uip_ipaddr_t *from, rpl_dio_t *dio)
;	-----------------------------------------
;	 function rpl_process_dio
;	-----------------------------------------
_rpl_process_dio:
	mov	a,sp
	add	a,#0x09
	mov	sp,a
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/rpl/rpl-dag.c:1096: if(dio->mop != RPL_MOP_DEFAULT) {
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x15
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
	cjne	r2,#0x02,00273$
	sjmp	00102$
00273$:
;	../../../core/net/rpl/rpl-dag.c:1098: return;
	ljmp	00155$
00102$:
;	../../../core/net/rpl/rpl-dag.c:1101: dag = get_dag(dio->instance_id, &dio->dag_id);
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x18
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r5
	mov	r0,#_get_dag
	mov	r1,#(_get_dag >> 8)
	mov	r2,#(_get_dag >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	dec	sp
	dec	sp
	dec	sp
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:1102: instance = rpl_get_instance(dio->instance_id);
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x18
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,a
	mov	r0,#_rpl_get_instance
	mov	r1,#(_rpl_get_instance >> 8)
	mov	r2,#(_rpl_get_instance >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:1104: if(dag != NULL && instance != NULL) {
	pop	ar7
	pop	ar6
	pop	ar5
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00274$
	ljmp	00113$
00274$:
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00275$
	ljmp	00113$
00275$:
;	../../../core/net/rpl/rpl-dag.c:1105: if(lollipop_greater_than(dio->version, dag->version)) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
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
	mov	r2,a
	mov	r4,#0x00
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x17
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r3
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	mov	r7,#0x00
	push	ar5
	push	ar2
	push	ar4
	mov	dpl,r3
	mov	dph,r7
	mov	r0,#_lollipop_greater_than
	mov	r1,#(_lollipop_greater_than >> 8)
	mov	r2,#(_lollipop_greater_than >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar5
	mov	a,r6
	orl	a,r7
	pop	ar7
	pop	ar6
	pop	ar5
	jnz	00276$
	ljmp	00107$
00276$:
;	../../../core/net/rpl/rpl-dag.c:1106: if(dag->rank == ROOT_RANK(instance)) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x1a
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x93
	add	a,@r0
	mov	r4,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	a,r2
	cjne	a,ar4,00277$
	mov	a,r3
	cjne	a,ar6,00277$
	sjmp	00278$
00277$:
	pop	ar7
	pop	ar6
	pop	ar5
	ljmp	00104$
00278$:
	pop	ar7
	pop	ar6
	pop	ar5
;	../../../core/net/rpl/rpl-dag.c:1108: dag->version = dio->version;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x12
	add	a,@r0
	mov	r7,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar5,@r0
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x17
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
;	../../../core/net/rpl/rpl-dag.c:1109: RPL_LOLLIPOP_INCREMENT(dag->version);
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__gptrput
	add	a,#0xff - 0x7f
	jnc	00157$
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x12
	add	a,@r0
	mov	r7,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__gptrget
	mov	r4,a
	inc	r4
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	a,r4
	lcall	__gptrput
	sjmp	00158$
00157$:
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x12
	add	a,@r0
	mov	r7,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__gptrget
	mov	r4,a
	inc	r4
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	a,r4
	lcall	__gptrput
00158$:
;	../../../core/net/rpl/rpl-dag.c:1110: rpl_reset_dio_timer(instance);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_reset_dio_timer
	mov	r1,#(_rpl_reset_dio_timer >> 8)
	mov	r2,#(_rpl_reset_dio_timer >> 16)
	lcall	__sdcc_banked_call
	sjmp	00105$
00104$:
;	../../../core/net/rpl/rpl-dag.c:1112: global_repair(from, dag, dio);
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_global_repair
	mov	r1,#(_global_repair >> 8)
	mov	r2,#(_global_repair >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
00105$:
;	../../../core/net/rpl/rpl-dag.c:1114: return;
	ljmp	00155$
00107$:
;	../../../core/net/rpl/rpl-dag.c:1117: if(lollipop_greater_than(dag->version, dio->version)) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x17
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
	mov	r4,#0x00
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x12
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r3
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	mov	r7,#0x00
	push	ar5
	push	ar2
	push	ar4
	mov	dpl,r3
	mov	dph,r7
	mov	r0,#_lollipop_greater_than
	mov	r1,#(_lollipop_greater_than >> 8)
	mov	r2,#(_lollipop_greater_than >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	pop	ar5
	mov	a,r6
	orl	a,r7
	pop	ar7
	pop	ar6
	pop	ar5
	jz	00113$
;	../../../core/net/rpl/rpl-dag.c:1120: if(dag->joined) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x16
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
	jz	00113$
;	../../../core/net/rpl/rpl-dag.c:1121: rpl_reset_dio_timer(instance);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_reset_dio_timer
	mov	r1,#(_rpl_reset_dio_timer >> 8)
	mov	r2,#(_rpl_reset_dio_timer >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/rpl/rpl-dag.c:1122: return;
	ljmp	00155$
00113$:
;	../../../core/net/rpl/rpl-dag.c:1127: if(dio->rank == INFINITE_RANK) {
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x12
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
	cjne	r2,#0xff,00116$
	cjne	r3,#0xff,00116$
;	../../../core/net/rpl/rpl-dag.c:1131: return;
	ljmp	00155$
00116$:
;	../../../core/net/rpl/rpl-dag.c:1134: if(instance == NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00118$
;	../../../core/net/rpl/rpl-dag.c:1136: rpl_join_instance(from, dio);
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_join_instance
	mov	r1,#(_rpl_join_instance >> 8)
	mov	r2,#(_rpl_join_instance >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:1137: return;
	ljmp	00155$
00118$:
;	../../../core/net/rpl/rpl-dag.c:1140: if(dag == NULL) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00120$
;	../../../core/net/rpl/rpl-dag.c:1142: rpl_add_dag(from, dio);
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rpl_add_dag
	mov	r1,#(_rpl_add_dag >> 8)
	mov	r2,#(_rpl_add_dag >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/rpl/rpl-dag.c:1143: return;
	ljmp	00155$
00120$:
;	../../../core/net/rpl/rpl-dag.c:1147: if(dio->rank < ROOT_RANK(instance)) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x12
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x93
	add	a,@r0
	mov	r4,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	clr	c
	mov	a,r2
	subb	a,r4
	mov	a,r3
	subb	a,r6
	pop	ar7
	pop	ar6
	pop	ar5
	jnc	00125$
;	../../../core/net/rpl/rpl-dag.c:1150: return;
	ljmp	00155$
00125$:
;	../../../core/net/rpl/rpl-dag.c:1151: } else if(dio->rank == INFINITE_RANK && dag->joined) {
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x12
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
	cjne	r2,#0xff,00126$
	cjne	r3,#0xff,00126$
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x16
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
	jz	00126$
;	../../../core/net/rpl/rpl-dag.c:1152: rpl_reset_dio_timer(instance);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
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
00126$:
;	../../../core/net/rpl/rpl-dag.c:1155: if(dag->rank == ROOT_RANK(instance)) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x1a
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x93
	add	a,@r0
	mov	r4,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	a,r2
	cjne	a,ar4,00290$
	mov	a,r3
	cjne	a,ar6,00290$
	sjmp	00291$
00290$:
	pop	ar7
	pop	ar6
	pop	ar5
	sjmp	00130$
00291$:
	pop	ar7
	pop	ar6
	pop	ar5
;	../../../core/net/rpl/rpl-dag.c:1156: if(dio->rank != INFINITE_RANK) {
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x12
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
	cjne	r2,#0xff,00292$
	cjne	r3,#0xff,00292$
	sjmp	00128$
00292$:
;	../../../core/net/rpl/rpl-dag.c:1157: instance->dio_counter++;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x90
	add	a,@r0
	mov	r7,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__gptrget
	mov	r4,a
	inc	r4
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	a,r4
	lcall	__gptrput
00128$:
;	../../../core/net/rpl/rpl-dag.c:1159: return;
	ljmp	00155$
00130$:
;	../../../core/net/rpl/rpl-dag.c:1169: p = rpl_find_parent(dag, from);
	push	ar7
	push	ar6
	push	ar5
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf2
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
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
;	../../../core/net/rpl/rpl-dag.c:1170: if(p == NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00293$
	ljmp	00146$
00293$:
;	../../../core/net/rpl/rpl-dag.c:1171: previous_dag = find_parent_dag(instance, from);
	push	ar7
	push	ar6
	push	ar5
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_find_parent_dag
	mov	r1,#(_find_parent_dag >> 8)
	mov	r2,#(_find_parent_dag >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	mov	r3,dph
	mov	r2,b
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:1172: if(previous_dag == NULL) {
	mov	a,r4
	orl	a,r3
	jz	00294$
	ljmp	00138$
00294$:
;	../../../core/net/rpl/rpl-dag.c:1173: if(RPL_PARENT_COUNT(dag) == RPL_MAX_PARENTS_PER_DAG) {
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,#0x22
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	push	ar5
	mov	r0,#_list_length
	mov	r1,#(_list_length >> 8)
	mov	r2,#(_list_length >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	pop	ar5
	cjne	r6,#0x08,00295$
	cjne	r7,#0x00,00295$
	sjmp	00296$
00295$:
	pop	ar7
	pop	ar6
	pop	ar5
	sjmp	00132$
00296$:
;	../../../core/net/rpl/rpl-dag.c:1175: remove_worst_parent(dag, dio->rank);
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
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
	push	ar7
	push	ar6
	push	ar5
	push	ar5
	push	ar6
	mov	a,sp
	add	a,#0xf0
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_remove_worst_parent
	mov	r1,#(_remove_worst_parent >> 8)
	mov	r2,#(_remove_worst_parent >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/rpl/rpl-dag.c:1227: p->dtsn = dio->dtsn;
	pop	ar7
	pop	ar6
	pop	ar5
;	../../../core/net/rpl/rpl-dag.c:1175: remove_worst_parent(dag, dio->rank);
00132$:
;	../../../core/net/rpl/rpl-dag.c:1178: p = rpl_add_parent(dag, dio, from);
	push	ar5
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_add_parent
	mov	r1,#(_rpl_add_parent >> 8)
	mov	r2,#(_rpl_add_parent >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	r6,dph
	mov	r5,b
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar5
;	../../../core/net/rpl/rpl-dag.c:1179: if(p == NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00297$
	ljmp	00147$
00297$:
;	../../../core/net/rpl/rpl-dag.c:1183: return;
	ljmp	00155$
00138$:
;	../../../core/net/rpl/rpl-dag.c:1189: p = rpl_find_parent(previous_dag, from);
	push	ar4
	push	ar3
	push	ar2
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	r0,#_rpl_find_parent
	mov	r1,#(_rpl_find_parent >> 8)
	mov	r2,#(_rpl_find_parent >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	dec	sp
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/rpl/rpl-dag.c:1190: if(p != NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00298$
	ljmp	00147$
00298$:
;	../../../core/net/rpl/rpl-dag.c:1191: rpl_move_parent(previous_dag, dag, p);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
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
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	mov	r0,#_rpl_move_parent
	mov	r1,#(_rpl_move_parent >> 8)
	mov	r2,#(_rpl_move_parent >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	ljmp	00147$
00146$:
;	../../../core/net/rpl/rpl-dag.c:1195: if(p->rank == dio->rank) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1d
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
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x12
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,r5
	cjne	a,ar3,00143$
	mov	a,r6
	cjne	a,ar4,00143$
;	../../../core/net/rpl/rpl-dag.c:1197: if(dag->joined) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
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
	lcall	__gptrget
	jz	00147$
;	../../../core/net/rpl/rpl-dag.c:1198: instance->dio_counter++;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x90
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
	sjmp	00147$
00143$:
;	../../../core/net/rpl/rpl-dag.c:1201: p->rank=dio->rank;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1d
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x12
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	../../../core/net/rpl/rpl-dag.c:1227: p->dtsn = dio->dtsn;
;	../../../core/net/rpl/rpl-dag.c:1201: p->rank=dio->rank;
00147$:
;	../../../core/net/rpl/rpl-dag.c:1214: memcpy(&p->mc, &dio->mc, sizeof(p->mc));
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x50
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x06
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	a,#0x07
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
;	../../../core/net/rpl/rpl-dag.c:1215: if(rpl_process_parent_event(instance, p) == 0) {
	mov	sp,a
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_process_parent_event
	mov	r1,#(_rpl_process_parent_event >> 8)
	mov	r2,#(_rpl_process_parent_event >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	dec	sp
	mov	a,r6
	orl	a,r7
	jnz	00149$
;	../../../core/net/rpl/rpl-dag.c:1217: return;
	ljmp	00155$
00149$:
;	../../../core/net/rpl/rpl-dag.c:1221: if(dag->joined && p == dag->preferred_parent) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
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
	lcall	__gptrget
	jnz	00303$
	ljmp	00153$
00303$:
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00305$
	ljmp	00153$
00305$:
;	../../../core/net/rpl/rpl-dag.c:1222: if(should_send_dao(instance, dio, p)) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_should_send_dao
	mov	r1,#(_should_send_dao >> 8)
	mov	r2,#(_should_send_dao >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	mov	a,r6
	orl	a,r7
	jz	00153$
;	../../../core/net/rpl/rpl-dag.c:1223: RPL_LOLLIPOP_INCREMENT(instance->dtsn_out);
	mov	r0,sp
	dec	r0
	dec	r0
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
	add	a,#0xff - 0x7f
	jnc	00159$
	mov	r0,sp
	dec	r0
	dec	r0
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
	sjmp	00160$
00159$:
	mov	r0,sp
	dec	r0
	dec	r0
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
00160$:
;	../../../core/net/rpl/rpl-dag.c:1224: rpl_schedule_dao(instance);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_rpl_schedule_dao
	mov	r1,#(_rpl_schedule_dao >> 8)
	mov	r2,#(_rpl_schedule_dao >> 16)
	lcall	__sdcc_banked_call
00153$:
;	../../../core/net/rpl/rpl-dag.c:1227: p->dtsn = dio->dtsn;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x20
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	a,sp
	add	a,#0xf2
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,#0x19
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
00155$:
;	../../../core/net/rpl/rpl-dag.c:1228: }
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
_objective_functions:
	.byte _rpl_of_etx, (_rpl_of_etx >> 8),#0x00
	.area XINIT   (CODE)
__xinit__parent_memb:
	.byte #0x22,#0x00	; 34
	.byte #0x10,#0x00	; 16
	.byte _parent_memb_memb_count, (_parent_memb_memb_count >> 8),#0x00
	.byte _parent_memb_memb_mem, (_parent_memb_memb_mem >> 8),#0x00
	.area CABS    (ABS,CODE)
