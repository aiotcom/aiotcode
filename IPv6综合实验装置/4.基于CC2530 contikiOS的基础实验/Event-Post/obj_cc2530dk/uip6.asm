;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module uip6
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _remove_ext_hdr
	.globl _uip_add32
	.globl _rpl_verify_header
	.globl _rpl_update_header_empty
	.globl _uip_rpl_input
	.globl _uip_ds6_select_src
	.globl _uip_ds6_maddr_lookup
	.globl _uip_ds6_addr_lookup
	.globl _uip_ds6_is_addr_onlink
	.globl _uip_ds6_init
	.globl _uip_nd6_na_input
	.globl _uip_nd6_ns_input
	.globl _uip_icmp6_error_output
	.globl _uip_icmp6_echo_request_input
	.globl _tcpip_uipcall
	.globl ___memcpy
	.globl _memset
	.globl _memcmp
	.globl _memmove
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
	.globl _uip_ext_opt_offset
	.globl _uip_ext_len
	.globl _uip_ext_bitmap
	.globl _uip_udp_conns
	.globl _uip_udp_conn
	.globl _uip_acc32
	.globl _uip_listenports
	.globl _uip_conns
	.globl _uip_conn
	.globl _uip_flags
	.globl _uip_slen
	.globl _uip_len
	.globl _uip_sappdata
	.globl _uip_appdata
	.globl _uip_aligned_buf
	.globl _uip_next_hdr
	.globl _uip_lladdr
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
	.globl _uip_chksum
	.globl _uip_ipchksum
	.globl _uip_icmp6chksum
	.globl _uip_tcpchksum
	.globl _uip_udpchksum
	.globl _uip_init
	.globl _uip_connect
	.globl _uip_udp_new
	.globl _uip_unlisten
	.globl _uip_listen
	.globl _uip_process
	.globl _uip_htons
	.globl _uip_htonl
	.globl _uip_send
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
_uip_lladdr::
	.ds 8
_uip_next_hdr::
	.ds 3
_uip_aligned_buf::
	.ds 240
_uip_appdata::
	.ds 3
_uip_sappdata::
	.ds 3
_uip_len::
	.ds 2
_uip_slen::
	.ds 2
_uip_flags::
	.ds 1
_uip_conn::
	.ds 3
_c:
	.ds 1
_lastport:
	.ds 2
_uip_conns::
	.ds 460
_uip_listenports::
	.ds 40
_iss:
	.ds 4
_uip_acc32::
	.ds 4
_opt:
	.ds 1
_tmp16:
	.ds 2
_uip_udp_conn::
	.ds 3
_uip_udp_conns::
	.ds 270
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_uip_ext_bitmap::
	.ds 1
_uip_ext_len::
	.ds 1
_uip_ext_opt_offset::
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
;Allocation info for local variables in function 'uip_add32'
;------------------------------------------------------------
;op16                      Allocated to stack - sp -7
;op32                      Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/uip6.c:271: uip_add32(uint8_t *op32, uint16_t op16)
;	-----------------------------------------
;	 function uip_add32
;	-----------------------------------------
_uip_add32:
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
;	../../../core/net/uip6.c:273: uip_acc32[3] = op32[3] + (op16 & 0xff);
	mov	r0,sp
	dec	r0
	dec	r0
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
	add	a,#0xf9
	mov	r0,a
	mov	a,@r0
	add	a,r2
	mov	dptr,#(_uip_acc32 + 0x0003)
	movx	@dptr,a
;	../../../core/net/uip6.c:274: uip_acc32[2] = op32[2] + (op16 >> 8);
	mov	r0,sp
	dec	r0
	dec	r0
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
	add	a,#0xf9
	mov	r0,a
	inc	r0
	mov	a,@r0
	add	a,r2
	mov	r2,a
	mov	dptr,#(_uip_acc32 + 0x0002)
	movx	@dptr,a
;	../../../core/net/uip6.c:275: uip_acc32[1] = op32[1];
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x01
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
	mov	dptr,#(_uip_acc32 + 0x0001)
	movx	@dptr,a
;	../../../core/net/uip6.c:276: uip_acc32[0] = op32[0];
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	dptr,#_uip_acc32
	movx	@dptr,a
