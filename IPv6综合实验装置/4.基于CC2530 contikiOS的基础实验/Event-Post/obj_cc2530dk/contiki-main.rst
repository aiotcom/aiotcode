                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.4 #10774 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module contiki_main
                                      6 	.optsdcc -mmcs51 --model-huge
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _SHT2x_Init
                                     13 	.globl _OLED_Init
                                     14 	.globl _printf
                                     15 	.globl _random_init
                                     16 	.globl _puthex
                                     17 	.globl _putstring
                                     18 	.globl _netstack_init
                                     19 	.globl _queuebuf_init
                                     20 	.globl _packetbuf_set_datalen
                                     21 	.globl _packetbuf_dataptr
                                     22 	.globl _packetbuf_clear
                                     23 	.globl _cc2530_rf_set_addr
                                     24 	.globl _uart1_set_input
                                     25 	.globl _uart1_init
                                     26 	.globl _leds_off
                                     27 	.globl _leds_on
                                     28 	.globl _serial_line_init
                                     29 	.globl _serial_line_input_byte
                                     30 	.globl _soc_init
                                     31 	.globl _energest_init
                                     32 	.globl _rtimer_init
                                     33 	.globl _ctimer_init
                                     34 	.globl _etimer_next_expiration_time
                                     35 	.globl _etimer_pending
                                     36 	.globl _etimer_request_poll
                                     37 	.globl _clock_time
                                     38 	.globl _clock_init
                                     39 	.globl _autostart_start
                                     40 	.globl _process_run
                                     41 	.globl _process_init
                                     42 	.globl _process_start
                                     43 	.globl ___memcpy
                                     44 	.globl _watchdog_periodic
                                     45 	.globl _watchdog_start
                                     46 	.globl _watchdog_init
                                     47 	.globl _ACTIVE
                                     48 	.globl _TX_BYTE
                                     49 	.globl _RX_BYTE
                                     50 	.globl _ERR
                                     51 	.globl _FE
                                     52 	.globl _SLAVE
                                     53 	.globl _RE
                                     54 	.globl _MODE
                                     55 	.globl _T3OVFIF
                                     56 	.globl _T3CH0IF
                                     57 	.globl _T3CH1IF
                                     58 	.globl _T4OVFIF
                                     59 	.globl _T4CH0IF
                                     60 	.globl _T4CH1IF
                                     61 	.globl _OVFIM
                                     62 	.globl _B_0
                                     63 	.globl _B_1
                                     64 	.globl _B_2
                                     65 	.globl _B_3
                                     66 	.globl _B_4
                                     67 	.globl _B_5
                                     68 	.globl _B_6
                                     69 	.globl _B_7
                                     70 	.globl _P2IF
                                     71 	.globl _UTX0IF
                                     72 	.globl _UTX1IF
                                     73 	.globl _P1IF
                                     74 	.globl _WDTIF
                                     75 	.globl _ACC_0
                                     76 	.globl _ACC_1
                                     77 	.globl _ACC_2
                                     78 	.globl _ACC_3
                                     79 	.globl _ACC_4
                                     80 	.globl _ACC_5
                                     81 	.globl _ACC_6
                                     82 	.globl _ACC_7
                                     83 	.globl _P
                                     84 	.globl _F1
                                     85 	.globl _OV
                                     86 	.globl _RS0
                                     87 	.globl _RS1
                                     88 	.globl _F0
                                     89 	.globl _AC
                                     90 	.globl _CY
                                     91 	.globl _DMAIF
                                     92 	.globl _T1IF
                                     93 	.globl _T2IF
                                     94 	.globl _T3IF
                                     95 	.globl _T4IF
                                     96 	.globl _P0IF
                                     97 	.globl _STIF
                                     98 	.globl _DMAIE
                                     99 	.globl _T1IE
                                    100 	.globl _T2IE
                                    101 	.globl _T3IE
                                    102 	.globl _T4IE
                                    103 	.globl _P0IE
                                    104 	.globl _RFERRIE
                                    105 	.globl _ADCIE
                                    106 	.globl _URX0IE
                                    107 	.globl _URX1IE
                                    108 	.globl _ENCIE
                                    109 	.globl _STIE
                                    110 	.globl _EA
                                    111 	.globl _P2_0
                                    112 	.globl _P2_1
                                    113 	.globl _P2_2
                                    114 	.globl _P2_3
                                    115 	.globl _P2_4
                                    116 	.globl _P2_5
                                    117 	.globl _P2_6
                                    118 	.globl _P2_7
                                    119 	.globl _ENCIF_0
                                    120 	.globl _ENCIF_1
                                    121 	.globl _P1_0
                                    122 	.globl _P1_1
                                    123 	.globl _P1_2
                                    124 	.globl _P1_3
                                    125 	.globl _P1_4
                                    126 	.globl _P1_5
                                    127 	.globl _P1_6
                                    128 	.globl _P1_7
                                    129 	.globl _IT0
                                    130 	.globl _RFERRIF
                                    131 	.globl _IT1
                                    132 	.globl _URX0IF
                                    133 	.globl _ADCIF
                                    134 	.globl _URX1IF
                                    135 	.globl _P0_0
                                    136 	.globl _P0_1
                                    137 	.globl _P0_2
                                    138 	.globl _P0_3
                                    139 	.globl _P0_4
                                    140 	.globl _P0_5
                                    141 	.globl _P0_6
                                    142 	.globl _P0_7
                                    143 	.globl _WDCTL
                                    144 	.globl _U1GCR
                                    145 	.globl _U1UCR
                                    146 	.globl _U1BAUD
                                    147 	.globl _U1DBUF
                                    148 	.globl _U1CSR
                                    149 	.globl _U0GCR
                                    150 	.globl _U0UCR
                                    151 	.globl _U0BAUD
                                    152 	.globl _U0DBUF
                                    153 	.globl _U0CSR
                                    154 	.globl _TIMIF
                                    155 	.globl _T4CC1
                                    156 	.globl _T4CCTL1
                                    157 	.globl _T4CC0
                                    158 	.globl _T4CCTL0
                                    159 	.globl _T4CTL
                                    160 	.globl _T4CNT
                                    161 	.globl _T3CC1
                                    162 	.globl _T3CCTL1
                                    163 	.globl _T3CC0
                                    164 	.globl _T3CCTL0
                                    165 	.globl _T3CTL
                                    166 	.globl _T3CNT
                                    167 	.globl _T2MSEL
                                    168 	.globl _T2IRQM
                                    169 	.globl _T2MOVF2
                                    170 	.globl _T2MOVF1
                                    171 	.globl _T2MOVF0
                                    172 	.globl _T2M1
                                    173 	.globl _T2M0
                                    174 	.globl _T2IRQF
                                    175 	.globl _T2EVTCFG
                                    176 	.globl _T2CTRL
                                    177 	.globl _T1STAT
                                    178 	.globl _T1CCTL2
                                    179 	.globl _T1CCTL1
                                    180 	.globl _T1CCTL0
                                    181 	.globl _T1CTL
                                    182 	.globl _T1CNTH
                                    183 	.globl _T1CNTL
                                    184 	.globl _T1CC2H
                                    185 	.globl _T1CC2L
                                    186 	.globl _T1CC1H
                                    187 	.globl _T1CC1L
                                    188 	.globl _T1CC0H
                                    189 	.globl _T1CC0L
                                    190 	.globl _CLKCONSTA
                                    191 	.globl _CLKCONCMD
                                    192 	.globl _SLEEPSTA
                                    193 	.globl _SLEEPCMD
                                    194 	.globl _STLOAD
                                    195 	.globl _ST2
                                    196 	.globl _ST1
                                    197 	.globl _ST0
                                    198 	.globl _RFERRF
                                    199 	.globl _RFIRQF0
                                    200 	.globl _RFST
                                    201 	.globl _RFD
                                    202 	.globl _RFIRQF1
                                    203 	.globl _PSBANK
                                    204 	.globl _FMAP
                                    205 	.globl _MEMCTR
                                    206 	.globl __XPAGE
                                    207 	.globl _MPAGE
                                    208 	.globl _PMUX
                                    209 	.globl _P2DIR
                                    210 	.globl _P1DIR
                                    211 	.globl _P0DIR
                                    212 	.globl _P2INP
                                    213 	.globl _P1INP
                                    214 	.globl _P2SEL
                                    215 	.globl _P1SEL
                                    216 	.globl _P0SEL
                                    217 	.globl _APCFG
                                    218 	.globl _PERCFG
                                    219 	.globl _P0INP
                                    220 	.globl _P2IEN
                                    221 	.globl _P1IEN
                                    222 	.globl _P0IEN
                                    223 	.globl _PICTL
                                    224 	.globl _P2IFG
                                    225 	.globl _P1IFG
                                    226 	.globl _P0IFG
                                    227 	.globl _DMAREQ
                                    228 	.globl _DMAARM
                                    229 	.globl _DMA0CFGH
                                    230 	.globl _DMA0CFGL
                                    231 	.globl _DMA1CFGH
                                    232 	.globl _DMA1CFGL
                                    233 	.globl _DMAIRQ
                                    234 	.globl _ENCCS
                                    235 	.globl _ENCDO
                                    236 	.globl _ENCDI
                                    237 	.globl _RNDH
                                    238 	.globl _RNDL
                                    239 	.globl _ADCH
                                    240 	.globl _ADCL
                                    241 	.globl _ADCCON3
                                    242 	.globl _ADCCON2
                                    243 	.globl _ADCCON1
                                    244 	.globl _B
                                    245 	.globl _IRCON2
                                    246 	.globl _ACC
                                    247 	.globl _PSW
                                    248 	.globl _IRCON
                                    249 	.globl _IP1
                                    250 	.globl _IEN1
                                    251 	.globl _IP0
                                    252 	.globl _IEN0
                                    253 	.globl _P2
                                    254 	.globl _S1CON
                                    255 	.globl _IEN2
                                    256 	.globl _S0CON
                                    257 	.globl _DPS
                                    258 	.globl _P1
                                    259 	.globl _TCON
                                    260 	.globl _PCON
                                    261 	.globl _DPH1
                                    262 	.globl _DPL1
                                    263 	.globl _DPH0
                                    264 	.globl _DPL0
                                    265 	.globl _SP
                                    266 	.globl _P0
                                    267 	.globl _X_IEEE_ADDR
                                    268 	.globl _X_INFOPAGE
                                    269 	.globl _X_P2DIR
                                    270 	.globl _X_P1DIR
                                    271 	.globl _X_P0DIR
                                    272 	.globl _X_U1GCR
                                    273 	.globl _X_U1UCR
                                    274 	.globl _X_U1BAUD
                                    275 	.globl _X_U1DBUF
                                    276 	.globl _X_U1CSR
                                    277 	.globl _X_P2INP
                                    278 	.globl _X_P1INP
                                    279 	.globl _X_P2SEL
                                    280 	.globl _X_P1SEL
                                    281 	.globl _X_P0SEL
                                    282 	.globl _X_APCFG
                                    283 	.globl _X_PERCFG
                                    284 	.globl _X_T4CC1
                                    285 	.globl _X_T4CCTL1
                                    286 	.globl _X_T4CC0
                                    287 	.globl _X_T4CCTL0
                                    288 	.globl _X_T4CTL
                                    289 	.globl _X_T4CNT
                                    290 	.globl _X_RFIRQF0
                                    291 	.globl _X_T1CCTL2
                                    292 	.globl _X_T1CCTL1
                                    293 	.globl _X_T1CCTL0
                                    294 	.globl _X_T1CTL
                                    295 	.globl _X_T1CNTH
                                    296 	.globl _X_T1CNTL
                                    297 	.globl _X_RFST
                                    298 	.globl _X_T1CC2H
                                    299 	.globl _X_T1CC2L
                                    300 	.globl _X_T1CC1H
                                    301 	.globl _X_T1CC1L
                                    302 	.globl _X_T1CC0H
                                    303 	.globl _X_T1CC0L
                                    304 	.globl _X_RFD
                                    305 	.globl _X_TIMIF
                                    306 	.globl _X_DMAREQ
                                    307 	.globl _X_DMAARM
                                    308 	.globl _X_DMA0CFGH
                                    309 	.globl _X_DMA0CFGL
                                    310 	.globl _X_DMA1CFGH
                                    311 	.globl _X_DMA1CFGL
                                    312 	.globl _X_DMAIRQ
                                    313 	.globl _X_T3CC1
                                    314 	.globl _X_T3CCTL1
                                    315 	.globl _X_T3CC0
                                    316 	.globl _X_T3CCTL0
                                    317 	.globl _X_T3CTL
                                    318 	.globl _X_T3CNT
                                    319 	.globl _X_WDCTL
                                    320 	.globl _X_MEMCTR
                                    321 	.globl _X_CLKCONCMD
                                    322 	.globl _X_U0GCR
                                    323 	.globl _X_U0UCR
                                    324 	.globl _X_T2MSEL
                                    325 	.globl _X_U0BAUD
                                    326 	.globl _X_U0DBUF
                                    327 	.globl _X_RFERRF
                                    328 	.globl _X_SLEEPCMD
                                    329 	.globl _X_RNDH
                                    330 	.globl _X_RNDL
                                    331 	.globl _X_ADCH
                                    332 	.globl _X_ADCL
                                    333 	.globl _X_ADCCON3
                                    334 	.globl _X_ADCCON2
                                    335 	.globl _X_ADCCON1
                                    336 	.globl _X_ENCCS
                                    337 	.globl _X_ENCDO
                                    338 	.globl _X_ENCDI
                                    339 	.globl _X_T1STAT
                                    340 	.globl _X_PMUX
                                    341 	.globl _X_STLOAD
                                    342 	.globl _X_P2IEN
                                    343 	.globl _X_P0IEN
                                    344 	.globl _X_T2IRQM
                                    345 	.globl _X_T2MOVF2
                                    346 	.globl _X_T2MOVF1
                                    347 	.globl _X_T2MOVF0
                                    348 	.globl _X_T2M1
                                    349 	.globl _X_T2M0
                                    350 	.globl _X_T2IRQF
                                    351 	.globl _X_P2
                                    352 	.globl _X_PSBANK
                                    353 	.globl _X_FMAP
                                    354 	.globl _X_CLKCONSTA
                                    355 	.globl _X_SLEEPSTA
                                    356 	.globl _X_T2EVTCFG
                                    357 	.globl _X_ST2
                                    358 	.globl _X_ST1
                                    359 	.globl _X_ST0
                                    360 	.globl _X_T2CTRL
                                    361 	.globl _X__XPAGE
                                    362 	.globl _X_MPAGE
                                    363 	.globl _X_RFIRQF1
                                    364 	.globl _X_P1
                                    365 	.globl _X_P0INP
                                    366 	.globl _X_P1IEN
                                    367 	.globl _X_PICTL
                                    368 	.globl _X_P2IFG
                                    369 	.globl _X_P1IFG
                                    370 	.globl _X_P0IFG
                                    371 	.globl _X_U0CSR
                                    372 	.globl _X_P0
                                    373 	.globl _USBF5
                                    374 	.globl _USBF4
                                    375 	.globl _USBF3
                                    376 	.globl _USBF2
                                    377 	.globl _USBF1
                                    378 	.globl _USBF0
                                    379 	.globl _USBCNTH
                                    380 	.globl _USBCNTL
                                    381 	.globl _USBCNT0
                                    382 	.globl _USBCSOH
                                    383 	.globl _USBCSOL
                                    384 	.globl _USBMAXO
                                    385 	.globl _USBCSIH
                                    386 	.globl _USBCSIL
                                    387 	.globl _USBCS0
                                    388 	.globl _USBMAXI
                                    389 	.globl _USBCTRL
                                    390 	.globl _USBINDEX
                                    391 	.globl _USBFRMH
                                    392 	.globl _USBFRML
                                    393 	.globl _USBCIE
                                    394 	.globl _USBOIE
                                    395 	.globl _USBIIE
                                    396 	.globl _USBCIF
                                    397 	.globl _USBOIF
                                    398 	.globl _USBIIF
                                    399 	.globl _USBPOW
                                    400 	.globl _USBADDR
                                    401 	.globl _CSPT
                                    402 	.globl _CSPZ
                                    403 	.globl _CSPY
                                    404 	.globl _CSPX
                                    405 	.globl _CSPSTAT
                                    406 	.globl _CSPCTRL
                                    407 	.globl _CSPPROG23
                                    408 	.globl _CSPPROG22
                                    409 	.globl _CSPPROG21
                                    410 	.globl _CSPPROG20
                                    411 	.globl _CSPPROG19
                                    412 	.globl _CSPPROG18
                                    413 	.globl _CSPPROG17
                                    414 	.globl _CSPPROG16
                                    415 	.globl _CSPPROG15
                                    416 	.globl _CSPPROG14
                                    417 	.globl _CSPPROG13
                                    418 	.globl _CSPPROG12
                                    419 	.globl _CSPPROG11
                                    420 	.globl _CSPPROG10
                                    421 	.globl _CSPPROG9
                                    422 	.globl _CSPPROG8
                                    423 	.globl _CSPPROG7
                                    424 	.globl _CSPPROG6
                                    425 	.globl _CSPPROG5
                                    426 	.globl _CSPPROG4
                                    427 	.globl _CSPPROG3
                                    428 	.globl _CSPPROG2
                                    429 	.globl _CSPPROG1
                                    430 	.globl _CSPPROG0
                                    431 	.globl _RFC_OBS_CTRL2
                                    432 	.globl _RFC_OBS_CTRL1
                                    433 	.globl _RFC_OBS_CTRL0
                                    434 	.globl _TXFILTCFG
                                    435 	.globl _PTEST1
                                    436 	.globl _PTEST0
                                    437 	.globl _ATEST
                                    438 	.globl _DACTEST2
                                    439 	.globl _DACTEST1
                                    440 	.globl _DACTEST0
                                    441 	.globl _MDMTEST1
                                    442 	.globl _MDMTEST0
                                    443 	.globl _ADCTEST2
                                    444 	.globl _ADCTEST1
                                    445 	.globl _ADCTEST0
                                    446 	.globl _AGCCTRL3
                                    447 	.globl _AGCCTRL2
                                    448 	.globl _AGCCTRL1
                                    449 	.globl _AGCCTRL0
                                    450 	.globl _FSCAL3
                                    451 	.globl _FSCAL2
                                    452 	.globl _FSCAL1
                                    453 	.globl _FSCAL0
                                    454 	.globl _FSCTRL
                                    455 	.globl _RXCTRL
                                    456 	.globl _FREQEST
                                    457 	.globl _MDMCTRL1
                                    458 	.globl _MDMCTRL0
                                    459 	.globl _RFRND
                                    460 	.globl _RFERRM
                                    461 	.globl _RFIRQM1
                                    462 	.globl _RFIRQM0
                                    463 	.globl _TXLAST_PTR
                                    464 	.globl _TXFIRST_PTR
                                    465 	.globl _RXP1_PTR
                                    466 	.globl _RXLAST_PTR
                                    467 	.globl _RXFIRST_PTR
                                    468 	.globl _TXFIFOCNT
                                    469 	.globl _RXFIFOCNT
                                    470 	.globl _RXFIRST
                                    471 	.globl _RSSISTAT
                                    472 	.globl _RSSI
                                    473 	.globl _CCACTRL1
                                    474 	.globl _CCACTRL0
                                    475 	.globl _FSMCTRL
                                    476 	.globl _FIFOPCTRL
                                    477 	.globl _FSMSTAT1
                                    478 	.globl _FSMSTAT0
                                    479 	.globl _TXCTRL
                                    480 	.globl _TXPOWER
                                    481 	.globl _FREQCTRL
                                    482 	.globl _FREQTUNE
                                    483 	.globl _RXMASKCLR
                                    484 	.globl _RXMASKSET
                                    485 	.globl _RXENABLE
                                    486 	.globl _FRMCTRL1
                                    487 	.globl _FRMCTRL0
                                    488 	.globl _SRCEXTEN2
                                    489 	.globl _SRCEXTEN1
                                    490 	.globl _SRCEXTEN0
                                    491 	.globl _SRCSHORTEN2
                                    492 	.globl _SRCSHORTEN1
                                    493 	.globl _SRCSHORTEN0
                                    494 	.globl _SRCMATCH
                                    495 	.globl _FRMFILT1
                                    496 	.globl _FRMFILT0
                                    497 	.globl _SHORT_ADDR1
                                    498 	.globl _SHORT_ADDR0
                                    499 	.globl _PAN_ID1
                                    500 	.globl _PAN_ID0
                                    501 	.globl _EXT_ADDR7
                                    502 	.globl _EXT_ADDR6
                                    503 	.globl _EXT_ADDR5
                                    504 	.globl _EXT_ADDR4
                                    505 	.globl _EXT_ADDR3
                                    506 	.globl _EXT_ADDR2
                                    507 	.globl _EXT_ADDR1
                                    508 	.globl _EXT_ADDR0
                                    509 	.globl _SRCSHORTPENDEN2
                                    510 	.globl _SRCSHORTPENDEN1
                                    511 	.globl _SRCSHORTPENDEN0
                                    512 	.globl _SRCEXTPENDEN2
                                    513 	.globl _SRCEXTPENDEN1
                                    514 	.globl _SRCEXTPENDEN0
                                    515 	.globl _SRCRESINDEX
                                    516 	.globl _SRCRESMASK2
                                    517 	.globl _SRCRESMASK1
                                    518 	.globl _SRCRESMASK0
                                    519 	.globl _SRC_ADDR_TABLE
                                    520 	.globl _TXFIFO
                                    521 	.globl _RXFIFO
                                    522 	.globl _RFCORE_RAM
                                    523 	.globl _CMPCTL
                                    524 	.globl _OPAMPS
                                    525 	.globl _OPAMPC
                                    526 	.globl _STCV2
                                    527 	.globl _STCV1
                                    528 	.globl _STCV0
                                    529 	.globl _STCS
                                    530 	.globl _STCC
                                    531 	.globl _T1CC4H
                                    532 	.globl _T1CC4L
                                    533 	.globl _T1CC3H
                                    534 	.globl _T1CC3L
                                    535 	.globl _XX_T1CC2H
                                    536 	.globl _XX_T1CC2L
                                    537 	.globl _XX_T1CC1H
                                    538 	.globl _XX_T1CC1L
                                    539 	.globl _XX_T1CC0H
                                    540 	.globl _XX_T1CC0L
                                    541 	.globl _T1CCTL4
                                    542 	.globl _T1CCTL3
                                    543 	.globl _XX_T1CCTL2
                                    544 	.globl _XX_T1CCTL1
                                    545 	.globl _XX_T1CCTL0
                                    546 	.globl _CLD
                                    547 	.globl _IRCTL
                                    548 	.globl _CHIPINFO1
                                    549 	.globl _CHIPINFO0
                                    550 	.globl _FWDATA
                                    551 	.globl _FADDRH
                                    552 	.globl _FADDRL
                                    553 	.globl _FCTL
                                    554 	.globl _IVCTRL
                                    555 	.globl _BATTMON
                                    556 	.globl _SRCRC
                                    557 	.globl _DBGDATA
                                    558 	.globl _TESTREG0
                                    559 	.globl _CHIPID
                                    560 	.globl _CHVER
                                    561 	.globl _OBSSEL5
                                    562 	.globl _OBSSEL4
                                    563 	.globl _OBSSEL3
                                    564 	.globl _OBSSEL2
                                    565 	.globl _OBSSEL1
                                    566 	.globl _OBSSEL0
                                    567 	.globl _I2CIO
                                    568 	.globl _I2CWC
                                    569 	.globl _I2CADDR
                                    570 	.globl _I2CDATA
                                    571 	.globl _I2CSTAT
                                    572 	.globl _I2CCFG
                                    573 	.globl _OPAMPMC
                                    574 	.globl _MONMUX
                                    575 ;--------------------------------------------------------
                                    576 ; special function registers
                                    577 ;--------------------------------------------------------
                                    578 	.area RSEG    (ABS,DATA)
      000000                        579 	.org 0x0000
                           000080   580 _P0	=	0x0080
                           000081   581 _SP	=	0x0081
                           000082   582 _DPL0	=	0x0082
                           000083   583 _DPH0	=	0x0083
                           000084   584 _DPL1	=	0x0084
                           000085   585 _DPH1	=	0x0085
                           000087   586 _PCON	=	0x0087
                           000088   587 _TCON	=	0x0088
                           000090   588 _P1	=	0x0090
                           000092   589 _DPS	=	0x0092
                           000098   590 _S0CON	=	0x0098
                           00009A   591 _IEN2	=	0x009a
                           00009B   592 _S1CON	=	0x009b
                           0000A0   593 _P2	=	0x00a0
                           0000A8   594 _IEN0	=	0x00a8
                           0000A9   595 _IP0	=	0x00a9
                           0000B8   596 _IEN1	=	0x00b8
                           0000B9   597 _IP1	=	0x00b9
                           0000C0   598 _IRCON	=	0x00c0
                           0000D0   599 _PSW	=	0x00d0
                           0000E0   600 _ACC	=	0x00e0
                           0000E8   601 _IRCON2	=	0x00e8
                           0000F0   602 _B	=	0x00f0
                           0000B4   603 _ADCCON1	=	0x00b4
                           0000B5   604 _ADCCON2	=	0x00b5
                           0000B6   605 _ADCCON3	=	0x00b6
                           0000BA   606 _ADCL	=	0x00ba
                           0000BB   607 _ADCH	=	0x00bb
                           0000BC   608 _RNDL	=	0x00bc
                           0000BD   609 _RNDH	=	0x00bd
                           0000B1   610 _ENCDI	=	0x00b1
                           0000B2   611 _ENCDO	=	0x00b2
                           0000B3   612 _ENCCS	=	0x00b3
                           0000D1   613 _DMAIRQ	=	0x00d1
                           0000D2   614 _DMA1CFGL	=	0x00d2
                           0000D3   615 _DMA1CFGH	=	0x00d3
                           0000D4   616 _DMA0CFGL	=	0x00d4
                           0000D5   617 _DMA0CFGH	=	0x00d5
                           0000D6   618 _DMAARM	=	0x00d6
                           0000D7   619 _DMAREQ	=	0x00d7
                           000089   620 _P0IFG	=	0x0089
                           00008A   621 _P1IFG	=	0x008a
                           00008B   622 _P2IFG	=	0x008b
                           00008C   623 _PICTL	=	0x008c
                           0000AB   624 _P0IEN	=	0x00ab
                           00008D   625 _P1IEN	=	0x008d
                           0000AC   626 _P2IEN	=	0x00ac
                           00008F   627 _P0INP	=	0x008f
                           0000F1   628 _PERCFG	=	0x00f1
                           0000F2   629 _APCFG	=	0x00f2
                           0000F3   630 _P0SEL	=	0x00f3
                           0000F4   631 _P1SEL	=	0x00f4
                           0000F5   632 _P2SEL	=	0x00f5
                           0000F6   633 _P1INP	=	0x00f6
                           0000F7   634 _P2INP	=	0x00f7
                           0000FD   635 _P0DIR	=	0x00fd
                           0000FE   636 _P1DIR	=	0x00fe
                           0000FF   637 _P2DIR	=	0x00ff
                           0000AE   638 _PMUX	=	0x00ae
                           000093   639 _MPAGE	=	0x0093
                           000093   640 __XPAGE	=	0x0093
                           0000C7   641 _MEMCTR	=	0x00c7
                           00009F   642 _FMAP	=	0x009f
                           00009F   643 _PSBANK	=	0x009f
                           000091   644 _RFIRQF1	=	0x0091
                           0000D9   645 _RFD	=	0x00d9
                           0000E1   646 _RFST	=	0x00e1
                           0000E9   647 _RFIRQF0	=	0x00e9
                           0000BF   648 _RFERRF	=	0x00bf
                           000095   649 _ST0	=	0x0095
                           000096   650 _ST1	=	0x0096
                           000097   651 _ST2	=	0x0097
                           0000AD   652 _STLOAD	=	0x00ad
                           0000BE   653 _SLEEPCMD	=	0x00be
                           00009D   654 _SLEEPSTA	=	0x009d
                           0000C6   655 _CLKCONCMD	=	0x00c6
                           00009E   656 _CLKCONSTA	=	0x009e
                           0000DA   657 _T1CC0L	=	0x00da
                           0000DB   658 _T1CC0H	=	0x00db
                           0000DC   659 _T1CC1L	=	0x00dc
                           0000DD   660 _T1CC1H	=	0x00dd
                           0000DE   661 _T1CC2L	=	0x00de
                           0000DF   662 _T1CC2H	=	0x00df
                           0000E2   663 _T1CNTL	=	0x00e2
                           0000E3   664 _T1CNTH	=	0x00e3
                           0000E4   665 _T1CTL	=	0x00e4
                           0000E5   666 _T1CCTL0	=	0x00e5
                           0000E6   667 _T1CCTL1	=	0x00e6
                           0000E7   668 _T1CCTL2	=	0x00e7
                           0000AF   669 _T1STAT	=	0x00af
                           000094   670 _T2CTRL	=	0x0094
                           00009C   671 _T2EVTCFG	=	0x009c
                           0000A1   672 _T2IRQF	=	0x00a1
                           0000A2   673 _T2M0	=	0x00a2
                           0000A3   674 _T2M1	=	0x00a3
                           0000A4   675 _T2MOVF0	=	0x00a4
                           0000A5   676 _T2MOVF1	=	0x00a5
                           0000A6   677 _T2MOVF2	=	0x00a6
                           0000A7   678 _T2IRQM	=	0x00a7
                           0000C3   679 _T2MSEL	=	0x00c3
                           0000CA   680 _T3CNT	=	0x00ca
                           0000CB   681 _T3CTL	=	0x00cb
                           0000CC   682 _T3CCTL0	=	0x00cc
                           0000CD   683 _T3CC0	=	0x00cd
                           0000CE   684 _T3CCTL1	=	0x00ce
                           0000CF   685 _T3CC1	=	0x00cf
                           0000EA   686 _T4CNT	=	0x00ea
                           0000EB   687 _T4CTL	=	0x00eb
                           0000EC   688 _T4CCTL0	=	0x00ec
                           0000ED   689 _T4CC0	=	0x00ed
                           0000EE   690 _T4CCTL1	=	0x00ee
                           0000EF   691 _T4CC1	=	0x00ef
                           0000D8   692 _TIMIF	=	0x00d8
                           000086   693 _U0CSR	=	0x0086
                           0000C1   694 _U0DBUF	=	0x00c1
                           0000C2   695 _U0BAUD	=	0x00c2
                           0000C4   696 _U0UCR	=	0x00c4
                           0000C5   697 _U0GCR	=	0x00c5
                           0000F8   698 _U1CSR	=	0x00f8
                           0000F9   699 _U1DBUF	=	0x00f9
                           0000FA   700 _U1BAUD	=	0x00fa
                           0000FB   701 _U1UCR	=	0x00fb
                           0000FC   702 _U1GCR	=	0x00fc
                           0000C9   703 _WDCTL	=	0x00c9
                                    704 ;--------------------------------------------------------
                                    705 ; special function bits
                                    706 ;--------------------------------------------------------
                                    707 	.area RSEG    (ABS,DATA)
      000000                        708 	.org 0x0000
                           000087   709 _P0_7	=	0x0087
                           000086   710 _P0_6	=	0x0086
                           000085   711 _P0_5	=	0x0085
                           000084   712 _P0_4	=	0x0084
                           000083   713 _P0_3	=	0x0083
                           000082   714 _P0_2	=	0x0082
                           000081   715 _P0_1	=	0x0081
                           000080   716 _P0_0	=	0x0080
                           00008F   717 _URX1IF	=	0x008f
                           00008D   718 _ADCIF	=	0x008d
                           00008B   719 _URX0IF	=	0x008b
                           00008A   720 _IT1	=	0x008a
                           000089   721 _RFERRIF	=	0x0089
                           000088   722 _IT0	=	0x0088
                           000097   723 _P1_7	=	0x0097
                           000096   724 _P1_6	=	0x0096
                           000095   725 _P1_5	=	0x0095
                           000094   726 _P1_4	=	0x0094
                           000093   727 _P1_3	=	0x0093
                           000092   728 _P1_2	=	0x0092
                           000091   729 _P1_1	=	0x0091
                           000090   730 _P1_0	=	0x0090
                           000099   731 _ENCIF_1	=	0x0099
                           000098   732 _ENCIF_0	=	0x0098
                           0000A7   733 _P2_7	=	0x00a7
                           0000A6   734 _P2_6	=	0x00a6
                           0000A5   735 _P2_5	=	0x00a5
                           0000A4   736 _P2_4	=	0x00a4
                           0000A3   737 _P2_3	=	0x00a3
                           0000A2   738 _P2_2	=	0x00a2
                           0000A1   739 _P2_1	=	0x00a1
                           0000A0   740 _P2_0	=	0x00a0
                           0000AF   741 _EA	=	0x00af
                           0000AD   742 _STIE	=	0x00ad
                           0000AC   743 _ENCIE	=	0x00ac
                           0000AB   744 _URX1IE	=	0x00ab
                           0000AA   745 _URX0IE	=	0x00aa
                           0000A9   746 _ADCIE	=	0x00a9
                           0000A8   747 _RFERRIE	=	0x00a8
                           0000BD   748 _P0IE	=	0x00bd
                           0000BC   749 _T4IE	=	0x00bc
                           0000BB   750 _T3IE	=	0x00bb
                           0000BA   751 _T2IE	=	0x00ba
                           0000B9   752 _T1IE	=	0x00b9
                           0000B8   753 _DMAIE	=	0x00b8
                           0000C7   754 _STIF	=	0x00c7
                           0000C5   755 _P0IF	=	0x00c5
                           0000C4   756 _T4IF	=	0x00c4
                           0000C3   757 _T3IF	=	0x00c3
                           0000C2   758 _T2IF	=	0x00c2
                           0000C1   759 _T1IF	=	0x00c1
                           0000C0   760 _DMAIF	=	0x00c0
                           0000D7   761 _CY	=	0x00d7
                           0000D6   762 _AC	=	0x00d6
                           0000D5   763 _F0	=	0x00d5
                           0000D4   764 _RS1	=	0x00d4
                           0000D3   765 _RS0	=	0x00d3
                           0000D2   766 _OV	=	0x00d2
                           0000D1   767 _F1	=	0x00d1
                           0000D0   768 _P	=	0x00d0
                           0000E7   769 _ACC_7	=	0x00e7
                           0000E6   770 _ACC_6	=	0x00e6
                           0000E5   771 _ACC_5	=	0x00e5
                           0000E4   772 _ACC_4	=	0x00e4
                           0000E3   773 _ACC_3	=	0x00e3
                           0000E2   774 _ACC_2	=	0x00e2
                           0000E1   775 _ACC_1	=	0x00e1
                           0000E0   776 _ACC_0	=	0x00e0
                           0000EC   777 _WDTIF	=	0x00ec
                           0000EB   778 _P1IF	=	0x00eb
                           0000EA   779 _UTX1IF	=	0x00ea
                           0000E9   780 _UTX0IF	=	0x00e9
                           0000E8   781 _P2IF	=	0x00e8
                           0000F7   782 _B_7	=	0x00f7
                           0000F6   783 _B_6	=	0x00f6
                           0000F5   784 _B_5	=	0x00f5
                           0000F4   785 _B_4	=	0x00f4
                           0000F3   786 _B_3	=	0x00f3
                           0000F2   787 _B_2	=	0x00f2
                           0000F1   788 _B_1	=	0x00f1
                           0000F0   789 _B_0	=	0x00f0
                           0000DE   790 _OVFIM	=	0x00de
                           0000DD   791 _T4CH1IF	=	0x00dd
                           0000DC   792 _T4CH0IF	=	0x00dc
                           0000DB   793 _T4OVFIF	=	0x00db
                           0000DA   794 _T3CH1IF	=	0x00da
                           0000D9   795 _T3CH0IF	=	0x00d9
                           0000D8   796 _T3OVFIF	=	0x00d8
                           0000FF   797 _MODE	=	0x00ff
                           0000FE   798 _RE	=	0x00fe
                           0000FD   799 _SLAVE	=	0x00fd
                           0000FC   800 _FE	=	0x00fc
                           0000FB   801 _ERR	=	0x00fb
                           0000FA   802 _RX_BYTE	=	0x00fa
                           0000F9   803 _TX_BYTE	=	0x00f9
                           0000F8   804 _ACTIVE	=	0x00f8
                                    805 ;--------------------------------------------------------
                                    806 ; overlayable register banks
                                    807 ;--------------------------------------------------------
                                    808 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        809 	.ds 8
                                    810 ;--------------------------------------------------------
                                    811 ; internal ram data
                                    812 ;--------------------------------------------------------
                                    813 	.area DSEG    (DATA)
      000008                        814 _len:
      000008                        815 	.ds 2
                                    816 ;--------------------------------------------------------
                                    817 ; overlayable items in internal ram 
                                    818 ;--------------------------------------------------------
                                    819 ;--------------------------------------------------------
                                    820 ; Stack segment in internal ram 
                                    821 ;--------------------------------------------------------
                                    822 	.area	SSEG
      000021                        823 __start__stack:
      000021                        824 	.ds	1
                                    825 
                                    826 ;--------------------------------------------------------
                                    827 ; indirectly addressable internal ram data
                                    828 ;--------------------------------------------------------
                                    829 	.area ISEG    (DATA)
                                    830 ;--------------------------------------------------------
                                    831 ; absolute internal ram data
                                    832 ;--------------------------------------------------------
                                    833 	.area IABS    (ABS,DATA)
                                    834 	.area IABS    (ABS,DATA)
                                    835 ;--------------------------------------------------------
                                    836 ; bit data
                                    837 ;--------------------------------------------------------
                                    838 	.area BSEG    (BIT)
                                    839 ;--------------------------------------------------------
                                    840 ; paged external ram data
                                    841 ;--------------------------------------------------------
                                    842 	.area PSEG    (PAG,XDATA)
                                    843 ;--------------------------------------------------------
                                    844 ; external ram data
                                    845 ;--------------------------------------------------------
                                    846 	.area XSEG    (XDATA)
                           0061A6   847 _MONMUX	=	0x61a6
                           0061A6   848 _OPAMPMC	=	0x61a6
                           006230   849 _I2CCFG	=	0x6230
                           006231   850 _I2CSTAT	=	0x6231
                           006232   851 _I2CDATA	=	0x6232
                           006233   852 _I2CADDR	=	0x6233
                           006234   853 _I2CWC	=	0x6234
                           006235   854 _I2CIO	=	0x6235
                           006243   855 _OBSSEL0	=	0x6243
                           006244   856 _OBSSEL1	=	0x6244
                           006245   857 _OBSSEL2	=	0x6245
                           006246   858 _OBSSEL3	=	0x6246
                           006247   859 _OBSSEL4	=	0x6247
                           006248   860 _OBSSEL5	=	0x6248
                           006249   861 _CHVER	=	0x6249
                           00624A   862 _CHIPID	=	0x624a
                           00624B   863 _TESTREG0	=	0x624b
                           006260   864 _DBGDATA	=	0x6260
                           006262   865 _SRCRC	=	0x6262
                           006264   866 _BATTMON	=	0x6264
                           006265   867 _IVCTRL	=	0x6265
                           006270   868 _FCTL	=	0x6270
                           006271   869 _FADDRL	=	0x6271
                           006272   870 _FADDRH	=	0x6272
                           006273   871 _FWDATA	=	0x6273
                           006276   872 _CHIPINFO0	=	0x6276
                           006277   873 _CHIPINFO1	=	0x6277
                           006281   874 _IRCTL	=	0x6281
                           006290   875 _CLD	=	0x6290
                           0062A0   876 _XX_T1CCTL0	=	0x62a0
                           0062A1   877 _XX_T1CCTL1	=	0x62a1
                           0062A2   878 _XX_T1CCTL2	=	0x62a2
                           0062A3   879 _T1CCTL3	=	0x62a3
                           0062A4   880 _T1CCTL4	=	0x62a4
                           0062A6   881 _XX_T1CC0L	=	0x62a6
                           0062A7   882 _XX_T1CC0H	=	0x62a7
                           0062A8   883 _XX_T1CC1L	=	0x62a8
                           0062A9   884 _XX_T1CC1H	=	0x62a9
                           0062AA   885 _XX_T1CC2L	=	0x62aa
                           0062AB   886 _XX_T1CC2H	=	0x62ab
                           0062AC   887 _T1CC3L	=	0x62ac
                           0062AD   888 _T1CC3H	=	0x62ad
                           0062AE   889 _T1CC4L	=	0x62ae
                           0062AF   890 _T1CC4H	=	0x62af
                           0062B0   891 _STCC	=	0x62b0
                           0062B1   892 _STCS	=	0x62b1
                           0062B2   893 _STCV0	=	0x62b2
                           0062B3   894 _STCV1	=	0x62b3
                           0062B4   895 _STCV2	=	0x62b4
                           0062C0   896 _OPAMPC	=	0x62c0
                           0062C1   897 _OPAMPS	=	0x62c1
                           0062D0   898 _CMPCTL	=	0x62d0
                           006000   899 _RFCORE_RAM	=	0x6000
                           006000   900 _RXFIFO	=	0x6000
                           006080   901 _TXFIFO	=	0x6080
                           006100   902 _SRC_ADDR_TABLE	=	0x6100
                           006160   903 _SRCRESMASK0	=	0x6160
                           006161   904 _SRCRESMASK1	=	0x6161
                           006162   905 _SRCRESMASK2	=	0x6162
                           006163   906 _SRCRESINDEX	=	0x6163
                           006164   907 _SRCEXTPENDEN0	=	0x6164
                           006165   908 _SRCEXTPENDEN1	=	0x6165
                           006166   909 _SRCEXTPENDEN2	=	0x6166
                           006167   910 _SRCSHORTPENDEN0	=	0x6167
                           006168   911 _SRCSHORTPENDEN1	=	0x6168
                           006169   912 _SRCSHORTPENDEN2	=	0x6169
                           00616A   913 _EXT_ADDR0	=	0x616a
                           00616B   914 _EXT_ADDR1	=	0x616b
                           00616C   915 _EXT_ADDR2	=	0x616c
                           00616D   916 _EXT_ADDR3	=	0x616d
                           00616E   917 _EXT_ADDR4	=	0x616e
                           00616F   918 _EXT_ADDR5	=	0x616f
                           006170   919 _EXT_ADDR6	=	0x6170
                           006171   920 _EXT_ADDR7	=	0x6171
                           006172   921 _PAN_ID0	=	0x6172
                           006173   922 _PAN_ID1	=	0x6173
                           006174   923 _SHORT_ADDR0	=	0x6174
                           006175   924 _SHORT_ADDR1	=	0x6175
                           006180   925 _FRMFILT0	=	0x6180
                           006181   926 _FRMFILT1	=	0x6181
                           006182   927 _SRCMATCH	=	0x6182
                           006183   928 _SRCSHORTEN0	=	0x6183
                           006184   929 _SRCSHORTEN1	=	0x6184
                           006185   930 _SRCSHORTEN2	=	0x6185
                           006186   931 _SRCEXTEN0	=	0x6186
                           006187   932 _SRCEXTEN1	=	0x6187
                           006188   933 _SRCEXTEN2	=	0x6188
                           006189   934 _FRMCTRL0	=	0x6189
                           00618A   935 _FRMCTRL1	=	0x618a
                           00618B   936 _RXENABLE	=	0x618b
                           00618C   937 _RXMASKSET	=	0x618c
                           00618D   938 _RXMASKCLR	=	0x618d
                           00618E   939 _FREQTUNE	=	0x618e
                           00618F   940 _FREQCTRL	=	0x618f
                           006190   941 _TXPOWER	=	0x6190
                           006191   942 _TXCTRL	=	0x6191
                           006192   943 _FSMSTAT0	=	0x6192
                           006193   944 _FSMSTAT1	=	0x6193
                           006194   945 _FIFOPCTRL	=	0x6194
                           006195   946 _FSMCTRL	=	0x6195
                           006196   947 _CCACTRL0	=	0x6196
                           006197   948 _CCACTRL1	=	0x6197
                           006198   949 _RSSI	=	0x6198
                           006199   950 _RSSISTAT	=	0x6199
                           00619A   951 _RXFIRST	=	0x619a
                           00619B   952 _RXFIFOCNT	=	0x619b
                           00619C   953 _TXFIFOCNT	=	0x619c
                           00619D   954 _RXFIRST_PTR	=	0x619d
                           00619E   955 _RXLAST_PTR	=	0x619e
                           00619F   956 _RXP1_PTR	=	0x619f
                           0061A1   957 _TXFIRST_PTR	=	0x61a1
                           0061A2   958 _TXLAST_PTR	=	0x61a2
                           0061A3   959 _RFIRQM0	=	0x61a3
                           0061A4   960 _RFIRQM1	=	0x61a4
                           0061A5   961 _RFERRM	=	0x61a5
                           0061A7   962 _RFRND	=	0x61a7
                           0061A8   963 _MDMCTRL0	=	0x61a8
                           0061A9   964 _MDMCTRL1	=	0x61a9
                           0061AA   965 _FREQEST	=	0x61aa
                           0061AB   966 _RXCTRL	=	0x61ab
                           0061AC   967 _FSCTRL	=	0x61ac
                           0061AD   968 _FSCAL0	=	0x61ad
                           0061AE   969 _FSCAL1	=	0x61ae
                           0061AF   970 _FSCAL2	=	0x61af
                           0061B0   971 _FSCAL3	=	0x61b0
                           0061B1   972 _AGCCTRL0	=	0x61b1
                           0061B2   973 _AGCCTRL1	=	0x61b2
                           0061B3   974 _AGCCTRL2	=	0x61b3
                           0061B4   975 _AGCCTRL3	=	0x61b4
                           0061B5   976 _ADCTEST0	=	0x61b5
                           0061B6   977 _ADCTEST1	=	0x61b6
                           0061B7   978 _ADCTEST2	=	0x61b7
                           0061B8   979 _MDMTEST0	=	0x61b8
                           0061B9   980 _MDMTEST1	=	0x61b9
                           0061BA   981 _DACTEST0	=	0x61ba
                           0061BB   982 _DACTEST1	=	0x61bb
                           0061BC   983 _DACTEST2	=	0x61bc
                           0061BD   984 _ATEST	=	0x61bd
                           0061BE   985 _PTEST0	=	0x61be
                           0061BF   986 _PTEST1	=	0x61bf
                           0061FA   987 _TXFILTCFG	=	0x61fa
                           0061EB   988 _RFC_OBS_CTRL0	=	0x61eb
                           0061EC   989 _RFC_OBS_CTRL1	=	0x61ec
                           0061ED   990 _RFC_OBS_CTRL2	=	0x61ed
                           0061C0   991 _CSPPROG0	=	0x61c0
                           0061C1   992 _CSPPROG1	=	0x61c1
                           0061C2   993 _CSPPROG2	=	0x61c2
                           0061C3   994 _CSPPROG3	=	0x61c3
                           0061C4   995 _CSPPROG4	=	0x61c4
                           0061C5   996 _CSPPROG5	=	0x61c5
                           0061C6   997 _CSPPROG6	=	0x61c6
                           0061C7   998 _CSPPROG7	=	0x61c7
                           0061C8   999 _CSPPROG8	=	0x61c8
                           0061C9  1000 _CSPPROG9	=	0x61c9
                           0061CA  1001 _CSPPROG10	=	0x61ca
                           0061CB  1002 _CSPPROG11	=	0x61cb
                           0061CC  1003 _CSPPROG12	=	0x61cc
                           0061CD  1004 _CSPPROG13	=	0x61cd
                           0061CE  1005 _CSPPROG14	=	0x61ce
                           0061CF  1006 _CSPPROG15	=	0x61cf
                           0061D0  1007 _CSPPROG16	=	0x61d0
                           0061D1  1008 _CSPPROG17	=	0x61d1
                           0061D2  1009 _CSPPROG18	=	0x61d2
                           0061D3  1010 _CSPPROG19	=	0x61d3
                           0061D4  1011 _CSPPROG20	=	0x61d4
                           0061D5  1012 _CSPPROG21	=	0x61d5
                           0061D6  1013 _CSPPROG22	=	0x61d6
                           0061D7  1014 _CSPPROG23	=	0x61d7
                           0061E0  1015 _CSPCTRL	=	0x61e0
                           0061E1  1016 _CSPSTAT	=	0x61e1
                           0061E2  1017 _CSPX	=	0x61e2
                           0061E3  1018 _CSPY	=	0x61e3
                           0061E4  1019 _CSPZ	=	0x61e4
                           0061E5  1020 _CSPT	=	0x61e5
                           006200  1021 _USBADDR	=	0x6200
                           006201  1022 _USBPOW	=	0x6201
                           006202  1023 _USBIIF	=	0x6202
                           006204  1024 _USBOIF	=	0x6204
                           006206  1025 _USBCIF	=	0x6206
                           006207  1026 _USBIIE	=	0x6207
                           006209  1027 _USBOIE	=	0x6209
                           00620B  1028 _USBCIE	=	0x620b
                           00620C  1029 _USBFRML	=	0x620c
                           00620D  1030 _USBFRMH	=	0x620d
                           00620E  1031 _USBINDEX	=	0x620e
                           00620F  1032 _USBCTRL	=	0x620f
                           006210  1033 _USBMAXI	=	0x6210
                           006211  1034 _USBCS0	=	0x6211
                           006211  1035 _USBCSIL	=	0x6211
                           006212  1036 _USBCSIH	=	0x6212
                           006213  1037 _USBMAXO	=	0x6213
                           006214  1038 _USBCSOL	=	0x6214
                           006215  1039 _USBCSOH	=	0x6215
                           006216  1040 _USBCNT0	=	0x6216
                           006216  1041 _USBCNTL	=	0x6216
                           006217  1042 _USBCNTH	=	0x6217
                           006220  1043 _USBF0	=	0x6220
                           006222  1044 _USBF1	=	0x6222
                           006224  1045 _USBF2	=	0x6224
                           006226  1046 _USBF3	=	0x6226
                           006228  1047 _USBF4	=	0x6228
                           00622A  1048 _USBF5	=	0x622a
                           007080  1049 _X_P0	=	0x7080
                           007086  1050 _X_U0CSR	=	0x7086
                           007089  1051 _X_P0IFG	=	0x7089
                           00708A  1052 _X_P1IFG	=	0x708a
                           00708B  1053 _X_P2IFG	=	0x708b
                           00708C  1054 _X_PICTL	=	0x708c
                           00708D  1055 _X_P1IEN	=	0x708d
                           00708F  1056 _X_P0INP	=	0x708f
                           007090  1057 _X_P1	=	0x7090
                           007091  1058 _X_RFIRQF1	=	0x7091
                           007093  1059 _X_MPAGE	=	0x7093
                           007093  1060 _X__XPAGE	=	0x7093
                           007094  1061 _X_T2CTRL	=	0x7094
                           007095  1062 _X_ST0	=	0x7095
                           007096  1063 _X_ST1	=	0x7096
                           007097  1064 _X_ST2	=	0x7097
                           00709C  1065 _X_T2EVTCFG	=	0x709c
                           00709D  1066 _X_SLEEPSTA	=	0x709d
                           00709E  1067 _X_CLKCONSTA	=	0x709e
                           00709F  1068 _X_FMAP	=	0x709f
                           00709F  1069 _X_PSBANK	=	0x709f
                           0070A0  1070 _X_P2	=	0x70a0
                           0070A1  1071 _X_T2IRQF	=	0x70a1
                           0070A2  1072 _X_T2M0	=	0x70a2
                           0070A3  1073 _X_T2M1	=	0x70a3
                           0070A4  1074 _X_T2MOVF0	=	0x70a4
                           0070A5  1075 _X_T2MOVF1	=	0x70a5
                           0070A6  1076 _X_T2MOVF2	=	0x70a6
                           0070A7  1077 _X_T2IRQM	=	0x70a7
                           0070AB  1078 _X_P0IEN	=	0x70ab
                           0070AC  1079 _X_P2IEN	=	0x70ac
                           0070AD  1080 _X_STLOAD	=	0x70ad
                           0070AE  1081 _X_PMUX	=	0x70ae
                           0070AF  1082 _X_T1STAT	=	0x70af
                           0070B1  1083 _X_ENCDI	=	0x70b1
                           0070B2  1084 _X_ENCDO	=	0x70b2
                           0070B3  1085 _X_ENCCS	=	0x70b3
                           0070B4  1086 _X_ADCCON1	=	0x70b4
                           0070B5  1087 _X_ADCCON2	=	0x70b5
                           0070B6  1088 _X_ADCCON3	=	0x70b6
                           0070BA  1089 _X_ADCL	=	0x70ba
                           0070BB  1090 _X_ADCH	=	0x70bb
                           0070BC  1091 _X_RNDL	=	0x70bc
                           0070BD  1092 _X_RNDH	=	0x70bd
                           0070BE  1093 _X_SLEEPCMD	=	0x70be
                           0070BF  1094 _X_RFERRF	=	0x70bf
                           0070C1  1095 _X_U0DBUF	=	0x70c1
                           0070C2  1096 _X_U0BAUD	=	0x70c2
                           0070C3  1097 _X_T2MSEL	=	0x70c3
                           0070C4  1098 _X_U0UCR	=	0x70c4
                           0070C5  1099 _X_U0GCR	=	0x70c5
                           0070C6  1100 _X_CLKCONCMD	=	0x70c6
                           0070C7  1101 _X_MEMCTR	=	0x70c7
                           0070C9  1102 _X_WDCTL	=	0x70c9
                           0070CA  1103 _X_T3CNT	=	0x70ca
                           0070CB  1104 _X_T3CTL	=	0x70cb
                           0070CC  1105 _X_T3CCTL0	=	0x70cc
                           0070CD  1106 _X_T3CC0	=	0x70cd
                           0070CE  1107 _X_T3CCTL1	=	0x70ce
                           0070CF  1108 _X_T3CC1	=	0x70cf
                           0070D1  1109 _X_DMAIRQ	=	0x70d1
                           0070D2  1110 _X_DMA1CFGL	=	0x70d2
                           0070D3  1111 _X_DMA1CFGH	=	0x70d3
                           0070D4  1112 _X_DMA0CFGL	=	0x70d4
                           0070D5  1113 _X_DMA0CFGH	=	0x70d5
                           0070D6  1114 _X_DMAARM	=	0x70d6
                           0070D7  1115 _X_DMAREQ	=	0x70d7
                           0070D8  1116 _X_TIMIF	=	0x70d8
                           0070D9  1117 _X_RFD	=	0x70d9
                           0070DA  1118 _X_T1CC0L	=	0x70da
                           0070DB  1119 _X_T1CC0H	=	0x70db
                           0070DC  1120 _X_T1CC1L	=	0x70dc
                           0070DD  1121 _X_T1CC1H	=	0x70dd
                           0070DE  1122 _X_T1CC2L	=	0x70de
                           0070DF  1123 _X_T1CC2H	=	0x70df
                           0070E1  1124 _X_RFST	=	0x70e1
                           0070E2  1125 _X_T1CNTL	=	0x70e2
                           0070E3  1126 _X_T1CNTH	=	0x70e3
                           0070E4  1127 _X_T1CTL	=	0x70e4
                           0070E5  1128 _X_T1CCTL0	=	0x70e5
                           0070E6  1129 _X_T1CCTL1	=	0x70e6
                           0070E7  1130 _X_T1CCTL2	=	0x70e7
                           0070E9  1131 _X_RFIRQF0	=	0x70e9
                           0070EA  1132 _X_T4CNT	=	0x70ea
                           0070EB  1133 _X_T4CTL	=	0x70eb
                           0070EC  1134 _X_T4CCTL0	=	0x70ec
                           0070ED  1135 _X_T4CC0	=	0x70ed
                           0070EE  1136 _X_T4CCTL1	=	0x70ee
                           0070EF  1137 _X_T4CC1	=	0x70ef
                           0070F1  1138 _X_PERCFG	=	0x70f1
                           0070F2  1139 _X_APCFG	=	0x70f2
                           0070F3  1140 _X_P0SEL	=	0x70f3
                           0070F4  1141 _X_P1SEL	=	0x70f4
                           0070F5  1142 _X_P2SEL	=	0x70f5
                           0070F6  1143 _X_P1INP	=	0x70f6
                           0070F7  1144 _X_P2INP	=	0x70f7
                           0070F8  1145 _X_U1CSR	=	0x70f8
                           0070F9  1146 _X_U1DBUF	=	0x70f9
                           0070FA  1147 _X_U1BAUD	=	0x70fa
                           0070FB  1148 _X_U1UCR	=	0x70fb
                           0070FC  1149 _X_U1GCR	=	0x70fc
                           0070FD  1150 _X_P0DIR	=	0x70fd
                           0070FE  1151 _X_P1DIR	=	0x70fe
                           0070FF  1152 _X_P2DIR	=	0x70ff
                           007800  1153 _X_INFOPAGE	=	0x7800
                           00780C  1154 _X_IEEE_ADDR	=	0x780c
                                   1155 ;--------------------------------------------------------
                                   1156 ; absolute external ram data
                                   1157 ;--------------------------------------------------------
                                   1158 	.area XABS    (ABS,XDATA)
                                   1159 ;--------------------------------------------------------
                                   1160 ; external initialized ram data
                                   1161 ;--------------------------------------------------------
                                   1162 	.area XISEG   (XDATA)
                                   1163 	.area HOME    (CODE)
                                   1164 	.area GSINIT0 (CODE)
                                   1165 	.area GSINIT1 (CODE)
                                   1166 	.area GSINIT2 (CODE)
                                   1167 	.area GSINIT3 (CODE)
                                   1168 	.area GSINIT4 (CODE)
                                   1169 	.area GSINIT5 (CODE)
                                   1170 	.area GSINIT  (CODE)
                                   1171 	.area GSFINAL (CODE)
                                   1172 	.area CSEG    (CODE)
                                   1173 ;--------------------------------------------------------
                                   1174 ; interrupt vector 
                                   1175 ;--------------------------------------------------------
                                   1176 	.area HOME    (CODE)
      000000                       1177 __interrupt_vect:
      000000 02 49 29         [24] 1178 	ljmp	__sdcc_gsinit_startup
      000003 32               [24] 1179 	reti
      000004                       1180 	.ds	7
      00000B 32               [24] 1181 	reti
      00000C                       1182 	.ds	7
      000013 02 05 35         [24] 1183 	ljmp	_uart0_rx_isr
      000016                       1184 	.ds	5
      00001B 32               [24] 1185 	reti
      00001C                       1186 	.ds	7
      000023 32               [24] 1187 	reti
      000024                       1188 	.ds	7
      00002B 02 06 FF         [24] 1189 	ljmp	_clock_isr
      00002E                       1190 	.ds	5
      000033 32               [24] 1191 	reti
      000034                       1192 	.ds	7
      00003B 32               [24] 1193 	reti
      00003C                       1194 	.ds	7
      000043 32               [24] 1195 	reti
      000044                       1196 	.ds	7
      00004B 02 3F AB         [24] 1197 	ljmp	_rtimer_isr
      00004E                       1198 	.ds	5
      000053 32               [24] 1199 	reti
      000054                       1200 	.ds	7
      00005B 32               [24] 1201 	reti
      00005C                       1202 	.ds	7
      000063 32               [24] 1203 	reti
      000064                       1204 	.ds	7
      00006B 02 40 B5         [24] 1205 	ljmp	_port_0_isr
                                   1206 ;--------------------------------------------------------
                                   1207 ; global & static initialisations
                                   1208 ;--------------------------------------------------------
                                   1209 	.area HOME    (CODE)
                                   1210 	.area GSINIT  (CODE)
                                   1211 	.area GSFINAL (CODE)
                                   1212 	.area GSINIT  (CODE)
                                   1213 	.globl __sdcc_gsinit_startup
                                   1214 	.globl __sdcc_program_startup
                                   1215 	.globl __start__stack
                                   1216 	.globl __mcs51_genXINIT
                                   1217 	.globl __mcs51_genXRAMCLEAR
                                   1218 	.globl __mcs51_genRAMCLEAR
                                   1219 	.area GSFINAL (CODE)
      0049A3 02 00 6E         [24] 1220 	ljmp	__sdcc_program_startup
                                   1221 ;--------------------------------------------------------
                                   1222 ; Home
                                   1223 ;--------------------------------------------------------
                                   1224 	.area HOME    (CODE)
                                   1225 	.area HOME    (CODE)
      00006E                       1226 __sdcc_program_startup:
      00006E 02 01 BF         [24] 1227 	ljmp	_main
                                   1228 ;	return from main will return to caller
                                   1229 ;--------------------------------------------------------
                                   1230 ; code
                                   1231 ;--------------------------------------------------------
                                   1232 	.area HOME    (CODE)
                                   1233 ;------------------------------------------------------------
                                   1234 ;Allocation info for local variables in function 'fade'
                                   1235 ;------------------------------------------------------------
                                   1236 ;l                         Allocated to registers r6 r7 
                                   1237 ;i                         Allocated to stack - sp -3
                                   1238 ;a                         Allocated to stack - sp -1
                                   1239 ;k                         Allocated to registers 
                                   1240 ;j                         Allocated to registers r2 r3 
                                   1241 ;sloc0                     Allocated to stack - sp +7
                                   1242 ;------------------------------------------------------------
                                   1243 ;	../../../platform/cc2530dk/./contiki-main.c:74: fade(int l) CC_NON_BANKED
                                   1244 ;	-----------------------------------------
                                   1245 ;	 function fade
                                   1246 ;	-----------------------------------------
      000071                       1247 _fade:
                           000007  1248 	ar7 = 0x07
                           000006  1249 	ar6 = 0x06
                           000005  1250 	ar5 = 0x05
                           000004  1251 	ar4 = 0x04
                           000003  1252 	ar3 = 0x03
                           000002  1253 	ar2 = 0x02
                           000001  1254 	ar1 = 0x01
                           000000  1255 	ar0 = 0x00
      000071 E5 81            [12] 1256 	mov	a,sp
      000073 24 04            [12] 1257 	add	a,#0x04
      000075 F5 81            [12] 1258 	mov	sp,a
      000077 AE 82            [24] 1259 	mov	r6,dpl
      000079 AF 83            [24] 1260 	mov	r7,dph
                                   1261 ;	../../../platform/cc2530dk/./contiki-main.c:78: for(k = 0; k < 400; ++k) {
      00007B 7C 00            [12] 1262 	mov	r4,#0x00
      00007D 7D 00            [12] 1263 	mov	r5,#0x00
      00007F                       1264 00110$:
                                   1265 ;	../../../platform/cc2530dk/./contiki-main.c:79: j = k > 200 ? 400 - k : k;
      00007F C3               [12] 1266 	clr	c
      000080 74 C8            [12] 1267 	mov	a,#0xc8
      000082 9C               [12] 1268 	subb	a,r4
      000083 74 80            [12] 1269 	mov	a,#(0x00 ^ 0x80)
      000085 8D F0            [24] 1270 	mov	b,r5
      000087 63 F0 80         [24] 1271 	xrl	b,#0x80
      00008A 95 F0            [12] 1272 	subb	a,b
      00008C 50 0B            [24] 1273 	jnc	00114$
      00008E 74 90            [12] 1274 	mov	a,#0x90
      000090 C3               [12] 1275 	clr	c
      000091 9C               [12] 1276 	subb	a,r4
      000092 FA               [12] 1277 	mov	r2,a
      000093 74 01            [12] 1278 	mov	a,#0x01
      000095 9D               [12] 1279 	subb	a,r5
      000096 FB               [12] 1280 	mov	r3,a
      000097 80 04            [24] 1281 	sjmp	00115$
      000099                       1282 00114$:
      000099 8C 02            [24] 1283 	mov	ar2,r4
      00009B 8D 03            [24] 1284 	mov	ar3,r5
      00009D                       1285 00115$:
      00009D C0 04            [24] 1286 	push	ar4
      00009F C0 05            [24] 1287 	push	ar5
                                   1288 ;	../../../platform/cc2530dk/./contiki-main.c:81: leds_on(l);
      0000A1 8E 05            [24] 1289 	mov	ar5,r6
      0000A3 8D 82            [24] 1290 	mov	dpl,r5
      0000A5 C0 07            [24] 1291 	push	ar7
      0000A7 C0 06            [24] 1292 	push	ar6
      0000A9 C0 05            [24] 1293 	push	ar5
      0000AB C0 04            [24] 1294 	push	ar4
      0000AD C0 03            [24] 1295 	push	ar3
      0000AF C0 02            [24] 1296 	push	ar2
      0000B1 78 CB            [12] 1297 	mov	r0,#_leds_on
      0000B3 79 83            [12] 1298 	mov	r1,#(_leds_on >> 8)
      0000B5 7A 04            [12] 1299 	mov	r2,#(_leds_on >> 16)
      0000B7 12 05 92         [24] 1300 	lcall	__sdcc_banked_call
      0000BA D0 02            [24] 1301 	pop	ar2
      0000BC D0 03            [24] 1302 	pop	ar3
      0000BE D0 04            [24] 1303 	pop	ar4
      0000C0 D0 05            [24] 1304 	pop	ar5
      0000C2 D0 06            [24] 1305 	pop	ar6
      0000C4 D0 07            [24] 1306 	pop	ar7
                                   1307 ;	../../../platform/cc2530dk/./contiki-main.c:82: for(i = 0; i < j; ++i) {
      0000C6 E5 81            [12] 1308 	mov	a,sp
      0000C8 24 FB            [12] 1309 	add	a,#0xfb
      0000CA F8               [12] 1310 	mov	r0,a
      0000CB E4               [12] 1311 	clr	a
      0000CC F6               [12] 1312 	mov	@r0,a
      0000CD 08               [12] 1313 	inc	r0
      0000CE F6               [12] 1314 	mov	@r0,a
                                   1315 ;	../../../platform/cc2530dk/./contiki-main.c:78: for(k = 0; k < 400; ++k) {
      0000CF D0 05            [24] 1316 	pop	ar5
      0000D1 D0 04            [24] 1317 	pop	ar4
                                   1318 ;	../../../platform/cc2530dk/./contiki-main.c:82: for(i = 0; i < j; ++i) {
      0000D3                       1319 00105$:
      0000D3 E5 81            [12] 1320 	mov	a,sp
      0000D5 24 FD            [12] 1321 	add	a,#0xfd
      0000D7 F8               [12] 1322 	mov	r0,a
      0000D8 C3               [12] 1323 	clr	c
      0000D9 E6               [12] 1324 	mov	a,@r0
      0000DA 9A               [12] 1325 	subb	a,r2
      0000DB 08               [12] 1326 	inc	r0
      0000DC E6               [12] 1327 	mov	a,@r0
      0000DD 64 80            [12] 1328 	xrl	a,#0x80
      0000DF 8B F0            [24] 1329 	mov	b,r3
      0000E1 63 F0 80         [24] 1330 	xrl	b,#0x80
      0000E4 95 F0            [12] 1331 	subb	a,b
      0000E6 50 1D            [24] 1332 	jnc	00101$
                                   1333 ;	../../../platform/cc2530dk/./contiki-main.c:83: a = i;
      0000E8 E5 81            [12] 1334 	mov	a,sp
      0000EA 24 FD            [12] 1335 	add	a,#0xfd
      0000EC F8               [12] 1336 	mov	r0,a
      0000ED A9 81            [24] 1337 	mov	r1,sp
      0000EF 19               [12] 1338 	dec	r1
      0000F0 E6               [12] 1339 	mov	a,@r0
      0000F1 F7               [12] 1340 	mov	@r1,a
      0000F2 08               [12] 1341 	inc	r0
      0000F3 09               [12] 1342 	inc	r1
      0000F4 E6               [12] 1343 	mov	a,@r0
      0000F5 F7               [12] 1344 	mov	@r1,a
                                   1345 ;	../../../platform/cc2530dk/./contiki-main.c:82: for(i = 0; i < j; ++i) {
      0000F6 E5 81            [12] 1346 	mov	a,sp
      0000F8 24 FD            [12] 1347 	add	a,#0xfd
      0000FA F8               [12] 1348 	mov	r0,a
      0000FB 74 01            [12] 1349 	mov	a,#0x01
      0000FD 26               [12] 1350 	add	a,@r0
      0000FE F6               [12] 1351 	mov	@r0,a
      0000FF E4               [12] 1352 	clr	a
      000100 08               [12] 1353 	inc	r0
      000101 36               [12] 1354 	addc	a,@r0
      000102 F6               [12] 1355 	mov	@r0,a
      000103 80 CE            [24] 1356 	sjmp	00105$
      000105                       1357 00101$:
                                   1358 ;	../../../platform/cc2530dk/./contiki-main.c:85: leds_off(l);
      000105 C0 04            [24] 1359 	push	ar4
      000107 C0 05            [24] 1360 	push	ar5
      000109 8E 05            [24] 1361 	mov	ar5,r6
      00010B 8D 82            [24] 1362 	mov	dpl,r5
      00010D C0 07            [24] 1363 	push	ar7
      00010F C0 06            [24] 1364 	push	ar6
      000111 C0 05            [24] 1365 	push	ar5
      000113 C0 04            [24] 1366 	push	ar4
      000115 C0 03            [24] 1367 	push	ar3
      000117 C0 02            [24] 1368 	push	ar2
      000119 78 EB            [12] 1369 	mov	r0,#_leds_off
      00011B 79 83            [12] 1370 	mov	r1,#(_leds_off >> 8)
      00011D 7A 04            [12] 1371 	mov	r2,#(_leds_off >> 16)
      00011F 12 05 92         [24] 1372 	lcall	__sdcc_banked_call
      000122 D0 02            [24] 1373 	pop	ar2
      000124 D0 03            [24] 1374 	pop	ar3
      000126 D0 04            [24] 1375 	pop	ar4
      000128 D0 05            [24] 1376 	pop	ar5
      00012A D0 06            [24] 1377 	pop	ar6
      00012C D0 07            [24] 1378 	pop	ar7
                                   1379 ;	../../../platform/cc2530dk/./contiki-main.c:86: for(i = 0; i < 200 - j; ++i) {
      00012E E5 81            [12] 1380 	mov	a,sp
      000130 24 FB            [12] 1381 	add	a,#0xfb
      000132 F8               [12] 1382 	mov	r0,a
      000133 E4               [12] 1383 	clr	a
      000134 F6               [12] 1384 	mov	@r0,a
      000135 08               [12] 1385 	inc	r0
      000136 F6               [12] 1386 	mov	@r0,a
      000137 74 C8            [12] 1387 	mov	a,#0xc8
      000139 C3               [12] 1388 	clr	c
      00013A 9A               [12] 1389 	subb	a,r2
      00013B FA               [12] 1390 	mov	r2,a
      00013C E4               [12] 1391 	clr	a
      00013D 9B               [12] 1392 	subb	a,r3
      00013E FB               [12] 1393 	mov	r3,a
                                   1394 ;	../../../platform/cc2530dk/./contiki-main.c:78: for(k = 0; k < 400; ++k) {
      00013F D0 05            [24] 1395 	pop	ar5
      000141 D0 04            [24] 1396 	pop	ar4
                                   1397 ;	../../../platform/cc2530dk/./contiki-main.c:86: for(i = 0; i < 200 - j; ++i) {
      000143                       1398 00108$:
      000143 E5 81            [12] 1399 	mov	a,sp
      000145 24 FD            [12] 1400 	add	a,#0xfd
      000147 F8               [12] 1401 	mov	r0,a
      000148 C3               [12] 1402 	clr	c
      000149 E6               [12] 1403 	mov	a,@r0
      00014A 9A               [12] 1404 	subb	a,r2
      00014B 08               [12] 1405 	inc	r0
      00014C E6               [12] 1406 	mov	a,@r0
      00014D 64 80            [12] 1407 	xrl	a,#0x80
      00014F 8B F0            [24] 1408 	mov	b,r3
      000151 63 F0 80         [24] 1409 	xrl	b,#0x80
      000154 95 F0            [12] 1410 	subb	a,b
      000156 50 1D            [24] 1411 	jnc	00111$
                                   1412 ;	../../../platform/cc2530dk/./contiki-main.c:87: a = i;
      000158 E5 81            [12] 1413 	mov	a,sp
      00015A 24 FD            [12] 1414 	add	a,#0xfd
      00015C F8               [12] 1415 	mov	r0,a
      00015D A9 81            [24] 1416 	mov	r1,sp
      00015F 19               [12] 1417 	dec	r1
      000160 E6               [12] 1418 	mov	a,@r0
      000161 F7               [12] 1419 	mov	@r1,a
      000162 08               [12] 1420 	inc	r0
      000163 09               [12] 1421 	inc	r1
      000164 E6               [12] 1422 	mov	a,@r0
      000165 F7               [12] 1423 	mov	@r1,a
                                   1424 ;	../../../platform/cc2530dk/./contiki-main.c:86: for(i = 0; i < 200 - j; ++i) {
      000166 E5 81            [12] 1425 	mov	a,sp
      000168 24 FD            [12] 1426 	add	a,#0xfd
      00016A F8               [12] 1427 	mov	r0,a
      00016B 74 01            [12] 1428 	mov	a,#0x01
      00016D 26               [12] 1429 	add	a,@r0
      00016E F6               [12] 1430 	mov	@r0,a
      00016F E4               [12] 1431 	clr	a
      000170 08               [12] 1432 	inc	r0
      000171 36               [12] 1433 	addc	a,@r0
      000172 F6               [12] 1434 	mov	@r0,a
      000173 80 CE            [24] 1435 	sjmp	00108$
      000175                       1436 00111$:
                                   1437 ;	../../../platform/cc2530dk/./contiki-main.c:78: for(k = 0; k < 400; ++k) {
      000175 0C               [12] 1438 	inc	r4
      000176 BC 00 01         [24] 1439 	cjne	r4,#0x00,00144$
      000179 0D               [12] 1440 	inc	r5
      00017A                       1441 00144$:
      00017A C3               [12] 1442 	clr	c
      00017B EC               [12] 1443 	mov	a,r4
      00017C 94 90            [12] 1444 	subb	a,#0x90
      00017E ED               [12] 1445 	mov	a,r5
      00017F 64 80            [12] 1446 	xrl	a,#0x80
      000181 94 81            [12] 1447 	subb	a,#0x81
      000183 50 03            [24] 1448 	jnc	00145$
      000185 02 00 7F         [24] 1449 	ljmp	00110$
      000188                       1450 00145$:
                                   1451 ;	../../../platform/cc2530dk/./contiki-main.c:90: }
      000188 E5 81            [12] 1452 	mov	a,sp
      00018A 24 FC            [12] 1453 	add	a,#0xfc
      00018C F5 81            [12] 1454 	mov	sp,a
      00018E 22               [24] 1455 	ret
                                   1456 ;------------------------------------------------------------
                                   1457 ;Allocation info for local variables in function 'set_rime_addr'
                                   1458 ;------------------------------------------------------------
                                   1459 ;i                         Allocated to registers 
                                   1460 ;macp                      Allocated to registers 
                                   1461 ;------------------------------------------------------------
                                   1462 ;	../../../platform/cc2530dk/./contiki-main.c:93: set_rime_addr(void) CC_NON_BANKED
                                   1463 ;	-----------------------------------------
                                   1464 ;	 function set_rime_addr
                                   1465 ;	-----------------------------------------
      00018F                       1466 _set_rime_addr:
                                   1467 ;	../../../platform/cc2530dk/./contiki-main.c:98: __xdata unsigned char *macp = &X_IEEE_ADDR;
      00018F 7E 0C            [12] 1468 	mov	r6,#_X_IEEE_ADDR
      000191 7F 78            [12] 1469 	mov	r7,#(_X_IEEE_ADDR >> 8)
                                   1470 ;	../../../platform/cc2530dk/./contiki-main.c:128: for(i = (RIMEADDR_SIZE - 1); i >= 0; --i) {
      000193 7D 07            [12] 1471 	mov	r5,#0x07
      000195                       1472 00102$:
                                   1473 ;	../../../platform/cc2530dk/./contiki-main.c:129: rimeaddr_node_addr.u8[i] = *macp;
      000195 ED               [12] 1474 	mov	a,r5
      000196 24 F0            [12] 1475 	add	a,#_rimeaddr_node_addr
      000198 FB               [12] 1476 	mov	r3,a
      000199 E4               [12] 1477 	clr	a
      00019A 34 10            [12] 1478 	addc	a,#(_rimeaddr_node_addr >> 8)
      00019C FC               [12] 1479 	mov	r4,a
      00019D 8E 82            [24] 1480 	mov	dpl,r6
      00019F 8F 83            [24] 1481 	mov	dph,r7
      0001A1 E0               [24] 1482 	movx	a,@dptr
      0001A2 FA               [12] 1483 	mov	r2,a
      0001A3 A3               [24] 1484 	inc	dptr
      0001A4 AE 82            [24] 1485 	mov	r6,dpl
      0001A6 AF 83            [24] 1486 	mov	r7,dph
      0001A8 8B 82            [24] 1487 	mov	dpl,r3
      0001AA 8C 83            [24] 1488 	mov	dph,r4
      0001AC EA               [12] 1489 	mov	a,r2
      0001AD F0               [24] 1490 	movx	@dptr,a
                                   1491 ;	../../../platform/cc2530dk/./contiki-main.c:130: macp++;
                                   1492 ;	../../../platform/cc2530dk/./contiki-main.c:128: for(i = (RIMEADDR_SIZE - 1); i >= 0; --i) {
      0001AE 1D               [12] 1493 	dec	r5
      0001AF ED               [12] 1494 	mov	a,r5
      0001B0 30 E7 E2         [24] 1495 	jnb	acc.7,00102$
                                   1496 ;	../../../platform/cc2530dk/./contiki-main.c:150: cc2530_rf_set_addr(IEEE802154_PANID);
      0001B3 90 54 49         [24] 1497 	mov	dptr,#0x5449
      0001B6 78 B1            [12] 1498 	mov	r0,#_cc2530_rf_set_addr
      0001B8 79 88            [12] 1499 	mov	r1,#(_cc2530_rf_set_addr >> 8)
      0001BA 7A 04            [12] 1500 	mov	r2,#(_cc2530_rf_set_addr >> 16)
                                   1501 ;	../../../platform/cc2530dk/./contiki-main.c:151: return;
                                   1502 ;	../../../platform/cc2530dk/./contiki-main.c:152: }
      0001BC 02 05 92         [24] 1503 	ljmp	__sdcc_banked_call
                                   1504 ;------------------------------------------------------------
                                   1505 ;Allocation info for local variables in function 'main'
                                   1506 ;------------------------------------------------------------
                                   1507 ;r                         Allocated to registers r6 
                                   1508 ;------------------------------------------------------------
                                   1509 ;	../../../platform/cc2530dk/./contiki-main.c:155: main(void) CC_NON_BANKED
                                   1510 ;	-----------------------------------------
                                   1511 ;	 function main
                                   1512 ;	-----------------------------------------
      0001BF                       1513 _main:
                                   1514 ;	../../../platform/cc2530dk/./contiki-main.c:158: clock_init();
      0001BF 78 36            [12] 1515 	mov	r0,#_clock_init
      0001C1 79 06            [12] 1516 	mov	r1,#(_clock_init >> 8)
      0001C3 7A 00            [12] 1517 	mov	r2,#(_clock_init >> 16)
      0001C5 12 05 92         [24] 1518 	lcall	__sdcc_banked_call
                                   1519 ;	../../../platform/cc2530dk/./contiki-main.c:159: soc_init();
      0001C8 78 D5            [12] 1520 	mov	r0,#_soc_init
      0001CA 79 D0            [12] 1521 	mov	r1,#(_soc_init >> 8)
      0001CC 7A 02            [12] 1522 	mov	r2,#(_soc_init >> 16)
      0001CE 12 05 92         [24] 1523 	lcall	__sdcc_banked_call
                                   1524 ;	../../../platform/cc2530dk/./contiki-main.c:161: rtimer_init();
      0001D1 78 53            [12] 1525 	mov	r0,#_rtimer_init
      0001D3 79 84            [12] 1526 	mov	r1,#(_rtimer_init >> 8)
      0001D5 7A 04            [12] 1527 	mov	r2,#(_rtimer_init >> 16)
      0001D7 12 05 92         [24] 1528 	lcall	__sdcc_banked_call
                                   1529 ;	../../../platform/cc2530dk/./contiki-main.c:170: process_init();
      0001DA 78 F7            [12] 1530 	mov	r0,#_process_init
      0001DC 79 8F            [12] 1531 	mov	r1,#(_process_init >> 8)
      0001DE 7A 03            [12] 1532 	mov	r2,#(_process_init >> 16)
      0001E0 12 05 92         [24] 1533 	lcall	__sdcc_banked_call
                                   1534 ;	../../../platform/cc2530dk/./contiki-main.c:177: io_arch_init();
      0001E3 78 36            [12] 1535 	mov	r0,#_uart1_init
      0001E5 79 AB            [12] 1536 	mov	r1,#(_uart1_init >> 8)
      0001E7 7A 04            [12] 1537 	mov	r2,#(_uart1_init >> 16)
      0001E9 12 05 92         [24] 1538 	lcall	__sdcc_banked_call
                                   1539 ;	../../../platform/cc2530dk/./contiki-main.c:181: io_arch_set_input(serial_line_input_byte);
      0001EC 90 85 FE         [24] 1540 	mov	dptr,#_serial_line_input_byte
      0001EF 75 F0 04         [24] 1541 	mov	b,#(_serial_line_input_byte >> 16)
      0001F2 78 7F            [12] 1542 	mov	r0,#_uart1_set_input
      0001F4 79 05            [12] 1543 	mov	r1,#(_uart1_set_input >> 8)
      0001F6 7A 00            [12] 1544 	mov	r2,#(_uart1_set_input >> 16)
      0001F8 12 05 92         [24] 1545 	lcall	__sdcc_banked_call
                                   1546 ;	../../../platform/cc2530dk/./contiki-main.c:182: serial_line_init();
      0001FB 78 24            [12] 1547 	mov	r0,#_serial_line_init
      0001FD 79 88            [12] 1548 	mov	r1,#(_serial_line_init >> 8)
      0001FF 7A 04            [12] 1549 	mov	r2,#(_serial_line_init >> 16)
      000201 12 05 92         [24] 1550 	lcall	__sdcc_banked_call
                                   1551 ;	../../../platform/cc2530dk/./contiki-main.c:189: OLED_Init();	//初始化OLED
      000204 78 EC            [12] 1552 	mov	r0,#_OLED_Init
      000206 79 83            [12] 1553 	mov	r1,#(_OLED_Init >> 8)
      000208 7A 03            [12] 1554 	mov	r2,#(_OLED_Init >> 16)
      00020A 12 05 92         [24] 1555 	lcall	__sdcc_banked_call
                                   1556 ;	../../../platform/cc2530dk/./contiki-main.c:207: printf("sht20 init\r\n");
      00020D 74 15            [12] 1557 	mov	a,#___str_0
      00020F C0 E0            [24] 1558 	push	acc
      000211 74 73            [12] 1559 	mov	a,#(___str_0 >> 8)
      000213 C0 E0            [24] 1560 	push	acc
      000215 74 80            [12] 1561 	mov	a,#0x80
      000217 C0 E0            [24] 1562 	push	acc
      000219 78 09            [12] 1563 	mov	r0,#_printf
      00021B 79 4E            [12] 1564 	mov	r1,#(_printf >> 8)
      00021D 7A 00            [12] 1565 	mov	r2,#(_printf >> 16)
      00021F 12 05 92         [24] 1566 	lcall	__sdcc_banked_call
      000222 15 81            [12] 1567 	dec	sp
      000224 15 81            [12] 1568 	dec	sp
      000226 15 81            [12] 1569 	dec	sp
                                   1570 ;	../../../platform/cc2530dk/./contiki-main.c:208: TM1640_Init();	//初始化数码管
      000228 78 6F            [12] 1571 	mov	r0,#_TM1640_Init
      00022A 79 B2            [12] 1572 	mov	r1,#(_TM1640_Init >> 8)
      00022C 7A 04            [12] 1573 	mov	r2,#(_TM1640_Init >> 16)
      00022E 12 05 92         [24] 1574 	lcall	__sdcc_banked_call
                                   1575 ;	../../../platform/cc2530dk/./contiki-main.c:209: SHT2x_Init();	//初始化温湿度
      000231 78 95            [12] 1576 	mov	r0,#_SHT2x_Init
      000233 79 A9            [12] 1577 	mov	r1,#(_SHT2x_Init >> 8)
      000235 7A 03            [12] 1578 	mov	r2,#(_SHT2x_Init >> 16)
      000237 12 05 92         [24] 1579 	lcall	__sdcc_banked_call
                                   1580 ;	../../../platform/cc2530dk/./contiki-main.c:242: printf("this is print\r\n");
      00023A 74 22            [12] 1581 	mov	a,#___str_1
      00023C C0 E0            [24] 1582 	push	acc
      00023E 74 73            [12] 1583 	mov	a,#(___str_1 >> 8)
      000240 C0 E0            [24] 1584 	push	acc
      000242 74 80            [12] 1585 	mov	a,#0x80
      000244 C0 E0            [24] 1586 	push	acc
      000246 78 09            [12] 1587 	mov	r0,#_printf
      000248 79 4E            [12] 1588 	mov	r1,#(_printf >> 8)
      00024A 7A 00            [12] 1589 	mov	r2,#(_printf >> 16)
      00024C 12 05 92         [24] 1590 	lcall	__sdcc_banked_call
      00024F 15 81            [12] 1591 	dec	sp
      000251 15 81            [12] 1592 	dec	sp
      000253 15 81            [12] 1593 	dec	sp
                                   1594 ;	../../../platform/cc2530dk/./contiki-main.c:244: putstring(CONTIKI_VERSION_STRING "\r\n");
      000255 90 73 32         [24] 1595 	mov	dptr,#___str_2
      000258 75 F0 80         [24] 1596 	mov	b,#0x80
      00025B 78 E6            [12] 1597 	mov	r0,#_putstring
      00025D 79 A9            [12] 1598 	mov	r1,#(_putstring >> 8)
      00025F 7A 03            [12] 1599 	mov	r2,#(_putstring >> 16)
      000261 12 05 92         [24] 1600 	lcall	__sdcc_banked_call
                                   1601 ;	../../../platform/cc2530dk/./contiki-main.c:245: putstring(MODEL_STRING);
      000264 90 73 40         [24] 1602 	mov	dptr,#___str_3
      000267 75 F0 80         [24] 1603 	mov	b,#0x80
      00026A 78 E6            [12] 1604 	mov	r0,#_putstring
      00026C 79 A9            [12] 1605 	mov	r1,#(_putstring >> 8)
      00026E 7A 03            [12] 1606 	mov	r2,#(_putstring >> 16)
      000270 12 05 92         [24] 1607 	lcall	__sdcc_banked_call
                                   1608 ;	../../../platform/cc2530dk/./contiki-main.c:246: switch(CHIPID) {
      000273 90 62 4A         [24] 1609 	mov	dptr,#_CHIPID
      000276 E0               [24] 1610 	movx	a,@dptr
      000277 FF               [12] 1611 	mov	r7,a
      000278 BF 8D 02         [24] 1612 	cjne	r7,#0x8d,00169$
      00027B 80 42            [24] 1613 	sjmp	00104$
      00027D                       1614 00169$:
      00027D BF 95 02         [24] 1615 	cjne	r7,#0x95,00170$
      000280 80 2C            [24] 1616 	sjmp	00103$
      000282                       1617 00170$:
      000282 BF A5 02         [24] 1618 	cjne	r7,#0xa5,00171$
      000285 80 05            [24] 1619 	sjmp	00101$
      000287                       1620 00171$:
                                   1621 ;	../../../platform/cc2530dk/./contiki-main.c:247: case 0xA5:
      000287 BF B5 44         [24] 1622 	cjne	r7,#0xb5,00105$
      00028A 80 11            [24] 1623 	sjmp	00102$
      00028C                       1624 00101$:
                                   1625 ;	../../../platform/cc2530dk/./contiki-main.c:248: putstring("cc2530");
      00028C 90 73 51         [24] 1626 	mov	dptr,#___str_4
      00028F 75 F0 80         [24] 1627 	mov	b,#0x80
      000292 78 E6            [12] 1628 	mov	r0,#_putstring
      000294 79 A9            [12] 1629 	mov	r1,#(_putstring >> 8)
      000296 7A 03            [12] 1630 	mov	r2,#(_putstring >> 16)
      000298 12 05 92         [24] 1631 	lcall	__sdcc_banked_call
                                   1632 ;	../../../platform/cc2530dk/./contiki-main.c:249: break;
                                   1633 ;	../../../platform/cc2530dk/./contiki-main.c:250: case 0xB5:
      00029B 80 31            [24] 1634 	sjmp	00105$
      00029D                       1635 00102$:
                                   1636 ;	../../../platform/cc2530dk/./contiki-main.c:251: putstring("cc2531");
      00029D 90 73 58         [24] 1637 	mov	dptr,#___str_5
      0002A0 75 F0 80         [24] 1638 	mov	b,#0x80
      0002A3 78 E6            [12] 1639 	mov	r0,#_putstring
      0002A5 79 A9            [12] 1640 	mov	r1,#(_putstring >> 8)
      0002A7 7A 03            [12] 1641 	mov	r2,#(_putstring >> 16)
      0002A9 12 05 92         [24] 1642 	lcall	__sdcc_banked_call
                                   1643 ;	../../../platform/cc2530dk/./contiki-main.c:252: break;
                                   1644 ;	../../../platform/cc2530dk/./contiki-main.c:253: case 0x95:
      0002AC 80 20            [24] 1645 	sjmp	00105$
      0002AE                       1646 00103$:
                                   1647 ;	../../../platform/cc2530dk/./contiki-main.c:254: putstring("cc2533");
      0002AE 90 73 5F         [24] 1648 	mov	dptr,#___str_6
      0002B1 75 F0 80         [24] 1649 	mov	b,#0x80
      0002B4 78 E6            [12] 1650 	mov	r0,#_putstring
      0002B6 79 A9            [12] 1651 	mov	r1,#(_putstring >> 8)
      0002B8 7A 03            [12] 1652 	mov	r2,#(_putstring >> 16)
      0002BA 12 05 92         [24] 1653 	lcall	__sdcc_banked_call
                                   1654 ;	../../../platform/cc2530dk/./contiki-main.c:255: break;
                                   1655 ;	../../../platform/cc2530dk/./contiki-main.c:256: case 0x8D:
      0002BD 80 0F            [24] 1656 	sjmp	00105$
      0002BF                       1657 00104$:
                                   1658 ;	../../../platform/cc2530dk/./contiki-main.c:257: putstring("cc2540");
      0002BF 90 73 66         [24] 1659 	mov	dptr,#___str_7
      0002C2 75 F0 80         [24] 1660 	mov	b,#0x80
      0002C5 78 E6            [12] 1661 	mov	r0,#_putstring
      0002C7 79 A9            [12] 1662 	mov	r1,#(_putstring >> 8)
      0002C9 7A 03            [12] 1663 	mov	r2,#(_putstring >> 16)
      0002CB 12 05 92         [24] 1664 	lcall	__sdcc_banked_call
                                   1665 ;	../../../platform/cc2530dk/./contiki-main.c:259: }
      0002CE                       1666 00105$:
                                   1667 ;	../../../platform/cc2530dk/./contiki-main.c:261: putstring("-" CC2530_FLAVOR_STRING ", ");
      0002CE 90 73 6D         [24] 1668 	mov	dptr,#___str_8
      0002D1 75 F0 80         [24] 1669 	mov	b,#0x80
      0002D4 78 E6            [12] 1670 	mov	r0,#_putstring
      0002D6 79 A9            [12] 1671 	mov	r1,#(_putstring >> 8)
      0002D8 7A 03            [12] 1672 	mov	r2,#(_putstring >> 16)
      0002DA 12 05 92         [24] 1673 	lcall	__sdcc_banked_call
                                   1674 ;	../../../platform/cc2530dk/./contiki-main.c:262: puthex(CHIPINFO1 + 1);
      0002DD 90 62 77         [24] 1675 	mov	dptr,#_CHIPINFO1
      0002E0 E0               [24] 1676 	movx	a,@dptr
      0002E1 FF               [12] 1677 	mov	r7,a
      0002E2 0F               [12] 1678 	inc	r7
      0002E3 8F 82            [24] 1679 	mov	dpl,r7
      0002E5 78 22            [12] 1680 	mov	r0,#_puthex
      0002E7 79 AA            [12] 1681 	mov	r1,#(_puthex >> 8)
      0002E9 7A 03            [12] 1682 	mov	r2,#(_puthex >> 16)
      0002EB 12 05 92         [24] 1683 	lcall	__sdcc_banked_call
                                   1684 ;	../../../platform/cc2530dk/./contiki-main.c:263: putstring("KB SRAM\r\n");
      0002EE 90 73 75         [24] 1685 	mov	dptr,#___str_9
      0002F1 75 F0 80         [24] 1686 	mov	b,#0x80
      0002F4 78 E6            [12] 1687 	mov	r0,#_putstring
      0002F6 79 A9            [12] 1688 	mov	r1,#(_putstring >> 8)
      0002F8 7A 03            [12] 1689 	mov	r2,#(_putstring >> 16)
      0002FA 12 05 92         [24] 1690 	lcall	__sdcc_banked_call
                                   1691 ;	../../../platform/cc2530dk/./contiki-main.c:300: watchdog_init();
      0002FD 78 29            [12] 1692 	mov	r0,#_watchdog_init
      0002FF 79 84            [12] 1693 	mov	r1,#(_watchdog_init >> 8)
      000301 7A 04            [12] 1694 	mov	r2,#(_watchdog_init >> 16)
      000303 12 05 92         [24] 1695 	lcall	__sdcc_banked_call
                                   1696 ;	../../../platform/cc2530dk/./contiki-main.c:303: random_init(0);
      000306 90 00 00         [24] 1697 	mov	dptr,#0x0000
      000309 78 FF            [12] 1698 	mov	r0,#_random_init
      00030B 79 BF            [12] 1699 	mov	r1,#(_random_init >> 8)
      00030D 7A 02            [12] 1700 	mov	r2,#(_random_init >> 16)
      00030F 12 05 92         [24] 1701 	lcall	__sdcc_banked_call
                                   1702 ;	../../../platform/cc2530dk/./contiki-main.c:306: process_start(&etimer_process, NULL);
      000312 E4               [12] 1703 	clr	a
      000313 C0 E0            [24] 1704 	push	acc
      000315 C0 E0            [24] 1705 	push	acc
      000317 C0 E0            [24] 1706 	push	acc
      000319 90 18 61         [24] 1707 	mov	dptr,#_etimer_process
      00031C 75 F0 00         [24] 1708 	mov	b,#0x00
      00031F 78 A3            [12] 1709 	mov	r0,#_process_start
      000321 79 8A            [12] 1710 	mov	r1,#(_process_start >> 8)
      000323 7A 03            [12] 1711 	mov	r2,#(_process_start >> 16)
      000325 12 05 92         [24] 1712 	lcall	__sdcc_banked_call
      000328 15 81            [12] 1713 	dec	sp
      00032A 15 81            [12] 1714 	dec	sp
      00032C 15 81            [12] 1715 	dec	sp
                                   1716 ;	../../../platform/cc2530dk/./contiki-main.c:307: ctimer_init();
      00032E 78 D6            [12] 1717 	mov	r0,#_ctimer_init
      000330 79 BA            [12] 1718 	mov	r1,#(_ctimer_init >> 8)
      000332 7A 04            [12] 1719 	mov	r2,#(_ctimer_init >> 16)
      000334 12 05 92         [24] 1720 	lcall	__sdcc_banked_call
                                   1721 ;	../../../platform/cc2530dk/./contiki-main.c:310: netstack_init();
      000337 78 74            [12] 1722 	mov	r0,#_netstack_init
      000339 79 8D            [12] 1723 	mov	r1,#(_netstack_init >> 8)
      00033B 7A 04            [12] 1724 	mov	r2,#(_netstack_init >> 16)
      00033D 12 05 92         [24] 1725 	lcall	__sdcc_banked_call
                                   1726 ;	../../../platform/cc2530dk/./contiki-main.c:311: set_rime_addr();
      000340 12 01 8F         [24] 1727 	lcall	_set_rime_addr
                                   1728 ;	../../../platform/cc2530dk/./contiki-main.c:315: memcpy(&uip_lladdr.addr, &rimeaddr_node_addr, sizeof(uip_lladdr.addr));
      000343 74 08            [12] 1729 	mov	a,#0x08
      000345 C0 E0            [24] 1730 	push	acc
      000347 E4               [12] 1731 	clr	a
      000348 C0 E0            [24] 1732 	push	acc
      00034A 74 F0            [12] 1733 	mov	a,#_rimeaddr_node_addr
      00034C C0 E0            [24] 1734 	push	acc
      00034E 74 10            [12] 1735 	mov	a,#(_rimeaddr_node_addr >> 8)
      000350 C0 E0            [24] 1736 	push	acc
      000352 E4               [12] 1737 	clr	a
      000353 C0 E0            [24] 1738 	push	acc
      000355 90 0A 12         [24] 1739 	mov	dptr,#_uip_lladdr
      000358 75 F0 00         [24] 1740 	mov	b,#0x00
      00035B 78 AF            [12] 1741 	mov	r0,#___memcpy
      00035D 79 4C            [12] 1742 	mov	r1,#(___memcpy >> 8)
      00035F 7A 00            [12] 1743 	mov	r2,#(___memcpy >> 16)
      000361 12 05 92         [24] 1744 	lcall	__sdcc_banked_call
      000364 E5 81            [12] 1745 	mov	a,sp
      000366 24 FB            [12] 1746 	add	a,#0xfb
      000368 F5 81            [12] 1747 	mov	sp,a
                                   1748 ;	../../../platform/cc2530dk/./contiki-main.c:316: queuebuf_init();
      00036A 78 23            [12] 1749 	mov	r0,#_queuebuf_init
      00036C 79 91            [12] 1750 	mov	r1,#(_queuebuf_init >> 8)
      00036E 7A 04            [12] 1751 	mov	r2,#(_queuebuf_init >> 16)
      000370 12 05 92         [24] 1752 	lcall	__sdcc_banked_call
                                   1753 ;	../../../platform/cc2530dk/./contiki-main.c:317: process_start(&tcpip_process, NULL);
      000373 E4               [12] 1754 	clr	a
      000374 C0 E0            [24] 1755 	push	acc
      000376 C0 E0            [24] 1756 	push	acc
      000378 C0 E0            [24] 1757 	push	acc
      00037A 90 18 D3         [24] 1758 	mov	dptr,#_tcpip_process
      00037D 75 F0 00         [24] 1759 	mov	b,#0x00
      000380 78 A3            [12] 1760 	mov	r0,#_process_start
      000382 79 8A            [12] 1761 	mov	r1,#(_process_start >> 8)
      000384 7A 03            [12] 1762 	mov	r2,#(_process_start >> 16)
      000386 12 05 92         [24] 1763 	lcall	__sdcc_banked_call
      000389 15 81            [12] 1764 	dec	sp
      00038B 15 81            [12] 1765 	dec	sp
      00038D 15 81            [12] 1766 	dec	sp
                                   1767 ;	../../../platform/cc2530dk/./contiki-main.c:321: process_start(&viztool_process, NULL);
      00038F E4               [12] 1768 	clr	a
      000390 C0 E0            [24] 1769 	push	acc
      000392 C0 E0            [24] 1770 	push	acc
      000394 C0 E0            [24] 1771 	push	acc
      000396 90 18 9A         [24] 1772 	mov	dptr,#_viztool_process
      000399 75 F0 00         [24] 1773 	mov	b,#0x00
      00039C 78 A3            [12] 1774 	mov	r0,#_process_start
      00039E 79 8A            [12] 1775 	mov	r1,#(_process_start >> 8)
      0003A0 7A 03            [12] 1776 	mov	r2,#(_process_start >> 16)
      0003A2 12 05 92         [24] 1777 	lcall	__sdcc_banked_call
      0003A5 15 81            [12] 1778 	dec	sp
      0003A7 15 81            [12] 1779 	dec	sp
      0003A9 15 81            [12] 1780 	dec	sp
                                   1781 ;	../../../platform/cc2530dk/./contiki-main.c:324: energest_init();
      0003AB 78 AA            [12] 1782 	mov	r0,#_energest_init
      0003AD 79 05            [12] 1783 	mov	r1,#(_energest_init >> 8)
      0003AF 7A 00            [12] 1784 	mov	r2,#(_energest_init >> 16)
      0003B1 12 05 92         [24] 1785 	lcall	__sdcc_banked_call
                                   1786 ;	../../../platform/cc2530dk/./contiki-main.c:327: autostart_start(autostart_processes);
      0003B4 90 73 7F         [24] 1787 	mov	dptr,#_autostart_processes
      0003B7 75 F0 80         [24] 1788 	mov	b,#0x80
      0003BA 78 91            [12] 1789 	mov	r0,#_autostart_start
      0003BC 79 8F            [12] 1790 	mov	r1,#(_autostart_start >> 8)
      0003BE 7A 04            [12] 1791 	mov	r2,#(_autostart_start >> 16)
      0003C0 12 05 92         [24] 1792 	lcall	__sdcc_banked_call
                                   1793 ;	../../../platform/cc2530dk/./contiki-main.c:329: watchdog_start();
      0003C3 78 2F            [12] 1794 	mov	r0,#_watchdog_start
      0003C5 79 84            [12] 1795 	mov	r1,#(_watchdog_start >> 8)
      0003C7 7A 04            [12] 1796 	mov	r2,#(_watchdog_start >> 16)
      0003C9 12 05 92         [24] 1797 	lcall	__sdcc_banked_call
                                   1798 ;	../../../platform/cc2530dk/./contiki-main.c:333: do {
      0003CC                       1799 00113$:
                                   1800 ;	../../../platform/cc2530dk/./contiki-main.c:335: watchdog_periodic();
      0003CC 78 35            [12] 1801 	mov	r0,#_watchdog_periodic
      0003CE 79 84            [12] 1802 	mov	r1,#(_watchdog_periodic >> 8)
      0003D0 7A 04            [12] 1803 	mov	r2,#(_watchdog_periodic >> 16)
      0003D2 12 05 92         [24] 1804 	lcall	__sdcc_banked_call
                                   1805 ;	../../../platform/cc2530dk/./contiki-main.c:338: if(sleep_flag) {
      0003D5 90 0A 11         [24] 1806 	mov	dptr,#_sleep_flag
      0003D8 E0               [24] 1807 	movx	a,@dptr
      0003D9 60 57            [24] 1808 	jz	00112$
                                   1809 ;	../../../platform/cc2530dk/./contiki-main.c:339: if(etimer_pending() &&
      0003DB 78 89            [12] 1810 	mov	r0,#_etimer_pending
      0003DD 79 9C            [12] 1811 	mov	r1,#(_etimer_pending >> 8)
      0003DF 7A 03            [12] 1812 	mov	r2,#(_etimer_pending >> 16)
      0003E1 12 05 92         [24] 1813 	lcall	__sdcc_banked_call
      0003E4 E5 82            [12] 1814 	mov	a,dpl
      0003E6 85 83 F0         [24] 1815 	mov	b,dph
      0003E9 45 F0            [12] 1816 	orl	a,b
      0003EB 60 40            [24] 1817 	jz	00109$
                                   1818 ;	../../../platform/cc2530dk/./contiki-main.c:340: (etimer_next_expiration_time() - clock_time() - 1) > MAX_TICKS) {
      0003ED 78 A7            [12] 1819 	mov	r0,#_etimer_next_expiration_time
      0003EF 79 9C            [12] 1820 	mov	r1,#(_etimer_next_expiration_time >> 8)
      0003F1 7A 03            [12] 1821 	mov	r2,#(_etimer_next_expiration_time >> 16)
      0003F3 12 05 92         [24] 1822 	lcall	__sdcc_banked_call
      0003F6 AE 82            [24] 1823 	mov	r6,dpl
      0003F8 AF 83            [24] 1824 	mov	r7,dph
      0003FA C0 07            [24] 1825 	push	ar7
      0003FC C0 06            [24] 1826 	push	ar6
      0003FE 78 1B            [12] 1827 	mov	r0,#_clock_time
      000400 79 06            [12] 1828 	mov	r1,#(_clock_time >> 8)
      000402 7A 00            [12] 1829 	mov	r2,#(_clock_time >> 16)
      000404 12 05 92         [24] 1830 	lcall	__sdcc_banked_call
      000407 AC 82            [24] 1831 	mov	r4,dpl
      000409 AD 83            [24] 1832 	mov	r5,dph
      00040B D0 06            [24] 1833 	pop	ar6
      00040D D0 07            [24] 1834 	pop	ar7
      00040F EE               [12] 1835 	mov	a,r6
      000410 C3               [12] 1836 	clr	c
      000411 9C               [12] 1837 	subb	a,r4
      000412 FE               [12] 1838 	mov	r6,a
      000413 EF               [12] 1839 	mov	a,r7
      000414 9D               [12] 1840 	subb	a,r5
      000415 FF               [12] 1841 	mov	r7,a
      000416 1E               [12] 1842 	dec	r6
      000417 BE FF 01         [24] 1843 	cjne	r6,#0xff,00175$
      00041A 1F               [12] 1844 	dec	r7
      00041B                       1845 00175$:
      00041B C3               [12] 1846 	clr	c
      00041C 74 FF            [12] 1847 	mov	a,#0xff
      00041E 9E               [12] 1848 	subb	a,r6
      00041F 74 7F            [12] 1849 	mov	a,#0x7f
      000421 9F               [12] 1850 	subb	a,r7
      000422 50 09            [24] 1851 	jnc	00109$
                                   1852 ;	../../../platform/cc2530dk/./contiki-main.c:341: etimer_request_poll();
      000424 78 EF            [12] 1853 	mov	r0,#_etimer_request_poll
      000426 79 99            [12] 1854 	mov	r1,#(_etimer_request_poll >> 8)
      000428 7A 03            [12] 1855 	mov	r2,#(_etimer_request_poll >> 16)
      00042A 12 05 92         [24] 1856 	lcall	__sdcc_banked_call
      00042D                       1857 00109$:
                                   1858 ;	../../../platform/cc2530dk/./contiki-main.c:343: sleep_flag = 0;
      00042D 90 0A 11         [24] 1859 	mov	dptr,#_sleep_flag
      000430 E4               [12] 1860 	clr	a
      000431 F0               [24] 1861 	movx	@dptr,a
      000432                       1862 00112$:
                                   1863 ;	../../../platform/cc2530dk/./contiki-main.c:346: r = process_run();
      000432 78 1B            [12] 1864 	mov	r0,#_process_run
      000434 79 92            [12] 1865 	mov	r1,#(_process_run >> 8)
      000436 7A 03            [12] 1866 	mov	r2,#(_process_run >> 16)
      000438 12 05 92         [24] 1867 	lcall	__sdcc_banked_call
      00043B AE 82            [24] 1868 	mov	r6,dpl
      00043D AF 83            [24] 1869 	mov	r7,dph
                                   1870 ;	../../../platform/cc2530dk/./contiki-main.c:347: } while(r > 0);
      00043F EE               [12] 1871 	mov	a,r6
      000440 70 8A            [24] 1872 	jnz	00113$
                                   1873 ;	../../../platform/cc2530dk/./contiki-main.c:348: len = NETSTACK_RADIO.pending_packet();
      000442 90 7D 1B         [24] 1874 	mov	dptr,#(_cc2530_rf_driver + 0x0015)
      000445 E4               [12] 1875 	clr	a
      000446 93               [24] 1876 	movc	a,@a+dptr
      000447 FD               [12] 1877 	mov	r5,a
      000448 A3               [24] 1878 	inc	dptr
      000449 E4               [12] 1879 	clr	a
      00044A 93               [24] 1880 	movc	a,@a+dptr
      00044B FE               [12] 1881 	mov	r6,a
      00044C A3               [24] 1882 	inc	dptr
      00044D E4               [12] 1883 	clr	a
      00044E 93               [24] 1884 	movc	a,@a+dptr
      00044F FF               [12] 1885 	mov	r7,a
      000450 C0 07            [24] 1886 	push	ar7
      000452 C0 06            [24] 1887 	push	ar6
      000454 C0 05            [24] 1888 	push	ar5
      000456 C0 05            [24] 1889 	push	ar5
      000458 C0 06            [24] 1890 	push	ar6
      00045A C0 07            [24] 1891 	push	ar7
      00045C D0 02            [24] 1892 	pop	ar2
      00045E D0 01            [24] 1893 	pop	ar1
      000460 D0 00            [24] 1894 	pop	ar0
      000462 12 05 92         [24] 1895 	lcall	__sdcc_banked_call
      000465 85 82 08         [24] 1896 	mov	_len,dpl
      000468 85 83 09         [24] 1897 	mov	(_len + 1),dph
      00046B D0 05            [24] 1898 	pop	ar5
      00046D D0 06            [24] 1899 	pop	ar6
      00046F D0 07            [24] 1900 	pop	ar7
                                   1901 ;	../../../platform/cc2530dk/./contiki-main.c:349: if(len) {
      000471 E5 08            [12] 1902 	mov	a,_len
      000473 45 09            [12] 1903 	orl	a,(_len + 1)
      000475 70 03            [24] 1904 	jnz	00178$
      000477 02 03 CC         [24] 1905 	ljmp	00113$
      00047A                       1906 00178$:
                                   1907 ;	../../../platform/cc2530dk/./contiki-main.c:350: packetbuf_clear();
      00047A 78 ED            [12] 1908 	mov	r0,#_packetbuf_clear
      00047C 79 97            [12] 1909 	mov	r1,#(_packetbuf_clear >> 8)
      00047E 7A 04            [12] 1910 	mov	r2,#(_packetbuf_clear >> 16)
      000480 12 05 92         [24] 1911 	lcall	__sdcc_banked_call
                                   1912 ;	../../../platform/cc2530dk/./contiki-main.c:351: len = NETSTACK_RADIO.read(packetbuf_dataptr(), PACKETBUF_SIZE);
      000483 90 7D 12         [24] 1913 	mov	dptr,#(_cc2530_rf_driver + 0x000c)
      000486 E4               [12] 1914 	clr	a
      000487 93               [24] 1915 	movc	a,@a+dptr
      000488 FD               [12] 1916 	mov	r5,a
      000489 A3               [24] 1917 	inc	dptr
      00048A E4               [12] 1918 	clr	a
      00048B 93               [24] 1919 	movc	a,@a+dptr
      00048C FE               [12] 1920 	mov	r6,a
      00048D A3               [24] 1921 	inc	dptr
      00048E E4               [12] 1922 	clr	a
      00048F 93               [24] 1923 	movc	a,@a+dptr
      000490 FF               [12] 1924 	mov	r7,a
      000491 C0 07            [24] 1925 	push	ar7
      000493 C0 06            [24] 1926 	push	ar6
      000495 C0 05            [24] 1927 	push	ar5
      000497 78 2D            [12] 1928 	mov	r0,#_packetbuf_dataptr
      000499 79 9C            [12] 1929 	mov	r1,#(_packetbuf_dataptr >> 8)
      00049B 7A 04            [12] 1930 	mov	r2,#(_packetbuf_dataptr >> 16)
      00049D 12 05 92         [24] 1931 	lcall	__sdcc_banked_call
      0004A0 AA 82            [24] 1932 	mov	r2,dpl
      0004A2 AB 83            [24] 1933 	mov	r3,dph
      0004A4 AC F0            [24] 1934 	mov	r4,b
      0004A6 D0 05            [24] 1935 	pop	ar5
      0004A8 D0 06            [24] 1936 	pop	ar6
      0004AA D0 07            [24] 1937 	pop	ar7
      0004AC C0 07            [24] 1938 	push	ar7
      0004AE C0 06            [24] 1939 	push	ar6
      0004B0 C0 05            [24] 1940 	push	ar5
      0004B2 74 80            [12] 1941 	mov	a,#0x80
      0004B4 C0 E0            [24] 1942 	push	acc
      0004B6 E4               [12] 1943 	clr	a
      0004B7 C0 E0            [24] 1944 	push	acc
      0004B9 C0 05            [24] 1945 	push	ar5
      0004BB C0 06            [24] 1946 	push	ar6
      0004BD C0 07            [24] 1947 	push	ar7
      0004BF 8A 82            [24] 1948 	mov	dpl,r2
      0004C1 8B 83            [24] 1949 	mov	dph,r3
      0004C3 8C F0            [24] 1950 	mov	b,r4
      0004C5 D0 02            [24] 1951 	pop	ar2
      0004C7 D0 01            [24] 1952 	pop	ar1
      0004C9 D0 00            [24] 1953 	pop	ar0
      0004CB 12 05 92         [24] 1954 	lcall	__sdcc_banked_call
      0004CE 85 82 08         [24] 1955 	mov	_len,dpl
      0004D1 85 83 09         [24] 1956 	mov	(_len + 1),dph
      0004D4 15 81            [12] 1957 	dec	sp
      0004D6 15 81            [12] 1958 	dec	sp
      0004D8 D0 05            [24] 1959 	pop	ar5
      0004DA D0 06            [24] 1960 	pop	ar6
      0004DC D0 07            [24] 1961 	pop	ar7
                                   1962 ;	../../../platform/cc2530dk/./contiki-main.c:352: if(len > 0) {
      0004DE E5 08            [12] 1963 	mov	a,_len
      0004E0 45 09            [12] 1964 	orl	a,(_len + 1)
      0004E2 70 03            [24] 1965 	jnz	00179$
      0004E4 02 03 CC         [24] 1966 	ljmp	00113$
      0004E7                       1967 00179$:
                                   1968 ;	../../../platform/cc2530dk/./contiki-main.c:353: packetbuf_set_datalen(len);
      0004E7 85 08 82         [24] 1969 	mov	dpl,_len
      0004EA 85 09 83         [24] 1970 	mov	dph,(_len + 1)
      0004ED 78 1F            [12] 1971 	mov	r0,#_packetbuf_set_datalen
      0004EF 79 9C            [12] 1972 	mov	r1,#(_packetbuf_set_datalen >> 8)
      0004F1 7A 04            [12] 1973 	mov	r2,#(_packetbuf_set_datalen >> 16)
      0004F3 12 05 92         [24] 1974 	lcall	__sdcc_banked_call
                                   1975 ;	../../../platform/cc2530dk/./contiki-main.c:354: NETSTACK_RDC.input();
      0004F6 90 7D BB         [24] 1976 	mov	dptr,#(_nullrdc_driver + 0x000c)
      0004F9 E4               [12] 1977 	clr	a
      0004FA 93               [24] 1978 	movc	a,@a+dptr
      0004FB FD               [12] 1979 	mov	r5,a
      0004FC A3               [24] 1980 	inc	dptr
      0004FD E4               [12] 1981 	clr	a
      0004FE 93               [24] 1982 	movc	a,@a+dptr
      0004FF FE               [12] 1983 	mov	r6,a
      000500 A3               [24] 1984 	inc	dptr
      000501 E4               [12] 1985 	clr	a
      000502 93               [24] 1986 	movc	a,@a+dptr
      000503 FF               [12] 1987 	mov	r7,a
      000504 C0 07            [24] 1988 	push	ar7
      000506 C0 06            [24] 1989 	push	ar6
      000508 C0 05            [24] 1990 	push	ar5
      00050A C0 05            [24] 1991 	push	ar5
      00050C C0 06            [24] 1992 	push	ar6
      00050E C0 07            [24] 1993 	push	ar7
      000510 D0 02            [24] 1994 	pop	ar2
      000512 D0 01            [24] 1995 	pop	ar1
      000514 D0 00            [24] 1996 	pop	ar0
      000516 12 05 92         [24] 1997 	lcall	__sdcc_banked_call
      000519 D0 05            [24] 1998 	pop	ar5
      00051B D0 06            [24] 1999 	pop	ar6
      00051D D0 07            [24] 2000 	pop	ar7
                                   2001 ;	../../../platform/cc2530dk/./contiki-main.c:421: }
      00051F 02 03 CC         [24] 2002 	ljmp	00113$
                                   2003 	.area CSEG    (CODE)
                                   2004 	.area CONST   (CODE)
      007315                       2005 ___str_0:
      007315 73 68 74 32 30 20 69  2006 	.ascii "sht20 init"
             6E 69 74
      00731F 0D                    2007 	.db 0x0d
      007320 0A                    2008 	.db 0x0a
      007321 00                    2009 	.db 0x00
      007322                       2010 ___str_1:
      007322 74 68 69 73 20 69 73  2011 	.ascii "this is print"
             20 70 72 69 6E 74
      00732F 0D                    2012 	.db 0x0d
      007330 0A                    2013 	.db 0x0a
      007331 00                    2014 	.db 0x00
      007332                       2015 ___str_2:
      007332 43 6F 6E 74 69 6B 69  2016 	.ascii "Contiki 2.6"
             20 32 2E 36
      00733D 0D                    2017 	.db 0x0d
      00733E 0A                    2018 	.db 0x0a
      00733F 00                    2019 	.db 0x00
      007340                       2020 ___str_3:
      007340 54 49 20 53 6D 61 72  2021 	.ascii "TI SmartRF05 EB"
             74 52 46 30 35 20 45
             42
      00734F 0A                    2022 	.db 0x0a
      007350 00                    2023 	.db 0x00
      007351                       2024 ___str_4:
      007351 63 63 32 35 33 30     2025 	.ascii "cc2530"
      007357 00                    2026 	.db 0x00
      007358                       2027 ___str_5:
      007358 63 63 32 35 33 31     2028 	.ascii "cc2531"
      00735E 00                    2029 	.db 0x00
      00735F                       2030 ___str_6:
      00735F 63 63 32 35 33 33     2031 	.ascii "cc2533"
      007365 00                    2032 	.db 0x00
      007366                       2033 ___str_7:
      007366 63 63 32 35 34 30     2034 	.ascii "cc2540"
      00736C 00                    2035 	.db 0x00
      00736D                       2036 ___str_8:
      00736D 2D 46 32 35 36 2C 20  2037 	.ascii "-F256, "
      007374 00                    2038 	.db 0x00
      007375                       2039 ___str_9:
      007375 4B 42 20 53 52 41 4D  2040 	.ascii "KB SRAM"
      00737C 0D                    2041 	.db 0x0d
      00737D 0A                    2042 	.db 0x0a
      00737E 00                    2043 	.db 0x00
                                   2044 	.area XINIT   (CODE)
                                   2045 	.area CABS    (ABS,CODE)