;	../../../core/net/uip6.c:278: if(uip_acc32[2] < (op16 >> 8)) {
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	inc	r0
	mov	ar6,@r0
	mov	r7,#0x00
	mov	r5,#0x00
	clr	c
	mov	a,r2
	subb	a,r6
	mov	a,r5
	subb	a,r7
	jnc	00104$
;	../../../core/net/uip6.c:279: ++uip_acc32[1];
	mov	dptr,#(_uip_acc32 + 0x0001)
	movx	a,@dptr
	mov	r7,a
	inc	r7
	mov	dptr,#(_uip_acc32 + 0x0001)
	mov	a,r7
	movx	@dptr,a
;	../../../core/net/uip6.c:280: if(uip_acc32[1] == 0) {
	mov	a,r7
	jnz	00104$
;	../../../core/net/uip6.c:281: ++uip_acc32[0];
	mov	dptr,#_uip_acc32
	movx	a,@dptr
	mov	r7,a
	inc	r7
	mov	dptr,#_uip_acc32
	mov	a,r7
	movx	@dptr,a
00104$:
;	../../../core/net/uip6.c:286: if(uip_acc32[3] < (op16 & 0xff)) {
	mov	dptr,#(_uip_acc32 + 0x0003)
	movx	a,@dptr
	mov	r7,a
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar5,@r0
	mov	r6,#0x00
	mov	r4,#0x00
	clr	c
	mov	a,r7
	subb	a,r5
	mov	a,r4
	subb	a,r6
	jnc	00111$
;	../../../core/net/uip6.c:287: ++uip_acc32[2];
	mov	dptr,#(_uip_acc32 + 0x0002)
	movx	a,@dptr
	mov	r7,a
	inc	r7
	mov	dptr,#(_uip_acc32 + 0x0002)
	mov	a,r7
	movx	@dptr,a
;	../../../core/net/uip6.c:288: if(uip_acc32[2] == 0) {
	mov	a,r7
	jnz	00111$
;	../../../core/net/uip6.c:289: ++uip_acc32[1];
	mov	dptr,#(_uip_acc32 + 0x0001)
	movx	a,@dptr
	mov	r7,a
	inc	r7
	mov	dptr,#(_uip_acc32 + 0x0001)
	mov	a,r7
	movx	@dptr,a
;	../../../core/net/uip6.c:290: if(uip_acc32[1] == 0) {
	mov	a,r7
	jnz	00111$
;	../../../core/net/uip6.c:291: ++uip_acc32[0];
	mov	dptr,#_uip_acc32
	movx	a,@dptr
	mov	r7,a
	inc	r7
	mov	dptr,#_uip_acc32
	mov	a,r7
	movx	@dptr,a
00111$:
;	../../../core/net/uip6.c:295: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'chksum'
;------------------------------------------------------------
;data                      Allocated to stack - sp -9
;len                       Allocated to stack - sp -11
;sum                       Allocated to stack - sp -3
;t                         Allocated to registers r3 r7 
;dataptr                   Allocated to registers r3 r4 r5 
;last_byte                 Allocated to registers r2 r6 r7 
;sloc0                     Allocated to stack - sp -1
;------------------------------------------------------------
;	../../../core/net/uip6.c:302: chksum(uint16_t sum, const uint8_t *data, uint16_t len)
;	-----------------------------------------
;	 function chksum
;	-----------------------------------------
_chksum:
	push	dpl
	push	dph
	inc	sp
	inc	sp
;	../../../core/net/uip6.c:308: dataptr = data;
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
;	../../../core/net/uip6.c:309: last_byte = data + len - 1;
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,@r0
	add	a,r3
	mov	r2,a
	inc	r0
	mov	a,@r0
	addc	a,r4
	mov	r6,a
	mov	ar7,r5
	dec	r2
	cjne	r2,#0xff,00138$
	dec	r6
00138$:
;	../../../core/net/uip6.c:311: while(dataptr < last_byte) {   /* At least two more bytes */
00103$:
	push	ar2
	push	ar6
	push	ar7
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jnc	00117$
;	../../../core/net/uip6.c:312: t = (dataptr[0] << 8) + dataptr[1];
	push	ar2
	push	ar6
	push	ar7
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrget
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	inc	r0
	mov	@r0,ar7
	dec	r0
	mov	@r0,#0x00
	mov	a,#0x01
	add	a,r3
	mov	r2,a
	clr	a
	addc	a,r4
	mov	r6,a
	mov	ar7,r5
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	mov	r7,#0x00
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
;	../../../core/net/uip6.c:313: sum += t;
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	@r0,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	@r0,a
;	../../../core/net/uip6.c:314: if(sum < t) {
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,r2
	inc	r0
	mov	a,@r0
	subb	a,r7
	pop	ar7
	pop	ar6
	pop	ar2
	jnc	00102$
;	../../../core/net/uip6.c:315: sum++;      /* carry */
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00141$
	inc	r0
	inc	@r0
00141$:
00102$:
;	../../../core/net/uip6.c:317: dataptr += 2;
	mov	a,#0x02
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	ljmp	00103$
00117$:
;	../../../core/net/uip6.c:320: if(dataptr == last_byte) {
	push	ar2
	push	ar6
	push	ar7
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jz	00143$
	sjmp	00109$
00143$:
;	../../../core/net/uip6.c:321: t = (dataptr[0] << 8) + 0;
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrget
	mov	r7,a
	mov	r3,#0x00
;	../../../core/net/uip6.c:322: sum += t;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,r3
	add	a,@r0
	mov	@r0,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	@r0,a
;	../../../core/net/uip6.c:323: if(sum < t) {
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,r3
	inc	r0
	mov	a,@r0
	subb	a,r7
	jnc	00109$
;	../../../core/net/uip6.c:324: sum++;      /* carry */
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00145$
	inc	r0
	inc	@r0
00145$:
00109$:
;	../../../core/net/uip6.c:329: return sum;
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
;	../../../core/net/uip6.c:330: }
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_chksum'
;------------------------------------------------------------
;len                       Allocated to stack - sp -4
;data                      Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/uip6.c:333: uip_chksum(uint16_t *data, uint16_t len)
;	-----------------------------------------
;	 function uip_chksum
;	-----------------------------------------
_uip_chksum:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/uip6.c:335: return uip_htons(chksum(0, (uint8_t *)data, len));
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
	mov	dptr,#0x0000
	mov	r0,#_chksum
	mov	r1,#(_chksum >> 8)
	mov	r2,#(_chksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_uip_htons
	mov	r1,#(_uip_htons >> 8)
	mov	r2,#(_uip_htons >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov  r7,dph
;	../../../core/net/uip6.c:336: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_ipchksum'
;------------------------------------------------------------
;sum                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/uip6.c:340: uip_ipchksum(void)
;	-----------------------------------------
;	 function uip_ipchksum
;	-----------------------------------------
_uip_ipchksum:
;	../../../core/net/uip6.c:344: sum = chksum(0, &uip_buf[UIP_LLH_LEN], UIP_IPH_LEN);
	mov	a,#0x28
	push	acc
	clr	a
	push	acc
	mov	a,#_uip_aligned_buf
	push	acc
	mov	a,#(_uip_aligned_buf >> 8)
	push	acc
	clr	a
	push	acc
	mov	dptr,#0x0000
	mov	r0,#_chksum
	mov	r1,#(_chksum >> 8)
	mov	r2,#(_chksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:346: return (sum == 0) ? 0xffff : uip_htons(sum);
	mov	a,r6
	orl	a,r7
	jnz	00103$
	mov	r4,#0xff
	mov	r5,#0xff
	sjmp	00104$
00103$:
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_uip_htons
	mov	r1,#(_uip_htons >> 8)
	mov	r2,#(_uip_htons >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	mov	r5,dph
00104$:
	mov	dpl,r4
	mov	dph,r5
;	../../../core/net/uip6.c:347: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'upper_layer_chksum'
;------------------------------------------------------------
;proto                     Allocated to registers r7 
;upper_layer_len           Allocated to stack - sp -1
;sum                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/uip6.c:351: upper_layer_chksum(uint8_t proto)
;	-----------------------------------------
;	 function upper_layer_chksum
;	-----------------------------------------
_upper_layer_chksum:
	inc	sp
	inc	sp
	mov	r7,dpl
;	../../../core/net/uip6.c:365: upper_layer_len = (((uint16_t)(UIP_IP_BUF->len[0]) << 8) + UIP_IP_BUF->len[1] - uip_ext_len);
	mov	dptr,#(_uip_aligned_buf + 0x0004)
	movx	a,@dptr
	mov	r5,a
	mov	r6,#0x00
	mov	dptr,#(_uip_aligned_buf + 0x0005)
	movx	a,@dptr
	mov	r3,#0x00
	add	a,r6
	mov	r6,a
	mov	a,r3
	addc	a,r5
	mov	r5,a
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r5
	subb	a,r3
	mov	r5,a
	mov	r0,sp
	dec	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar5
;	../../../core/net/uip6.c:372: sum = upper_layer_len + proto;
	mov	r6,#0x00
	mov	r0,sp
	dec	r0
	mov	a,r7
	add	a,@r0
	mov	r7,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
;	../../../core/net/uip6.c:374: sum = chksum(sum, (uint8_t *)&UIP_IP_BUF->srcipaddr, 2 * sizeof(uip_ipaddr_t));
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#(_uip_aligned_buf + 0x0008)
	push	acc
	mov	a,#((_uip_aligned_buf + 0x0008) >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,r7
	mov	dph,r6
	mov	r0,#_chksum
	mov	r1,#(_chksum >> 8)
	mov	r2,#(_chksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:377: sum = chksum(sum, &uip_buf[UIP_IPH_LEN + UIP_LLH_LEN + uip_ext_len],
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	a,#0x28
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	a,r5
	add	a,#_uip_aligned_buf
	mov	r5,a
	mov	a,r4
	addc	a,#(_uip_aligned_buf >> 8)
	mov	r4,a
	mov	r3,#0x00
	mov	r0,sp
	dec	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	push	ar5
	push	ar4
	push	ar3
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_chksum
	mov	r1,#(_chksum >> 8)
	mov	r2,#(_chksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:380: return (sum == 0) ? 0xffff : uip_htons(sum);
	mov	a,r6
	orl	a,r7
	jnz	00103$
	mov	r4,#0xff
	mov	r5,#0xff
	sjmp	00104$
00103$:
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_uip_htons
	mov	r1,#(_uip_htons >> 8)
	mov	r2,#(_uip_htons >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	mov	r5,dph
00104$:
	mov	dpl,r4
	mov	dph,r5
;	../../../core/net/uip6.c:381: }
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_icmp6chksum'
;------------------------------------------------------------
;	../../../core/net/uip6.c:384: uip_icmp6chksum(void)
;	-----------------------------------------
;	 function uip_icmp6chksum
;	-----------------------------------------
_uip_icmp6chksum:
;	../../../core/net/uip6.c:386: return upper_layer_chksum(UIP_PROTO_ICMP6);
	mov	dpl,#0x3a
	mov	r0,#_upper_layer_chksum
	mov	r1,#(_upper_layer_chksum >> 8)
	mov	r2,#(_upper_layer_chksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov  r7,dph
;	../../../core/net/uip6.c:388: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_tcpchksum'
;------------------------------------------------------------
;	../../../core/net/uip6.c:392: uip_tcpchksum(void)
;	-----------------------------------------
;	 function uip_tcpchksum
;	-----------------------------------------
_uip_tcpchksum:
;	../../../core/net/uip6.c:394: return upper_layer_chksum(UIP_PROTO_TCP);
	mov	dpl,#0x06
	mov	r0,#_upper_layer_chksum
	mov	r1,#(_upper_layer_chksum >> 8)
	mov	r2,#(_upper_layer_chksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov  r7,dph
;	../../../core/net/uip6.c:395: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_udpchksum'
;------------------------------------------------------------
;	../../../core/net/uip6.c:400: uip_udpchksum(void)
;	-----------------------------------------
;	 function uip_udpchksum
;	-----------------------------------------
_uip_udpchksum:
;	../../../core/net/uip6.c:402: return upper_layer_chksum(UIP_PROTO_UDP);
	mov	dpl,#0x11
	mov	r0,#_upper_layer_chksum
	mov	r1,#(_upper_layer_chksum >> 8)
	mov	r2,#(_upper_layer_chksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov  r7,dph
;	../../../core/net/uip6.c:403: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_init'
;------------------------------------------------------------
;	../../../core/net/uip6.c:408: uip_init(void)
;	-----------------------------------------
;	 function uip_init
;	-----------------------------------------
_uip_init:
;	../../../core/net/uip6.c:411: uip_ds6_init();
	mov	r0,#_uip_ds6_init
	mov	r1,#(_uip_ds6_init >> 8)
	mov	r2,#(_uip_ds6_init >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:414: for(c = 0; c < UIP_LISTENPORTS; ++c) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00104$:
;	../../../core/net/uip6.c:415: uip_listenports[c] = 0;
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x02
	mul	ab
	add	a,#_uip_listenports
	mov	dpl,a
	mov	a,#(_uip_listenports >> 8)
	addc	a,b
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:414: for(c = 0; c < UIP_LISTENPORTS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x14,00132$
00132$:
	jc	00104$
;	../../../core/net/uip6.c:417: for(c = 0; c < UIP_CONNS; ++c) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00106$:
;	../../../core/net/uip6.c:418: uip_conns[c].tcpstateflags = UIP_CLOSED;
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x2e
	mul	ab
	add	a,#_uip_conns
	mov	r6,a
	mov	a,#(_uip_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	a,#0x25
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,r7
	mov	dph,a
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:417: for(c = 0; c < UIP_CONNS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x0a,00134$
00134$:
	jc	00106$
;	../../../core/net/uip6.c:423: lastport = 1024;
	mov	dptr,#_lastport
	clr	a
	movx	@dptr,a
	mov	a,#0x04
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:427: for(c = 0; c < UIP_UDP_CONNS; ++c) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00108$:
;	../../../core/net/uip6.c:428: uip_udp_conns[c].lport = 0;
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x1b
	mul	ab
	add	a,#_uip_udp_conns
	mov	r6,a
	mov	a,#(_uip_udp_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	a,#0x10
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,r7
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:427: for(c = 0; c < UIP_UDP_CONNS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x09,00136$
00136$:
	jc	00108$
;	../../../core/net/uip6.c:431: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_connect'
;------------------------------------------------------------
;rport                     Allocated to stack - sp -16
;ripaddr                   Allocated to stack - sp -11
;conn                      Allocated to stack - sp -5
;cconn                     Allocated to stack - sp -2
;sloc0                     Allocated to stack - sp -8
;------------------------------------------------------------
;	../../../core/net/uip6.c:435: uip_connect(uip_ipaddr_t *ripaddr, uint16_t rport)
;	-----------------------------------------
;	 function uip_connect
;	-----------------------------------------
_uip_connect:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x09
	mov	sp,a
;	../../../core/net/uip6.c:440: again:
00101$:
;	../../../core/net/uip6.c:441: ++lastport;
	mov	dptr,#_lastport
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	../../../core/net/uip6.c:443: if(lastport >= 32000) {
	mov	dptr,#_lastport
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	clr	c
	subb	a,#0x7d
	jc	00103$
;	../../../core/net/uip6.c:444: lastport = 4096;
	mov	dptr,#_lastport
	clr	a
	movx	@dptr,a
	mov	a,#0x10
	inc	dptr
	movx	@dptr,a
00103$:
;	../../../core/net/uip6.c:449: for(c = 0; c < UIP_CONNS; ++c) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00118$:
;	../../../core/net/uip6.c:450: conn = &uip_conns[c];
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x2e
	mul	ab
	add	a,#_uip_conns
	mov	r3,a
	mov	a,#(_uip_conns >> 8)
	addc	a,b
	mov	r2,a
	mov	r4,#0x00
;	../../../core/net/uip6.c:451: if(conn->tcpstateflags != UIP_CLOSED &&
	mov	a,#0x25
	add	a,r3
	mov	r5,a
	clr	a
	addc	a,r2
	mov	r6,a
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jz	00119$
;	../../../core/net/uip6.c:452: conn->lport == uip_htons(lastport)) {
	mov	a,#0x10
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r2
	mov	r2,a
	mov	dpl,r3
	mov	dph,r2
	mov	b,r4
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r2,a
	mov	dptr,#_lastport
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r4
	mov	dph,r7
	push	ar3
	push	ar2
	mov	r0,#_uip_htons
	mov	r1,#(_uip_htons >> 8)
	mov	r2,#(_uip_htons >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	pop	ar2
	pop	ar3
	mov	a,r3
	cjne	a,ar6,00176$
	mov	a,r2
	cjne	a,ar7,00176$
	ljmp	00101$
00176$:
;	../../../core/net/uip6.c:453: goto again;
00119$:
;	../../../core/net/uip6.c:449: for(c = 0; c < UIP_CONNS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0x0a,00177$
00177$:
	jc	00118$
;	../../../core/net/uip6.c:457: conn = 0;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/uip6.c:458: for(c = 0; c < UIP_CONNS; ++c) {
	mov	dptr,#_c
	movx	@dptr,a
00120$:
;	../../../core/net/uip6.c:459: cconn = &uip_conns[c];
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x2e
	mul	ab
	add	a,#_uip_conns
	mov	r6,a
	mov	a,#(_uip_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/uip6.c:460: if(cconn->tcpstateflags == UIP_CLOSED) {
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jnz	00109$
;	../../../core/net/uip6.c:461: conn = cconn;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
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
;	../../../core/net/uip6.c:462: break;
	ljmp	00115$
00109$:
;	../../../core/net/uip6.c:464: if(cconn->tcpstateflags == UIP_TIME_WAIT) {
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	cjne	r5,#0x07,00121$
;	../../../core/net/uip6.c:465: if(conn == 0 ||
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00110$
;	../../../core/net/uip6.c:466: cconn->timer > conn->timer) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x26
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
	mov	a,#0x26
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
	clr	c
	subb	a,r5
	jnc	00121$
00110$:
;	../../../core/net/uip6.c:467: conn = cconn;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
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
00121$:
;	../../../core/net/uip6.c:458: for(c = 0; c < UIP_CONNS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0x0a,00184$
00184$:
	jnc	00185$
	ljmp	00120$
00185$:
00115$:
;	../../../core/net/uip6.c:472: if(conn == 0) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
;	../../../core/net/uip6.c:473: return 0;
	jnz	00117$
	mov	dptr,#0x0000
	mov	b,a
	ljmp	00122$
00117$:
;	../../../core/net/uip6.c:476: conn->tcpstateflags = UIP_SYN_SENT;
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
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0x02
	lcall	__gptrput
;	../../../core/net/uip6.c:478: conn->snd_nxt[0] = iss[0];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x18
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
	mov	dptr,#_iss
	movx	a,@dptr
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:479: conn->snd_nxt[1] = iss[1];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x18
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
	mov	a,#0x01
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_iss + 0x0001)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:480: conn->snd_nxt[2] = iss[2];
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x02
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_iss + 0x0002)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:481: conn->snd_nxt[3] = iss[3];
	mov	a,#0x03
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#(_iss + 0x0003)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:483: conn->rcv_nxt[0] = 0;
	mov	a,sp
	add	a,#0xfb
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
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:484: conn->rcv_nxt[1] = 0;
	mov	a,sp
	add	a,#0xfb
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
	mov	a,#0x01
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
;	../../../core/net/uip6.c:485: conn->rcv_nxt[2] = 0;
	mov	a,#0x02
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
;	../../../core/net/uip6.c:486: conn->rcv_nxt[3] = 0;
	mov	a,#0x03
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
;	../../../core/net/uip6.c:488: conn->initialmss = conn->mss = UIP_TCP_MSS;
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
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x1e
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
	mov	a,#0xb4
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0xb4
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:490: conn->len = 1;   /* TCP length of the SYN is one. */
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
	mov	a,#0x01
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:491: conn->nrtx = 0;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x27
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
;	../../../core/net/uip6.c:492: conn->timer = 1; /* Send the SYN next time around. */
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x26
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
;	../../../core/net/uip6.c:493: conn->rto = UIP_RTO;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x24
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
	mov	a,#0x03
	lcall	__gptrput
;	../../../core/net/uip6.c:494: conn->sa = 0;
	mov	a,sp
	add	a,#0xfb
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
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:495: conn->sv = 16;   /* Initial value of the RTT variance. */
	mov	a,sp
	add	a,#0xfb
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
	mov	a,#0x10
	lcall	__gptrput
;	../../../core/net/uip6.c:496: conn->lport = uip_htons(lastport);
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
	mov	dptr,#_lastport
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_uip_htons
	mov	r1,#(_uip_htons >> 8)
	mov	r2,#(_uip_htons >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r4,dph
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:497: conn->rport = rport;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x12
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
	add	a,#0xf0
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/uip6.c:498: uip_ipaddr_copy(&conn->ripaddr, ripaddr);
	mov	a,sp
	add	a,#0xf5
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
;	../../../core/net/uip6.c:500: return conn;
	mov	sp,a
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
00122$:
;	../../../core/net/uip6.c:501: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'remove_ext_hdr'
;------------------------------------------------------------
;	../../../core/net/uip6.c:505: remove_ext_hdr(void)
;	-----------------------------------------
;	 function remove_ext_hdr
;	-----------------------------------------
_remove_ext_hdr:
;	../../../core/net/uip6.c:508: if(uip_ext_len > 0) {
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	jnz	00115$
	ljmp	__sdcc_banked_ret
00115$:
;	../../../core/net/uip6.c:511: if(uip_len < UIP_IPH_LEN + uip_ext_len) {
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
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	clr	c
	mov	a,r4
	subb	a,r7
	mov	a,r5
	subb	a,r6
	jnc	00102$
;	../../../core/net/uip6.c:513: uip_ext_len = 0;
	mov	dptr,#_uip_ext_len
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:514: uip_len = 0;
	mov	dptr,#_uip_len
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:515: return;
	ljmp	__sdcc_banked_ret
00102$:
;	../../../core/net/uip6.c:518: uip_len - UIP_IPH_LEN - uip_ext_len);
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r6
	add	a,#0xd8
	mov	r6,a
	mov	a,r7
	addc	a,#0xff
	mov	r7,a
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r5,a
	mov	r3,a
	mov	r4,#0x00
	mov	a,r6
	clr	c
	subb	a,r3
	mov	r6,a
	mov	a,r7
	subb	a,r4
	mov	r7,a
;	../../../core/net/uip6.c:517: memmove(((uint8_t *)UIP_TCP_BUF), (uint8_t *)UIP_TCP_BUF + uip_ext_len,
	mov	a,r5
	add	a,#(_uip_aligned_buf + 0x0028)
	mov	r5,a
	clr	a
	addc	a,#((_uip_aligned_buf + 0x0028) >> 8)
	mov	r4,a
	mov	r3,#0x00
	push	ar6
	push	ar7
	push	ar5
	push	ar4
	push	ar3
	mov	dptr,#(_uip_aligned_buf + 0x0028)
	mov	b,#0x00
	mov	r0,#_memmove
	mov	r1,#(_memmove >> 8)
	mov	r2,#(_memmove >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:520: uip_len -= uip_ext_len;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_uip_len
	mov	a,r4
	clr	c
	subb	a,r7
	movx	@dptr,a
	mov	a,r5
	subb	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:523: UIP_IP_BUF->len[0] = (uip_len - UIP_IPH_LEN) >> 8;
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r6
	add	a,#0xd8
	mov	a,r7
	addc	a,#0xff
	mov	dptr,#(_uip_aligned_buf + 0x0004)
	movx	@dptr,a
;	../../../core/net/uip6.c:524: UIP_IP_BUF->len[1] = (uip_len - UIP_IPH_LEN) & 0xff;
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r6
	add	a,#0xd8
	mov	r6,a
	mov	dptr,#(_uip_aligned_buf + 0x0005)
	movx	@dptr,a
;	../../../core/net/uip6.c:525: uip_ext_len = 0;
	mov	dptr,#_uip_ext_len
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:527: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_udp_new'
;------------------------------------------------------------
;rport                     Allocated to stack - sp -13
;ripaddr                   Allocated to stack - sp -8
;conn                      Allocated to stack - sp -2
;sloc0                     Allocated to stack - sp -5
;------------------------------------------------------------
;	../../../core/net/uip6.c:531: uip_udp_new(const uip_ipaddr_t *ripaddr, uint16_t rport)
;	-----------------------------------------
;	 function uip_udp_new
;	-----------------------------------------
_uip_udp_new:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x06
	mov	sp,a
;	../../../core/net/uip6.c:536: again:
00101$:
;	../../../core/net/uip6.c:537: ++lastport;
	mov	dptr,#_lastport
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	../../../core/net/uip6.c:539: if(lastport >= 32000) {
	mov	dptr,#_lastport
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	clr	c
	subb	a,#0x7d
	jc	00103$
;	../../../core/net/uip6.c:540: lastport = 4096;
	mov	dptr,#_lastport
	clr	a
	movx	@dptr,a
	mov	a,#0x10
	inc	dptr
	movx	@dptr,a
00103$:
;	../../../core/net/uip6.c:543: for(c = 0; c < UIP_UDP_CONNS; ++c) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00115$:
;	../../../core/net/uip6.c:544: if(uip_udp_conns[c].lport == uip_htons(lastport)) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x1b
	mul	ab
	add	a,#_uip_udp_conns
	mov	r3,a
	mov	a,#(_uip_udp_conns >> 8)
	addc	a,b
	mov	r4,a
	mov	a,#0x10
	add	a,r3
	mov	dpl,a
	clr	a
	addc	a,r4
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_lastport
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r2
	mov	dph,r7
	push	ar4
	push	ar3
	mov	r0,#_uip_htons
	mov	r1,#(_uip_htons >> 8)
	mov	r2,#(_uip_htons >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	pop	ar3
	pop	ar4
	mov	a,r3
	cjne	a,ar6,00158$
	mov	a,r4
	cjne	a,ar7,00158$
	sjmp	00101$
00158$:
;	../../../core/net/uip6.c:543: for(c = 0; c < UIP_UDP_CONNS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0x09,00159$
00159$:
	jc	00115$
;	../../../core/net/uip6.c:549: conn = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/uip6.c:550: for(c = 0; c < UIP_UDP_CONNS; ++c) {
	mov	dptr,#_c
	movx	@dptr,a
00117$:
;	../../../core/net/uip6.c:551: if(uip_udp_conns[c].lport == 0) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x1b
	mul	ab
	add	a,#_uip_udp_conns
	mov	r6,a
	mov	a,#(_uip_udp_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	a,#0x10
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,r7
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	orl	a,r6
	jnz	00118$
;	../../../core/net/uip6.c:552: conn = &uip_udp_conns[c];
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x1b
	mul	ab
	add	a,#_uip_udp_conns
	mov	r6,a
	mov	a,#(_uip_udp_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/uip6.c:553: break;
	sjmp	00109$
00118$:
;	../../../core/net/uip6.c:550: for(c = 0; c < UIP_UDP_CONNS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x09,00162$
00162$:
	jc	00117$
00109$:
;	../../../core/net/uip6.c:557: if(conn == 0) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
;	../../../core/net/uip6.c:558: return 0;
	jnz	00111$
	mov	dptr,#0x0000
	mov	b,a
	ljmp	00119$
00111$:
;	../../../core/net/uip6.c:561: conn->lport = UIP_HTONS(lastport);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
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
	mov	dptr,#_lastport
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	ar7,r3
	mov	r2,#0x00
	mov	ar3,r4
	mov	r4,#0x00
	mov	a,r3
	orl	ar2,a
	mov	a,r4
	orl	ar7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:562: conn->rport = rport;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x12
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
	add	a,#0xf3
	mov	r0,a
	mov	a,@r0
	lcall	__gptrput
	inc	dptr
	inc	r0
	mov	a,@r0
	lcall	__gptrput
;	../../../core/net/uip6.c:563: if(ripaddr == NULL) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00113$
;	../../../core/net/uip6.c:564: memset(&conn->ripaddr, 0, sizeof(uip_ipaddr_t));
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
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
	sjmp	00114$
00113$:
;	../../../core/net/uip6.c:566: uip_ipaddr_copy(&conn->ripaddr, ripaddr);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	r0,sp
	dec	r0
	dec	r0
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
00114$:
;	../../../core/net/uip6.c:568: conn->ttl = uip_ds6_if.cur_hop_limit;
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
	mov	dptr,#(_uip_ds6_if + 0x0004)
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:570: return conn;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
00119$:
;	../../../core/net/uip6.c:571: }
	xch	a,r0
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	xch	a,r0
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_unlisten'
;------------------------------------------------------------
;port                      Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/uip6.c:576: uip_unlisten(uint16_t port)
;	-----------------------------------------
;	 function uip_unlisten
;	-----------------------------------------
_uip_unlisten:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/net/uip6.c:578: for(c = 0; c < UIP_LISTENPORTS; ++c) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00104$:
;	../../../core/net/uip6.c:579: if(uip_listenports[c] == port) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x02
	mul	ab
	add	a,#_uip_listenports
	mov	dpl,a
	mov	a,#(_uip_listenports >> 8)
	addc	a,b
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,r4
	cjne	a,ar6,00105$
	mov	a,r5
	cjne	a,ar7,00105$
;	../../../core/net/uip6.c:580: uip_listenports[c] = 0;
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x02
	mul	ab
	add	a,#_uip_listenports
	mov	dpl,a
	mov	a,#(_uip_listenports >> 8)
	addc	a,b
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:581: return;
	sjmp	00106$
00105$:
;	../../../core/net/uip6.c:578: for(c = 0; c < UIP_LISTENPORTS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x14,00118$
00118$:
	jc	00104$
00106$:
;	../../../core/net/uip6.c:584: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_listen'
;------------------------------------------------------------
;port                      Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/uip6.c:587: uip_listen(uint16_t port)
;	-----------------------------------------
;	 function uip_listen
;	-----------------------------------------
_uip_listen:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/net/uip6.c:589: for(c = 0; c < UIP_LISTENPORTS; ++c) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00104$:
;	../../../core/net/uip6.c:590: if(uip_listenports[c] == 0) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x02
	mul	ab
	add	a,#_uip_listenports
	mov	dpl,a
	mov	a,#(_uip_listenports >> 8)
	addc	a,b
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	orl	a,r4
	jnz	00105$
;	../../../core/net/uip6.c:591: uip_listenports[c] = port;
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x02
	mul	ab
	add	a,#_uip_listenports
	mov	dpl,a
	mov	a,#(_uip_listenports >> 8)
	addc	a,b
	mov	dph,a
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:592: return;
	sjmp	00106$
00105$:
;	../../../core/net/uip6.c:589: for(c = 0; c < UIP_LISTENPORTS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x14,00117$
00117$:
	jc	00104$
00106$:
;	../../../core/net/uip6.c:595: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_add_rcv_nxt'
;------------------------------------------------------------
;n                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/uip6.c:816: uip_add_rcv_nxt(uint16_t n)
;	-----------------------------------------
;	 function uip_add_rcv_nxt
;	-----------------------------------------
_uip_add_rcv_nxt:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/net/uip6.c:818: uip_add32(uip_conn->rcv_nxt, n);
	mov	dptr,#_uip_conn
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,#0x14
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	push	ar6
	push	ar7
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	r0,#_uip_add32
	mov	r1,#(_uip_add32 >> 8)
	mov	r2,#(_uip_add32 >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
;	../../../core/net/uip6.c:819: uip_conn->rcv_nxt[0] = uip_acc32[0];
	mov	dptr,#_uip_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x14
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#_uip_acc32
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:820: uip_conn->rcv_nxt[1] = uip_acc32[1];
	mov	dptr,#_uip_conn
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
	mov	dptr,#(_uip_acc32 + 0x0001)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:821: uip_conn->rcv_nxt[2] = uip_acc32[2];
	mov	dptr,#_uip_conn
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
	mov	dptr,#(_uip_acc32 + 0x0002)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:822: uip_conn->rcv_nxt[3] = uip_acc32[3];
	mov	dptr,#_uip_conn
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
	mov	dptr,#(_uip_acc32 + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:823: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ext_hdr_options_process'
;------------------------------------------------------------
;	../../../core/net/uip6.c:831: ext_hdr_options_process(void)
;	-----------------------------------------
;	 function ext_hdr_options_process
;	-----------------------------------------
_ext_hdr_options_process:
;	../../../core/net/uip6.c:838: uip_ext_opt_offset = 2;
	mov	dptr,#_uip_ext_opt_offset
	mov	a,#0x02
	movx	@dptr,a
;	../../../core/net/uip6.c:839: while(uip_ext_opt_offset < ((UIP_EXT_BUF->len << 3) + 8)) {
00115$:
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
	mov	r7,a
	clr	a
	rr	a
	anl	a,#0xf8
	xch	a,r7
	swap	a
	rr	a
	xch	a,r7
	xrl	a,r7
	xch	a,r7
	anl	a,#0xf8
	xch	a,r7
	xrl	a,r7
	mov	r6,a
	mov	a,#0x08
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#_uip_ext_opt_offset
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	clr	c
	mov	a,r5
	subb	a,r7
	mov	a,r4
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	00164$
	ljmp	00117$
00164$:
;	../../../core/net/uip6.c:840: switch(UIP_EXT_HDR_OPT_BUF->type) {
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
	mov	dptr,#_uip_ext_opt_offset
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	jz	00101$
	cjne	r7,#0x01,00166$
	sjmp	00102$
00166$:
	cjne	r7,#0x63,00167$
	sjmp	00103$
00167$:
	ljmp	00106$
;	../../../core/net/uip6.c:846: case UIP_EXT_HDR_OPT_PAD1:
00101$:
;	../../../core/net/uip6.c:848: uip_ext_opt_offset += 1;
	mov	dptr,#_uip_ext_opt_offset
	movx	a,@dptr
	mov	r7,a
	inc	a
	movx	@dptr,a
;	../../../core/net/uip6.c:849: break;
	ljmp	00115$
;	../../../core/net/uip6.c:850: case UIP_EXT_HDR_OPT_PADN:
00102$:
;	../../../core/net/uip6.c:852: uip_ext_opt_offset += UIP_EXT_HDR_OPT_PADN_BUF->opt_len + 2;
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
	mov	dptr,#_uip_ext_opt_offset
	movx	a,@dptr
	mov	r5,a
	mov	r3,a
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
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
	mov	r7,a
	inc	r7
	inc	r7
	mov	dptr,#_uip_ext_opt_offset
	mov	a,r7
	add	a,r5
	movx	@dptr,a
;	../../../core/net/uip6.c:853: break;
	ljmp	00115$
;	../../../core/net/uip6.c:855: case UIP_EXT_HDR_OPT_RPL:
00103$:
;	../../../core/net/uip6.c:857: if(rpl_verify_header(uip_ext_opt_offset)) {
	mov	dptr,#_uip_ext_opt_offset
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	dpl,r7
	mov	dph,r6
	mov	r0,#_rpl_verify_header
	mov	r1,#(_rpl_verify_header >> 8)
	mov	r2,#(_rpl_verify_header >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jz	00105$
;	../../../core/net/uip6.c:859: return 1;
	mov	dpl,#0x01
	ljmp	__sdcc_banked_ret
00105$:
;	../../../core/net/uip6.c:861: uip_ext_opt_offset += (UIP_EXT_HDR_OPT_RPL_BUF->opt_len) + 2;
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
	mov	dptr,#_uip_ext_opt_offset
	movx	a,@dptr
	mov	r5,a
	mov	r3,a
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
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
	mov	r7,a
	inc	r7
	inc	r7
	mov	dptr,#_uip_ext_opt_offset
	mov	a,r7
	add	a,r5
	movx	@dptr,a
;	../../../core/net/uip6.c:862: return 0;
	mov	dpl,#0x00
	ljmp	__sdcc_banked_ret
;	../../../core/net/uip6.c:864: default:
00106$:
;	../../../core/net/uip6.c:879: switch(UIP_EXT_HDR_OPT_BUF->type & 0xC0) {
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
	mov	dptr,#_uip_ext_opt_offset
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0xc0
	mov	r6,#0x00
	cjne	r7,#0x00,00169$
	cjne	r6,#0x00,00169$
	sjmp	00113$
00169$:
	cjne	r7,#0x40,00170$
	cjne	r6,#0x00,00170$
	sjmp	00108$
00170$:
	cjne	r7,#0x80,00171$
	cjne	r6,#0x00,00171$
	sjmp	00112$
00171$:
;	../../../core/net/uip6.c:882: case 0x40:
	cjne	r7,#0xc0,00113$
	cjne	r6,#0x00,00113$
	sjmp	00109$
00108$:
;	../../../core/net/uip6.c:883: return 1;
	mov	dpl,#0x01
	ljmp	__sdcc_banked_ret
;	../../../core/net/uip6.c:884: case 0xC0:
00109$:
;	../../../core/net/uip6.c:885: if(uip_is_addr_mcast(&UIP_IP_BUF->destipaddr)) {
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xff,00112$
;	../../../core/net/uip6.c:886: return 1;
	mov	dpl,#0x01
	ljmp	__sdcc_banked_ret
;	../../../core/net/uip6.c:888: case 0x80:
00112$:
;	../../../core/net/uip6.c:890: (uint32_t)UIP_IPH_LEN + uip_ext_len + uip_ext_opt_offset);
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	clr	a
	mov	r6,a
	mov	r5,a
	mov	r4,a
	mov	a,#0x28
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	addc	a,r5
	mov	r5,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	dptr,#_uip_ext_opt_offset
	movx	a,@dptr
	mov	r0,a
	clr	a
	mov	r1,a
	mov	r2,a
	mov	r3,a
	mov	a,r0
	add	a,r7
	mov	r7,a
	mov	a,r1
	addc	a,r6
	mov	r6,a
	mov	a,r2
	addc	a,r5
	mov	r5,a
	mov	a,r3
	addc	a,r4
	mov	r4,a
;	../../../core/net/uip6.c:889: uip_icmp6_error_output(ICMP6_PARAM_PROB, ICMP6_PARAMPROB_OPTION,
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	mov	a,#0x02
	push	acc
	mov	dpl,#0x04
	mov	r0,#_uip_icmp6_error_output
	mov	r1,#(_uip_icmp6_error_output >> 8)
	mov	r2,#(_uip_icmp6_error_output >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:891: return 2;
	mov	dpl,#0x02
;	../../../core/net/uip6.c:892: }
	sjmp	00118$
00113$:
;	../../../core/net/uip6.c:894: uip_ext_opt_offset += UIP_EXT_HDR_OPT_BUF->len + 2;
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
	mov	dptr,#_uip_ext_opt_offset
	movx	a,@dptr
	mov	r5,a
	mov	r3,a
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
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
	mov	r7,a
	inc	r7
	inc	r7
	mov	dptr,#_uip_ext_opt_offset
	mov	a,r7
	add	a,r5
	movx	@dptr,a
;	../../../core/net/uip6.c:896: }
	ljmp	00115$
00117$:
;	../../../core/net/uip6.c:898: return 0;
	mov	dpl,#0x00
00118$:
;	../../../core/net/uip6.c:899: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_process'
;------------------------------------------------------------
;flag                      Allocated to registers r7 
;uip_connr                 Allocated to stack - sp -2
;m                         Allocated to registers r5 
;sloc0                     Allocated to stack - sp -5
;------------------------------------------------------------
;	../../../core/net/uip6.c:904: uip_process(uint8_t flag)
;	-----------------------------------------
;	 function uip_process
;	-----------------------------------------
_uip_process:
	mov	a,sp
	add	a,#0x06
	mov	sp,a
	mov	r7,dpl
;	../../../core/net/uip6.c:907: register struct uip_conn *uip_connr = uip_conn;
	mov	dptr,#_uip_conn
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
;	../../../core/net/uip6.c:910: if(flag == UIP_UDP_SEND_CONN) {
	cjne	r7,#0x04,01569$
	ljmp	00293$
01569$:
;	../../../core/net/uip6.c:914: uip_sappdata = uip_appdata = &uip_buf[UIP_IPTCPH_LEN + UIP_LLH_LEN];
	mov	dptr,#_uip_appdata
	mov	a,#(_uip_aligned_buf + 0x003c)
	movx	@dptr,a
	mov	a,#((_uip_aligned_buf + 0x003c) >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_uip_sappdata
	mov	a,#(_uip_aligned_buf + 0x003c)
	movx	@dptr,a
	mov	a,#((_uip_aligned_buf + 0x003c) >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:915: if(flag == UIP_TCP_SEND_CONN)
	cjne	r7,#0x55,01570$
	ljmp	00424$
01570$:
;	../../../core/net/uip6.c:921: if(flag == UIP_POLL_REQUEST) {
	cjne	r7,#0x03,01571$
	sjmp	01572$
01571$:
	ljmp	00147$
01572$:
;	../../../core/net/uip6.c:923: if((uip_connr->tcpstateflags & UIP_TS_MASK) == UIP_ESTABLISHED &&
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	mov	r2,a
	anl	ar2,#0x0f
	mov	r6,#0x00
	cjne	r2,#0x03,00108$
	cjne	r6,#0x00,00108$
;	../../../core/net/uip6.c:924: !uip_outstanding(uip_connr)) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1c
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
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	orl	a,r4
	jnz	00108$
;	../../../core/net/uip6.c:925: uip_flags = UIP_POLL;
	mov	dptr,#_uip_flags
	mov	a,#0x08
	movx	@dptr,a
;	../../../core/net/uip6.c:926: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:927: goto appsend;
	ljmp	00424$
00108$:
;	../../../core/net/uip6.c:929: } else if((uip_connr->tcpstateflags & UIP_TS_MASK) == UIP_SYN_SENT) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	lcall	__gptrget
	mov	r4,a
	anl	ar4,#0x0f
	mov	r6,#0x00
	cjne	r4,#0x02,01576$
	cjne	r6,#0x00,01576$
	sjmp	01577$
01576$:
	ljmp	00484$
01577$:
;	../../../core/net/uip6.c:931: UIP_TCP_BUF->flags = 0;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:932: goto tcp_send_syn;
	ljmp	00351$
;	../../../core/net/uip6.c:935: goto drop;
00147$:
;	../../../core/net/uip6.c:938: } else if(flag == UIP_TIMER) {
	cjne	r7,#0x02,01578$
	sjmp	01579$
01578$:
	ljmp	00148$
01579$:
;	../../../core/net/uip6.c:941: uip_len = 0;
	mov	dptr,#_uip_len
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:942: uip_slen = 0;
	mov	dptr,#_uip_slen
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:945: if(++iss[3] == 0) {
	mov	dptr,#(_iss + 0x0003)
	movx	a,@dptr
	mov	r6,a
	inc	r6
	mov	dptr,#(_iss + 0x0003)
	mov	a,r6
	movx	@dptr,a
	mov	a,r6
	jnz	00116$
;	../../../core/net/uip6.c:946: if(++iss[2] == 0) {
	mov	dptr,#(_iss + 0x0002)
	movx	a,@dptr
	mov	r6,a
	inc	r6
	mov	dptr,#(_iss + 0x0002)
	mov	a,r6
	movx	@dptr,a
	mov	a,r6
	jnz	00116$
;	../../../core/net/uip6.c:947: if(++iss[1] == 0) {
	mov	dptr,#(_iss + 0x0001)
	movx	a,@dptr
	mov	r6,a
	inc	r6
	mov	dptr,#(_iss + 0x0001)
	mov	a,r6
	movx	@dptr,a
	mov	a,r6
	jnz	00116$
;	../../../core/net/uip6.c:948: ++iss[0];
	mov	dptr,#_iss
	movx	a,@dptr
	mov	r6,a
	inc	r6
	mov	dptr,#_iss
	mov	a,r6
	movx	@dptr,a
00116$:
;	../../../core/net/uip6.c:959: if(uip_connr->tcpstateflags == UIP_TIME_WAIT ||
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x07,01583$
	sjmp	00140$
01583$:
;	../../../core/net/uip6.c:960: uip_connr->tcpstateflags == UIP_FIN_WAIT_2) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x05,00141$
00140$:
;	../../../core/net/uip6.c:961: ++(uip_connr->timer);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x26
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
	lcall	__gptrget
	mov	r3,a
	inc	r3
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
;	../../../core/net/uip6.c:962: if(uip_connr->timer == UIP_TIME_WAIT_TIMEOUT) {
	cjne	r3,#0x78,01586$
	sjmp	01587$
01586$:
	ljmp	00484$
01587$:
;	../../../core/net/uip6.c:963: uip_connr->tcpstateflags = UIP_CLOSED;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	ljmp	00484$
00141$:
;	../../../core/net/uip6.c:965: } else if(uip_connr->tcpstateflags != UIP_CLOSED) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	lcall	__gptrget
	jnz	01588$
	ljmp	00484$
01588$:
;	../../../core/net/uip6.c:971: if(uip_outstanding(uip_connr)) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1c
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
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	orl	a,r4
	jnz	01589$
	ljmp	00136$
01589$:
;	../../../core/net/uip6.c:972: if(uip_connr->timer-- == 0) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x26
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
	lcall	__gptrget
	mov	r3,a
	dec	a
	mov	r2,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrput
	mov	a,r3
	jz	01590$
	ljmp	00484$
01590$:
;	../../../core/net/uip6.c:973: if(uip_connr->nrtx == UIP_MAXRTX ||
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x27
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
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x08,01591$
	sjmp	00119$
01591$:
;	../../../core/net/uip6.c:974: ((uip_connr->tcpstateflags == UIP_SYN_SENT ||
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x02,01592$
	sjmp	00122$
01592$:
;	../../../core/net/uip6.c:975: uip_connr->tcpstateflags == UIP_SYN_RCVD) &&
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x01,00120$
00122$:
;	../../../core/net/uip6.c:976: uip_connr->nrtx == UIP_MAXSYNRTX)) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x27
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
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x05,00120$
00119$:
;	../../../core/net/uip6.c:977: uip_connr->tcpstateflags = UIP_CLOSED;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
;	../../../core/net/uip6.c:984: uip_flags = UIP_TIMEDOUT;
	mov	dptr,#_uip_flags
	mov	a,#0x80
	movx	@dptr,a
;	../../../core/net/uip6.c:985: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:988: UIP_TCP_BUF->flags = TCP_RST | TCP_ACK;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	mov	a,#0x14
	movx	@dptr,a
;	../../../core/net/uip6.c:989: goto tcp_send_nodata;
	ljmp	00475$
00120$:
;	../../../core/net/uip6.c:993: uip_connr->timer = UIP_RTO << (uip_connr->nrtx > 4?
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
	mov	r1,a
	mov	a,#0x26
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
	mov	a,#0x27
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
	mov  r2,a
	add	a,#0xff - 0x04
	jnc	00503$
;	../../../core/net/uip6.c:994: 4:
	mov	r5,#0x04
	mov	r6,#0x00
	sjmp	00504$
00503$:
;	../../../core/net/uip6.c:995: uip_connr->nrtx);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x27
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
	mov	r5,a
	mov	r6,#0x00
00504$:
	mov	b,r5
	inc	b
	mov	a,#0x03
	sjmp	01600$
01598$:
	add	a,acc
01600$:
	djnz	b,01598$
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
;	../../../core/net/uip6.c:996: ++(uip_connr->nrtx);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x27
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
	lcall	__gptrget
	mov	r3,a
	inc	r3
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
;	../../../core/net/uip6.c:1007: switch(uip_connr->tcpstateflags & UIP_TS_MASK) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	lcall	__gptrget
	mov	r4,a
	mov	a,#0x0f
	anl	a,r4
	mov	r5,a
	mov	r6,#0x00
	cjne	r5,#0x01,01601$
	cjne	r6,#0x00,01601$
	ljmp	00350$
01601$:
	cjne	r5,#0x02,01602$
	cjne	r6,#0x00,01602$
	sjmp	00125$
01602$:
	cjne	r5,#0x03,01603$
	cjne	r6,#0x00,01603$
	sjmp	00126$
01603$:
	cjne	r5,#0x04,01604$
	cjne	r6,#0x00,01604$
	ljmp	00412$
01604$:
	cjne	r5,#0x06,01605$
	cjne	r6,#0x00,01605$
	ljmp	00412$
01605$:
	cjne	r5,#0x08,01606$
	cjne	r6,#0x00,01606$
	ljmp	00412$
01606$:
	ljmp	00484$
;	../../../core/net/uip6.c:1013: case UIP_SYN_SENT:
00125$:
;	../../../core/net/uip6.c:1015: UIP_TCP_BUF->flags = 0;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:1016: goto tcp_send_syn;
	ljmp	00351$
;	../../../core/net/uip6.c:1019: case UIP_ESTABLISHED:
00126$:
;	../../../core/net/uip6.c:1026: uip_flags = UIP_REXMIT;
	mov	dptr,#_uip_flags
	mov	a,#0x04
	movx	@dptr,a
;	../../../core/net/uip6.c:1027: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1028: goto apprexmit;
	ljmp	00438$
;	../../../core/net/uip6.c:1035: }
00136$:
;	../../../core/net/uip6.c:1037: } else if((uip_connr->tcpstateflags & UIP_TS_MASK) == UIP_ESTABLISHED) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x25
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
	lcall	__gptrget
	mov	r4,a
	anl	ar4,#0x0f
	mov	r6,#0x00
	cjne	r4,#0x03,01607$
	cjne	r6,#0x00,01607$
	sjmp	01608$
01607$:
	ljmp	00484$
01608$:
;	../../../core/net/uip6.c:1042: uip_flags = UIP_POLL;
	mov	dptr,#_uip_flags
	mov	a,#0x08
	movx	@dptr,a
;	../../../core/net/uip6.c:1043: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1044: goto appsend;
	ljmp	00424$
;	../../../core/net/uip6.c:1047: goto drop;
00148$:
;	../../../core/net/uip6.c:1051: if(flag == UIP_UDP_TIMER) {
	cjne	r7,#0x05,00153$
;	../../../core/net/uip6.c:1052: if(uip_udp_conn->lport != 0) {
	mov	dptr,#_uip_udp_conn
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
	orl	a,r5
	jnz	01611$
	ljmp	00484$
01611$:
;	../../../core/net/uip6.c:1053: uip_conn = NULL;
	mov	dptr,#_uip_conn
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1054: uip_sappdata = uip_appdata = &uip_buf[UIP_IPUDPH_LEN + UIP_LLH_LEN];
	mov	dptr,#_uip_appdata
	mov	a,#(_uip_aligned_buf + 0x0030)
	movx	@dptr,a
	mov	a,#((_uip_aligned_buf + 0x0030) >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_uip_sappdata
	mov	a,#(_uip_aligned_buf + 0x0030)
	movx	@dptr,a
	mov	a,#((_uip_aligned_buf + 0x0030) >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1055: uip_len = uip_slen = 0;
	mov	dptr,#_uip_slen
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_uip_len
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1056: uip_flags = UIP_POLL;
	mov	dptr,#_uip_flags
	mov	a,#0x08
	movx	@dptr,a
;	../../../core/net/uip6.c:1057: UIP_UDP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1058: goto udp_send;
	ljmp	00293$
;	../../../core/net/uip6.c:1060: goto drop;
00153$:
;	../../../core/net/uip6.c:1072: if((UIP_IP_BUF->vtc & 0xf0) != 0x60)  { /* IP version and header length. */
	mov	dptr,#_uip_aligned_buf
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0xf0
	mov	r6,#0x00
	cjne	r7,#0x60,01612$
	cjne	r6,#0x00,01612$
	sjmp	01613$
01612$:
	ljmp	00484$
01613$:
;	../../../core/net/uip6.c:1087: if((UIP_IP_BUF->len[0] << 8) + UIP_IP_BUF->len[1] <= uip_len) {
	mov	dptr,#(_uip_aligned_buf + 0x0004)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_uip_aligned_buf + 0x0005)
	movx	a,@dptr
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
	addc	a,r6
	mov	r6,a
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	clr	c
	mov	a,r4
	subb	a,r7
	mov	a,r5
	subb	a,r6
	jnc	01614$
	ljmp	00484$
01614$:
;	../../../core/net/uip6.c:1088: uip_len = (UIP_IP_BUF->len[0] << 8) + UIP_IP_BUF->len[1] + UIP_IPH_LEN;
	mov	dptr,#(_uip_aligned_buf + 0x0004)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_uip_aligned_buf + 0x0005)
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
	addc	a,r6
	mov	r6,a
	mov	dptr,#_uip_len
	mov	a,#0x28
	add	a,r7
	movx	@dptr,a
	clr	a
	addc	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1111: if(uip_is_addr_mcast(&UIP_IP_BUF->srcipaddr)){
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xff,01615$
	ljmp	00484$
01615$:
;	../../../core/net/uip6.c:1123: uip_next_hdr = &UIP_IP_BUF->proto;
	mov	dptr,#_uip_next_hdr
	mov	a,#(_uip_aligned_buf + 0x0006)
	movx	@dptr,a
	mov	a,#((_uip_aligned_buf + 0x0006) >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1124: uip_ext_len = 0;
	mov	dptr,#_uip_ext_len
	movx	@dptr,a
;	../../../core/net/uip6.c:1125: uip_ext_bitmap = 0;
	mov	dptr,#_uip_ext_bitmap
	movx	@dptr,a
;	../../../core/net/uip6.c:1126: if(*uip_next_hdr == UIP_PROTO_HBHO) {
	mov	dptr,#(_uip_aligned_buf + 0x0006)
	movx	a,@dptr
	jnz	00166$
;	../../../core/net/uip6.c:1128: uip_ext_bitmap |= UIP_EXT_HDR_BITMAP_HBHO;
	mov	dptr,#_uip_ext_bitmap
	movx	a,@dptr
	orl	acc,#0x01
	movx	@dptr,a
;	../../../core/net/uip6.c:1130: switch(ext_hdr_options_process()) {
	mov	r0,#_ext_hdr_options_process
	mov	r1,#(_ext_hdr_options_process >> 8)
	mov	r2,#(_ext_hdr_options_process >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	cjne	r7,#0x00,01617$
	sjmp	00161$
01617$:
	cjne	r7,#0x01,01618$
	ljmp	00484$
01618$:
	cjne	r7,#0x02,01619$
	ljmp	00483$
01619$:
;	../../../core/net/uip6.c:1131: case 0:
	sjmp	00166$
00161$:
;	../../../core/net/uip6.c:1133: uip_next_hdr = &UIP_EXT_BUF->next;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	mov	a,#0x28
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
	mov	ar3,r5
	mov	ar4,r6
	mov	dptr,#_uip_next_hdr
	mov	a,r3
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1134: uip_ext_len += (UIP_EXT_BUF->len << 3) + 8;
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	swap	a
	rr	a
	anl	a,#0xf8
	add	a,#0x08
	mov	r6,a
	mov	dptr,#_uip_ext_len
	add	a,r7
	movx	@dptr,a
;	../../../core/net/uip6.c:1145: }
00166$:
;	../../../core/net/uip6.c:1150: if(!uip_ds6_is_my_addr(&UIP_IP_BUF->destipaddr) &&
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	mov	b,#0x00
	mov	r0,#_uip_ds6_addr_lookup
	mov	r1,#(_uip_ds6_addr_lookup >> 8)
	mov	r2,#(_uip_ds6_addr_lookup >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,r5
	orl	a,r6
	jz	01620$
	ljmp	00253$
01620$:
;	../../../core/net/uip6.c:1151: !uip_ds6_is_my_maddr(&UIP_IP_BUF->destipaddr)) {
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	mov	b,#0x00
	mov	r0,#_uip_ds6_maddr_lookup
	mov	r1,#(_uip_ds6_maddr_lookup >> 8)
	mov	r2,#(_uip_ds6_maddr_lookup >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,r5
	orl	a,r6
	jz	01621$
	ljmp	00253$
01621$:
;	../../../core/net/uip6.c:1152: if(!uip_is_addr_mcast(&UIP_IP_BUF->destipaddr) &&
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xff,01622$
	ljmp	00194$
01622$:
;	../../../core/net/uip6.c:1153: !uip_is_addr_link_local(&UIP_IP_BUF->destipaddr) &&
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xfe,00199$
	mov	dptr,#(_uip_aligned_buf + 0x0019)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x80,01625$
	ljmp	00194$
01625$:
00199$:
;	../../../core/net/uip6.c:1154: !uip_is_addr_link_local(&UIP_IP_BUF->srcipaddr) &&
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xfe,00207$
	mov	dptr,#(_uip_aligned_buf + 0x0009)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x80,01628$
	ljmp	00194$
01628$:
00207$:
;	../../../core/net/uip6.c:1155: !uip_is_addr_unspecified(&UIP_IP_BUF->srcipaddr) &&
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00216$
	mov	dptr,#(_uip_aligned_buf + 0x000a)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00216$
	mov	dptr,#(_uip_aligned_buf + 0x000c)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00216$
	mov	dptr,#(_uip_aligned_buf + 0x000e)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00216$
	mov	dptr,#(_uip_aligned_buf + 0x0010)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00216$
	mov	dptr,#(_uip_aligned_buf + 0x0012)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00216$
	mov	dptr,#(_uip_aligned_buf + 0x0014)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00216$
	mov	dptr,#(_uip_aligned_buf + 0x0016)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	01636$
	ljmp	00194$
01636$:
00216$:
;	../../../core/net/uip6.c:1156: !uip_is_addr_loopback(&UIP_IP_BUF->destipaddr)) {
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00193$
	mov	dptr,#(_uip_aligned_buf + 0x001a)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00193$
	mov	dptr,#(_uip_aligned_buf + 0x001c)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00193$
	mov	dptr,#(_uip_aligned_buf + 0x001e)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00193$
	mov	dptr,#(_uip_aligned_buf + 0x0020)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00193$
	mov	dptr,#(_uip_aligned_buf + 0x0022)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00193$
	mov	dptr,#(_uip_aligned_buf + 0x0024)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00193$
	mov	dptr,#(_uip_aligned_buf + 0x0026)
	movx	a,@dptr
	jnz	00193$
	mov	dptr,#(_uip_aligned_buf + 0x0027)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,01645$
	sjmp	00194$
01645$:
00193$:
;	../../../core/net/uip6.c:1160: if(uip_len > UIP_LINK_MTU) {
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	clr	a
	subb	a,r6
	mov	a,#0x05
	subb	a,r7
	jnc	00168$
;	../../../core/net/uip6.c:1161: uip_icmp6_error_output(ICMP6_PACKET_TOO_BIG, 0, UIP_LINK_MTU);
	clr	a
	push	acc
	mov	a,#0x05
	push	acc
	clr	a
	push	acc
	push	acc
	push	acc
	mov	dpl,#0x02
	mov	r0,#_uip_icmp6_error_output
	mov	r1,#(_uip_icmp6_error_output >> 8)
	mov	r2,#(_uip_icmp6_error_output >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:1163: goto send;
	ljmp	00483$
00168$:
;	../../../core/net/uip6.c:1166: if(UIP_IP_BUF->ttl <= 1) {
	mov	dptr,#(_uip_aligned_buf + 0x0007)
	movx	a,@dptr
	add	a,#0xff - 0x01
	jc	00170$
;	../../../core/net/uip6.c:1167: uip_icmp6_error_output(ICMP6_TIME_EXCEEDED,
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,#0x03
	mov	r0,#_uip_icmp6_error_output
	mov	r1,#(_uip_icmp6_error_output >> 8)
	mov	r2,#(_uip_icmp6_error_output >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:1170: goto send;
	ljmp	00483$
00170$:
;	../../../core/net/uip6.c:1174: rpl_update_header_empty();
	mov	r0,#_rpl_update_header_empty
	mov	r1,#(_rpl_update_header_empty >> 8)
	mov	r2,#(_rpl_update_header_empty >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1177: UIP_IP_BUF->ttl = UIP_IP_BUF->ttl - 1;
	mov	dptr,#(_uip_aligned_buf + 0x0007)
	movx	a,@dptr
	mov	r7,a
	dec	r7
	mov	dptr,#(_uip_aligned_buf + 0x0007)
	mov	a,r7
	movx	@dptr,a
;	../../../core/net/uip6.c:1182: goto send;
	ljmp	00483$
00194$:
;	../../../core/net/uip6.c:1184: if((uip_is_addr_link_local(&UIP_IP_BUF->srcipaddr)) &&
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xfe,01648$
	sjmp	01649$
01648$:
	ljmp	00484$
01649$:
	mov	dptr,#(_uip_aligned_buf + 0x0009)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x80,01650$
	sjmp	01651$
01650$:
	ljmp	00484$
01651$:
;	../../../core/net/uip6.c:1185: (!uip_is_addr_unspecified(&UIP_IP_BUF->srcipaddr)) &&
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00190$
	mov	dptr,#(_uip_aligned_buf + 0x000a)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00190$
	mov	dptr,#(_uip_aligned_buf + 0x000c)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00190$
	mov	dptr,#(_uip_aligned_buf + 0x000e)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00190$
	mov	dptr,#(_uip_aligned_buf + 0x0010)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00190$
	mov	dptr,#(_uip_aligned_buf + 0x0012)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00190$
	mov	dptr,#(_uip_aligned_buf + 0x0014)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00190$
	mov	dptr,#(_uip_aligned_buf + 0x0016)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	01659$
	ljmp	00484$
01659$:
00190$:
;	../../../core/net/uip6.c:1186: (!uip_is_addr_loopback(&UIP_IP_BUF->destipaddr)) &&
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00191$
	mov	dptr,#(_uip_aligned_buf + 0x001a)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00191$
	mov	dptr,#(_uip_aligned_buf + 0x001c)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00191$
	mov	dptr,#(_uip_aligned_buf + 0x001e)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00191$
	mov	dptr,#(_uip_aligned_buf + 0x0020)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00191$
	mov	dptr,#(_uip_aligned_buf + 0x0022)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00191$
	mov	dptr,#(_uip_aligned_buf + 0x0024)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	00191$
	mov	dptr,#(_uip_aligned_buf + 0x0026)
	movx	a,@dptr
	jnz	00191$
	mov	dptr,#(_uip_aligned_buf + 0x0027)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,01668$
	ljmp	00484$
01668$:
00191$:
;	../../../core/net/uip6.c:1187: (!uip_is_addr_mcast(&UIP_IP_BUF->destipaddr)) &&
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xff,01669$
	ljmp	00484$
01669$:
;	../../../core/net/uip6.c:1188: (!uip_ds6_is_addr_onlink((&UIP_IP_BUF->destipaddr)))) {
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	mov	b,#0x00
	mov	r0,#_uip_ds6_is_addr_onlink
	mov	r1,#(_uip_ds6_is_addr_onlink >> 8)
	mov	r2,#(_uip_ds6_is_addr_onlink >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	jz	01670$
	ljmp	00484$
01670$:
;	../../../core/net/uip6.c:1190: uip_icmp6_error_output(ICMP6_DST_UNREACH,
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	a,#0x02
	push	acc
	mov	dpl,#0x01
	mov	r0,#_uip_icmp6_error_output
	mov	r1,#(_uip_icmp6_error_output >> 8)
	mov	r2,#(_uip_icmp6_error_output >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:1192: goto send;
	ljmp	00483$
;	../../../core/net/uip6.c:1217: while(1) {
00253$:
;	../../../core/net/uip6.c:1218: switch(*uip_next_hdr){
	mov	dptr,#_uip_next_hdr
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
	mov	r7,a
	jz	00223$
	cjne	r7,#0x06,01672$
	ljmp	00298$
01672$:
	cjne	r7,#0x11,01673$
	ljmp	00271$
01673$:
	cjne	r7,#0x2b,01674$
	ljmp	00242$
01674$:
	cjne	r7,#0x2c,01675$
	ljmp	00484$
01675$:
	cjne	r7,#0x3a,01676$
	ljmp	00256$
01676$:
	cjne	r7,#0x3b,01677$
	ljmp	00484$
01677$:
	cjne	r7,#0x3c,01678$
	sjmp	00231$
01678$:
	ljmp	00255$
;	../../../core/net/uip6.c:1232: case UIP_PROTO_HBHO:
00223$:
;	../../../core/net/uip6.c:1237: if(uip_ext_bitmap & UIP_EXT_HDR_BITMAP_HBHO) {
	mov	dptr,#_uip_ext_bitmap
	movx	a,@dptr
	jnb	acc.0,01679$
	ljmp	00255$
01679$:
;	../../../core/net/uip6.c:1240: uip_ext_bitmap |= UIP_EXT_HDR_BITMAP_HBHO;
	mov	dptr,#_uip_ext_bitmap
	movx	a,@dptr
	orl	acc,#0x01
	movx	@dptr,a
;	../../../core/net/uip6.c:1243: switch(ext_hdr_options_process()) {
	mov	r0,#_ext_hdr_options_process
	mov	r1,#(_ext_hdr_options_process >> 8)
	mov	r2,#(_ext_hdr_options_process >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	cjne	r7,#0x00,01680$
	sjmp	00227$
01680$:
	cjne	r7,#0x01,01681$
	ljmp	00484$
01681$:
	cjne	r7,#0x02,01682$
	ljmp	00483$
01682$:
;	../../../core/net/uip6.c:1244: case 0:
	sjmp	00253$
00227$:
;	../../../core/net/uip6.c:1246: uip_next_hdr = &UIP_EXT_BUF->next;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	mov	a,#0x28
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
	mov	ar3,r5
	mov	ar4,r6
	mov	dptr,#_uip_next_hdr
	mov	a,r3
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1247: uip_ext_len += (UIP_EXT_BUF->len << 3) + 8;
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	swap	a
	rr	a
	anl	a,#0xf8
	add	a,#0x08
	mov	r6,a
	mov	dptr,#_uip_ext_len
	add	a,r7
	movx	@dptr,a
;	../../../core/net/uip6.c:1248: break;
	ljmp	00253$
;	../../../core/net/uip6.c:1258: case UIP_PROTO_DESTO:
00231$:
;	../../../core/net/uip6.c:1262: if(uip_ext_bitmap & UIP_EXT_HDR_BITMAP_DESTO1) {
	mov	dptr,#_uip_ext_bitmap
	movx	a,@dptr
	jnb	acc.1,00236$
;	../../../core/net/uip6.c:1263: if(uip_ext_bitmap & UIP_EXT_HDR_BITMAP_DESTO2) {
	mov	dptr,#_uip_ext_bitmap
	movx	a,@dptr
	jnb	acc.6,01684$
	ljmp	00255$
01684$:
;	../../../core/net/uip6.c:1266: uip_ext_bitmap |= UIP_EXT_HDR_BITMAP_DESTO2;
	mov	dptr,#_uip_ext_bitmap
	movx	a,@dptr
	orl	acc,#0x40
	movx	@dptr,a
	sjmp	00237$
00236$:
;	../../../core/net/uip6.c:1269: uip_ext_bitmap |= UIP_EXT_HDR_BITMAP_DESTO1;
	mov	dptr,#_uip_ext_bitmap
	movx	a,@dptr
	orl	acc,#0x02
	movx	@dptr,a
00237$:
;	../../../core/net/uip6.c:1272: switch(ext_hdr_options_process()) {
	mov	r0,#_ext_hdr_options_process
	mov	r1,#(_ext_hdr_options_process >> 8)
	mov	r2,#(_ext_hdr_options_process >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	cjne	r7,#0x00,01685$
	sjmp	00238$
01685$:
	cjne	r7,#0x01,01686$
	ljmp	00484$
01686$:
	cjne	r7,#0x02,01687$
	ljmp	00483$
01687$:
	ljmp	00253$
;	../../../core/net/uip6.c:1273: case 0:
00238$:
;	../../../core/net/uip6.c:1275: uip_next_hdr = &UIP_EXT_BUF->next;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	mov	a,#0x28
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
	mov	ar3,r5
	mov	ar4,r6
	mov	dptr,#_uip_next_hdr
	mov	a,r3
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1276: uip_ext_len += (UIP_EXT_BUF->len << 3) + 8;
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	swap	a
	rr	a
	anl	a,#0xf8
	add	a,#0x08
	mov	r6,a
	mov	dptr,#_uip_ext_len
	add	a,r7
	movx	@dptr,a
;	../../../core/net/uip6.c:1277: break;
	ljmp	00253$
;	../../../core/net/uip6.c:1287: case UIP_PROTO_ROUTING:
00242$:
;	../../../core/net/uip6.c:1290: if(uip_ext_bitmap & UIP_EXT_HDR_BITMAP_ROUTING) {
	mov	dptr,#_uip_ext_bitmap
	movx	a,@dptr
	jnb	acc.2,01688$
	ljmp	00255$
01688$:
;	../../../core/net/uip6.c:1293: uip_ext_bitmap |= UIP_EXT_HDR_BITMAP_ROUTING;
	mov	dptr,#_uip_ext_bitmap
	movx	a,@dptr
	orl	acc,#0x04
	movx	@dptr,a
;	../../../core/net/uip6.c:1305: if(UIP_ROUTING_BUF->seg_left > 0) {
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
	mov	a,#0x03
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r7
	mov	dph,r6
	movx	a,@dptr
	jz	00247$
;	../../../core/net/uip6.c:1306: uip_icmp6_error_output(ICMP6_PARAM_PROB, ICMP6_PARAMPROB_HEADER, UIP_IPH_LEN + uip_ext_len + 2);
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x2a
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r5,a
	mov	r4,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	clr	a
	push	acc
	mov	dpl,#0x04
	mov	r0,#_uip_icmp6_error_output
	mov	r1,#(_uip_icmp6_error_output >> 8)
	mov	r2,#(_uip_icmp6_error_output >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:1309: goto send;
	ljmp	00483$
00247$:
;	../../../core/net/uip6.c:1311: uip_next_hdr = &UIP_EXT_BUF->next;
	mov	dptr,#_uip_ext_len
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	mov	a,#0x28
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
	mov	ar3,r5
	mov	ar4,r6
	mov	dptr,#_uip_next_hdr
	mov	a,r3
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1312: uip_ext_len += (UIP_EXT_BUF->len << 3) + 8;
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	swap	a
	rr	a
	anl	a,#0xf8
	add	a,#0x08
	mov	r6,a
	mov	dptr,#_uip_ext_len
	add	a,r7
	movx	@dptr,a
;	../../../core/net/uip6.c:1313: break;
	ljmp	00253$
;	../../../core/net/uip6.c:1345: bad_hdr:
00255$:
;	../../../core/net/uip6.c:1350: uip_icmp6_error_output(ICMP6_PARAM_PROB, ICMP6_PARAMPROB_NEXTHEADER, (uint32_t)(uip_next_hdr - (uint8_t *)UIP_IP_BUF));
	mov	dptr,#_uip_next_hdr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	a,r5
	clr	c
	subb	a,#_uip_aligned_buf
	mov	r5,a
	mov	a,r6
	subb	a,#(_uip_aligned_buf >> 8)
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	r4,a
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	mov	a,#0x01
	push	acc
	mov	dpl,#0x04
	mov	r0,#_uip_icmp6_error_output
	mov	r1,#(_uip_icmp6_error_output >> 8)
	mov	r2,#(_uip_icmp6_error_output >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:1354: goto send;
	ljmp	00483$
;	../../../core/net/uip6.c:1357: icmp6_input:
00256$:
;	../../../core/net/uip6.c:1363: if(uip_icmp6chksum() != 0xffff) {
	mov	r0,#_uip_icmp6chksum
	mov	r1,#(_uip_icmp6chksum >> 8)
	mov	r2,#(_uip_icmp6chksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0xff,01690$
	cjne	r7,#0xff,01690$
	sjmp	01691$
01690$:
	ljmp	00484$
01691$:
;	../../../core/net/uip6.c:1386: switch(UIP_ICMP_BUF->type) {
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
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x80,01692$
	sjmp	00264$
01692$:
	cjne	r7,#0x81,01693$
	sjmp	00265$
01693$:
	cjne	r7,#0x85,01694$
	sjmp	00261$
01694$:
	cjne	r7,#0x86,01695$
	sjmp	00262$
01695$:
	cjne	r7,#0x87,01696$
	sjmp	00259$
01696$:
	cjne	r7,#0x88,01697$
	sjmp	00260$
01697$:
;	../../../core/net/uip6.c:1387: case ICMP6_NS:
	cjne	r7,#0x9b,00266$
	sjmp	00263$
00259$:
;	../../../core/net/uip6.c:1388: uip_nd6_ns_input();
	mov	r0,#_uip_nd6_ns_input
	mov	r1,#(_uip_nd6_ns_input >> 8)
	mov	r2,#(_uip_nd6_ns_input >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1389: break;
;	../../../core/net/uip6.c:1390: case ICMP6_NA:
	sjmp	00267$
00260$:
;	../../../core/net/uip6.c:1391: uip_nd6_na_input();
	mov	r0,#_uip_nd6_na_input
	mov	r1,#(_uip_nd6_na_input >> 8)
	mov	r2,#(_uip_nd6_na_input >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1392: break;
;	../../../core/net/uip6.c:1393: case ICMP6_RS:
	sjmp	00267$
00261$:
;	../../../core/net/uip6.c:1398: uip_len = 0;
	mov	dptr,#_uip_len
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1400: break;
;	../../../core/net/uip6.c:1401: case ICMP6_RA:
	sjmp	00267$
00262$:
;	../../../core/net/uip6.c:1404: uip_len = 0;
	mov	dptr,#_uip_len
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1408: break;
;	../../../core/net/uip6.c:1410: case ICMP6_RPL:
	sjmp	00267$
00263$:
;	../../../core/net/uip6.c:1411: uip_rpl_input();
	mov	r0,#_uip_rpl_input
	mov	r1,#(_uip_rpl_input >> 8)
	mov	r2,#(_uip_rpl_input >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1412: break;
;	../../../core/net/uip6.c:1414: case ICMP6_ECHO_REQUEST:
	sjmp	00267$
00264$:
;	../../../core/net/uip6.c:1415: uip_icmp6_echo_request_input();
	mov	r0,#_uip_icmp6_echo_request_input
	mov	r1,#(_uip_icmp6_echo_request_input >> 8)
	mov	r2,#(_uip_icmp6_echo_request_input >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1416: break;
;	../../../core/net/uip6.c:1417: case ICMP6_ECHO_REPLY:
	sjmp	00267$
00265$:
;	../../../core/net/uip6.c:1421: uip_len = 0;
	mov	dptr,#_uip_len
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1422: break;
;	../../../core/net/uip6.c:1423: default:
	sjmp	00267$
00266$:
;	../../../core/net/uip6.c:1428: uip_len = 0;
	mov	dptr,#_uip_len
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1430: }
00267$:
;	../../../core/net/uip6.c:1432: if(uip_len > 0) {
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	01699$
	ljmp	00484$
01699$:
;	../../../core/net/uip6.c:1433: goto send;
	ljmp	00483$
;	../../../core/net/uip6.c:1442: udp_input:
00271$:
;	../../../core/net/uip6.c:1444: remove_ext_hdr();
	mov	r0,#_remove_ext_hdr
	mov	r1,#(_remove_ext_hdr >> 8)
	mov	r2,#(_remove_ext_hdr >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1454: uip_len = uip_len - UIP_IPUDPH_LEN;
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r6
	add	a,#0xd0
	mov	r6,a
	mov	a,r7
	addc	a,#0xff
	mov	r7,a
	mov	dptr,#_uip_len
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1455: uip_appdata = &uip_buf[UIP_IPUDPH_LEN + UIP_LLH_LEN];
	mov	dptr,#_uip_appdata
	mov	a,#(_uip_aligned_buf + 0x0030)
	movx	@dptr,a
	mov	a,#((_uip_aligned_buf + 0x0030) >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1461: if(UIP_UDP_BUF->udpchksum != 0 && uip_udpchksum() != 0xffff) {
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	orl	a,r6
	jz	00273$
	mov	r0,#_uip_udpchksum
	mov	r1,#(_uip_udpchksum >> 8)
	mov	r2,#(_uip_udpchksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0xff,01701$
	cjne	r7,#0xff,01701$
	sjmp	01702$
01701$:
	ljmp	00484$
01702$:
;	../../../core/net/uip6.c:1466: goto drop;
00273$:
;	../../../core/net/uip6.c:1473: if(UIP_UDP_BUF->destport == 0) {
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	01703$
	ljmp	00484$
01703$:
;	../../../core/net/uip6.c:1479: for(uip_udp_conn = &uip_udp_conns[0];
	mov	dptr,#_uip_udp_conn
	mov	a,#_uip_udp_conns
	movx	@dptr,a
	mov	a,#(_uip_udp_conns >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
00486$:
;	../../../core/net/uip6.c:1480: uip_udp_conn < &uip_udp_conns[UIP_UDP_CONNS];
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#(_uip_udp_conns + 0x00f3)
	push	acc
	mov	a,#((_uip_udp_conns + 0x00f3) >> 8)
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
	jc	01704$
	ljmp	00484$
01704$:
;	../../../core/net/uip6.c:1489: if(uip_udp_conn->lport != 0 &&
	mov	dptr,#_uip_udp_conn
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
	orl	a,r5
	jnz	01705$
	ljmp	00487$
01705$:
;	../../../core/net/uip6.c:1490: UIP_UDP_BUF->destport == uip_udp_conn->lport &&
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,#0x10
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
	mov	a,r6
	cjne	a,ar3,01706$
	mov	a,r7
	cjne	a,ar4,01706$
	sjmp	01707$
01706$:
	ljmp	00487$
01707$:
;	../../../core/net/uip6.c:1491: (uip_udp_conn->rport == 0 ||
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
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
	orl	a,r5
	jz	00290$
;	../../../core/net/uip6.c:1492: UIP_UDP_BUF->srcport == uip_udp_conn->rport) &&
	mov	dptr,#(_uip_aligned_buf + 0x0028)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,#0x12
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
	mov	a,r6
	cjne	a,ar3,01709$
	mov	a,r7
	cjne	a,ar4,01709$
	sjmp	01710$
01709$:
	ljmp	00487$
01710$:
00290$:
;	../../../core/net/uip6.c:1493: (uip_is_addr_unspecified(&uip_udp_conn->ripaddr) ||
	mov	dptr,#_uip_udp_conn
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
	orl	a,r5
	jz	01711$
	ljmp	00289$
01711$:
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x02
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
	orl	a,r5
	jz	01712$
	ljmp	00289$
01712$:
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x04
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
	orl	a,r5
	jz	01713$
	ljmp	00289$
01713$:
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
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
	orl	a,r5
	jz	01714$
	ljmp	00289$
01714$:
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x08
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
	orl	a,r5
	jnz	00289$
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
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
	orl	a,r5
	jnz	00289$
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
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
	orl	a,r5
	jnz	00289$
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x0e
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
	orl	a,r5
	jz	00292$
00289$:
;	../../../core/net/uip6.c:1494: uip_ipaddr_cmp(&UIP_IP_BUF->srcipaddr, &uip_udp_conn->ripaddr))) {
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	mov	b,#0x00
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
	jz	00292$
;	../../../core/net/uip6.c:1495: goto udp_found;
00487$:
;	../../../core/net/uip6.c:1481: ++uip_udp_conn) {
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	add	a,#0x1b
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	ljmp	00486$
;	../../../core/net/uip6.c:1508: udp_found:
00292$:
;	../../../core/net/uip6.c:1511: uip_conn = NULL;
	mov	dptr,#_uip_conn
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1512: uip_flags = UIP_NEWDATA;
	mov	dptr,#_uip_flags
	mov	a,#0x02
	movx	@dptr,a
;	../../../core/net/uip6.c:1513: uip_sappdata = uip_appdata = &uip_buf[UIP_IPUDPH_LEN + UIP_LLH_LEN];
	mov	dptr,#_uip_appdata
	mov	a,#(_uip_aligned_buf + 0x0030)
	movx	@dptr,a
	mov	a,#((_uip_aligned_buf + 0x0030) >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_uip_sappdata
	mov	a,#(_uip_aligned_buf + 0x0030)
	movx	@dptr,a
	mov	a,#((_uip_aligned_buf + 0x0030) >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1514: uip_slen = 0;
	mov	dptr,#_uip_slen
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1515: UIP_UDP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1517: udp_send:
00293$:
;	../../../core/net/uip6.c:1520: if(uip_slen == 0) {
	mov	dptr,#_uip_slen
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	01720$
	ljmp	00484$
01720$:
;	../../../core/net/uip6.c:1523: uip_len = uip_slen + UIP_IPUDPH_LEN;
	mov	dptr,#_uip_slen
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_uip_len
	mov	a,#0x30
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1527: UIP_IP_BUF->len[0] = ((uip_len - UIP_IPH_LEN) >> 8);
	mov	a,r6
	add	a,#0x08
	clr	a
	addc	a,r7
	mov	dptr,#(_uip_aligned_buf + 0x0004)
	movx	@dptr,a
;	../../../core/net/uip6.c:1528: UIP_IP_BUF->len[1] = ((uip_len - UIP_IPH_LEN) & 0xff);
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	a,r6
	add	a,#0xd8
	mov	dptr,#(_uip_aligned_buf + 0x0005)
	movx	@dptr,a
;	../../../core/net/uip6.c:1530: memcpy(&UIP_IP_BUF->ttl, &uip_udp_conn->ttl, sizeof(uip_udp_conn->ttl));
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x14
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#(_uip_aligned_buf + 0x0007)
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:1531: UIP_IP_BUF->proto = UIP_PROTO_UDP;
	mov	dptr,#(_uip_aligned_buf + 0x0006)
	mov	a,#0x11
	movx	@dptr,a
;	../../../core/net/uip6.c:1533: UIP_UDP_BUF->udplen = UIP_HTONS(uip_slen + UIP_UDPH_LEN);
	mov	dptr,#_uip_slen
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x08
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	ar5,r6
	mov	r4,#0x00
	mov	ar6,r7
	mov	r7,#0x00
	mov	a,r6
	orl	ar4,a
	mov	a,r7
	orl	ar5,a
	mov	dptr,#(_uip_aligned_buf + 0x002c)
	mov	a,r4
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1534: UIP_UDP_BUF->udpchksum = 0;
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1536: UIP_UDP_BUF->srcport  = uip_udp_conn->lport;
	mov	dptr,#_uip_udp_conn
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
	mov	dptr,#(_uip_aligned_buf + 0x0028)
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1537: UIP_UDP_BUF->destport = uip_udp_conn->rport;
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
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
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1539: uip_ipaddr_copy(&UIP_IP_BUF->destipaddr, &uip_udp_conn->ripaddr);
	mov	dptr,#_uip_udp_conn
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:1540: uip_ds6_select_src(&UIP_IP_BUF->srcipaddr, &UIP_IP_BUF->destipaddr);
	mov	a,#(_uip_aligned_buf + 0x0018)
	push	acc
	mov	a,#((_uip_aligned_buf + 0x0018) >> 8)
	push	acc
	clr	a
	push	acc
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	mov	b,#0x00
	mov	r0,#_uip_ds6_select_src
	mov	r1,#(_uip_ds6_select_src >> 8)
	mov	r2,#(_uip_ds6_select_src >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/uip6.c:1542: uip_appdata = &uip_buf[UIP_LLH_LEN + UIP_IPTCPH_LEN];
	mov	dptr,#_uip_appdata
	mov	a,#(_uip_aligned_buf + 0x003c)
	movx	@dptr,a
	mov	a,#((_uip_aligned_buf + 0x003c) >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1546: UIP_UDP_BUF->udpchksum = ~(uip_udpchksum());
	mov	r0,#_uip_udpchksum
	mov	r1,#(_uip_udpchksum >> 8)
	mov	r2,#(_uip_udpchksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	a,r6
	cpl	a
	mov	r6,a
	mov	a,r7
	cpl	a
	mov	r7,a
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1547: if(UIP_UDP_BUF->udpchksum == 0) {
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jz	01721$
	ljmp	00482$
01721$:
;	../../../core/net/uip6.c:1548: UIP_UDP_BUF->udpchksum = 0xffff;
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	mov	a,#0xff
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1552: goto ip_send_nolen;
	ljmp	00482$
;	../../../core/net/uip6.c:1557: tcp_input:
00298$:
;	../../../core/net/uip6.c:1559: remove_ext_hdr();
	mov	r0,#_remove_ext_hdr
	mov	r1,#(_remove_ext_hdr >> 8)
	mov	r2,#(_remove_ext_hdr >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1565: if(uip_tcpchksum() != 0xffff) {   /* Compute and check the TCP
	mov	r0,#_uip_tcpchksum
	mov	r1,#(_uip_tcpchksum >> 8)
	mov	r2,#(_uip_tcpchksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0xff,01722$
	cjne	r7,#0xff,01722$
	sjmp	01723$
01722$:
	ljmp	00484$
01723$:
;	../../../core/net/uip6.c:1575: if(UIP_TCP_BUF->destport == 0 || UIP_TCP_BUF->srcport == 0) {
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	01724$
	ljmp	00484$
01724$:
	mov	dptr,#(_uip_aligned_buf + 0x0028)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	orl	a,r6
	jnz	01725$
	ljmp	00484$
01725$:
;	../../../core/net/uip6.c:1582: for(uip_connr = &uip_conns[0]; uip_connr <= &uip_conns[UIP_CONNS - 1];
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,#_uip_conns
	inc	r0
	mov	@r0,#(_uip_conns >> 8)
	inc	r0
	mov	@r0,#0x00
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar7,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
00489$:
	push	ar7
	push	ar5
	push	ar6
	mov	dptr,#(_uip_conns + 0x019e)
	mov	b,#0x00
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jnc	01726$
	ljmp	00309$
01726$:
;	../../../core/net/uip6.c:1584: if(uip_connr->tcpstateflags != UIP_CLOSED &&
	mov	a,#0x25
	add	a,r7
	mov	r2,a
	clr	a
	addc	a,r5
	mov	r3,a
	mov	ar4,r6
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	jnz	01727$
	ljmp	00490$
01727$:
;	../../../core/net/uip6.c:1585: UIP_TCP_BUF->destport == uip_connr->lport &&
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	movx	a,@dptr
	mov	@r0,a
	inc	dptr
	movx	a,@dptr
	inc	r0
	mov	@r0,a
	mov	a,#0x10
	add	a,r7
	mov	r2,a
	clr	a
	addc	a,r5
	mov	r3,a
	mov	ar4,r6
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
	mov	a,@r0
	cjne	a,ar2,01728$
	inc	r0
	mov	a,@r0
	cjne	a,ar3,01728$
	sjmp	01729$
01728$:
	sjmp	00490$
01729$:
;	../../../core/net/uip6.c:1586: UIP_TCP_BUF->srcport == uip_connr->rport &&
	mov	dptr,#(_uip_aligned_buf + 0x0028)
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	movx	a,@dptr
	mov	@r0,a
	inc	dptr
	movx	a,@dptr
	inc	r0
	mov	@r0,a
	mov	a,#0x12
	add	a,r7
	mov	r2,a
	clr	a
	addc	a,r5
	mov	r3,a
	mov	ar4,r6
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
	mov	a,@r0
	cjne	a,ar2,01730$
	inc	r0
	mov	a,@r0
	cjne	a,ar3,01730$
	sjmp	01731$
01730$:
	sjmp	00490$
01731$:
;	../../../core/net/uip6.c:1587: uip_ipaddr_cmp(&UIP_IP_BUF->srcipaddr, &uip_connr->ripaddr)) {
	mov	ar2,r7
	mov	ar3,r5
	mov	ar4,r6
	push	ar7
	push	ar6
	push	ar5
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar2
	push	ar3
	push	ar4
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	mov	b,#0x00
	mov	r0,#_memcmp
	mov	r1,#(_memcmp >> 8)
	mov	r2,#(_memcmp >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r4,dph
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,r3
	orl	a,r4
	jnz	01732$
	ljmp	00352$
01732$:
;	../../../core/net/uip6.c:1588: goto found;
00490$:
;	../../../core/net/uip6.c:1583: ++uip_connr) {
	mov	a,#0x2e
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	ljmp	00489$
00309$:
;	../../../core/net/uip6.c:1596: if((UIP_TCP_BUF->flags & TCP_CTL) != TCP_SYN) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0x3f
	mov	r6,#0x00
	cjne	r7,#0x02,00315$
	cjne	r6,#0x00,00315$
;	../../../core/net/uip6.c:1600: tmp16 = UIP_TCP_BUF->destport;
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_tmp16
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1602: for(c = 0; c < UIP_LISTENPORTS; ++c) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00491$:
;	../../../core/net/uip6.c:1603: if(tmp16 == uip_listenports[c]) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x02
	mul	ab
	add	a,#_uip_listenports
	mov	dpl,a
	mov	a,#(_uip_listenports >> 8)
	addc	a,b
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_tmp16
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,r4
	cjne	a,ar6,01735$
	mov	a,r5
	cjne	a,ar7,01735$
	ljmp	00324$
01735$:
;	../../../core/net/uip6.c:1602: for(c = 0; c < UIP_LISTENPORTS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x14,01736$
01736$:
	jc	00491$
;	../../../core/net/uip6.c:1611: reset:
00315$:
;	../../../core/net/uip6.c:1614: if(UIP_TCP_BUF->flags & TCP_RST) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	jnb	acc.2,01738$
	ljmp	00484$
01738$:
;	../../../core/net/uip6.c:1620: UIP_TCP_BUF->flags = TCP_RST | TCP_ACK;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	mov	a,#0x14
	movx	@dptr,a
;	../../../core/net/uip6.c:1621: uip_len = UIP_IPTCPH_LEN;
	mov	dptr,#_uip_len
	mov	a,#0x3c
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1622: UIP_TCP_BUF->tcpoffset = 5 << 4;
	mov	dptr,#(_uip_aligned_buf + 0x0034)
	mov	a,#0x50
	movx	@dptr,a
;	../../../core/net/uip6.c:1625: c = UIP_TCP_BUF->seqno[3];
	mov	dptr,#(_uip_aligned_buf + 0x002f)
	movx	a,@dptr
	mov	dptr,#_c
	movx	@dptr,a
;	../../../core/net/uip6.c:1626: UIP_TCP_BUF->seqno[3] = UIP_TCP_BUF->ackno[3];
	mov	dptr,#(_uip_aligned_buf + 0x0033)
	movx	a,@dptr
	mov	dptr,#(_uip_aligned_buf + 0x002f)
	movx	@dptr,a
;	../../../core/net/uip6.c:1627: UIP_TCP_BUF->ackno[3] = c;
	mov	dptr,#_c
	movx	a,@dptr
	mov	dptr,#(_uip_aligned_buf + 0x0033)
	movx	@dptr,a
;	../../../core/net/uip6.c:1629: c = UIP_TCP_BUF->seqno[2];
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	movx	a,@dptr
	mov	dptr,#_c
	movx	@dptr,a
;	../../../core/net/uip6.c:1630: UIP_TCP_BUF->seqno[2] = UIP_TCP_BUF->ackno[2];
	mov	dptr,#(_uip_aligned_buf + 0x0032)
	movx	a,@dptr
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	movx	@dptr,a
;	../../../core/net/uip6.c:1631: UIP_TCP_BUF->ackno[2] = c;
	mov	dptr,#_c
	movx	a,@dptr
	mov	dptr,#(_uip_aligned_buf + 0x0032)
	movx	@dptr,a
;	../../../core/net/uip6.c:1633: c = UIP_TCP_BUF->seqno[1];
	mov	dptr,#(_uip_aligned_buf + 0x002d)
	movx	a,@dptr
	mov	dptr,#_c
	movx	@dptr,a
;	../../../core/net/uip6.c:1634: UIP_TCP_BUF->seqno[1] = UIP_TCP_BUF->ackno[1];
	mov	dptr,#(_uip_aligned_buf + 0x0031)
	movx	a,@dptr
	mov	dptr,#(_uip_aligned_buf + 0x002d)
	movx	@dptr,a
;	../../../core/net/uip6.c:1635: UIP_TCP_BUF->ackno[1] = c;
	mov	dptr,#_c
	movx	a,@dptr
	mov	dptr,#(_uip_aligned_buf + 0x0031)
	movx	@dptr,a
;	../../../core/net/uip6.c:1637: c = UIP_TCP_BUF->seqno[0];
	mov	dptr,#(_uip_aligned_buf + 0x002c)
	movx	a,@dptr
	mov	dptr,#_c
	movx	@dptr,a
;	../../../core/net/uip6.c:1638: UIP_TCP_BUF->seqno[0] = UIP_TCP_BUF->ackno[0];
	mov	dptr,#(_uip_aligned_buf + 0x0030)
	movx	a,@dptr
	mov	dptr,#(_uip_aligned_buf + 0x002c)
	movx	@dptr,a
;	../../../core/net/uip6.c:1639: UIP_TCP_BUF->ackno[0] = c;
	mov	dptr,#_c
	movx	a,@dptr
	mov	dptr,#(_uip_aligned_buf + 0x0030)
	movx	@dptr,a
;	../../../core/net/uip6.c:1644: if(++UIP_TCP_BUF->ackno[3] == 0) {
	mov	dptr,#(_uip_aligned_buf + 0x0033)
	movx	a,@dptr
	mov	r7,a
	inc	r7
	mov	dptr,#(_uip_aligned_buf + 0x0033)
	mov	a,r7
	movx	@dptr,a
	mov	a,r7
	jnz	00323$
;	../../../core/net/uip6.c:1645: if(++UIP_TCP_BUF->ackno[2] == 0) {
	mov	dptr,#(_uip_aligned_buf + 0x0032)
	movx	a,@dptr
	mov	r7,a
	inc	r7
	mov	dptr,#(_uip_aligned_buf + 0x0032)
	mov	a,r7
	movx	@dptr,a
	mov	a,r7
	jnz	00323$
;	../../../core/net/uip6.c:1646: if(++UIP_TCP_BUF->ackno[1] == 0) {
	mov	dptr,#(_uip_aligned_buf + 0x0031)
	movx	a,@dptr
	mov	r7,a
	inc	r7
	mov	dptr,#(_uip_aligned_buf + 0x0031)
	mov	a,r7
	movx	@dptr,a
	mov	a,r7
	jnz	00323$
;	../../../core/net/uip6.c:1647: ++UIP_TCP_BUF->ackno[0];
	mov	dptr,#(_uip_aligned_buf + 0x0030)
	movx	a,@dptr
	mov	r7,a
	inc	r7
	mov	dptr,#(_uip_aligned_buf + 0x0030)
	mov	a,r7
	movx	@dptr,a
00323$:
;	../../../core/net/uip6.c:1653: tmp16 = UIP_TCP_BUF->srcport;
	mov	dptr,#(_uip_aligned_buf + 0x0028)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_tmp16
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1654: UIP_TCP_BUF->srcport = UIP_TCP_BUF->destport;
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_uip_aligned_buf + 0x0028)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1655: UIP_TCP_BUF->destport = tmp16;
	mov	dptr,#_tmp16
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1658: uip_ipaddr_copy(&UIP_IP_BUF->destipaddr, &UIP_IP_BUF->srcipaddr);
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
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:1659: uip_ds6_select_src(&UIP_IP_BUF->srcipaddr, &UIP_IP_BUF->destipaddr);
	mov	a,#(_uip_aligned_buf + 0x0018)
	push	acc
	mov	a,#((_uip_aligned_buf + 0x0018) >> 8)
	push	acc
	clr	a
	push	acc
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	mov	b,#0x00
	mov	r0,#_uip_ds6_select_src
	mov	r1,#(_uip_ds6_select_src >> 8)
	mov	r2,#(_uip_ds6_select_src >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/uip6.c:1661: goto tcp_send_noconn;
	ljmp	00481$
;	../../../core/net/uip6.c:1666: found_listen:
00324$:
;	../../../core/net/uip6.c:1674: uip_connr = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/uip6.c:1675: for(c = 0; c < UIP_CONNS; ++c) {
	mov	dptr,#_c
	movx	@dptr,a
00493$:
;	../../../core/net/uip6.c:1676: if(uip_conns[c].tcpstateflags == UIP_CLOSED) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x2e
	mul	ab
	add	a,#_uip_conns
	mov	r6,a
	mov	a,#(_uip_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	a,#0x25
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jnz	00326$
;	../../../core/net/uip6.c:1677: uip_connr = &uip_conns[c];
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x2e
	mul	ab
	add	a,#_uip_conns
	mov	r6,a
	mov	a,#(_uip_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,#0x00
;	../../../core/net/uip6.c:1678: break;
	ljmp	00332$
00326$:
;	../../../core/net/uip6.c:1680: if(uip_conns[c].tcpstateflags == UIP_TIME_WAIT) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x2e
	mul	ab
	add	a,#_uip_conns
	mov	r6,a
	mov	a,#(_uip_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	a,#0x25
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,r7
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x07,00494$
;	../../../core/net/uip6.c:1681: if(uip_connr == 0 ||
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00327$
;	../../../core/net/uip6.c:1682: uip_conns[c].timer > uip_connr->timer) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x2e
	mul	ab
	add	a,#_uip_conns
	mov	r6,a
	mov	a,#(_uip_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	a,#0x26
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,r7
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x26
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
	lcall	__gptrget
	mov	r4,a
	clr	c
	subb	a,r7
	jnc	00494$
00327$:
;	../../../core/net/uip6.c:1683: uip_connr = &uip_conns[c];
	mov	dptr,#_c
	movx	a,@dptr
	mov	b,#0x2e
	mul	ab
	add	a,#_uip_conns
	mov	r6,a
	mov	a,#(_uip_conns >> 8)
	addc	a,b
	mov	r7,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,#0x00
00494$:
;	../../../core/net/uip6.c:1675: for(c = 0; c < UIP_CONNS; ++c) {
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x0a,01747$
01747$:
	jnc	01748$
	ljmp	00493$
01748$:
00332$:
;	../../../core/net/uip6.c:1688: if(uip_connr == 0) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	01749$
	ljmp	00484$
01749$:
;	../../../core/net/uip6.c:1696: uip_conn = uip_connr;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dptr,#_uip_conn
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
;	../../../core/net/uip6.c:1699: uip_connr->rto = uip_connr->timer = UIP_RTO;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x24
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
	mov	a,#0x26
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
	mov	a,#0x03
	lcall	__gptrput
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1700: uip_connr->sa = 0;
	mov	r0,sp
	dec	r0
	dec	r0
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
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:1701: uip_connr->sv = 4;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	a,#0x04
	lcall	__gptrput
;	../../../core/net/uip6.c:1702: uip_connr->nrtx = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x27
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
;	../../../core/net/uip6.c:1703: uip_connr->lport = UIP_TCP_BUF->destport;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x10
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1704: uip_connr->rport = UIP_TCP_BUF->srcport;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x12
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dptr,#(_uip_aligned_buf + 0x0028)
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1705: uip_ipaddr_copy(&uip_connr->ripaddr, &UIP_IP_BUF->srcipaddr);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
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
;	../../../core/net/uip6.c:1706: uip_connr->tcpstateflags = UIP_SYN_RCVD;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/net/uip6.c:1708: uip_connr->snd_nxt[0] = iss[0];
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
	mov	dptr,#_iss
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1709: uip_connr->snd_nxt[1] = iss[1];
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x01
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_iss + 0x0001)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1710: uip_connr->snd_nxt[2] = iss[2];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x02
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_iss + 0x0002)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1711: uip_connr->snd_nxt[3] = iss[3];
	mov	a,#0x03
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#(_iss + 0x0003)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1712: uip_connr->len = 1;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	a,#0x01
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:1715: uip_connr->rcv_nxt[3] = UIP_TCP_BUF->seqno[3];
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x03
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_uip_aligned_buf + 0x002f)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1716: uip_connr->rcv_nxt[2] = UIP_TCP_BUF->seqno[2];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x02
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1717: uip_connr->rcv_nxt[1] = UIP_TCP_BUF->seqno[1];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x01
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_uip_aligned_buf + 0x002d)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1718: uip_connr->rcv_nxt[0] = UIP_TCP_BUF->seqno[0];
	mov	dptr,#(_uip_aligned_buf + 0x002c)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1719: uip_add_rcv_nxt(1);
	mov	dptr,#0x0001
	mov	r0,#_uip_add_rcv_nxt
	mov	r1,#(_uip_add_rcv_nxt >> 8)
	mov	r2,#(_uip_add_rcv_nxt >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1722: if((UIP_TCP_BUF->tcpoffset & 0xf0) > 0x50) {
	mov	dptr,#(_uip_aligned_buf + 0x0034)
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0xf0
	mov	r6,#0x00
	clr	c
	mov	a,#0x50
	subb	a,r7
	mov	a,#(0x00 ^ 0x80)
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	01750$
	ljmp	00350$
01750$:
;	../../../core/net/uip6.c:1723: for(c = 0; c < ((UIP_TCP_BUF->tcpoffset >> 4) - 5) << 2 ;) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00496$:
	mov	dptr,#(_uip_aligned_buf + 0x0034)
	movx	a,@dptr
	swap	a
	anl	a,#0x0f
	mov	r6,#0x00
	add	a,#0xfb
	mov	r7,a
	mov	a,r6
	addc	a,#0xff
	mov	r6,a
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
	mov	dptr,#_c
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	clr	c
	mov	a,r5
	subb	a,r7
	mov	a,r4
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	01751$
	ljmp	00350$
01751$:
;	../../../core/net/uip6.c:1724: opt = uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + c];
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x3c
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_opt
	movx	@dptr,a
;	../../../core/net/uip6.c:1725: if(opt == TCP_OPT_END) {
	mov	a,r7
	jnz	01752$
	ljmp	00350$
01752$:
;	../../../core/net/uip6.c:1728: } else if(opt == TCP_OPT_NOOP) {
	mov	dptr,#_opt
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00342$
;	../../../core/net/uip6.c:1729: ++c;
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	sjmp	00496$
00342$:
;	../../../core/net/uip6.c:1731: } else if(opt == TCP_OPT_MSS &&
	mov	dptr,#_opt
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x02,01755$
	sjmp	01756$
01755$:
	ljmp	00338$
01756$:
;	../../../core/net/uip6.c:1732: uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + 1 + c] == TCP_OPT_MSS_LEN) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x3d
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x04,01757$
	sjmp	01758$
01757$:
	ljmp	00338$
01758$:
;	../../../core/net/uip6.c:1734: tmp16 = ((uint16_t)uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + 2 + c] << 8) |
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x3e
	add	a,r7
	mov	r4,a
	clr	a
	addc	a,r6
	mov	r5,a
	mov	a,r4
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r5
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
;	../../../core/net/uip6.c:1735: (uint16_t)uip_buf[UIP_IPTCPH_LEN + UIP_LLH_LEN + 3 + c];
	mov	a,#0x3f
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,#0x00
	orl	ar5,a
	mov	a,r6
	orl	ar4,a
	mov	dptr,#_tmp16
	mov	a,r5
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1736: uip_connr->initialmss = uip_connr->mss =
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x20
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
	mov	r1,a
	mov	a,#0x1e
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
;	../../../core/net/uip6.c:1737: tmp16 > UIP_TCP_MSS? UIP_TCP_MSS: tmp16;
	clr	c
	mov	a,#0xb4
	subb	a,r5
	clr	a
	subb	a,r4
	jnc	00505$
	mov	r4,#0xb4
	mov	r5,#0x00
	sjmp	00506$
00505$:
	mov	dptr,#_tmp16
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
00506$:
	mov	a,sp
	add	a,#0xfb
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
	mov	dpl,r3
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r5
	lcall	__gptrput
;	../../../core/net/uip6.c:1740: break;
	sjmp	00350$
00338$:
;	../../../core/net/uip6.c:1744: if(uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + 1 + c] == 0) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x3d
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
	movx	a,@dptr
	jz	00350$
;	../../../core/net/uip6.c:1749: c += uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + 1 + c];
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	mov	a,#0x3d
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r5
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_c
	add	a,r7
	movx	@dptr,a
	ljmp	00496$
;	../../../core/net/uip6.c:1756: tcp_send_synack:
00350$:
;	../../../core/net/uip6.c:1757: UIP_TCP_BUF->flags = TCP_ACK;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	mov	a,#0x10
	movx	@dptr,a
;	../../../core/net/uip6.c:1759: tcp_send_syn:
00351$:
;	../../../core/net/uip6.c:1760: UIP_TCP_BUF->flags |= TCP_SYN;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	orl	a,#0x02
	mov	r7,a
	movx	@dptr,a
;	../../../core/net/uip6.c:1768: UIP_TCP_BUF->optdata[0] = TCP_OPT_MSS;
	mov	dptr,#(_uip_aligned_buf + 0x003c)
	mov	a,#0x02
	movx	@dptr,a
;	../../../core/net/uip6.c:1769: UIP_TCP_BUF->optdata[1] = TCP_OPT_MSS_LEN;
	mov	dptr,#(_uip_aligned_buf + 0x003d)
	rl	a
	movx	@dptr,a
;	../../../core/net/uip6.c:1770: UIP_TCP_BUF->optdata[2] = (UIP_TCP_MSS) / 256;
	mov	dptr,#(_uip_aligned_buf + 0x003e)
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:1771: UIP_TCP_BUF->optdata[3] = (UIP_TCP_MSS) & 255;
	mov	dptr,#(_uip_aligned_buf + 0x003f)
	mov	a,#0xb4
	movx	@dptr,a
;	../../../core/net/uip6.c:1772: uip_len = UIP_IPTCPH_LEN + TCP_OPT_MSS_LEN;
	mov	dptr,#_uip_len
	mov	a,#0x40
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1773: UIP_TCP_BUF->tcpoffset = ((UIP_TCPH_LEN + TCP_OPT_MSS_LEN) / 4) << 4;
	mov	dptr,#(_uip_aligned_buf + 0x0034)
	mov	a,#0x60
	movx	@dptr,a
;	../../../core/net/uip6.c:1774: goto tcp_send;
	ljmp	00477$
;	../../../core/net/uip6.c:1777: found:
00352$:
;	../../../core/net/uip6.c:1779: uip_conn = uip_connr;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dptr,#_uip_conn
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
;	../../../core/net/uip6.c:1780: uip_flags = 0;
	mov	dptr,#_uip_flags
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:1785: if(UIP_TCP_BUF->flags & TCP_RST) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	jnb	acc.2,00354$
;	../../../core/net/uip6.c:1786: uip_connr->tcpstateflags = UIP_CLOSED;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:1788: uip_flags = UIP_ABORT;
	mov	dptr,#_uip_flags
	mov	a,#0x20
	movx	@dptr,a
;	../../../core/net/uip6.c:1789: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1790: goto drop;
	ljmp	00484$
00354$:
;	../../../core/net/uip6.c:1794: c = (UIP_TCP_BUF->tcpoffset >> 4) << 2;
	mov	dptr,#(_uip_aligned_buf + 0x0034)
	movx	a,@dptr
	swap	a
	anl	a,#0x0f
	add	a,acc
	add	a,acc
	mov	r7,a
	mov	dptr,#_c
	movx	@dptr,a
;	../../../core/net/uip6.c:1798: uip_len = uip_len - c - UIP_IPH_LEN;
	mov	r6,#0x00
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,r7
	mov	r4,a
	mov	a,r5
	subb	a,r6
	mov	r5,a
	mov	a,r4
	add	a,#0xd8
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	dptr,#_uip_len
	mov	a,r4
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1805: if(!((((uip_connr->tcpstateflags & UIP_TS_MASK) == UIP_SYN_SENT) &&
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	anl	ar5,#0x0f
	mov	r7,#0x00
	cjne	r5,#0x02,00368$
	cjne	r7,#0x00,00368$
;	../../../core/net/uip6.c:1806: ((UIP_TCP_BUF->flags & TCP_CTL) == (TCP_SYN | TCP_ACK))) ||
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0x3f
	mov	r6,#0x00
	cjne	r7,#0x12,01764$
	cjne	r6,#0x00,01764$
	ljmp	00365$
01764$:
00368$:
;	../../../core/net/uip6.c:1807: (((uip_connr->tcpstateflags & UIP_TS_MASK) == UIP_SYN_RCVD) &&
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	anl	ar5,#0x0f
	mov	r7,#0x00
	cjne	r5,#0x01,00364$
	cjne	r7,#0x00,00364$
;	../../../core/net/uip6.c:1808: ((UIP_TCP_BUF->flags & TCP_CTL) == TCP_SYN)))) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0x3f
	mov	r6,#0x00
	cjne	r7,#0x02,01767$
	cjne	r6,#0x00,01767$
	ljmp	00365$
01767$:
00364$:
;	../../../core/net/uip6.c:1809: if((uip_len > 0 || ((UIP_TCP_BUF->flags & (TCP_SYN | TCP_FIN)) != 0)) &&
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00363$
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	anl	a,#0x03
	jnz	01769$
	ljmp	00365$
01769$:
00363$:
;	../../../core/net/uip6.c:1810: (UIP_TCP_BUF->seqno[0] != uip_connr->rcv_nxt[0] ||
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
	mov	dptr,#(_uip_aligned_buf + 0x002c)
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,r4
	cjne	a,ar5,01770$
	sjmp	01771$
01770$:
	sjmp	00357$
01771$:
;	../../../core/net/uip6.c:1811: UIP_TCP_BUF->seqno[1] != uip_connr->rcv_nxt[1] ||
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
	inc	r5
	cjne	r5,#0x00,01772$
	inc	r6
01772$:
	mov	dptr,#(_uip_aligned_buf + 0x002d)
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,r4
	cjne	a,ar5,00357$
;	../../../core/net/uip6.c:1812: UIP_TCP_BUF->seqno[2] != uip_connr->rcv_nxt[2] ||
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
	mov	a,#0x02
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,r4
	cjne	a,ar5,00357$
;	../../../core/net/uip6.c:1813: UIP_TCP_BUF->seqno[3] != uip_connr->rcv_nxt[3])) {
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
	mov	a,#0x03
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#(_uip_aligned_buf + 0x002f)
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,r4
	cjne	a,ar5,01777$
	sjmp	00365$
01777$:
00357$:
;	../../../core/net/uip6.c:1815: if(UIP_TCP_BUF->flags & TCP_SYN) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	jb	acc.1,01778$
	ljmp	00474$
01778$:
;	../../../core/net/uip6.c:1816: goto tcp_send_synack;
	ljmp	00350$
;	../../../core/net/uip6.c:1818: goto tcp_send_ack;
00365$:
;	../../../core/net/uip6.c:1826: if((UIP_TCP_BUF->flags & TCP_ACK) && uip_outstanding(uip_connr)) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	jb	acc.4,01779$
	ljmp	00379$
01779$:
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	r6,a
	orl	a,r5
	jnz	01780$
	ljmp	00379$
01780$:
;	../../../core/net/uip6.c:1827: uip_add32(uip_connr->snd_nxt, uip_connr->len);
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	r6,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x18
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar7,@r0
	push	ar5
	push	ar6
	mov	dpl,r3
	mov	dph,r4
	mov	b,r7
	mov	r0,#_uip_add32
	mov	r1,#(_uip_add32 >> 8)
	mov	r2,#(_uip_add32 >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
;	../../../core/net/uip6.c:1829: if(UIP_TCP_BUF->ackno[0] == uip_acc32[0] &&
	mov	dptr,#_uip_acc32
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_uip_aligned_buf + 0x0030)
	movx	a,@dptr
	mov	r6,a
	cjne	a,ar7,01781$
	sjmp	01782$
01781$:
	ljmp	00379$
01782$:
;	../../../core/net/uip6.c:1830: UIP_TCP_BUF->ackno[1] == uip_acc32[1] &&
	mov	dptr,#(_uip_acc32 + 0x0001)
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_uip_aligned_buf + 0x0031)
	movx	a,@dptr
	mov	r6,a
	cjne	a,ar7,01783$
	sjmp	01784$
01783$:
	ljmp	00379$
01784$:
;	../../../core/net/uip6.c:1831: UIP_TCP_BUF->ackno[2] == uip_acc32[2] &&
	mov	dptr,#(_uip_acc32 + 0x0002)
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_uip_aligned_buf + 0x0032)
	movx	a,@dptr
	mov	r6,a
	cjne	a,ar7,01785$
	sjmp	01786$
01785$:
	ljmp	00379$
01786$:
;	../../../core/net/uip6.c:1832: UIP_TCP_BUF->ackno[3] == uip_acc32[3]) {
	mov	dptr,#(_uip_acc32 + 0x0003)
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_uip_aligned_buf + 0x0033)
	movx	a,@dptr
	mov	r6,a
	cjne	a,ar7,01787$
	sjmp	01788$
01787$:
	ljmp	00379$
01788$:
;	../../../core/net/uip6.c:1834: uip_connr->snd_nxt[0] = uip_acc32[0];
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
	mov	dptr,#_uip_acc32
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1835: uip_connr->snd_nxt[1] = uip_acc32[1];
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x01
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_uip_acc32 + 0x0001)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1836: uip_connr->snd_nxt[2] = uip_acc32[2];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x02
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_uip_acc32 + 0x0002)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1837: uip_connr->snd_nxt[3] = uip_acc32[3];
	mov	a,#0x03
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#(_uip_acc32 + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1840: if(uip_connr->nrtx == 0) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x27
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
	jz	01789$
	ljmp	00372$
01789$:
;	../../../core/net/uip6.c:1842: m = uip_connr->rto - uip_connr->timer;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x24
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
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x26
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
	mov	a,r5
	clr	c
	subb	a,r4
	mov	r5,a
;	../../../core/net/uip6.c:1844: m = m - (uip_connr->sa >> 3);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x22
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
	mov	r3,a
	swap	a
	rl	a
	anl	a,#0x1f
	mov	r2,a
	mov	a,r5
	clr	c
	subb	a,r2
;	../../../core/net/uip6.c:1845: uip_connr->sa += m;
	mov	r5,a
	add	a,r3
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1846: if(m < 0) {
	mov	a,r5
	jnb	acc.7,00370$
;	../../../core/net/uip6.c:1847: m = -m;
	clr	c
	clr	a
	subb	a,r5
	mov	r5,a
00370$:
;	../../../core/net/uip6.c:1849: m = m - (uip_connr->sv >> 2);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x23
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
	mov	r3,a
	rr	a
	rr	a
	anl	a,#0x3f
	mov	r2,a
	mov	a,r5
	clr	c
	subb	a,r2
;	../../../core/net/uip6.c:1850: uip_connr->sv += m;
	add	a,r3
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1851: uip_connr->rto = (uip_connr->sa >> 3) + uip_connr->sv;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
	mov	r1,a
	mov	a,#0x24
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
	mov	a,#0x22
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r5
	lcall	__gptrget
	swap	a
	rl	a
	anl	a,#0x1f
	mov	r2,a
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	add	a,r2
	mov	r2,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
00372$:
;	../../../core/net/uip6.c:1855: uip_flags = UIP_ACKDATA;
	mov	dptr,#_uip_flags
	mov	a,#0x01
	movx	@dptr,a
;	../../../core/net/uip6.c:1857: uip_connr->timer = uip_connr->rto;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x26
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
	mov	a,#0x24
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1860: uip_connr->len = 0;
	mov	r0,sp
	dec	r0
	dec	r0
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
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
00379$:
;	../../../core/net/uip6.c:1866: switch(uip_connr->tcpstateflags & UIP_TS_MASK) {
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,#0x0f
	anl	a,r5
	mov	r6,a
	clr	a
	mov	r7,a
	jnb	acc.7,01791$
	ljmp	00484$
01791$:
	clr	c
	mov	a,#0x08
	subb	a,r6
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	01792$
	ljmp	00484$
01792$:
	mov	a,r6
	add	a,#(01793$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,r6
	add	a,#(01794$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
01793$:
	.db	00484$
	.db	00381$
	.db	00388$
	.db	00407$
	.db	00449$
	.db	00462$
	.db	00470$
	.db	00474$
	.db	00446$
01794$:
	.db	00484$>>8
	.db	00381$>>8
	.db	00388$>>8
	.db	00407$>>8
	.db	00449$>>8
	.db	00462$>>8
	.db	00470$>>8
	.db	00474$>>8
	.db	00446$>>8
;	../../../core/net/uip6.c:1871: case UIP_SYN_RCVD:
00381$:
;	../../../core/net/uip6.c:1876: if(uip_flags & UIP_ACKDATA) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jnb	acc.0,00385$
;	../../../core/net/uip6.c:1877: uip_connr->tcpstateflags = UIP_ESTABLISHED;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x03
	lcall	__gptrput
;	../../../core/net/uip6.c:1878: uip_flags = UIP_CONNECTED;
	mov	dptr,#_uip_flags
	mov	a,#0x40
	movx	@dptr,a
;	../../../core/net/uip6.c:1879: uip_connr->len = 0;
	mov	r0,sp
	dec	r0
	dec	r0
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
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/uip6.c:1880: if(uip_len > 0) {
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00383$
;	../../../core/net/uip6.c:1881: uip_flags |= UIP_NEWDATA;
	mov	dptr,#_uip_flags
	movx	a,@dptr
	orl	acc,#0x02
	movx	@dptr,a
;	../../../core/net/uip6.c:1882: uip_add_rcv_nxt(uip_len);
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_uip_add_rcv_nxt
	mov	r1,#(_uip_add_rcv_nxt >> 8)
	mov	r2,#(_uip_add_rcv_nxt >> 16)
	lcall	__sdcc_banked_call
00383$:
;	../../../core/net/uip6.c:1884: uip_slen = 0;
	mov	dptr,#_uip_slen
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1885: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1886: goto appsend;
	ljmp	00424$
00385$:
;	../../../core/net/uip6.c:1889: if((UIP_TCP_BUF->flags & TCP_CTL) == TCP_SYN) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0x3f
	mov	r6,#0x00
	cjne	r7,#0x02,01797$
	cjne	r6,#0x00,01797$
	sjmp	01798$
01797$:
	ljmp	00484$
01798$:
;	../../../core/net/uip6.c:1890: goto tcp_send_synack;
	ljmp	00350$
;	../../../core/net/uip6.c:1894: case UIP_SYN_SENT:
00388$:
;	../../../core/net/uip6.c:1899: if((uip_flags & UIP_ACKDATA) &&
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jb	acc.0,01799$
	ljmp	00405$
01799$:
;	../../../core/net/uip6.c:1900: (UIP_TCP_BUF->flags & TCP_CTL) == (TCP_SYN | TCP_ACK)) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0x3f
	mov	r6,#0x00
	cjne	r7,#0x12,01800$
	cjne	r6,#0x00,01800$
	sjmp	01801$
01800$:
	ljmp	00405$
01801$:
;	../../../core/net/uip6.c:1903: if((UIP_TCP_BUF->tcpoffset & 0xf0) > 0x50) {
	mov	dptr,#(_uip_aligned_buf + 0x0034)
	movx	a,@dptr
	mov	r7,a
	anl	ar7,#0xf0
	mov	r6,#0x00
	clr	c
	mov	a,#0x50
	subb	a,r7
	mov	a,#(0x00 ^ 0x80)
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	01802$
	ljmp	00403$
01802$:
;	../../../core/net/uip6.c:1904: for(c = 0; c < ((UIP_TCP_BUF->tcpoffset >> 4) - 5) << 2 ;) {
	mov	dptr,#_c
	clr	a
	movx	@dptr,a
00499$:
	mov	dptr,#(_uip_aligned_buf + 0x0034)
	movx	a,@dptr
	swap	a
	anl	a,#0x0f
	mov	r6,#0x00
	add	a,#0xfb
	mov	r7,a
	mov	a,r6
	addc	a,#0xff
	mov	r6,a
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
	mov	dptr,#_c
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	clr	c
	mov	a,r5
	subb	a,r7
	mov	a,r4
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	01803$
	ljmp	00403$
01803$:
;	../../../core/net/uip6.c:1905: opt = uip_buf[UIP_IPTCPH_LEN + UIP_LLH_LEN + c];
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x3c
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_opt
	movx	@dptr,a
;	../../../core/net/uip6.c:1906: if(opt == TCP_OPT_END) {
	mov	a,r7
	jnz	01804$
	ljmp	00403$
01804$:
;	../../../core/net/uip6.c:1909: } else if(opt == TCP_OPT_NOOP) {
	mov	dptr,#_opt
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00396$
;	../../../core/net/uip6.c:1910: ++c;
	mov	dptr,#_c
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	sjmp	00499$
00396$:
;	../../../core/net/uip6.c:1912: } else if(opt == TCP_OPT_MSS &&
	mov	dptr,#_opt
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x02,01807$
	sjmp	01808$
01807$:
	ljmp	00392$
01808$:
;	../../../core/net/uip6.c:1913: uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + 1 + c] == TCP_OPT_MSS_LEN) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x3d
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x04,01809$
	sjmp	01810$
01809$:
	ljmp	00392$
01810$:
;	../../../core/net/uip6.c:1915: tmp16 = (uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + 2 + c] << 8) |
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x3e
	add	a,r7
	mov	r4,a
	clr	a
	addc	a,r6
	mov	r5,a
	mov	a,r4
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r5
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
;	../../../core/net/uip6.c:1916: uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + 3 + c];
	mov	a,#0x3f
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,#0x00
	orl	ar5,a
	mov	a,r6
	orl	ar4,a
	mov	dptr,#_tmp16
	mov	a,r5
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1917: uip_connr->initialmss =
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x20
	add	a,@r0
	mov	r3,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
;	../../../core/net/uip6.c:1918: uip_connr->mss = tmp16 > UIP_TCP_MSS? UIP_TCP_MSS: tmp16;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,sp
	add	a,#0xfb
	mov	r1,a
	mov	a,#0x1e
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
	clr	c
	mov	a,#0xb4
	subb	a,r5
	clr	a
	subb	a,r4
	jnc	00507$
	mov	r4,#0xb4
	mov	r5,#0x00
	sjmp	00508$
00507$:
	mov	dptr,#_tmp16
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
00508$:
	mov	a,sp
	add	a,#0xfb
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
	mov	dpl,r3
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r5
	lcall	__gptrput
;	../../../core/net/uip6.c:1921: break;
	sjmp	00403$
00392$:
;	../../../core/net/uip6.c:1925: if(uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + 1 + c] == 0) {
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x3d
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
	movx	a,@dptr
	jz	00403$
;	../../../core/net/uip6.c:1930: c += uip_buf[UIP_TCPIP_HLEN + UIP_LLH_LEN + 1 + c];
	mov	dptr,#_c
	movx	a,@dptr
	mov	r7,a
	mov	r5,a
	mov	r6,#0x00
	mov	a,#0x3d
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r5
	add	a,#_uip_aligned_buf
	mov	dpl,a
	mov	a,r6
	addc	a,#(_uip_aligned_buf >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_c
	add	a,r7
	movx	@dptr,a
	ljmp	00499$
00403$:
;	../../../core/net/uip6.c:1934: uip_connr->tcpstateflags = UIP_ESTABLISHED;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x03
	lcall	__gptrput
;	../../../core/net/uip6.c:1935: uip_connr->rcv_nxt[0] = UIP_TCP_BUF->seqno[0];
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
	mov	dptr,#(_uip_aligned_buf + 0x002c)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1936: uip_connr->rcv_nxt[1] = UIP_TCP_BUF->seqno[1];
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x01
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_uip_aligned_buf + 0x002d)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1937: uip_connr->rcv_nxt[2] = UIP_TCP_BUF->seqno[2];
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x02
	add	a,r5
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar7
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	movx	a,@dptr
	mov	r4,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:1938: uip_connr->rcv_nxt[3] = UIP_TCP_BUF->seqno[3];
	mov	a,#0x03
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dptr,#(_uip_aligned_buf + 0x002f)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrput
;	../../../core/net/uip6.c:1939: uip_add_rcv_nxt(1);
	mov	dptr,#0x0001
	mov	r0,#_uip_add_rcv_nxt
	mov	r1,#(_uip_add_rcv_nxt >> 8)
	mov	r2,#(_uip_add_rcv_nxt >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1940: uip_flags = UIP_CONNECTED | UIP_NEWDATA;
	mov	dptr,#_uip_flags
	mov	a,#0x42
	movx	@dptr,a
;	../../../core/net/uip6.c:1941: uip_connr->len = 0;
	mov	r0,sp
	dec	r0
	dec	r0
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
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/uip6.c:1942: uip_len = 0;
	mov	dptr,#_uip_len
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1943: uip_slen = 0;
	mov	dptr,#_uip_slen
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:1944: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1945: goto appsend;
	ljmp	00424$
00405$:
;	../../../core/net/uip6.c:1948: uip_flags = UIP_ABORT;
	mov	dptr,#_uip_flags
	mov	a,#0x20
	movx	@dptr,a
;	../../../core/net/uip6.c:1949: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1951: uip_conn->tcpstateflags = UIP_CLOSED;
	mov	dptr,#_uip_conn
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:1952: goto reset;
	ljmp	00315$
;	../../../core/net/uip6.c:1955: case UIP_ESTABLISHED:
00407$:
;	../../../core/net/uip6.c:1967: if(UIP_TCP_BUF->flags & TCP_FIN && !(uip_connr->tcpstateflags & UIP_STOPPED)) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	jb	acc.0,01813$
	ljmp	00414$
01813$:
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	jnb	acc.4,01814$
	ljmp	00414$
01814$:
;	../../../core/net/uip6.c:1968: if(uip_outstanding(uip_connr)) {
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	r6,a
	orl	a,r5
	jz	01815$
	ljmp	00484$
01815$:
;	../../../core/net/uip6.c:1971: uip_add_rcv_nxt(1 + uip_len);
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	inc	r6
	cjne	r6,#0x00,01816$
	inc	r7
01816$:
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_uip_add_rcv_nxt
	mov	r1,#(_uip_add_rcv_nxt >> 8)
	mov	r2,#(_uip_add_rcv_nxt >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1972: uip_flags |= UIP_CLOSE;
	mov	dptr,#_uip_flags
	movx	a,@dptr
	orl	acc,#0x10
	movx	@dptr,a
;	../../../core/net/uip6.c:1973: if(uip_len > 0) {
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00411$
;	../../../core/net/uip6.c:1974: uip_flags |= UIP_NEWDATA;
	mov	dptr,#_uip_flags
	movx	a,@dptr
	orl	acc,#0x02
	movx	@dptr,a
00411$:
;	../../../core/net/uip6.c:1976: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:1977: uip_connr->len = 1;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	a,#0x01
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:1978: uip_connr->tcpstateflags = UIP_LAST_ACK;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x08
	lcall	__gptrput
;	../../../core/net/uip6.c:1979: uip_connr->nrtx = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x27
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
;	../../../core/net/uip6.c:1980: tcp_send_finack:
00412$:
;	../../../core/net/uip6.c:1981: UIP_TCP_BUF->flags = TCP_FIN | TCP_ACK;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	mov	a,#0x11
	movx	@dptr,a
;	../../../core/net/uip6.c:1982: goto tcp_send_nodata;
	ljmp	00475$
00414$:
;	../../../core/net/uip6.c:1987: if((UIP_TCP_BUF->flags & TCP_URG) != 0) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	jnb	acc.5,00417$
;	../../../core/net/uip6.c:2001: uip_appdata = ((char *)uip_appdata) + ((UIP_TCP_BUF->urgp[0] << 8) | UIP_TCP_BUF->urgp[1]);
	mov	dptr,#_uip_appdata
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_uip_aligned_buf + 0x003a)
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	inc	r0
	mov	@r0,ar4
	dec	r0
	mov	@r0,#0x00
	mov	dptr,#(_uip_aligned_buf + 0x003b)
	movx	a,@dptr
	mov	r2,a
	mov	r4,#0x00
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	orl	ar2,a
	inc	r0
	mov	a,@r0
	orl	ar4,a
	mov	a,r2
	add	a,r5
	mov	r5,a
	mov	a,r4
	addc	a,r6
	mov	r6,a
	mov	dptr,#_uip_appdata
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2002: uip_len -= (UIP_TCP_BUF->urgp[0] << 8) | UIP_TCP_BUF->urgp[1];
	mov	dptr,#(_uip_aligned_buf + 0x003a)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_uip_aligned_buf + 0x003b)
	movx	a,@dptr
	mov	r4,#0x00
	orl	ar7,a
	mov	a,r4
	orl	ar6,a
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_uip_len
	mov	a,r4
	clr	c
	subb	a,r7
	movx	@dptr,a
	mov	a,r5
	subb	a,r6
	inc	dptr
	movx	@dptr,a
00417$:
;	../../../core/net/uip6.c:2011: if(uip_len > 0 && !(uip_connr->tcpstateflags & UIP_STOPPED)) {
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00419$
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	jb	acc.4,00419$
;	../../../core/net/uip6.c:2012: uip_flags |= UIP_NEWDATA;
	mov	dptr,#_uip_flags
	movx	a,@dptr
	orl	acc,#0x02
	movx	@dptr,a
;	../../../core/net/uip6.c:2013: uip_add_rcv_nxt(uip_len);
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_uip_add_rcv_nxt
	mov	r1,#(_uip_add_rcv_nxt >> 8)
	mov	r2,#(_uip_add_rcv_nxt >> 16)
	lcall	__sdcc_banked_call
00419$:
;	../../../core/net/uip6.c:2028: tmp16 = ((uint16_t)UIP_TCP_BUF->wnd[0] << 8) + (uint16_t)UIP_TCP_BUF->wnd[1];
	mov	dptr,#(_uip_aligned_buf + 0x0036)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_uip_aligned_buf + 0x0037)
	movx	a,@dptr
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
	addc	a,r6
	mov	r6,a
	mov	dptr,#_tmp16
	mov	a,r7
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2029: if(tmp16 > uip_connr->initialmss ||
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x20
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
	clr	c
	mov	a,r3
	subb	a,r7
	mov	a,r4
	subb	a,r6
	jc	00421$
;	../../../core/net/uip6.c:2030: tmp16 == 0) {
	mov	dptr,#_tmp16
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00422$
00421$:
;	../../../core/net/uip6.c:2031: tmp16 = uip_connr->initialmss;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	dptr,#_tmp16
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
00422$:
;	../../../core/net/uip6.c:2033: uip_connr->mss = tmp16;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1e
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_tmp16
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/uip6.c:2051: if(uip_flags & (UIP_NEWDATA | UIP_ACKDATA)) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	anl	a,#0x03
	jnz	01823$
	ljmp	00484$
01823$:
;	../../../core/net/uip6.c:2052: uip_slen = 0;
	mov	dptr,#_uip_slen
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2053: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:2055: appsend:
00424$:
;	../../../core/net/uip6.c:2057: if(uip_flags & UIP_ABORT) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jnb	acc.5,00426$
;	../../../core/net/uip6.c:2058: uip_slen = 0;
	mov	dptr,#_uip_slen
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2059: uip_connr->tcpstateflags = UIP_CLOSED;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:2060: UIP_TCP_BUF->flags = TCP_RST | TCP_ACK;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	mov	a,#0x14
	movx	@dptr,a
;	../../../core/net/uip6.c:2061: goto tcp_send_nodata;
	ljmp	00475$
00426$:
;	../../../core/net/uip6.c:2064: if(uip_flags & UIP_CLOSE) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jnb	acc.4,00428$
;	../../../core/net/uip6.c:2065: uip_slen = 0;
	mov	dptr,#_uip_slen
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2066: uip_connr->len = 1;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	a,#0x01
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:2067: uip_connr->tcpstateflags = UIP_FIN_WAIT_1;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x04
	lcall	__gptrput
;	../../../core/net/uip6.c:2068: uip_connr->nrtx = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x27
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
;	../../../core/net/uip6.c:2069: UIP_TCP_BUF->flags = TCP_FIN | TCP_ACK;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	mov	a,#0x11
	movx	@dptr,a
;	../../../core/net/uip6.c:2070: goto tcp_send_nodata;
	ljmp	00475$
00428$:
;	../../../core/net/uip6.c:2074: if(uip_slen > 0) {
	mov	dptr,#_uip_slen
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	01826$
	ljmp	00437$
01826$:
;	../../../core/net/uip6.c:2078: if((uip_flags & UIP_ACKDATA) != 0) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jnb	acc.0,00430$
;	../../../core/net/uip6.c:2079: uip_connr->len = 0;
	mov	r0,sp
	dec	r0
	dec	r0
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
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
00430$:
;	../../../core/net/uip6.c:2085: if(uip_connr->len == 0) {
	mov	r0,sp
	dec	r0
	dec	r0
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
	orl	a,r5
	jnz	00434$
;	../../../core/net/uip6.c:2090: if(uip_slen > uip_connr->mss) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1e
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
	mov	dptr,#_uip_slen
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	mov	a,r5
	subb	a,r4
	mov	a,r6
	subb	a,r7
	jnc	00432$
;	../../../core/net/uip6.c:2091: uip_slen = uip_connr->mss;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1e
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
	mov	dptr,#_uip_slen
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
00432$:
;	../../../core/net/uip6.c:2096: uip_connr->len = uip_slen;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x1c
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_uip_slen
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
	sjmp	00437$
00434$:
;	../../../core/net/uip6.c:2102: uip_slen = uip_connr->len;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	r6,a
	mov	dptr,#_uip_slen
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
00437$:
;	../../../core/net/uip6.c:2105: uip_connr->nrtx = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x27
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
;	../../../core/net/uip6.c:2106: apprexmit:
00438$:
;	../../../core/net/uip6.c:2107: uip_appdata = uip_sappdata;
	mov	dptr,#_uip_sappdata
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_uip_appdata
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2111: if(uip_slen > 0 && uip_connr->len > 0) {
	mov	dptr,#_uip_slen
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00440$
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	r6,a
	orl	a,r5
	jz	00440$
;	../../../core/net/uip6.c:2113: uip_len = uip_connr->len + UIP_TCPIP_HLEN;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	r6,a
	mov	dptr,#_uip_len
	mov	a,#0x3c
	add	a,r5
	movx	@dptr,a
	clr	a
	addc	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2115: UIP_TCP_BUF->flags = TCP_ACK | TCP_PSH;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	mov	a,#0x18
	movx	@dptr,a
;	../../../core/net/uip6.c:2117: goto tcp_send_noopts;
	ljmp	00476$
00440$:
;	../../../core/net/uip6.c:2121: if(uip_flags & UIP_NEWDATA) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jb	acc.1,01832$
	ljmp	00484$
01832$:
;	../../../core/net/uip6.c:2122: uip_len = UIP_TCPIP_HLEN;
	mov	dptr,#_uip_len
	mov	a,#0x3c
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2123: UIP_TCP_BUF->flags = TCP_ACK;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	mov	a,#0x10
	movx	@dptr,a
;	../../../core/net/uip6.c:2124: goto tcp_send_noopts;
	ljmp	00476$
;	../../../core/net/uip6.c:2128: case UIP_LAST_ACK:
00446$:
;	../../../core/net/uip6.c:2131: if(uip_flags & UIP_ACKDATA) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jb	acc.0,01833$
	ljmp	00484$
01833$:
;	../../../core/net/uip6.c:2132: uip_connr->tcpstateflags = UIP_CLOSED;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	../../../core/net/uip6.c:2133: uip_flags = UIP_CLOSE;
	mov	dptr,#_uip_flags
	mov	a,#0x10
	movx	@dptr,a
;	../../../core/net/uip6.c:2134: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:2136: break;
	ljmp	00484$
;	../../../core/net/uip6.c:2138: case UIP_FIN_WAIT_1:
00449$:
;	../../../core/net/uip6.c:2142: if(uip_len > 0) {
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00451$
;	../../../core/net/uip6.c:2143: uip_add_rcv_nxt(uip_len);
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_uip_add_rcv_nxt
	mov	r1,#(_uip_add_rcv_nxt >> 8)
	mov	r2,#(_uip_add_rcv_nxt >> 16)
	lcall	__sdcc_banked_call
00451$:
;	../../../core/net/uip6.c:2145: if(UIP_TCP_BUF->flags & TCP_FIN) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	jb	acc.0,01835$
	ljmp	00458$
01835$:
;	../../../core/net/uip6.c:2146: if(uip_flags & UIP_ACKDATA) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jnb	acc.0,00453$
;	../../../core/net/uip6.c:2147: uip_connr->tcpstateflags = UIP_TIME_WAIT;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x07
	lcall	__gptrput
;	../../../core/net/uip6.c:2148: uip_connr->timer = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x26
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
;	../../../core/net/uip6.c:2149: uip_connr->len = 0;
	mov	r0,sp
	dec	r0
	dec	r0
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
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	sjmp	00454$
00453$:
;	../../../core/net/uip6.c:2151: uip_connr->tcpstateflags = UIP_CLOSING;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x06
	lcall	__gptrput
00454$:
;	../../../core/net/uip6.c:2153: uip_add_rcv_nxt(1);
	mov	dptr,#0x0001
	mov	r0,#_uip_add_rcv_nxt
	mov	r1,#(_uip_add_rcv_nxt >> 8)
	mov	r2,#(_uip_add_rcv_nxt >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:2154: uip_flags = UIP_CLOSE;
	mov	dptr,#_uip_flags
	mov	a,#0x10
	movx	@dptr,a
;	../../../core/net/uip6.c:2155: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:2156: goto tcp_send_ack;
	ljmp	00474$
00458$:
;	../../../core/net/uip6.c:2157: } else if(uip_flags & UIP_ACKDATA) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jnb	acc.0,00459$
;	../../../core/net/uip6.c:2158: uip_connr->tcpstateflags = UIP_FIN_WAIT_2;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x05
	lcall	__gptrput
;	../../../core/net/uip6.c:2159: uip_connr->len = 0;
	mov	r0,sp
	dec	r0
	dec	r0
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
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/net/uip6.c:2160: goto drop;
	ljmp	00484$
00459$:
;	../../../core/net/uip6.c:2162: if(uip_len > 0) {
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	01838$
	ljmp	00484$
01838$:
;	../../../core/net/uip6.c:2163: goto tcp_send_ack;
	ljmp	00474$
;	../../../core/net/uip6.c:2167: case UIP_FIN_WAIT_2:
00462$:
;	../../../core/net/uip6.c:2168: if(uip_len > 0) {
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00464$
;	../../../core/net/uip6.c:2169: uip_add_rcv_nxt(uip_len);
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_uip_add_rcv_nxt
	mov	r1,#(_uip_add_rcv_nxt >> 8)
	mov	r2,#(_uip_add_rcv_nxt >> 16)
	lcall	__sdcc_banked_call
00464$:
;	../../../core/net/uip6.c:2171: if(UIP_TCP_BUF->flags & TCP_FIN) {
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	movx	a,@dptr
	mov	r7,a
	jnb	acc.0,00466$
;	../../../core/net/uip6.c:2172: uip_connr->tcpstateflags = UIP_TIME_WAIT;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x07
	lcall	__gptrput
;	../../../core/net/uip6.c:2173: uip_connr->timer = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x26
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
;	../../../core/net/uip6.c:2174: uip_add_rcv_nxt(1);
	mov	dptr,#0x0001
	mov	r0,#_uip_add_rcv_nxt
	mov	r1,#(_uip_add_rcv_nxt >> 8)
	mov	r2,#(_uip_add_rcv_nxt >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:2175: uip_flags = UIP_CLOSE;
	mov	dptr,#_uip_flags
	mov	a,#0x10
	movx	@dptr,a
;	../../../core/net/uip6.c:2176: UIP_APPCALL();
	mov	r0,#_tcpip_uipcall
	mov	r1,#(_tcpip_uipcall >> 8)
	mov	r2,#(_tcpip_uipcall >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/uip6.c:2177: goto tcp_send_ack;
	sjmp	00474$
00466$:
;	../../../core/net/uip6.c:2179: if(uip_len > 0) {
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00474$
;	../../../core/net/uip6.c:2180: goto tcp_send_ack;
;	../../../core/net/uip6.c:2187: case UIP_CLOSING:
	ljmp	00484$
00470$:
;	../../../core/net/uip6.c:2188: if(uip_flags & UIP_ACKDATA) {
	mov	dptr,#_uip_flags
	movx	a,@dptr
	jb	acc.0,01842$
	ljmp	00484$
01842$:
;	../../../core/net/uip6.c:2189: uip_connr->tcpstateflags = UIP_TIME_WAIT;
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,#0x07
	lcall	__gptrput
;	../../../core/net/uip6.c:2190: uip_connr->timer = 0;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x26
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
;	../../../core/net/uip6.c:2193: goto drop;
	ljmp	00484$
;	../../../core/net/uip6.c:2197: tcp_send_ack:
00474$:
;	../../../core/net/uip6.c:2198: UIP_TCP_BUF->flags = TCP_ACK;
	mov	dptr,#(_uip_aligned_buf + 0x0035)
	mov	a,#0x10
	movx	@dptr,a
;	../../../core/net/uip6.c:2200: tcp_send_nodata:
00475$:
;	../../../core/net/uip6.c:2201: uip_len = UIP_IPTCPH_LEN;
	mov	dptr,#_uip_len
	mov	a,#0x3c
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2203: tcp_send_noopts:
00476$:
;	../../../core/net/uip6.c:2204: UIP_TCP_BUF->tcpoffset = (UIP_TCPH_LEN / 4) << 4;
	mov	dptr,#(_uip_aligned_buf + 0x0034)
	mov	a,#0x50
	movx	@dptr,a
;	../../../core/net/uip6.c:2210: tcp_send:
00477$:
;	../../../core/net/uip6.c:2213: UIP_TCP_BUF->ackno[0] = uip_connr->rcv_nxt[0];
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
	lcall	__gptrget
	mov	dptr,#(_uip_aligned_buf + 0x0030)
	movx	@dptr,a
;	../../../core/net/uip6.c:2214: UIP_TCP_BUF->ackno[1] = uip_connr->rcv_nxt[1];
	mov	a,#0x01
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
	mov	dptr,#(_uip_aligned_buf + 0x0031)
	movx	@dptr,a
;	../../../core/net/uip6.c:2215: UIP_TCP_BUF->ackno[2] = uip_connr->rcv_nxt[2];
	mov	a,#0x02
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
	mov	dptr,#(_uip_aligned_buf + 0x0032)
	movx	@dptr,a
;	../../../core/net/uip6.c:2216: UIP_TCP_BUF->ackno[3] = uip_connr->rcv_nxt[3];
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
	mov	dptr,#(_uip_aligned_buf + 0x0033)
	movx	@dptr,a
;	../../../core/net/uip6.c:2218: UIP_TCP_BUF->seqno[0] = uip_connr->snd_nxt[0];
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dptr,#(_uip_aligned_buf + 0x002c)
	movx	@dptr,a
;	../../../core/net/uip6.c:2219: UIP_TCP_BUF->seqno[1] = uip_connr->snd_nxt[1];
	mov	a,#0x01
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
	mov	dptr,#(_uip_aligned_buf + 0x002d)
	movx	@dptr,a
;	../../../core/net/uip6.c:2220: UIP_TCP_BUF->seqno[2] = uip_connr->snd_nxt[2];
	mov	a,#0x02
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
	mov	dptr,#(_uip_aligned_buf + 0x002e)
	movx	@dptr,a
;	../../../core/net/uip6.c:2221: UIP_TCP_BUF->seqno[3] = uip_connr->snd_nxt[3];
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
	mov	dptr,#(_uip_aligned_buf + 0x002f)
	movx	@dptr,a
;	../../../core/net/uip6.c:2223: UIP_IP_BUF->proto = UIP_PROTO_TCP;
	mov	dptr,#(_uip_aligned_buf + 0x0006)
	mov	a,#0x06
	movx	@dptr,a
;	../../../core/net/uip6.c:2225: UIP_TCP_BUF->srcport  = uip_connr->lport;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	dptr,#(_uip_aligned_buf + 0x0028)
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2226: UIP_TCP_BUF->destport = uip_connr->rport;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x12
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
	mov	dptr,#(_uip_aligned_buf + 0x002a)
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2228: uip_ipaddr_copy(&UIP_IP_BUF->destipaddr, &uip_connr->ripaddr);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#(_uip_aligned_buf + 0x0018)
	mov	b,#0x00
	mov	r0,#___memcpy
	mov	r1,#(___memcpy >> 8)
	mov	r2,#(___memcpy >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	../../../core/net/uip6.c:2229: uip_ds6_select_src(&UIP_IP_BUF->srcipaddr, &UIP_IP_BUF->destipaddr);
	mov	a,#(_uip_aligned_buf + 0x0018)
	push	acc
	mov	a,#((_uip_aligned_buf + 0x0018) >> 8)
	push	acc
	clr	a
	push	acc
	mov	dptr,#(_uip_aligned_buf + 0x0008)
	mov	b,#0x00
	mov	r0,#_uip_ds6_select_src
	mov	r1,#(_uip_ds6_select_src >> 8)
	mov	r2,#(_uip_ds6_select_src >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/uip6.c:2236: if(uip_connr->tcpstateflags & UIP_STOPPED) {
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	jnb	acc.4,00479$
;	../../../core/net/uip6.c:2239: UIP_TCP_BUF->wnd[0] = UIP_TCP_BUF->wnd[1] = 0;
	mov	dptr,#(_uip_aligned_buf + 0x0037)
	clr	a
	movx	@dptr,a
	mov	dptr,#(_uip_aligned_buf + 0x0036)
	movx	@dptr,a
	sjmp	00481$
00479$:
;	../../../core/net/uip6.c:2241: UIP_TCP_BUF->wnd[0] = ((UIP_RECEIVE_WINDOW) >> 8);
	mov	dptr,#(_uip_aligned_buf + 0x0036)
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:2242: UIP_TCP_BUF->wnd[1] = ((UIP_RECEIVE_WINDOW) & 0xff);
	mov	dptr,#(_uip_aligned_buf + 0x0037)
	mov	a,#0xb4
	movx	@dptr,a
;	../../../core/net/uip6.c:2245: tcp_send_noconn:
00481$:
;	../../../core/net/uip6.c:2246: UIP_IP_BUF->ttl = uip_ds6_if.cur_hop_limit;
	mov	dptr,#(_uip_ds6_if + 0x0004)
	movx	a,@dptr
	mov	dptr,#(_uip_aligned_buf + 0x0007)
	movx	@dptr,a
;	../../../core/net/uip6.c:2247: UIP_IP_BUF->len[0] = ((uip_len - UIP_IPH_LEN) >> 8);
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r6
	add	a,#0xd8
	mov	a,r7
	addc	a,#0xff
	mov	dptr,#(_uip_aligned_buf + 0x0004)
	movx	@dptr,a
;	../../../core/net/uip6.c:2248: UIP_IP_BUF->len[1] = ((uip_len - UIP_IPH_LEN) & 0xff);
	mov	dptr,#_uip_len
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	a,r6
	add	a,#0xd8
	mov	dptr,#(_uip_aligned_buf + 0x0005)
	movx	@dptr,a
;	../../../core/net/uip6.c:2250: UIP_TCP_BUF->urgp[0] = UIP_TCP_BUF->urgp[1] = 0;
	mov	dptr,#(_uip_aligned_buf + 0x003b)
	clr	a
	movx	@dptr,a
	mov	dptr,#(_uip_aligned_buf + 0x003a)
	movx	@dptr,a
;	../../../core/net/uip6.c:2253: UIP_TCP_BUF->tcpchksum = 0;
	mov	dptr,#(_uip_aligned_buf + 0x0038)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2254: UIP_TCP_BUF->tcpchksum = ~(uip_tcpchksum());
	mov	r0,#_uip_tcpchksum
	mov	r1,#(_uip_tcpchksum >> 8)
	mov	r2,#(_uip_tcpchksum >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	a,r6
	cpl	a
	mov	r6,a
	mov	a,r7
	cpl	a
	mov	r7,a
	mov	dptr,#(_uip_aligned_buf + 0x0038)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2259: ip_send_nolen:
00482$:
;	../../../core/net/uip6.c:2261: UIP_IP_BUF->vtc = 0x60;
	mov	dptr,#_uip_aligned_buf
	mov	a,#0x60
	movx	@dptr,a
;	../../../core/net/uip6.c:2262: UIP_IP_BUF->tcflow = 0x00;
	mov	dptr,#(_uip_aligned_buf + 0x0001)
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:2263: UIP_IP_BUF->flow = 0x00;
	mov	dptr,#(_uip_aligned_buf + 0x0002)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2264: send:
00483$:
;	../../../core/net/uip6.c:2270: uip_flags = 0;
	mov	dptr,#_uip_flags
	clr	a
	movx	@dptr,a
;	../../../core/net/uip6.c:2271: return;
;	../../../core/net/uip6.c:2273: drop:
	sjmp	00501$
00484$:
;	../../../core/net/uip6.c:2274: uip_len = 0;
	mov	dptr,#_uip_len
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2275: uip_ext_len = 0;
	mov	dptr,#_uip_ext_len
	movx	@dptr,a
;	../../../core/net/uip6.c:2276: uip_ext_bitmap = 0;
	mov	dptr,#_uip_ext_bitmap
	movx	@dptr,a
;	../../../core/net/uip6.c:2277: uip_flags = 0;
	mov	dptr,#_uip_flags
	movx	@dptr,a
;	../../../core/net/uip6.c:2278: return;
00501$:
;	../../../core/net/uip6.c:2279: }
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_htons'
;------------------------------------------------------------
;val                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/uip6.c:2282: uip_htons(uint16_t val)
;	-----------------------------------------
;	 function uip_htons
;	-----------------------------------------
_uip_htons:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/net/uip6.c:2284: return UIP_HTONS(val);
	mov	ar5,r6
	mov	r4,#0x00
	mov	ar6,r7
	mov	r7,#0x00
	mov	a,r6
	orl	ar4,a
	mov	a,r7
	orl	ar5,a
	mov	dpl,r4
	mov	dph,r5
;	../../../core/net/uip6.c:2285: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_htonl'
;------------------------------------------------------------
;val                       Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/uip6.c:2288: uip_htonl(uint32_t val)
;	-----------------------------------------
;	 function uip_htonl
;	-----------------------------------------
_uip_htonl:
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	../../../core/net/uip6.c:2290: return UIP_HTONL(val);
	mov	ar2,r4
	mov	ar3,r5
	mov	ar1,r2
	mov	r0,#0x00
	mov	ar2,r3
	mov	r3,#0x00
	mov	a,r2
	orl	ar0,a
	mov	a,r3
	orl	ar1,a
	mov	ar2,r1
	mov	ar3,r0
	mov	r0,#0x00
	mov	r1,#0x00
	mov	ar4,r6
	mov	ar5,r7
	mov	ar7,r4
	mov	r6,#0x00
	mov	ar4,r5
	mov	r5,#0x00
	mov	a,r4
	orl	ar6,a
	mov	a,r5
	orl	ar7,a
	clr	a
	mov	r5,a
	mov	r4,a
	mov	a,r6
	orl	ar0,a
	mov	a,r7
	orl	ar1,a
	mov	a,r5
	orl	ar3,a
	mov	a,r4
	orl	ar2,a
	mov	dpl,r0
	mov	dph,r1
	mov	b,r3
	mov	a,r2
;	../../../core/net/uip6.c:2291: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uip_send'
;------------------------------------------------------------
;len                       Allocated to stack - sp -4
;data                      Allocated to registers r5 r6 r7 
;copylen                   Allocated to registers r3 r4 
;------------------------------------------------------------
;	../../../core/net/uip6.c:2294: uip_send(const void *data, int len)
;	-----------------------------------------
;	 function uip_send
;	-----------------------------------------
_uip_send:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/uip6.c:2298: copylen = MIN(len, UIP_BUFSIZE - UIP_LLH_LEN - UIP_TCPIP_HLEN -
	mov	dptr,#_uip_sappdata
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	a,r2
	clr	c
	subb	a,#(_uip_aligned_buf + 0x003c)
	mov	r2,a
	mov	a,r3
	subb	a,#((_uip_aligned_buf + 0x003c) >> 8)
	mov	r3,a
	mov	a,#0xb4
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,r2
	inc	r0
	mov	a,@r0
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	00107$
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	sjmp	00108$
00107$:
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_uip_sappdata
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	a,r2
	clr	c
	subb	a,#(_uip_aligned_buf + 0x003c)
	mov	r2,a
	mov	a,r6
	subb	a,#((_uip_aligned_buf + 0x003c) >> 8)
	mov	r6,a
	mov	a,#0xb4
	clr	c
	subb	a,r2
	mov	r3,a
	clr	a
	subb	a,r6
	mov	r4,a
;	../../../core/net/uip6.c:2303: memcpy(uip_sappdata, (data), uip_slen);
	pop	ar7
	pop	ar6
	pop	ar5
;	../../../core/net/uip6.c:2298: copylen = MIN(len, UIP_BUFSIZE - UIP_LLH_LEN - UIP_TCPIP_HLEN -
00108$:
;	../../../core/net/uip6.c:2300: if(copylen > 0) {
	clr	c
	clr	a
	subb	a,r3
	mov	a,#(0x00 ^ 0x80)
	mov	b,r4
	xrl	b,#0x80
	subb	a,b
	jnc	00105$
;	../../../core/net/uip6.c:2301: uip_slen = copylen;
	mov	dptr,#_uip_slen
	mov	a,r3
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	../../../core/net/uip6.c:2302: if(data != uip_sappdata) {
	mov	dptr,#_uip_sappdata
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
	jz	00105$
;	../../../core/net/uip6.c:2303: memcpy(uip_sappdata, (data), uip_slen);
	mov	dptr,#_uip_sappdata
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_uip_slen
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
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
00105$:
;	../../../core/net/uip6.c:2306: }
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
__xinit__uip_ext_bitmap:
	.db #0x00	; 0
__xinit__uip_ext_len:
	.db #0x00	; 0
__xinit__uip_ext_opt_offset:
	.db #0x00	; 0
	.area CABS    (ABS,CODE)
