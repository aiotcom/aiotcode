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
                                     12 	.globl _OLEDM_Init
                                     13 	.globl _SHT2x_Init
                                     14 	.globl _OLED_Init
                                     15 	.globl _printf
                                     16 	.globl _random_init
                                     17 	.globl _puthex
                                     18 	.globl _putstring
                                     19 	.globl _netstack_init
                                     20 	.globl _queuebuf_init
                                     21 	.globl _packetbuf_set_datalen
                                     22 	.globl _packetbuf_dataptr
                                     23 	.globl _packetbuf_clear
                                     24 	.globl _cc2530_rf_set_addr
                                     25 	.globl _uart1_set_input
                                     26 	.globl _uart1_init
                                     27 	.globl _leds_off
                                     28 	.globl _leds_on
                                     29 	.globl _serial_line_init
                                     30 	.globl _serial_line_input_byte
                                     31 	.globl _soc_init
                                     32 	.globl _energest_init
                                     33 	.globl _rtimer_init
                                     34 	.globl _ctimer_init
                                     35 	.globl _etimer_next_expiration_time
                                     36 	.globl _etimer_pending
                                     37 	.globl _etimer_request_poll
                                     38 	.globl _clock_time
                                     39 	.globl _clock_init
                                     40 	.globl _autostart_start
                                     41 	.globl _process_run
                                     42 	.globl _process_init
                                     43 	.globl _process_start
                                     44 	.globl ___memcpy
                                     45 	.globl _watchdog_periodic
                                     46 	.globl _watchdog_start
                                     47 	.globl _watchdog_init
                                     48 	.globl _ACTIVE
                                     49 	.globl _TX_BYTE
                                     50 	.globl _RX_BYTE
                                     51 	.globl _ERR
                                     52 	.globl _FE
                                     53 	.globl _SLAVE
                                     54 	.globl _RE
                                     55 	.globl _MODE
                                     56 	.globl _T3OVFIF
                                     57 	.globl _T3CH0IF
                                     58 	.globl _T3CH1IF
                                     59 	.globl _T4OVFIF
                                     60 	.globl _T4CH0IF
                                     61 	.globl _T4CH1IF
                                     62 	.globl _OVFIM
                                     63 	.globl _B_0
                                     64 	.globl _B_1
                                     65 	.globl _B_2
                                     66 	.globl _B_3
                                     67 	.globl _B_4
                                     68 	.globl _B_5
                                     69 	.globl _B_6
                                     70 	.globl _B_7
                                     71 	.globl _P2IF
                                     72 	.globl _UTX0IF
                                     73 	.globl _UTX1IF
                                     74 	.globl _P1IF
                                     75 	.globl _WDTIF
                                     76 	.globl _ACC_0
                                     77 	.globl _ACC_1
                                     78 	.globl _ACC_2
                                     79 	.globl _ACC_3
                                     80 	.globl _ACC_4
                                     81 	.globl _ACC_5
                                     82 	.globl _ACC_6
                                     83 	.globl _ACC_7
                                     84 	.globl _P
                                     85 	.globl _F1
                                     86 	.globl _OV
                                     87 	.globl _RS0
                                     88 	.globl _RS1
                                     89 	.globl _F0
                                     90 	.globl _AC
                                     91 	.globl _CY
                                     92 	.globl _DMAIF
                                     93 	.globl _T1IF
                                     94 	.globl _T2IF
                                     95 	.globl _T3IF
                                     96 	.globl _T4IF
                                     97 	.globl _P0IF
                                     98 	.globl _STIF
                                     99 	.globl _DMAIE
                                    100 	.globl _T1IE
                                    101 	.globl _T2IE
                                    102 	.globl _T3IE
                                    103 	.globl _T4IE
                                    104 	.globl _P0IE
                                    105 	.globl _RFERRIE
                                    106 	.globl _ADCIE
                                    107 	.globl _URX0IE
                                    108 	.globl _URX1IE
                                    109 	.globl _ENCIE
                                    110 	.globl _STIE
                                    111 	.globl _EA
                                    112 	.globl _P2_0
                                    113 	.globl _P2_1
                                    114 	.globl _P2_2
                                    115 	.globl _P2_3
                                    116 	.globl _P2_4
                                    117 	.globl _P2_5
                                    118 	.globl _P2_6
                                    119 	.globl _P2_7
                                    120 	.globl _ENCIF_0
                                    121 	.globl _ENCIF_1
                                    122 	.globl _P1_0
                                    123 	.globl _P1_1
                                    124 	.globl _P1_2
                                    125 	.globl _P1_3
                                    126 	.globl _P1_4
                                    127 	.globl _P1_5
                                    128 	.globl _P1_6
                                    129 	.globl _P1_7
                                    130 	.globl _IT0
                                    131 	.globl _RFERRIF
                                    132 	.globl _IT1
                                    133 	.globl _URX0IF
                                    134 	.globl _ADCIF
                                    135 	.globl _URX1IF
                                    136 	.globl _P0_0
                                    137 	.globl _P0_1
                                    138 	.globl _P0_2
                                    139 	.globl _P0_3
                                    140 	.globl _P0_4
                                    141 	.globl _P0_5
                                    142 	.globl _P0_6
                                    143 	.globl _P0_7
                                    144 	.globl _WDCTL
                                    145 	.globl _U1GCR
                                    146 	.globl _U1UCR
                                    147 	.globl _U1BAUD
                                    148 	.globl _U1DBUF
                                    149 	.globl _U1CSR
                                    150 	.globl _U0GCR
                                    151 	.globl _U0UCR
                                    152 	.globl _U0BAUD
                                    153 	.globl _U0DBUF
                                    154 	.globl _U0CSR
                                    155 	.globl _TIMIF
                                    156 	.globl _T4CC1
                                    157 	.globl _T4CCTL1
                                    158 	.globl _T4CC0
                                    159 	.globl _T4CCTL0
                                    160 	.globl _T4CTL
                                    161 	.globl _T4CNT
                                    162 	.globl _T3CC1
                                    163 	.globl _T3CCTL1
                                    164 	.globl _T3CC0
                                    165 	.globl _T3CCTL0
                                    166 	.globl _T3CTL
                                    167 	.globl _T3CNT
                                    168 	.globl _T2MSEL
                                    169 	.globl _T2IRQM
                                    170 	.globl _T2MOVF2
                                    171 	.globl _T2MOVF1
                                    172 	.globl _T2MOVF0
                                    173 	.globl _T2M1
                                    174 	.globl _T2M0
                                    175 	.globl _T2IRQF
                                    176 	.globl _T2EVTCFG
                                    177 	.globl _T2CTRL
                                    178 	.globl _T1STAT
                                    179 	.globl _T1CCTL2
                                    180 	.globl _T1CCTL1
                                    181 	.globl _T1CCTL0
                                    182 	.globl _T1CTL
                                    183 	.globl _T1CNTH
                                    184 	.globl _T1CNTL
                                    185 	.globl _T1CC2H
                                    186 	.globl _T1CC2L
                                    187 	.globl _T1CC1H
                                    188 	.globl _T1CC1L
                                    189 	.globl _T1CC0H
                                    190 	.globl _T1CC0L
                                    191 	.globl _CLKCONSTA
                                    192 	.globl _CLKCONCMD
                                    193 	.globl _SLEEPSTA
                                    194 	.globl _SLEEPCMD
                                    195 	.globl _STLOAD
                                    196 	.globl _ST2
                                    197 	.globl _ST1
                                    198 	.globl _ST0
                                    199 	.globl _RFERRF
                                    200 	.globl _RFIRQF0
                                    201 	.globl _RFST
                                    202 	.globl _RFD
                                    203 	.globl _RFIRQF1
                                    204 	.globl _PSBANK
                                    205 	.globl _FMAP
                                    206 	.globl _MEMCTR
                                    207 	.globl __XPAGE
                                    208 	.globl _MPAGE
                                    209 	.globl _PMUX
                                    210 	.globl _P2DIR
                                    211 	.globl _P1DIR
                                    212 	.globl _P0DIR
                                    213 	.globl _P2INP
                                    214 	.globl _P1INP
                                    215 	.globl _P2SEL
                                    216 	.globl _P1SEL
                                    217 	.globl _P0SEL
                                    218 	.globl _APCFG
                                    219 	.globl _PERCFG
                                    220 	.globl _P0INP
                                    221 	.globl _P2IEN
                                    222 	.globl _P1IEN
                                    223 	.globl _P0IEN
                                    224 	.globl _PICTL
                                    225 	.globl _P2IFG
                                    226 	.globl _P1IFG
                                    227 	.globl _P0IFG
                                    228 	.globl _DMAREQ
                                    229 	.globl _DMAARM
                                    230 	.globl _DMA0CFGH
                                    231 	.globl _DMA0CFGL
                                    232 	.globl _DMA1CFGH
                                    233 	.globl _DMA1CFGL
                                    234 	.globl _DMAIRQ
                                    235 	.globl _ENCCS
                                    236 	.globl _ENCDO
                                    237 	.globl _ENCDI
                                    238 	.globl _RNDH
                                    239 	.globl _RNDL
                                    240 	.globl _ADCH
                                    241 	.globl _ADCL
                                    242 	.globl _ADCCON3
                                    243 	.globl _ADCCON2
                                    244 	.globl _ADCCON1
                                    245 	.globl _B
                                    246 	.globl _IRCON2
                                    247 	.globl _ACC
                                    248 	.globl _PSW
                                    249 	.globl _IRCON
                                    250 	.globl _IP1
                                    251 	.globl _IEN1
                                    252 	.globl _IP0
                                    253 	.globl _IEN0
                                    254 	.globl _P2
                                    255 	.globl _S1CON
                                    256 	.globl _IEN2
                                    257 	.globl _S0CON
                                    258 	.globl _DPS
                                    259 	.globl _P1
                                    260 	.globl _TCON
                                    261 	.globl _PCON
                                    262 	.globl _DPH1
                                    263 	.globl _DPL1
                                    264 	.globl _DPH0
                                    265 	.globl _DPL0
                                    266 	.globl _SP
                                    267 	.globl _P0
                                    268 	.globl _X_IEEE_ADDR
                                    269 	.globl _X_INFOPAGE
                                    270 	.globl _X_P2DIR
                                    271 	.globl _X_P1DIR
                                    272 	.globl _X_P0DIR
                                    273 	.globl _X_U1GCR
                                    274 	.globl _X_U1UCR
                                    275 	.globl _X_U1BAUD
                                    276 	.globl _X_U1DBUF
                                    277 	.globl _X_U1CSR
                                    278 	.globl _X_P2INP
                                    279 	.globl _X_P1INP
                                    280 	.globl _X_P2SEL
                                    281 	.globl _X_P1SEL
                                    282 	.globl _X_P0SEL
                                    283 	.globl _X_APCFG
                                    284 	.globl _X_PERCFG
                                    285 	.globl _X_T4CC1
                                    286 	.globl _X_T4CCTL1
                                    287 	.globl _X_T4CC0
                                    288 	.globl _X_T4CCTL0
                                    289 	.globl _X_T4CTL
                                    290 	.globl _X_T4CNT
                                    291 	.globl _X_RFIRQF0
                                    292 	.globl _X_T1CCTL2
                                    293 	.globl _X_T1CCTL1
                                    294 	.globl _X_T1CCTL0
                                    295 	.globl _X_T1CTL
                                    296 	.globl _X_T1CNTH
                                    297 	.globl _X_T1CNTL
                                    298 	.globl _X_RFST
                                    299 	.globl _X_T1CC2H
                                    300 	.globl _X_T1CC2L
                                    301 	.globl _X_T1CC1H
                                    302 	.globl _X_T1CC1L
                                    303 	.globl _X_T1CC0H
                                    304 	.globl _X_T1CC0L
                                    305 	.globl _X_RFD
                                    306 	.globl _X_TIMIF
                                    307 	.globl _X_DMAREQ
                                    308 	.globl _X_DMAARM
                                    309 	.globl _X_DMA0CFGH
                                    310 	.globl _X_DMA0CFGL
                                    311 	.globl _X_DMA1CFGH
                                    312 	.globl _X_DMA1CFGL
                                    313 	.globl _X_DMAIRQ
                                    314 	.globl _X_T3CC1
                                    315 	.globl _X_T3CCTL1
                                    316 	.globl _X_T3CC0
                                    317 	.globl _X_T3CCTL0
                                    318 	.globl _X_T3CTL
                                    319 	.globl _X_T3CNT
                                    320 	.globl _X_WDCTL
                                    321 	.globl _X_MEMCTR
                                    322 	.globl _X_CLKCONCMD
                                    323 	.globl _X_U0GCR
                                    324 	.globl _X_U0UCR
                                    325 	.globl _X_T2MSEL
                                    326 	.globl _X_U0BAUD
                                    327 	.globl _X_U0DBUF
                                    328 	.globl _X_RFERRF
                                    329 	.globl _X_SLEEPCMD
                                    330 	.globl _X_RNDH
                                    331 	.globl _X_RNDL
                                    332 	.globl _X_ADCH
                                    333 	.globl _X_ADCL
                                    334 	.globl _X_ADCCON3
                                    335 	.globl _X_ADCCON2
                                    336 	.globl _X_ADCCON1
                                    337 	.globl _X_ENCCS
                                    338 	.globl _X_ENCDO
                                    339 	.globl _X_ENCDI
                                    340 	.globl _X_T1STAT
                                    341 	.globl _X_PMUX
                                    342 	.globl _X_STLOAD
                                    343 	.globl _X_P2IEN
                                    344 	.globl _X_P0IEN
                                    345 	.globl _X_T2IRQM
                                    346 	.globl _X_T2MOVF2
                                    347 	.globl _X_T2MOVF1
                                    348 	.globl _X_T2MOVF0
                                    349 	.globl _X_T2M1
                                    350 	.globl _X_T2M0
                                    351 	.globl _X_T2IRQF
                                    352 	.globl _X_P2
                                    353 	.globl _X_PSBANK
                                    354 	.globl _X_FMAP
                                    355 	.globl _X_CLKCONSTA
                                    356 	.globl _X_SLEEPSTA
                                    357 	.globl _X_T2EVTCFG
                                    358 	.globl _X_ST2
                                    359 	.globl _X_ST1
                                    360 	.globl _X_ST0
                                    361 	.globl _X_T2CTRL
                                    362 	.globl _X__XPAGE
                                    363 	.globl _X_MPAGE
                                    364 	.globl _X_RFIRQF1
                                    365 	.globl _X_P1
                                    366 	.globl _X_P0INP
                                    367 	.globl _X_P1IEN
                                    368 	.globl _X_PICTL
                                    369 	.globl _X_P2IFG
                                    370 	.globl _X_P1IFG
                                    371 	.globl _X_P0IFG
                                    372 	.globl _X_U0CSR
                                    373 	.globl _X_P0
                                    374 	.globl _USBF5
                                    375 	.globl _USBF4
                                    376 	.globl _USBF3
                                    377 	.globl _USBF2
                                    378 	.globl _USBF1
                                    379 	.globl _USBF0
                                    380 	.globl _USBCNTH
                                    381 	.globl _USBCNTL
                                    382 	.globl _USBCNT0
                                    383 	.globl _USBCSOH
                                    384 	.globl _USBCSOL
                                    385 	.globl _USBMAXO
                                    386 	.globl _USBCSIH
                                    387 	.globl _USBCSIL
                                    388 	.globl _USBCS0
                                    389 	.globl _USBMAXI
                                    390 	.globl _USBCTRL
                                    391 	.globl _USBINDEX
                                    392 	.globl _USBFRMH
                                    393 	.globl _USBFRML
                                    394 	.globl _USBCIE
                                    395 	.globl _USBOIE
                                    396 	.globl _USBIIE
                                    397 	.globl _USBCIF
                                    398 	.globl _USBOIF
                                    399 	.globl _USBIIF
                                    400 	.globl _USBPOW
                                    401 	.globl _USBADDR
                                    402 	.globl _CSPT
                                    403 	.globl _CSPZ
                                    404 	.globl _CSPY
                                    405 	.globl _CSPX
                                    406 	.globl _CSPSTAT
                                    407 	.globl _CSPCTRL
                                    408 	.globl _CSPPROG23
                                    409 	.globl _CSPPROG22
                                    410 	.globl _CSPPROG21
                                    411 	.globl _CSPPROG20
                                    412 	.globl _CSPPROG19
                                    413 	.globl _CSPPROG18
                                    414 	.globl _CSPPROG17
                                    415 	.globl _CSPPROG16
                                    416 	.globl _CSPPROG15
                                    417 	.globl _CSPPROG14
                                    418 	.globl _CSPPROG13
                                    419 	.globl _CSPPROG12
                                    420 	.globl _CSPPROG11
                                    421 	.globl _CSPPROG10
                                    422 	.globl _CSPPROG9
                                    423 	.globl _CSPPROG8
                                    424 	.globl _CSPPROG7
                                    425 	.globl _CSPPROG6
                                    426 	.globl _CSPPROG5
                                    427 	.globl _CSPPROG4
                                    428 	.globl _CSPPROG3
                                    429 	.globl _CSPPROG2
                                    430 	.globl _CSPPROG1
                                    431 	.globl _CSPPROG0
                                    432 	.globl _RFC_OBS_CTRL2
                                    433 	.globl _RFC_OBS_CTRL1
                                    434 	.globl _RFC_OBS_CTRL0
                                    435 	.globl _TXFILTCFG
                                    436 	.globl _PTEST1
                                    437 	.globl _PTEST0
                                    438 	.globl _ATEST
                                    439 	.globl _DACTEST2
                                    440 	.globl _DACTEST1
                                    441 	.globl _DACTEST0
                                    442 	.globl _MDMTEST1
                                    443 	.globl _MDMTEST0
                                    444 	.globl _ADCTEST2
                                    445 	.globl _ADCTEST1
                                    446 	.globl _ADCTEST0
                                    447 	.globl _AGCCTRL3
                                    448 	.globl _AGCCTRL2
                                    449 	.globl _AGCCTRL1
                                    450 	.globl _AGCCTRL0
                                    451 	.globl _FSCAL3
                                    452 	.globl _FSCAL2
                                    453 	.globl _FSCAL1
                                    454 	.globl _FSCAL0
                                    455 	.globl _FSCTRL
                                    456 	.globl _RXCTRL
                                    457 	.globl _FREQEST
                                    458 	.globl _MDMCTRL1
                                    459 	.globl _MDMCTRL0
                                    460 	.globl _RFRND
                                    461 	.globl _RFERRM
                                    462 	.globl _RFIRQM1
                                    463 	.globl _RFIRQM0
                                    464 	.globl _TXLAST_PTR
                                    465 	.globl _TXFIRST_PTR
                                    466 	.globl _RXP1_PTR
                                    467 	.globl _RXLAST_PTR
                                    468 	.globl _RXFIRST_PTR
                                    469 	.globl _TXFIFOCNT
                                    470 	.globl _RXFIFOCNT
                                    471 	.globl _RXFIRST
                                    472 	.globl _RSSISTAT
                                    473 	.globl _RSSI
                                    474 	.globl _CCACTRL1
                                    475 	.globl _CCACTRL0
                                    476 	.globl _FSMCTRL
                                    477 	.globl _FIFOPCTRL
                                    478 	.globl _FSMSTAT1
                                    479 	.globl _FSMSTAT0
                                    480 	.globl _TXCTRL
                                    481 	.globl _TXPOWER
                                    482 	.globl _FREQCTRL
                                    483 	.globl _FREQTUNE
                                    484 	.globl _RXMASKCLR
                                    485 	.globl _RXMASKSET
                                    486 	.globl _RXENABLE
                                    487 	.globl _FRMCTRL1
                                    488 	.globl _FRMCTRL0
                                    489 	.globl _SRCEXTEN2
                                    490 	.globl _SRCEXTEN1
                                    491 	.globl _SRCEXTEN0
                                    492 	.globl _SRCSHORTEN2
                                    493 	.globl _SRCSHORTEN1
                                    494 	.globl _SRCSHORTEN0
                                    495 	.globl _SRCMATCH
                                    496 	.globl _FRMFILT1
                                    497 	.globl _FRMFILT0
                                    498 	.globl _SHORT_ADDR1
                                    499 	.globl _SHORT_ADDR0
                                    500 	.globl _PAN_ID1
                                    501 	.globl _PAN_ID0
                                    502 	.globl _EXT_ADDR7
                                    503 	.globl _EXT_ADDR6
                                    504 	.globl _EXT_ADDR5
                                    505 	.globl _EXT_ADDR4
                                    506 	.globl _EXT_ADDR3
                                    507 	.globl _EXT_ADDR2
                                    508 	.globl _EXT_ADDR1
                                    509 	.globl _EXT_ADDR0
                                    510 	.globl _SRCSHORTPENDEN2
                                    511 	.globl _SRCSHORTPENDEN1
                                    512 	.globl _SRCSHORTPENDEN0
                                    513 	.globl _SRCEXTPENDEN2
                                    514 	.globl _SRCEXTPENDEN1
                                    515 	.globl _SRCEXTPENDEN0
                                    516 	.globl _SRCRESINDEX
                                    517 	.globl _SRCRESMASK2
                                    518 	.globl _SRCRESMASK1
                                    519 	.globl _SRCRESMASK0
                                    520 	.globl _SRC_ADDR_TABLE
                                    521 	.globl _TXFIFO
                                    522 	.globl _RXFIFO
                                    523 	.globl _RFCORE_RAM
                                    524 	.globl _CMPCTL
                                    525 	.globl _OPAMPS
                                    526 	.globl _OPAMPC
                                    527 	.globl _STCV2
                                    528 	.globl _STCV1
                                    529 	.globl _STCV0
                                    530 	.globl _STCS
                                    531 	.globl _STCC
                                    532 	.globl _T1CC4H
                                    533 	.globl _T1CC4L
                                    534 	.globl _T1CC3H
                                    535 	.globl _T1CC3L
                                    536 	.globl _XX_T1CC2H
                                    537 	.globl _XX_T1CC2L
                                    538 	.globl _XX_T1CC1H
                                    539 	.globl _XX_T1CC1L
                                    540 	.globl _XX_T1CC0H
                                    541 	.globl _XX_T1CC0L
                                    542 	.globl _T1CCTL4
                                    543 	.globl _T1CCTL3
                                    544 	.globl _XX_T1CCTL2
                                    545 	.globl _XX_T1CCTL1
                                    546 	.globl _XX_T1CCTL0
                                    547 	.globl _CLD
                                    548 	.globl _IRCTL
                                    549 	.globl _CHIPINFO1
                                    550 	.globl _CHIPINFO0
                                    551 	.globl _FWDATA
                                    552 	.globl _FADDRH
                                    553 	.globl _FADDRL
                                    554 	.globl _FCTL
                                    555 	.globl _IVCTRL
                                    556 	.globl _BATTMON
                                    557 	.globl _SRCRC
                                    558 	.globl _DBGDATA
                                    559 	.globl _TESTREG0
                                    560 	.globl _CHIPID
                                    561 	.globl _CHVER
                                    562 	.globl _OBSSEL5
                                    563 	.globl _OBSSEL4
                                    564 	.globl _OBSSEL3
                                    565 	.globl _OBSSEL2
                                    566 	.globl _OBSSEL1
                                    567 	.globl _OBSSEL0
                                    568 	.globl _I2CIO
                                    569 	.globl _I2CWC
                                    570 	.globl _I2CADDR
                                    571 	.globl _I2CDATA
                                    572 	.globl _I2CSTAT
                                    573 	.globl _I2CCFG
                                    574 	.globl _OPAMPMC
                                    575 	.globl _MONMUX
                                    576 ;--------------------------------------------------------
                                    577 ; special function registers
                                    578 ;--------------------------------------------------------
                                    579 	.area RSEG    (ABS,DATA)
      000000                        580 	.org 0x0000
                           000080   581 _P0	=	0x0080
                           000081   582 _SP	=	0x0081
                           000082   583 _DPL0	=	0x0082
                           000083   584 _DPH0	=	0x0083
                           000084   585 _DPL1	=	0x0084
                           000085   586 _DPH1	=	0x0085
                           000087   587 _PCON	=	0x0087
                           000088   588 _TCON	=	0x0088
                           000090   589 _P1	=	0x0090
                           000092   590 _DPS	=	0x0092
                           000098   591 _S0CON	=	0x0098
                           00009A   592 _IEN2	=	0x009a
                           00009B   593 _S1CON	=	0x009b
                           0000A0   594 _P2	=	0x00a0
                           0000A8   595 _IEN0	=	0x00a8
                           0000A9   596 _IP0	=	0x00a9
                           0000B8   597 _IEN1	=	0x00b8
                           0000B9   598 _IP1	=	0x00b9
                           0000C0   599 _IRCON	=	0x00c0
                           0000D0   600 _PSW	=	0x00d0
                           0000E0   601 _ACC	=	0x00e0
                           0000E8   602 _IRCON2	=	0x00e8
                           0000F0   603 _B	=	0x00f0
                           0000B4   604 _ADCCON1	=	0x00b4
                           0000B5   605 _ADCCON2	=	0x00b5
                           0000B6   606 _ADCCON3	=	0x00b6
                           0000BA   607 _ADCL	=	0x00ba
                           0000BB   608 _ADCH	=	0x00bb
                           0000BC   609 _RNDL	=	0x00bc
                           0000BD   610 _RNDH	=	0x00bd
                           0000B1   611 _ENCDI	=	0x00b1
                           0000B2   612 _ENCDO	=	0x00b2
                           0000B3   613 _ENCCS	=	0x00b3
                           0000D1   614 _DMAIRQ	=	0x00d1
                           0000D2   615 _DMA1CFGL	=	0x00d2
                           0000D3   616 _DMA1CFGH	=	0x00d3
                           0000D4   617 _DMA0CFGL	=	0x00d4
                           0000D5   618 _DMA0CFGH	=	0x00d5
                           0000D6   619 _DMAARM	=	0x00d6
                           0000D7   620 _DMAREQ	=	0x00d7
                           000089   621 _P0IFG	=	0x0089
                           00008A   622 _P1IFG	=	0x008a
                           00008B   623 _P2IFG	=	0x008b
                           00008C   624 _PICTL	=	0x008c
                           0000AB   625 _P0IEN	=	0x00ab
                           00008D   626 _P1IEN	=	0x008d
                           0000AC   627 _P2IEN	=	0x00ac
                           00008F   628 _P0INP	=	0x008f
                           0000F1   629 _PERCFG	=	0x00f1
                           0000F2   630 _APCFG	=	0x00f2
                           0000F3   631 _P0SEL	=	0x00f3
                           0000F4   632 _P1SEL	=	0x00f4
                           0000F5   633 _P2SEL	=	0x00f5
                           0000F6   634 _P1INP	=	0x00f6
                           0000F7   635 _P2INP	=	0x00f7
                           0000FD   636 _P0DIR	=	0x00fd
                           0000FE   637 _P1DIR	=	0x00fe
                           0000FF   638 _P2DIR	=	0x00ff
                           0000AE   639 _PMUX	=	0x00ae
                           000093   640 _MPAGE	=	0x0093
                           000093   641 __XPAGE	=	0x0093
                           0000C7   642 _MEMCTR	=	0x00c7
                           00009F   643 _FMAP	=	0x009f
                           00009F   644 _PSBANK	=	0x009f
                           000091   645 _RFIRQF1	=	0x0091
                           0000D9   646 _RFD	=	0x00d9
                           0000E1   647 _RFST	=	0x00e1
                           0000E9   648 _RFIRQF0	=	0x00e9
                           0000BF   649 _RFERRF	=	0x00bf
                           000095   650 _ST0	=	0x0095
                           000096   651 _ST1	=	0x0096
                           000097   652 _ST2	=	0x0097
                           0000AD   653 _STLOAD	=	0x00ad
                           0000BE   654 _SLEEPCMD	=	0x00be
                           00009D   655 _SLEEPSTA	=	0x009d
                           0000C6   656 _CLKCONCMD	=	0x00c6
                           00009E   657 _CLKCONSTA	=	0x009e
                           0000DA   658 _T1CC0L	=	0x00da
                           0000DB   659 _T1CC0H	=	0x00db
                           0000DC   660 _T1CC1L	=	0x00dc
                           0000DD   661 _T1CC1H	=	0x00dd
                           0000DE   662 _T1CC2L	=	0x00de
                           0000DF   663 _T1CC2H	=	0x00df
                           0000E2   664 _T1CNTL	=	0x00e2
                           0000E3   665 _T1CNTH	=	0x00e3
                           0000E4   666 _T1CTL	=	0x00e4
                           0000E5   667 _T1CCTL0	=	0x00e5
                           0000E6   668 _T1CCTL1	=	0x00e6
                           0000E7   669 _T1CCTL2	=	0x00e7
                           0000AF   670 _T1STAT	=	0x00af
                           000094   671 _T2CTRL	=	0x0094
                           00009C   672 _T2EVTCFG	=	0x009c
                           0000A1   673 _T2IRQF	=	0x00a1
                           0000A2   674 _T2M0	=	0x00a2
                           0000A3   675 _T2M1	=	0x00a3
                           0000A4   676 _T2MOVF0	=	0x00a4
                           0000A5   677 _T2MOVF1	=	0x00a5
                           0000A6   678 _T2MOVF2	=	0x00a6
                           0000A7   679 _T2IRQM	=	0x00a7
                           0000C3   680 _T2MSEL	=	0x00c3
                           0000CA   681 _T3CNT	=	0x00ca
                           0000CB   682 _T3CTL	=	0x00cb
                           0000CC   683 _T3CCTL0	=	0x00cc
                           0000CD   684 _T3CC0	=	0x00cd
                           0000CE   685 _T3CCTL1	=	0x00ce
                           0000CF   686 _T3CC1	=	0x00cf
                           0000EA   687 _T4CNT	=	0x00ea
                           0000EB   688 _T4CTL	=	0x00eb
                           0000EC   689 _T4CCTL0	=	0x00ec
                           0000ED   690 _T4CC0	=	0x00ed
                           0000EE   691 _T4CCTL1	=	0x00ee
                           0000EF   692 _T4CC1	=	0x00ef
                           0000D8   693 _TIMIF	=	0x00d8
                           000086   694 _U0CSR	=	0x0086
                           0000C1   695 _U0DBUF	=	0x00c1
                           0000C2   696 _U0BAUD	=	0x00c2
                           0000C4   697 _U0UCR	=	0x00c4
                           0000C5   698 _U0GCR	=	0x00c5
                           0000F8   699 _U1CSR	=	0x00f8
                           0000F9   700 _U1DBUF	=	0x00f9
                           0000FA   701 _U1BAUD	=	0x00fa
                           0000FB   702 _U1UCR	=	0x00fb
                           0000FC   703 _U1GCR	=	0x00fc
                           0000C9   704 _WDCTL	=	0x00c9
                                    705 ;--------------------------------------------------------
                                    706 ; special function bits
                                    707 ;--------------------------------------------------------
                                    708 	.area RSEG    (ABS,DATA)
      000000                        709 	.org 0x0000
                           000087   710 _P0_7	=	0x0087
                           000086   711 _P0_6	=	0x0086
                           000085   712 _P0_5	=	0x0085
                           000084   713 _P0_4	=	0x0084
                           000083   714 _P0_3	=	0x0083
                           000082   715 _P0_2	=	0x0082
                           000081   716 _P0_1	=	0x0081
                           000080   717 _P0_0	=	0x0080
                           00008F   718 _URX1IF	=	0x008f
                           00008D   719 _ADCIF	=	0x008d
                           00008B   720 _URX0IF	=	0x008b
                           00008A   721 _IT1	=	0x008a
                           000089   722 _RFERRIF	=	0x0089
                           000088   723 _IT0	=	0x0088
                           000097   724 _P1_7	=	0x0097
                           000096   725 _P1_6	=	0x0096
                           000095   726 _P1_5	=	0x0095
                           000094   727 _P1_4	=	0x0094
                           000093   728 _P1_3	=	0x0093
                           000092   729 _P1_2	=	0x0092
                           000091   730 _P1_1	=	0x0091
                           000090   731 _P1_0	=	0x0090
                           000099   732 _ENCIF_1	=	0x0099
                           000098   733 _ENCIF_0	=	0x0098
                           0000A7   734 _P2_7	=	0x00a7
                           0000A6   735 _P2_6	=	0x00a6
                           0000A5   736 _P2_5	=	0x00a5
                           0000A4   737 _P2_4	=	0x00a4
                           0000A3   738 _P2_3	=	0x00a3
                           0000A2   739 _P2_2	=	0x00a2
                           0000A1   740 _P2_1	=	0x00a1
                           0000A0   741 _P2_0	=	0x00a0
                           0000AF   742 _EA	=	0x00af
                           0000AD   743 _STIE	=	0x00ad
                           0000AC   744 _ENCIE	=	0x00ac
                           0000AB   745 _URX1IE	=	0x00ab
                           0000AA   746 _URX0IE	=	0x00aa
                           0000A9   747 _ADCIE	=	0x00a9
                           0000A8   748 _RFERRIE	=	0x00a8
                           0000BD   749 _P0IE	=	0x00bd
                           0000BC   750 _T4IE	=	0x00bc
                           0000BB   751 _T3IE	=	0x00bb
                           0000BA   752 _T2IE	=	0x00ba
                           0000B9   753 _T1IE	=	0x00b9
                           0000B8   754 _DMAIE	=	0x00b8
                           0000C7   755 _STIF	=	0x00c7
                           0000C5   756 _P0IF	=	0x00c5
                           0000C4   757 _T4IF	=	0x00c4
                           0000C3   758 _T3IF	=	0x00c3
                           0000C2   759 _T2IF	=	0x00c2
                           0000C1   760 _T1IF	=	0x00c1
                           0000C0   761 _DMAIF	=	0x00c0
                           0000D7   762 _CY	=	0x00d7
                           0000D6   763 _AC	=	0x00d6
                           0000D5   764 _F0	=	0x00d5
                           0000D4   765 _RS1	=	0x00d4
                           0000D3   766 _RS0	=	0x00d3
                           0000D2   767 _OV	=	0x00d2
                           0000D1   768 _F1	=	0x00d1
                           0000D0   769 _P	=	0x00d0
                           0000E7   770 _ACC_7	=	0x00e7
                           0000E6   771 _ACC_6	=	0x00e6
                           0000E5   772 _ACC_5	=	0x00e5
                           0000E4   773 _ACC_4	=	0x00e4
                           0000E3   774 _ACC_3	=	0x00e3
                           0000E2   775 _ACC_2	=	0x00e2
                           0000E1   776 _ACC_1	=	0x00e1
                           0000E0   777 _ACC_0	=	0x00e0
                           0000EC   778 _WDTIF	=	0x00ec
                           0000EB   779 _P1IF	=	0x00eb
                           0000EA   780 _UTX1IF	=	0x00ea
                           0000E9   781 _UTX0IF	=	0x00e9
                           0000E8   782 _P2IF	=	0x00e8
                           0000F7   783 _B_7	=	0x00f7
                           0000F6   784 _B_6	=	0x00f6
                           0000F5   785 _B_5	=	0x00f5
                           0000F4   786 _B_4	=	0x00f4
                           0000F3   787 _B_3	=	0x00f3
                           0000F2   788 _B_2	=	0x00f2
                           0000F1   789 _B_1	=	0x00f1
                           0000F0   790 _B_0	=	0x00f0
                           0000DE   791 _OVFIM	=	0x00de
                           0000DD   792 _T4CH1IF	=	0x00dd
                           0000DC   793 _T4CH0IF	=	0x00dc
                           0000DB   794 _T4OVFIF	=	0x00db
                           0000DA   795 _T3CH1IF	=	0x00da
                           0000D9   796 _T3CH0IF	=	0x00d9
                           0000D8   797 _T3OVFIF	=	0x00d8
                           0000FF   798 _MODE	=	0x00ff
                           0000FE   799 _RE	=	0x00fe
                           0000FD   800 _SLAVE	=	0x00fd
                           0000FC   801 _FE	=	0x00fc
                           0000FB   802 _ERR	=	0x00fb
                           0000FA   803 _RX_BYTE	=	0x00fa
                           0000F9   804 _TX_BYTE	=	0x00f9
                           0000F8   805 _ACTIVE	=	0x00f8
                                    806 ;--------------------------------------------------------
                                    807 ; overlayable register banks
                                    808 ;--------------------------------------------------------
                                    809 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        810 	.ds 8
                                    811 ;--------------------------------------------------------
                                    812 ; internal ram data
                                    813 ;--------------------------------------------------------
                                    814 	.area DSEG    (DATA)
      000008                        815 _len:
      000008                        816 	.ds 2
                                    817 ;--------------------------------------------------------
                                    818 ; overlayable items in internal ram 
                                    819 ;--------------------------------------------------------
                                    820 ;--------------------------------------------------------
                                    821 ; Stack segment in internal ram 
                                    822 ;--------------------------------------------------------
                                    823 	.area	SSEG
      000021                        824 __start__stack:
      000021                        825 	.ds	1
                                    826 
                                    827 ;--------------------------------------------------------
                                    828 ; indirectly addressable internal ram data
                                    829 ;--------------------------------------------------------
                                    830 	.area ISEG    (DATA)
                                    831 ;--------------------------------------------------------
                                    832 ; absolute internal ram data
                                    833 ;--------------------------------------------------------
                                    834 	.area IABS    (ABS,DATA)
                                    835 	.area IABS    (ABS,DATA)
                                    836 ;--------------------------------------------------------
                                    837 ; bit data
                                    838 ;--------------------------------------------------------
                                    839 	.area BSEG    (BIT)
                                    840 ;--------------------------------------------------------
                                    841 ; paged external ram data
                                    842 ;--------------------------------------------------------
                                    843 	.area PSEG    (PAG,XDATA)
                                    844 ;--------------------------------------------------------
                                    845 ; external ram data
                                    846 ;--------------------------------------------------------
                                    847 	.area XSEG    (XDATA)
                           0061A6   848 _MONMUX	=	0x61a6
                           0061A6   849 _OPAMPMC	=	0x61a6
                           006230   850 _I2CCFG	=	0x6230
                           006231   851 _I2CSTAT	=	0x6231
                           006232   852 _I2CDATA	=	0x6232
                           006233   853 _I2CADDR	=	0x6233
                           006234   854 _I2CWC	=	0x6234
                           006235   855 _I2CIO	=	0x6235
                           006243   856 _OBSSEL0	=	0x6243
                           006244   857 _OBSSEL1	=	0x6244
                           006245   858 _OBSSEL2	=	0x6245
                           006246   859 _OBSSEL3	=	0x6246
                           006247   860 _OBSSEL4	=	0x6247
                           006248   861 _OBSSEL5	=	0x6248
                           006249   862 _CHVER	=	0x6249
                           00624A   863 _CHIPID	=	0x624a
                           00624B   864 _TESTREG0	=	0x624b
                           006260   865 _DBGDATA	=	0x6260
                           006262   866 _SRCRC	=	0x6262
                           006264   867 _BATTMON	=	0x6264
                           006265   868 _IVCTRL	=	0x6265
                           006270   869 _FCTL	=	0x6270
                           006271   870 _FADDRL	=	0x6271
                           006272   871 _FADDRH	=	0x6272
                           006273   872 _FWDATA	=	0x6273
                           006276   873 _CHIPINFO0	=	0x6276
                           006277   874 _CHIPINFO1	=	0x6277
                           006281   875 _IRCTL	=	0x6281
                           006290   876 _CLD	=	0x6290
                           0062A0   877 _XX_T1CCTL0	=	0x62a0
                           0062A1   878 _XX_T1CCTL1	=	0x62a1
                           0062A2   879 _XX_T1CCTL2	=	0x62a2
                           0062A3   880 _T1CCTL3	=	0x62a3
                           0062A4   881 _T1CCTL4	=	0x62a4
                           0062A6   882 _XX_T1CC0L	=	0x62a6
                           0062A7   883 _XX_T1CC0H	=	0x62a7
                           0062A8   884 _XX_T1CC1L	=	0x62a8
                           0062A9   885 _XX_T1CC1H	=	0x62a9
                           0062AA   886 _XX_T1CC2L	=	0x62aa
                           0062AB   887 _XX_T1CC2H	=	0x62ab
                           0062AC   888 _T1CC3L	=	0x62ac
                           0062AD   889 _T1CC3H	=	0x62ad
                           0062AE   890 _T1CC4L	=	0x62ae
                           0062AF   891 _T1CC4H	=	0x62af
                           0062B0   892 _STCC	=	0x62b0
                           0062B1   893 _STCS	=	0x62b1
                           0062B2   894 _STCV0	=	0x62b2
                           0062B3   895 _STCV1	=	0x62b3
                           0062B4   896 _STCV2	=	0x62b4
                           0062C0   897 _OPAMPC	=	0x62c0
                           0062C1   898 _OPAMPS	=	0x62c1
                           0062D0   899 _CMPCTL	=	0x62d0
                           006000   900 _RFCORE_RAM	=	0x6000
                           006000   901 _RXFIFO	=	0x6000
                           006080   902 _TXFIFO	=	0x6080
                           006100   903 _SRC_ADDR_TABLE	=	0x6100
                           006160   904 _SRCRESMASK0	=	0x6160
                           006161   905 _SRCRESMASK1	=	0x6161
                           006162   906 _SRCRESMASK2	=	0x6162
                           006163   907 _SRCRESINDEX	=	0x6163
                           006164   908 _SRCEXTPENDEN0	=	0x6164
                           006165   909 _SRCEXTPENDEN1	=	0x6165
                           006166   910 _SRCEXTPENDEN2	=	0x6166
                           006167   911 _SRCSHORTPENDEN0	=	0x6167
                           006168   912 _SRCSHORTPENDEN1	=	0x6168
                           006169   913 _SRCSHORTPENDEN2	=	0x6169
                           00616A   914 _EXT_ADDR0	=	0x616a
                           00616B   915 _EXT_ADDR1	=	0x616b
                           00616C   916 _EXT_ADDR2	=	0x616c
                           00616D   917 _EXT_ADDR3	=	0x616d
                           00616E   918 _EXT_ADDR4	=	0x616e
                           00616F   919 _EXT_ADDR5	=	0x616f
                           006170   920 _EXT_ADDR6	=	0x6170
                           006171   921 _EXT_ADDR7	=	0x6171
                           006172   922 _PAN_ID0	=	0x6172
                           006173   923 _PAN_ID1	=	0x6173
                           006174   924 _SHORT_ADDR0	=	0x6174
                           006175   925 _SHORT_ADDR1	=	0x6175
                           006180   926 _FRMFILT0	=	0x6180
                           006181   927 _FRMFILT1	=	0x6181
                           006182   928 _SRCMATCH	=	0x6182
                           006183   929 _SRCSHORTEN0	=	0x6183
                           006184   930 _SRCSHORTEN1	=	0x6184
                           006185   931 _SRCSHORTEN2	=	0x6185
                           006186   932 _SRCEXTEN0	=	0x6186
                           006187   933 _SRCEXTEN1	=	0x6187
                           006188   934 _SRCEXTEN2	=	0x6188
                           006189   935 _FRMCTRL0	=	0x6189
                           00618A   936 _FRMCTRL1	=	0x618a
                           00618B   937 _RXENABLE	=	0x618b
                           00618C   938 _RXMASKSET	=	0x618c
                           00618D   939 _RXMASKCLR	=	0x618d
                           00618E   940 _FREQTUNE	=	0x618e
                           00618F   941 _FREQCTRL	=	0x618f
                           006190   942 _TXPOWER	=	0x6190
                           006191   943 _TXCTRL	=	0x6191
                           006192   944 _FSMSTAT0	=	0x6192
                           006193   945 _FSMSTAT1	=	0x6193
                           006194   946 _FIFOPCTRL	=	0x6194
                           006195   947 _FSMCTRL	=	0x6195
                           006196   948 _CCACTRL0	=	0x6196
                           006197   949 _CCACTRL1	=	0x6197
                           006198   950 _RSSI	=	0x6198
                           006199   951 _RSSISTAT	=	0x6199
                           00619A   952 _RXFIRST	=	0x619a
                           00619B   953 _RXFIFOCNT	=	0x619b
                           00619C   954 _TXFIFOCNT	=	0x619c
                           00619D   955 _RXFIRST_PTR	=	0x619d
                           00619E   956 _RXLAST_PTR	=	0x619e
                           00619F   957 _RXP1_PTR	=	0x619f
                           0061A1   958 _TXFIRST_PTR	=	0x61a1
                           0061A2   959 _TXLAST_PTR	=	0x61a2
                           0061A3   960 _RFIRQM0	=	0x61a3
                           0061A4   961 _RFIRQM1	=	0x61a4
                           0061A5   962 _RFERRM	=	0x61a5
                           0061A7   963 _RFRND	=	0x61a7
                           0061A8   964 _MDMCTRL0	=	0x61a8
                           0061A9   965 _MDMCTRL1	=	0x61a9
                           0061AA   966 _FREQEST	=	0x61aa
                           0061AB   967 _RXCTRL	=	0x61ab
                           0061AC   968 _FSCTRL	=	0x61ac
                           0061AD   969 _FSCAL0	=	0x61ad
                           0061AE   970 _FSCAL1	=	0x61ae
                           0061AF   971 _FSCAL2	=	0x61af
                           0061B0   972 _FSCAL3	=	0x61b0
                           0061B1   973 _AGCCTRL0	=	0x61b1
                           0061B2   974 _AGCCTRL1	=	0x61b2
                           0061B3   975 _AGCCTRL2	=	0x61b3
                           0061B4   976 _AGCCTRL3	=	0x61b4
                           0061B5   977 _ADCTEST0	=	0x61b5
                           0061B6   978 _ADCTEST1	=	0x61b6
                           0061B7   979 _ADCTEST2	=	0x61b7
                           0061B8   980 _MDMTEST0	=	0x61b8
                           0061B9   981 _MDMTEST1	=	0x61b9
                           0061BA   982 _DACTEST0	=	0x61ba
                           0061BB   983 _DACTEST1	=	0x61bb
                           0061BC   984 _DACTEST2	=	0x61bc
                           0061BD   985 _ATEST	=	0x61bd
                           0061BE   986 _PTEST0	=	0x61be
                           0061BF   987 _PTEST1	=	0x61bf
                           0061FA   988 _TXFILTCFG	=	0x61fa
                           0061EB   989 _RFC_OBS_CTRL0	=	0x61eb
                           0061EC   990 _RFC_OBS_CTRL1	=	0x61ec
                           0061ED   991 _RFC_OBS_CTRL2	=	0x61ed
                           0061C0   992 _CSPPROG0	=	0x61c0
                           0061C1   993 _CSPPROG1	=	0x61c1
                           0061C2   994 _CSPPROG2	=	0x61c2
                           0061C3   995 _CSPPROG3	=	0x61c3
                           0061C4   996 _CSPPROG4	=	0x61c4
                           0061C5   997 _CSPPROG5	=	0x61c5
                           0061C6   998 _CSPPROG6	=	0x61c6
                           0061C7   999 _CSPPROG7	=	0x61c7
                           0061C8  1000 _CSPPROG8	=	0x61c8
                           0061C9  1001 _CSPPROG9	=	0x61c9
                           0061CA  1002 _CSPPROG10	=	0x61ca
                           0061CB  1003 _CSPPROG11	=	0x61cb
                           0061CC  1004 _CSPPROG12	=	0x61cc
                           0061CD  1005 _CSPPROG13	=	0x61cd
                           0061CE  1006 _CSPPROG14	=	0x61ce
                           0061CF  1007 _CSPPROG15	=	0x61cf
                           0061D0  1008 _CSPPROG16	=	0x61d0
                           0061D1  1009 _CSPPROG17	=	0x61d1
                           0061D2  1010 _CSPPROG18	=	0x61d2
                           0061D3  1011 _CSPPROG19	=	0x61d3
                           0061D4  1012 _CSPPROG20	=	0x61d4
                           0061D5  1013 _CSPPROG21	=	0x61d5
                           0061D6  1014 _CSPPROG22	=	0x61d6
                           0061D7  1015 _CSPPROG23	=	0x61d7
                           0061E0  1016 _CSPCTRL	=	0x61e0
                           0061E1  1017 _CSPSTAT	=	0x61e1
                           0061E2  1018 _CSPX	=	0x61e2
                           0061E3  1019 _CSPY	=	0x61e3
                           0061E4  1020 _CSPZ	=	0x61e4
                           0061E5  1021 _CSPT	=	0x61e5
                           006200  1022 _USBADDR	=	0x6200
                           006201  1023 _USBPOW	=	0x6201
                           006202  1024 _USBIIF	=	0x6202
                           006204  1025 _USBOIF	=	0x6204
                           006206  1026 _USBCIF	=	0x6206
                           006207  1027 _USBIIE	=	0x6207
                           006209  1028 _USBOIE	=	0x6209
                           00620B  1029 _USBCIE	=	0x620b
                           00620C  1030 _USBFRML	=	0x620c
                           00620D  1031 _USBFRMH	=	0x620d
                           00620E  1032 _USBINDEX	=	0x620e
                           00620F  1033 _USBCTRL	=	0x620f
                           006210  1034 _USBMAXI	=	0x6210
                           006211  1035 _USBCS0	=	0x6211
                           006211  1036 _USBCSIL	=	0x6211
                           006212  1037 _USBCSIH	=	0x6212
                           006213  1038 _USBMAXO	=	0x6213
                           006214  1039 _USBCSOL	=	0x6214
                           006215  1040 _USBCSOH	=	0x6215
                           006216  1041 _USBCNT0	=	0x6216
                           006216  1042 _USBCNTL	=	0x6216
                           006217  1043 _USBCNTH	=	0x6217
                           006220  1044 _USBF0	=	0x6220
                           006222  1045 _USBF1	=	0x6222
                           006224  1046 _USBF2	=	0x6224
                           006226  1047 _USBF3	=	0x6226
                           006228  1048 _USBF4	=	0x6228
                           00622A  1049 _USBF5	=	0x622a
                           007080  1050 _X_P0	=	0x7080
                           007086  1051 _X_U0CSR	=	0x7086
                           007089  1052 _X_P0IFG	=	0x7089
                           00708A  1053 _X_P1IFG	=	0x708a
                           00708B  1054 _X_P2IFG	=	0x708b
                           00708C  1055 _X_PICTL	=	0x708c
                           00708D  1056 _X_P1IEN	=	0x708d
                           00708F  1057 _X_P0INP	=	0x708f
                           007090  1058 _X_P1	=	0x7090
                           007091  1059 _X_RFIRQF1	=	0x7091
                           007093  1060 _X_MPAGE	=	0x7093
                           007093  1061 _X__XPAGE	=	0x7093
                           007094  1062 _X_T2CTRL	=	0x7094
                           007095  1063 _X_ST0	=	0x7095
                           007096  1064 _X_ST1	=	0x7096
                           007097  1065 _X_ST2	=	0x7097
                           00709C  1066 _X_T2EVTCFG	=	0x709c
                           00709D  1067 _X_SLEEPSTA	=	0x709d
                           00709E  1068 _X_CLKCONSTA	=	0x709e
                           00709F  1069 _X_FMAP	=	0x709f
                           00709F  1070 _X_PSBANK	=	0x709f
                           0070A0  1071 _X_P2	=	0x70a0
                           0070A1  1072 _X_T2IRQF	=	0x70a1
                           0070A2  1073 _X_T2M0	=	0x70a2
                           0070A3  1074 _X_T2M1	=	0x70a3
                           0070A4  1075 _X_T2MOVF0	=	0x70a4
                           0070A5  1076 _X_T2MOVF1	=	0x70a5
                           0070A6  1077 _X_T2MOVF2	=	0x70a6
                           0070A7  1078 _X_T2IRQM	=	0x70a7
                           0070AB  1079 _X_P0IEN	=	0x70ab
                           0070AC  1080 _X_P2IEN	=	0x70ac
                           0070AD  1081 _X_STLOAD	=	0x70ad
                           0070AE  1082 _X_PMUX	=	0x70ae
                           0070AF  1083 _X_T1STAT	=	0x70af
                           0070B1  1084 _X_ENCDI	=	0x70b1
                           0070B2  1085 _X_ENCDO	=	0x70b2
                           0070B3  1086 _X_ENCCS	=	0x70b3
                           0070B4  1087 _X_ADCCON1	=	0x70b4
                           0070B5  1088 _X_ADCCON2	=	0x70b5
                           0070B6  1089 _X_ADCCON3	=	0x70b6
                           0070BA  1090 _X_ADCL	=	0x70ba
                           0070BB  1091 _X_ADCH	=	0x70bb
                           0070BC  1092 _X_RNDL	=	0x70bc
                           0070BD  1093 _X_RNDH	=	0x70bd
                           0070BE  1094 _X_SLEEPCMD	=	0x70be
                           0070BF  1095 _X_RFERRF	=	0x70bf
                           0070C1  1096 _X_U0DBUF	=	0x70c1
                           0070C2  1097 _X_U0BAUD	=	0x70c2
                           0070C3  1098 _X_T2MSEL	=	0x70c3
                           0070C4  1099 _X_U0UCR	=	0x70c4
                           0070C5  1100 _X_U0GCR	=	0x70c5
                           0070C6  1101 _X_CLKCONCMD	=	0x70c6
                           0070C7  1102 _X_MEMCTR	=	0x70c7
                           0070C9  1103 _X_WDCTL	=	0x70c9
                           0070CA  1104 _X_T3CNT	=	0x70ca
                           0070CB  1105 _X_T3CTL	=	0x70cb
                           0070CC  1106 _X_T3CCTL0	=	0x70cc
                           0070CD  1107 _X_T3CC0	=	0x70cd
                           0070CE  1108 _X_T3CCTL1	=	0x70ce
                           0070CF  1109 _X_T3CC1	=	0x70cf
                           0070D1  1110 _X_DMAIRQ	=	0x70d1
                           0070D2  1111 _X_DMA1CFGL	=	0x70d2
                           0070D3  1112 _X_DMA1CFGH	=	0x70d3
                           0070D4  1113 _X_DMA0CFGL	=	0x70d4
                           0070D5  1114 _X_DMA0CFGH	=	0x70d5
                           0070D6  1115 _X_DMAARM	=	0x70d6
                           0070D7  1116 _X_DMAREQ	=	0x70d7
                           0070D8  1117 _X_TIMIF	=	0x70d8
                           0070D9  1118 _X_RFD	=	0x70d9
                           0070DA  1119 _X_T1CC0L	=	0x70da
                           0070DB  1120 _X_T1CC0H	=	0x70db
                           0070DC  1121 _X_T1CC1L	=	0x70dc
                           0070DD  1122 _X_T1CC1H	=	0x70dd
                           0070DE  1123 _X_T1CC2L	=	0x70de
                           0070DF  1124 _X_T1CC2H	=	0x70df
                           0070E1  1125 _X_RFST	=	0x70e1
                           0070E2  1126 _X_T1CNTL	=	0x70e2
                           0070E3  1127 _X_T1CNTH	=	0x70e3
                           0070E4  1128 _X_T1CTL	=	0x70e4
                           0070E5  1129 _X_T1CCTL0	=	0x70e5
                           0070E6  1130 _X_T1CCTL1	=	0x70e6
                           0070E7  1131 _X_T1CCTL2	=	0x70e7
                           0070E9  1132 _X_RFIRQF0	=	0x70e9
                           0070EA  1133 _X_T4CNT	=	0x70ea
                           0070EB  1134 _X_T4CTL	=	0x70eb
                           0070EC  1135 _X_T4CCTL0	=	0x70ec
                           0070ED  1136 _X_T4CC0	=	0x70ed
                           0070EE  1137 _X_T4CCTL1	=	0x70ee
                           0070EF  1138 _X_T4CC1	=	0x70ef
                           0070F1  1139 _X_PERCFG	=	0x70f1
                           0070F2  1140 _X_APCFG	=	0x70f2
                           0070F3  1141 _X_P0SEL	=	0x70f3
                           0070F4  1142 _X_P1SEL	=	0x70f4
                           0070F5  1143 _X_P2SEL	=	0x70f5
                           0070F6  1144 _X_P1INP	=	0x70f6
                           0070F7  1145 _X_P2INP	=	0x70f7
                           0070F8  1146 _X_U1CSR	=	0x70f8
                           0070F9  1147 _X_U1DBUF	=	0x70f9
                           0070FA  1148 _X_U1BAUD	=	0x70fa
                           0070FB  1149 _X_U1UCR	=	0x70fb
                           0070FC  1150 _X_U1GCR	=	0x70fc
                           0070FD  1151 _X_P0DIR	=	0x70fd
                           0070FE  1152 _X_P1DIR	=	0x70fe
                           0070FF  1153 _X_P2DIR	=	0x70ff
                           007800  1154 _X_INFOPAGE	=	0x7800
                           00780C  1155 _X_IEEE_ADDR	=	0x780c
                                   1156 ;--------------------------------------------------------
                                   1157 ; absolute external ram data
                                   1158 ;--------------------------------------------------------
                                   1159 	.area XABS    (ABS,XDATA)
                                   1160 ;--------------------------------------------------------
                                   1161 ; external initialized ram data
                                   1162 ;--------------------------------------------------------
                                   1163 	.area XISEG   (XDATA)
                                   1164 	.area HOME    (CODE)
                                   1165 	.area GSINIT0 (CODE)
                                   1166 	.area GSINIT1 (CODE)
                                   1167 	.area GSINIT2 (CODE)
                                   1168 	.area GSINIT3 (CODE)
                                   1169 	.area GSINIT4 (CODE)
                                   1170 	.area GSINIT5 (CODE)
                                   1171 	.area GSINIT  (CODE)
                                   1172 	.area GSFINAL (CODE)
                                   1173 	.area CSEG    (CODE)
                                   1174 ;--------------------------------------------------------
                                   1175 ; interrupt vector 
                                   1176 ;--------------------------------------------------------
                                   1177 	.area HOME    (CODE)
      000000                       1178 __interrupt_vect:
      000000 02 49 50         [24] 1179 	ljmp	__sdcc_gsinit_startup
      000003 32               [24] 1180 	reti
      000004                       1181 	.ds	7
      00000B 32               [24] 1182 	reti
      00000C                       1183 	.ds	7
      000013 02 05 3E         [24] 1184 	ljmp	_uart0_rx_isr
      000016                       1185 	.ds	5
      00001B 32               [24] 1186 	reti
      00001C                       1187 	.ds	7
      000023 32               [24] 1188 	reti
      000024                       1189 	.ds	7
      00002B 02 3E 9F         [24] 1190 	ljmp	_clock_isr
      00002E                       1191 	.ds	5
      000033 32               [24] 1192 	reti
      000034                       1193 	.ds	7
      00003B 32               [24] 1194 	reti
      00003C                       1195 	.ds	7
      000043 32               [24] 1196 	reti
      000044                       1197 	.ds	7
      00004B 02 3F D2         [24] 1198 	ljmp	_rtimer_isr
      00004E                       1199 	.ds	5
      000053 32               [24] 1200 	reti
      000054                       1201 	.ds	7
      00005B 32               [24] 1202 	reti
      00005C                       1203 	.ds	7
      000063 32               [24] 1204 	reti
      000064                       1205 	.ds	7
      00006B 02 40 DC         [24] 1206 	ljmp	_port_0_isr
                                   1207 ;--------------------------------------------------------
                                   1208 ; global & static initialisations
                                   1209 ;--------------------------------------------------------
                                   1210 	.area HOME    (CODE)
                                   1211 	.area GSINIT  (CODE)
                                   1212 	.area GSFINAL (CODE)
                                   1213 	.area GSINIT  (CODE)
                                   1214 	.globl __sdcc_gsinit_startup
                                   1215 	.globl __sdcc_program_startup
                                   1216 	.globl __start__stack
                                   1217 	.globl __mcs51_genXINIT
                                   1218 	.globl __mcs51_genXRAMCLEAR
                                   1219 	.globl __mcs51_genRAMCLEAR
                                   1220 	.area GSFINAL (CODE)
      0049DD 02 00 6E         [24] 1221 	ljmp	__sdcc_program_startup
                                   1222 ;--------------------------------------------------------
                                   1223 ; Home
                                   1224 ;--------------------------------------------------------
                                   1225 	.area HOME    (CODE)
                                   1226 	.area HOME    (CODE)
      00006E                       1227 __sdcc_program_startup:
      00006E 02 01 BF         [24] 1228 	ljmp	_main
                                   1229 ;	return from main will return to caller
                                   1230 ;--------------------------------------------------------
                                   1231 ; code
                                   1232 ;--------------------------------------------------------
                                   1233 	.area HOME    (CODE)
                                   1234 ;------------------------------------------------------------
                                   1235 ;Allocation info for local variables in function 'fade'
                                   1236 ;------------------------------------------------------------
                                   1237 ;l                         Allocated to registers r6 r7 
                                   1238 ;i                         Allocated to stack - sp -3
                                   1239 ;a                         Allocated to stack - sp -1
                                   1240 ;k                         Allocated to registers 
                                   1241 ;j                         Allocated to registers r2 r3 
                                   1242 ;sloc0                     Allocated to stack - sp +7
                                   1243 ;------------------------------------------------------------
                                   1244 ;	../../../platform/cc2530dk/./contiki-main.c:76: fade(int l) CC_NON_BANKED
                                   1245 ;	-----------------------------------------
                                   1246 ;	 function fade
                                   1247 ;	-----------------------------------------
      000071                       1248 _fade:
                           000007  1249 	ar7 = 0x07
                           000006  1250 	ar6 = 0x06
                           000005  1251 	ar5 = 0x05
                           000004  1252 	ar4 = 0x04
                           000003  1253 	ar3 = 0x03
                           000002  1254 	ar2 = 0x02
                           000001  1255 	ar1 = 0x01
                           000000  1256 	ar0 = 0x00
      000071 E5 81            [12] 1257 	mov	a,sp
      000073 24 04            [12] 1258 	add	a,#0x04
      000075 F5 81            [12] 1259 	mov	sp,a
      000077 AE 82            [24] 1260 	mov	r6,dpl
      000079 AF 83            [24] 1261 	mov	r7,dph
                                   1262 ;	../../../platform/cc2530dk/./contiki-main.c:80: for(k = 0; k < 400; ++k) {
      00007B 7C 00            [12] 1263 	mov	r4,#0x00
      00007D 7D 00            [12] 1264 	mov	r5,#0x00
      00007F                       1265 00110$:
                                   1266 ;	../../../platform/cc2530dk/./contiki-main.c:81: j = k > 200 ? 400 - k : k;
      00007F C3               [12] 1267 	clr	c
      000080 74 C8            [12] 1268 	mov	a,#0xc8
      000082 9C               [12] 1269 	subb	a,r4
      000083 74 80            [12] 1270 	mov	a,#(0x00 ^ 0x80)
      000085 8D F0            [24] 1271 	mov	b,r5
      000087 63 F0 80         [24] 1272 	xrl	b,#0x80
      00008A 95 F0            [12] 1273 	subb	a,b
      00008C 50 0B            [24] 1274 	jnc	00114$
      00008E 74 90            [12] 1275 	mov	a,#0x90
      000090 C3               [12] 1276 	clr	c
      000091 9C               [12] 1277 	subb	a,r4
      000092 FA               [12] 1278 	mov	r2,a
      000093 74 01            [12] 1279 	mov	a,#0x01
      000095 9D               [12] 1280 	subb	a,r5
      000096 FB               [12] 1281 	mov	r3,a
      000097 80 04            [24] 1282 	sjmp	00115$
      000099                       1283 00114$:
      000099 8C 02            [24] 1284 	mov	ar2,r4
      00009B 8D 03            [24] 1285 	mov	ar3,r5
      00009D                       1286 00115$:
      00009D C0 04            [24] 1287 	push	ar4
      00009F C0 05            [24] 1288 	push	ar5
                                   1289 ;	../../../platform/cc2530dk/./contiki-main.c:83: leds_on(l);
      0000A1 8E 05            [24] 1290 	mov	ar5,r6
      0000A3 8D 82            [24] 1291 	mov	dpl,r5
      0000A5 C0 07            [24] 1292 	push	ar7
      0000A7 C0 06            [24] 1293 	push	ar6
      0000A9 C0 05            [24] 1294 	push	ar5
      0000AB C0 04            [24] 1295 	push	ar4
      0000AD C0 03            [24] 1296 	push	ar3
      0000AF C0 02            [24] 1297 	push	ar2
      0000B1 78 A5            [12] 1298 	mov	r0,#_leds_on
      0000B3 79 86            [12] 1299 	mov	r1,#(_leds_on >> 8)
      0000B5 7A 04            [12] 1300 	mov	r2,#(_leds_on >> 16)
      0000B7 12 05 9B         [24] 1301 	lcall	__sdcc_banked_call
      0000BA D0 02            [24] 1302 	pop	ar2
      0000BC D0 03            [24] 1303 	pop	ar3
      0000BE D0 04            [24] 1304 	pop	ar4
      0000C0 D0 05            [24] 1305 	pop	ar5
      0000C2 D0 06            [24] 1306 	pop	ar6
      0000C4 D0 07            [24] 1307 	pop	ar7
                                   1308 ;	../../../platform/cc2530dk/./contiki-main.c:84: for(i = 0; i < j; ++i) {
      0000C6 E5 81            [12] 1309 	mov	a,sp
      0000C8 24 FB            [12] 1310 	add	a,#0xfb
      0000CA F8               [12] 1311 	mov	r0,a
      0000CB E4               [12] 1312 	clr	a
      0000CC F6               [12] 1313 	mov	@r0,a
      0000CD 08               [12] 1314 	inc	r0
      0000CE F6               [12] 1315 	mov	@r0,a
                                   1316 ;	../../../platform/cc2530dk/./contiki-main.c:80: for(k = 0; k < 400; ++k) {
      0000CF D0 05            [24] 1317 	pop	ar5
      0000D1 D0 04            [24] 1318 	pop	ar4
                                   1319 ;	../../../platform/cc2530dk/./contiki-main.c:84: for(i = 0; i < j; ++i) {
      0000D3                       1320 00105$:
      0000D3 E5 81            [12] 1321 	mov	a,sp
      0000D5 24 FD            [12] 1322 	add	a,#0xfd
      0000D7 F8               [12] 1323 	mov	r0,a
      0000D8 C3               [12] 1324 	clr	c
      0000D9 E6               [12] 1325 	mov	a,@r0
      0000DA 9A               [12] 1326 	subb	a,r2
      0000DB 08               [12] 1327 	inc	r0
      0000DC E6               [12] 1328 	mov	a,@r0
      0000DD 64 80            [12] 1329 	xrl	a,#0x80
      0000DF 8B F0            [24] 1330 	mov	b,r3
      0000E1 63 F0 80         [24] 1331 	xrl	b,#0x80
      0000E4 95 F0            [12] 1332 	subb	a,b
      0000E6 50 1D            [24] 1333 	jnc	00101$
                                   1334 ;	../../../platform/cc2530dk/./contiki-main.c:85: a = i;
      0000E8 E5 81            [12] 1335 	mov	a,sp
      0000EA 24 FD            [12] 1336 	add	a,#0xfd
      0000EC F8               [12] 1337 	mov	r0,a
      0000ED A9 81            [24] 1338 	mov	r1,sp
      0000EF 19               [12] 1339 	dec	r1
      0000F0 E6               [12] 1340 	mov	a,@r0
      0000F1 F7               [12] 1341 	mov	@r1,a
      0000F2 08               [12] 1342 	inc	r0
      0000F3 09               [12] 1343 	inc	r1
      0000F4 E6               [12] 1344 	mov	a,@r0
      0000F5 F7               [12] 1345 	mov	@r1,a
                                   1346 ;	../../../platform/cc2530dk/./contiki-main.c:84: for(i = 0; i < j; ++i) {
      0000F6 E5 81            [12] 1347 	mov	a,sp
      0000F8 24 FD            [12] 1348 	add	a,#0xfd
      0000FA F8               [12] 1349 	mov	r0,a
      0000FB 74 01            [12] 1350 	mov	a,#0x01
      0000FD 26               [12] 1351 	add	a,@r0
      0000FE F6               [12] 1352 	mov	@r0,a
      0000FF E4               [12] 1353 	clr	a
      000100 08               [12] 1354 	inc	r0
      000101 36               [12] 1355 	addc	a,@r0
      000102 F6               [12] 1356 	mov	@r0,a
      000103 80 CE            [24] 1357 	sjmp	00105$
      000105                       1358 00101$:
                                   1359 ;	../../../platform/cc2530dk/./contiki-main.c:87: leds_off(l);
      000105 C0 04            [24] 1360 	push	ar4
      000107 C0 05            [24] 1361 	push	ar5
      000109 8E 05            [24] 1362 	mov	ar5,r6
      00010B 8D 82            [24] 1363 	mov	dpl,r5
      00010D C0 07            [24] 1364 	push	ar7
      00010F C0 06            [24] 1365 	push	ar6
      000111 C0 05            [24] 1366 	push	ar5
      000113 C0 04            [24] 1367 	push	ar4
      000115 C0 03            [24] 1368 	push	ar3
      000117 C0 02            [24] 1369 	push	ar2
      000119 78 C5            [12] 1370 	mov	r0,#_leds_off
      00011B 79 86            [12] 1371 	mov	r1,#(_leds_off >> 8)
      00011D 7A 04            [12] 1372 	mov	r2,#(_leds_off >> 16)
      00011F 12 05 9B         [24] 1373 	lcall	__sdcc_banked_call
      000122 D0 02            [24] 1374 	pop	ar2
      000124 D0 03            [24] 1375 	pop	ar3
      000126 D0 04            [24] 1376 	pop	ar4
      000128 D0 05            [24] 1377 	pop	ar5
      00012A D0 06            [24] 1378 	pop	ar6
      00012C D0 07            [24] 1379 	pop	ar7
                                   1380 ;	../../../platform/cc2530dk/./contiki-main.c:88: for(i = 0; i < 200 - j; ++i) {
      00012E E5 81            [12] 1381 	mov	a,sp
      000130 24 FB            [12] 1382 	add	a,#0xfb
      000132 F8               [12] 1383 	mov	r0,a
      000133 E4               [12] 1384 	clr	a
      000134 F6               [12] 1385 	mov	@r0,a
      000135 08               [12] 1386 	inc	r0
      000136 F6               [12] 1387 	mov	@r0,a
      000137 74 C8            [12] 1388 	mov	a,#0xc8
      000139 C3               [12] 1389 	clr	c
      00013A 9A               [12] 1390 	subb	a,r2
      00013B FA               [12] 1391 	mov	r2,a
      00013C E4               [12] 1392 	clr	a
      00013D 9B               [12] 1393 	subb	a,r3
      00013E FB               [12] 1394 	mov	r3,a
                                   1395 ;	../../../platform/cc2530dk/./contiki-main.c:80: for(k = 0; k < 400; ++k) {
      00013F D0 05            [24] 1396 	pop	ar5
      000141 D0 04            [24] 1397 	pop	ar4
                                   1398 ;	../../../platform/cc2530dk/./contiki-main.c:88: for(i = 0; i < 200 - j; ++i) {
      000143                       1399 00108$:
      000143 E5 81            [12] 1400 	mov	a,sp
      000145 24 FD            [12] 1401 	add	a,#0xfd
      000147 F8               [12] 1402 	mov	r0,a
      000148 C3               [12] 1403 	clr	c
      000149 E6               [12] 1404 	mov	a,@r0
      00014A 9A               [12] 1405 	subb	a,r2
      00014B 08               [12] 1406 	inc	r0
      00014C E6               [12] 1407 	mov	a,@r0
      00014D 64 80            [12] 1408 	xrl	a,#0x80
      00014F 8B F0            [24] 1409 	mov	b,r3
      000151 63 F0 80         [24] 1410 	xrl	b,#0x80
      000154 95 F0            [12] 1411 	subb	a,b
      000156 50 1D            [24] 1412 	jnc	00111$
                                   1413 ;	../../../platform/cc2530dk/./contiki-main.c:89: a = i;
      000158 E5 81            [12] 1414 	mov	a,sp
      00015A 24 FD            [12] 1415 	add	a,#0xfd
      00015C F8               [12] 1416 	mov	r0,a
      00015D A9 81            [24] 1417 	mov	r1,sp
      00015F 19               [12] 1418 	dec	r1
      000160 E6               [12] 1419 	mov	a,@r0
      000161 F7               [12] 1420 	mov	@r1,a
      000162 08               [12] 1421 	inc	r0
      000163 09               [12] 1422 	inc	r1
      000164 E6               [12] 1423 	mov	a,@r0
      000165 F7               [12] 1424 	mov	@r1,a
                                   1425 ;	../../../platform/cc2530dk/./contiki-main.c:88: for(i = 0; i < 200 - j; ++i) {
      000166 E5 81            [12] 1426 	mov	a,sp
      000168 24 FD            [12] 1427 	add	a,#0xfd
      00016A F8               [12] 1428 	mov	r0,a
      00016B 74 01            [12] 1429 	mov	a,#0x01
      00016D 26               [12] 1430 	add	a,@r0
      00016E F6               [12] 1431 	mov	@r0,a
      00016F E4               [12] 1432 	clr	a
      000170 08               [12] 1433 	inc	r0
      000171 36               [12] 1434 	addc	a,@r0
      000172 F6               [12] 1435 	mov	@r0,a
      000173 80 CE            [24] 1436 	sjmp	00108$
      000175                       1437 00111$:
                                   1438 ;	../../../platform/cc2530dk/./contiki-main.c:80: for(k = 0; k < 400; ++k) {
      000175 0C               [12] 1439 	inc	r4
      000176 BC 00 01         [24] 1440 	cjne	r4,#0x00,00144$
      000179 0D               [12] 1441 	inc	r5
      00017A                       1442 00144$:
      00017A C3               [12] 1443 	clr	c
      00017B EC               [12] 1444 	mov	a,r4
      00017C 94 90            [12] 1445 	subb	a,#0x90
      00017E ED               [12] 1446 	mov	a,r5
      00017F 64 80            [12] 1447 	xrl	a,#0x80
      000181 94 81            [12] 1448 	subb	a,#0x81
      000183 50 03            [24] 1449 	jnc	00145$
      000185 02 00 7F         [24] 1450 	ljmp	00110$
      000188                       1451 00145$:
                                   1452 ;	../../../platform/cc2530dk/./contiki-main.c:92: }
      000188 E5 81            [12] 1453 	mov	a,sp
      00018A 24 FC            [12] 1454 	add	a,#0xfc
      00018C F5 81            [12] 1455 	mov	sp,a
      00018E 22               [24] 1456 	ret
                                   1457 ;------------------------------------------------------------
                                   1458 ;Allocation info for local variables in function 'set_rime_addr'
                                   1459 ;------------------------------------------------------------
                                   1460 ;i                         Allocated to registers 
                                   1461 ;macp                      Allocated to registers 
                                   1462 ;------------------------------------------------------------
                                   1463 ;	../../../platform/cc2530dk/./contiki-main.c:95: set_rime_addr(void) CC_NON_BANKED
                                   1464 ;	-----------------------------------------
                                   1465 ;	 function set_rime_addr
                                   1466 ;	-----------------------------------------
      00018F                       1467 _set_rime_addr:
                                   1468 ;	../../../platform/cc2530dk/./contiki-main.c:100: __xdata unsigned char *macp = &X_IEEE_ADDR;
      00018F 7E 0C            [12] 1469 	mov	r6,#_X_IEEE_ADDR
      000191 7F 78            [12] 1470 	mov	r7,#(_X_IEEE_ADDR >> 8)
                                   1471 ;	../../../platform/cc2530dk/./contiki-main.c:130: for(i = (RIMEADDR_SIZE - 1); i >= 0; --i) {
      000193 7D 07            [12] 1472 	mov	r5,#0x07
      000195                       1473 00102$:
                                   1474 ;	../../../platform/cc2530dk/./contiki-main.c:131: rimeaddr_node_addr.u8[i] = *macp;
      000195 ED               [12] 1475 	mov	a,r5
      000196 24 52            [12] 1476 	add	a,#_rimeaddr_node_addr
      000198 FB               [12] 1477 	mov	r3,a
      000199 E4               [12] 1478 	clr	a
      00019A 34 16            [12] 1479 	addc	a,#(_rimeaddr_node_addr >> 8)
      00019C FC               [12] 1480 	mov	r4,a
      00019D 8E 82            [24] 1481 	mov	dpl,r6
      00019F 8F 83            [24] 1482 	mov	dph,r7
      0001A1 E0               [24] 1483 	movx	a,@dptr
      0001A2 FA               [12] 1484 	mov	r2,a
      0001A3 A3               [24] 1485 	inc	dptr
      0001A4 AE 82            [24] 1486 	mov	r6,dpl
      0001A6 AF 83            [24] 1487 	mov	r7,dph
      0001A8 8B 82            [24] 1488 	mov	dpl,r3
      0001AA 8C 83            [24] 1489 	mov	dph,r4
      0001AC EA               [12] 1490 	mov	a,r2
      0001AD F0               [24] 1491 	movx	@dptr,a
                                   1492 ;	../../../platform/cc2530dk/./contiki-main.c:132: macp++;
                                   1493 ;	../../../platform/cc2530dk/./contiki-main.c:130: for(i = (RIMEADDR_SIZE - 1); i >= 0; --i) {
      0001AE 1D               [12] 1494 	dec	r5
      0001AF ED               [12] 1495 	mov	a,r5
      0001B0 30 E7 E2         [24] 1496 	jnb	acc.7,00102$
                                   1497 ;	../../../platform/cc2530dk/./contiki-main.c:152: cc2530_rf_set_addr(IEEE802154_PANID);
      0001B3 90 54 49         [24] 1498 	mov	dptr,#0x5449
      0001B6 78 61            [12] 1499 	mov	r0,#_cc2530_rf_set_addr
      0001B8 79 8B            [12] 1500 	mov	r1,#(_cc2530_rf_set_addr >> 8)
      0001BA 7A 04            [12] 1501 	mov	r2,#(_cc2530_rf_set_addr >> 16)
                                   1502 ;	../../../platform/cc2530dk/./contiki-main.c:153: return;
                                   1503 ;	../../../platform/cc2530dk/./contiki-main.c:154: }
      0001BC 02 05 9B         [24] 1504 	ljmp	__sdcc_banked_call
                                   1505 ;------------------------------------------------------------
                                   1506 ;Allocation info for local variables in function 'main'
                                   1507 ;------------------------------------------------------------
                                   1508 ;r                         Allocated to registers r6 
                                   1509 ;------------------------------------------------------------
                                   1510 ;	../../../platform/cc2530dk/./contiki-main.c:157: main(void) CC_NON_BANKED
                                   1511 ;	-----------------------------------------
                                   1512 ;	 function main
                                   1513 ;	-----------------------------------------
      0001BF                       1514 _main:
                                   1515 ;	../../../platform/cc2530dk/./contiki-main.c:160: clock_init();
      0001BF 78 D6            [12] 1516 	mov	r0,#_clock_init
      0001C1 79 3D            [12] 1517 	mov	r1,#(_clock_init >> 8)
      0001C3 7A 00            [12] 1518 	mov	r2,#(_clock_init >> 16)
      0001C5 12 05 9B         [24] 1519 	lcall	__sdcc_banked_call
                                   1520 ;	../../../platform/cc2530dk/./contiki-main.c:161: soc_init();
      0001C8 78 D4            [12] 1521 	mov	r0,#_soc_init
      0001CA 79 F2            [12] 1522 	mov	r1,#(_soc_init >> 8)
      0001CC 7A 03            [12] 1523 	mov	r2,#(_soc_init >> 16)
      0001CE 12 05 9B         [24] 1524 	lcall	__sdcc_banked_call
                                   1525 ;	../../../platform/cc2530dk/./contiki-main.c:163: rtimer_init();
      0001D1 78 03            [12] 1526 	mov	r0,#_rtimer_init
      0001D3 79 87            [12] 1527 	mov	r1,#(_rtimer_init >> 8)
      0001D5 7A 04            [12] 1528 	mov	r2,#(_rtimer_init >> 16)
      0001D7 12 05 9B         [24] 1529 	lcall	__sdcc_banked_call
                                   1530 ;	../../../platform/cc2530dk/./contiki-main.c:172: process_init();
      0001DA 78 60            [12] 1531 	mov	r0,#_process_init
      0001DC 79 85            [12] 1532 	mov	r1,#(_process_init >> 8)
      0001DE 7A 03            [12] 1533 	mov	r2,#(_process_init >> 16)
      0001E0 12 05 9B         [24] 1534 	lcall	__sdcc_banked_call
                                   1535 ;	../../../platform/cc2530dk/./contiki-main.c:179: io_arch_init();
      0001E3 78 64            [12] 1536 	mov	r0,#_uart1_init
      0001E5 79 B8            [12] 1537 	mov	r1,#(_uart1_init >> 8)
      0001E7 7A 04            [12] 1538 	mov	r2,#(_uart1_init >> 16)
      0001E9 12 05 9B         [24] 1539 	lcall	__sdcc_banked_call
                                   1540 ;	../../../platform/cc2530dk/./contiki-main.c:183: io_arch_set_input(serial_line_input_byte);
      0001EC 90 88 AE         [24] 1541 	mov	dptr,#_serial_line_input_byte
      0001EF 75 F0 04         [24] 1542 	mov	b,#(_serial_line_input_byte >> 16)
      0001F2 78 88            [12] 1543 	mov	r0,#_uart1_set_input
      0001F4 79 05            [12] 1544 	mov	r1,#(_uart1_set_input >> 8)
      0001F6 7A 00            [12] 1545 	mov	r2,#(_uart1_set_input >> 16)
      0001F8 12 05 9B         [24] 1546 	lcall	__sdcc_banked_call
                                   1547 ;	../../../platform/cc2530dk/./contiki-main.c:184: serial_line_init();
      0001FB 78 D4            [12] 1548 	mov	r0,#_serial_line_init
      0001FD 79 8A            [12] 1549 	mov	r1,#(_serial_line_init >> 8)
      0001FF 7A 04            [12] 1550 	mov	r2,#(_serial_line_init >> 16)
      000201 12 05 9B         [24] 1551 	lcall	__sdcc_banked_call
                                   1552 ;	../../../platform/cc2530dk/./contiki-main.c:186: OLEDM_Init();
      000204 78 1C            [12] 1553 	mov	r0,#_OLEDM_Init
      000206 79 8D            [12] 1554 	mov	r1,#(_OLEDM_Init >> 8)
      000208 7A 03            [12] 1555 	mov	r2,#(_OLEDM_Init >> 16)
      00020A 12 05 9B         [24] 1556 	lcall	__sdcc_banked_call
                                   1557 ;	../../../platform/cc2530dk/./contiki-main.c:191: OLED_Init();	//初始化OLED
      00020D 78 92            [12] 1558 	mov	r0,#_OLED_Init
      00020F 79 B3            [12] 1559 	mov	r1,#(_OLED_Init >> 8)
      000211 7A 02            [12] 1560 	mov	r2,#(_OLED_Init >> 16)
      000213 12 05 9B         [24] 1561 	lcall	__sdcc_banked_call
                                   1562 ;	../../../platform/cc2530dk/./contiki-main.c:209: printf("sht20 init\r\n");
      000216 74 4F            [12] 1563 	mov	a,#___str_0
      000218 C0 E0            [24] 1564 	push	acc
      00021A 74 73            [12] 1565 	mov	a,#(___str_0 >> 8)
      00021C C0 E0            [24] 1566 	push	acc
      00021E 74 80            [12] 1567 	mov	a,#0x80
      000220 C0 E0            [24] 1568 	push	acc
      000222 78 C6            [12] 1569 	mov	r0,#_printf
      000224 79 4F            [12] 1570 	mov	r1,#(_printf >> 8)
      000226 7A 00            [12] 1571 	mov	r2,#(_printf >> 16)
      000228 12 05 9B         [24] 1572 	lcall	__sdcc_banked_call
      00022B 15 81            [12] 1573 	dec	sp
      00022D 15 81            [12] 1574 	dec	sp
      00022F 15 81            [12] 1575 	dec	sp
                                   1576 ;	../../../platform/cc2530dk/./contiki-main.c:210: TM1640_Init();	//初始化数码管
      000231 78 CD            [12] 1577 	mov	r0,#_TM1640_Init
      000233 79 C1            [12] 1578 	mov	r1,#(_TM1640_Init >> 8)
      000235 7A 04            [12] 1579 	mov	r2,#(_TM1640_Init >> 16)
      000237 12 05 9B         [24] 1580 	lcall	__sdcc_banked_call
                                   1581 ;	../../../platform/cc2530dk/./contiki-main.c:211: SHT2x_Init();	//初始化温湿度
      00023A 78 B4            [12] 1582 	mov	r0,#_SHT2x_Init
      00023C 79 C6            [12] 1583 	mov	r1,#(_SHT2x_Init >> 8)
      00023E 7A 03            [12] 1584 	mov	r2,#(_SHT2x_Init >> 16)
      000240 12 05 9B         [24] 1585 	lcall	__sdcc_banked_call
                                   1586 ;	../../../platform/cc2530dk/./contiki-main.c:249: printf("this is print\r\n");
      000243 74 5C            [12] 1587 	mov	a,#___str_1
      000245 C0 E0            [24] 1588 	push	acc
      000247 74 73            [12] 1589 	mov	a,#(___str_1 >> 8)
      000249 C0 E0            [24] 1590 	push	acc
      00024B 74 80            [12] 1591 	mov	a,#0x80
      00024D C0 E0            [24] 1592 	push	acc
      00024F 78 C6            [12] 1593 	mov	r0,#_printf
      000251 79 4F            [12] 1594 	mov	r1,#(_printf >> 8)
      000253 7A 00            [12] 1595 	mov	r2,#(_printf >> 16)
      000255 12 05 9B         [24] 1596 	lcall	__sdcc_banked_call
      000258 15 81            [12] 1597 	dec	sp
      00025A 15 81            [12] 1598 	dec	sp
      00025C 15 81            [12] 1599 	dec	sp
                                   1600 ;	../../../platform/cc2530dk/./contiki-main.c:251: putstring(CONTIKI_VERSION_STRING "\r\n");
      00025E 90 73 6C         [24] 1601 	mov	dptr,#___str_2
      000261 75 F0 80         [24] 1602 	mov	b,#0x80
      000264 78 24            [12] 1603 	mov	r0,#_putstring
      000266 79 90            [12] 1604 	mov	r1,#(_putstring >> 8)
      000268 7A 04            [12] 1605 	mov	r2,#(_putstring >> 16)
      00026A 12 05 9B         [24] 1606 	lcall	__sdcc_banked_call
                                   1607 ;	../../../platform/cc2530dk/./contiki-main.c:252: putstring(MODEL_STRING);
      00026D 90 73 7A         [24] 1608 	mov	dptr,#___str_3
      000270 75 F0 80         [24] 1609 	mov	b,#0x80
      000273 78 24            [12] 1610 	mov	r0,#_putstring
      000275 79 90            [12] 1611 	mov	r1,#(_putstring >> 8)
      000277 7A 04            [12] 1612 	mov	r2,#(_putstring >> 16)
      000279 12 05 9B         [24] 1613 	lcall	__sdcc_banked_call
                                   1614 ;	../../../platform/cc2530dk/./contiki-main.c:253: switch(CHIPID) {
      00027C 90 62 4A         [24] 1615 	mov	dptr,#_CHIPID
      00027F E0               [24] 1616 	movx	a,@dptr
      000280 FF               [12] 1617 	mov	r7,a
      000281 BF 8D 02         [24] 1618 	cjne	r7,#0x8d,00169$
      000284 80 42            [24] 1619 	sjmp	00104$
      000286                       1620 00169$:
      000286 BF 95 02         [24] 1621 	cjne	r7,#0x95,00170$
      000289 80 2C            [24] 1622 	sjmp	00103$
      00028B                       1623 00170$:
      00028B BF A5 02         [24] 1624 	cjne	r7,#0xa5,00171$
      00028E 80 05            [24] 1625 	sjmp	00101$
      000290                       1626 00171$:
                                   1627 ;	../../../platform/cc2530dk/./contiki-main.c:254: case 0xA5:
      000290 BF B5 44         [24] 1628 	cjne	r7,#0xb5,00105$
      000293 80 11            [24] 1629 	sjmp	00102$
      000295                       1630 00101$:
                                   1631 ;	../../../platform/cc2530dk/./contiki-main.c:255: putstring("cc2530");
      000295 90 73 8B         [24] 1632 	mov	dptr,#___str_4
      000298 75 F0 80         [24] 1633 	mov	b,#0x80
      00029B 78 24            [12] 1634 	mov	r0,#_putstring
      00029D 79 90            [12] 1635 	mov	r1,#(_putstring >> 8)
      00029F 7A 04            [12] 1636 	mov	r2,#(_putstring >> 16)
      0002A1 12 05 9B         [24] 1637 	lcall	__sdcc_banked_call
                                   1638 ;	../../../platform/cc2530dk/./contiki-main.c:256: break;
                                   1639 ;	../../../platform/cc2530dk/./contiki-main.c:257: case 0xB5:
      0002A4 80 31            [24] 1640 	sjmp	00105$
      0002A6                       1641 00102$:
                                   1642 ;	../../../platform/cc2530dk/./contiki-main.c:258: putstring("cc2531");
      0002A6 90 73 92         [24] 1643 	mov	dptr,#___str_5
      0002A9 75 F0 80         [24] 1644 	mov	b,#0x80
      0002AC 78 24            [12] 1645 	mov	r0,#_putstring
      0002AE 79 90            [12] 1646 	mov	r1,#(_putstring >> 8)
      0002B0 7A 04            [12] 1647 	mov	r2,#(_putstring >> 16)
      0002B2 12 05 9B         [24] 1648 	lcall	__sdcc_banked_call
                                   1649 ;	../../../platform/cc2530dk/./contiki-main.c:259: break;
                                   1650 ;	../../../platform/cc2530dk/./contiki-main.c:260: case 0x95:
      0002B5 80 20            [24] 1651 	sjmp	00105$
      0002B7                       1652 00103$:
                                   1653 ;	../../../platform/cc2530dk/./contiki-main.c:261: putstring("cc2533");
      0002B7 90 73 99         [24] 1654 	mov	dptr,#___str_6
      0002BA 75 F0 80         [24] 1655 	mov	b,#0x80
      0002BD 78 24            [12] 1656 	mov	r0,#_putstring
      0002BF 79 90            [12] 1657 	mov	r1,#(_putstring >> 8)
      0002C1 7A 04            [12] 1658 	mov	r2,#(_putstring >> 16)
      0002C3 12 05 9B         [24] 1659 	lcall	__sdcc_banked_call
                                   1660 ;	../../../platform/cc2530dk/./contiki-main.c:262: break;
                                   1661 ;	../../../platform/cc2530dk/./contiki-main.c:263: case 0x8D:
      0002C6 80 0F            [24] 1662 	sjmp	00105$
      0002C8                       1663 00104$:
                                   1664 ;	../../../platform/cc2530dk/./contiki-main.c:264: putstring("cc2540");
      0002C8 90 73 A0         [24] 1665 	mov	dptr,#___str_7
      0002CB 75 F0 80         [24] 1666 	mov	b,#0x80
      0002CE 78 24            [12] 1667 	mov	r0,#_putstring
      0002D0 79 90            [12] 1668 	mov	r1,#(_putstring >> 8)
      0002D2 7A 04            [12] 1669 	mov	r2,#(_putstring >> 16)
      0002D4 12 05 9B         [24] 1670 	lcall	__sdcc_banked_call
                                   1671 ;	../../../platform/cc2530dk/./contiki-main.c:266: }
      0002D7                       1672 00105$:
                                   1673 ;	../../../platform/cc2530dk/./contiki-main.c:268: putstring("-" CC2530_FLAVOR_STRING ", ");
      0002D7 90 73 A7         [24] 1674 	mov	dptr,#___str_8
      0002DA 75 F0 80         [24] 1675 	mov	b,#0x80
      0002DD 78 24            [12] 1676 	mov	r0,#_putstring
      0002DF 79 90            [12] 1677 	mov	r1,#(_putstring >> 8)
      0002E1 7A 04            [12] 1678 	mov	r2,#(_putstring >> 16)
      0002E3 12 05 9B         [24] 1679 	lcall	__sdcc_banked_call
                                   1680 ;	../../../platform/cc2530dk/./contiki-main.c:269: puthex(CHIPINFO1 + 1);
      0002E6 90 62 77         [24] 1681 	mov	dptr,#_CHIPINFO1
      0002E9 E0               [24] 1682 	movx	a,@dptr
      0002EA FF               [12] 1683 	mov	r7,a
      0002EB 0F               [12] 1684 	inc	r7
      0002EC 8F 82            [24] 1685 	mov	dpl,r7
      0002EE 78 60            [12] 1686 	mov	r0,#_puthex
      0002F0 79 90            [12] 1687 	mov	r1,#(_puthex >> 8)
      0002F2 7A 04            [12] 1688 	mov	r2,#(_puthex >> 16)
      0002F4 12 05 9B         [24] 1689 	lcall	__sdcc_banked_call
                                   1690 ;	../../../platform/cc2530dk/./contiki-main.c:270: putstring("KB SRAM\r\n");
      0002F7 90 73 AF         [24] 1691 	mov	dptr,#___str_9
      0002FA 75 F0 80         [24] 1692 	mov	b,#0x80
      0002FD 78 24            [12] 1693 	mov	r0,#_putstring
      0002FF 79 90            [12] 1694 	mov	r1,#(_putstring >> 8)
      000301 7A 04            [12] 1695 	mov	r2,#(_putstring >> 16)
      000303 12 05 9B         [24] 1696 	lcall	__sdcc_banked_call
                                   1697 ;	../../../platform/cc2530dk/./contiki-main.c:307: watchdog_init();
      000306 78 5A            [12] 1698 	mov	r0,#_watchdog_init
      000308 79 93            [12] 1699 	mov	r1,#(_watchdog_init >> 8)
      00030A 7A 03            [12] 1700 	mov	r2,#(_watchdog_init >> 16)
      00030C 12 05 9B         [24] 1701 	lcall	__sdcc_banked_call
                                   1702 ;	../../../platform/cc2530dk/./contiki-main.c:310: random_init(0);
      00030F 90 00 00         [24] 1703 	mov	dptr,#0x0000
      000312 78 A5            [12] 1704 	mov	r0,#_random_init
      000314 79 B8            [12] 1705 	mov	r1,#(_random_init >> 8)
      000316 7A 04            [12] 1706 	mov	r2,#(_random_init >> 16)
      000318 12 05 9B         [24] 1707 	lcall	__sdcc_banked_call
                                   1708 ;	../../../platform/cc2530dk/./contiki-main.c:313: process_start(&etimer_process, NULL);
      00031B E4               [12] 1709 	clr	a
      00031C C0 E0            [24] 1710 	push	acc
      00031E C0 E0            [24] 1711 	push	acc
      000320 C0 E0            [24] 1712 	push	acc
      000322 90 18 98         [24] 1713 	mov	dptr,#_etimer_process
      000325 75 F0 00         [24] 1714 	mov	b,#0x00
      000328 78 0C            [12] 1715 	mov	r0,#_process_start
      00032A 79 80            [12] 1716 	mov	r1,#(_process_start >> 8)
      00032C 7A 03            [12] 1717 	mov	r2,#(_process_start >> 16)
      00032E 12 05 9B         [24] 1718 	lcall	__sdcc_banked_call
      000331 15 81            [12] 1719 	dec	sp
      000333 15 81            [12] 1720 	dec	sp
      000335 15 81            [12] 1721 	dec	sp
                                   1722 ;	../../../platform/cc2530dk/./contiki-main.c:314: ctimer_init();
      000337 78 32            [12] 1723 	mov	r0,#_ctimer_init
      000339 79 BC            [12] 1724 	mov	r1,#(_ctimer_init >> 8)
      00033B 7A 04            [12] 1725 	mov	r2,#(_ctimer_init >> 16)
      00033D 12 05 9B         [24] 1726 	lcall	__sdcc_banked_call
                                   1727 ;	../../../platform/cc2530dk/./contiki-main.c:317: netstack_init();
      000340 78 32            [12] 1728 	mov	r0,#_netstack_init
      000342 79 91            [12] 1729 	mov	r1,#(_netstack_init >> 8)
      000344 7A 04            [12] 1730 	mov	r2,#(_netstack_init >> 16)
      000346 12 05 9B         [24] 1731 	lcall	__sdcc_banked_call
                                   1732 ;	../../../platform/cc2530dk/./contiki-main.c:318: set_rime_addr();
      000349 12 01 8F         [24] 1733 	lcall	_set_rime_addr
                                   1734 ;	../../../platform/cc2530dk/./contiki-main.c:322: memcpy(&uip_lladdr.addr, &rimeaddr_node_addr, sizeof(uip_lladdr.addr));
      00034C 74 08            [12] 1735 	mov	a,#0x08
      00034E C0 E0            [24] 1736 	push	acc
      000350 E4               [12] 1737 	clr	a
      000351 C0 E0            [24] 1738 	push	acc
      000353 74 52            [12] 1739 	mov	a,#_rimeaddr_node_addr
      000355 C0 E0            [24] 1740 	push	acc
      000357 74 16            [12] 1741 	mov	a,#(_rimeaddr_node_addr >> 8)
      000359 C0 E0            [24] 1742 	push	acc
      00035B E4               [12] 1743 	clr	a
      00035C C0 E0            [24] 1744 	push	acc
      00035E 90 06 3B         [24] 1745 	mov	dptr,#_uip_lladdr
      000361 75 F0 00         [24] 1746 	mov	b,#0x00
      000364 78 6C            [12] 1747 	mov	r0,#___memcpy
      000366 79 4E            [12] 1748 	mov	r1,#(___memcpy >> 8)
      000368 7A 00            [12] 1749 	mov	r2,#(___memcpy >> 16)
      00036A 12 05 9B         [24] 1750 	lcall	__sdcc_banked_call
      00036D E5 81            [12] 1751 	mov	a,sp
      00036F 24 FB            [12] 1752 	add	a,#0xfb
      000371 F5 81            [12] 1753 	mov	sp,a
                                   1754 ;	../../../platform/cc2530dk/./contiki-main.c:323: queuebuf_init();
      000373 78 96            [12] 1755 	mov	r0,#_queuebuf_init
      000375 79 9A            [12] 1756 	mov	r1,#(_queuebuf_init >> 8)
      000377 7A 04            [12] 1757 	mov	r2,#(_queuebuf_init >> 16)
      000379 12 05 9B         [24] 1758 	lcall	__sdcc_banked_call
                                   1759 ;	../../../platform/cc2530dk/./contiki-main.c:324: process_start(&tcpip_process, NULL);
      00037C E4               [12] 1760 	clr	a
      00037D C0 E0            [24] 1761 	push	acc
      00037F C0 E0            [24] 1762 	push	acc
      000381 C0 E0            [24] 1763 	push	acc
      000383 90 18 85         [24] 1764 	mov	dptr,#_tcpip_process
      000386 75 F0 00         [24] 1765 	mov	b,#0x00
      000389 78 0C            [12] 1766 	mov	r0,#_process_start
      00038B 79 80            [12] 1767 	mov	r1,#(_process_start >> 8)
      00038D 7A 03            [12] 1768 	mov	r2,#(_process_start >> 16)
      00038F 12 05 9B         [24] 1769 	lcall	__sdcc_banked_call
      000392 15 81            [12] 1770 	dec	sp
      000394 15 81            [12] 1771 	dec	sp
      000396 15 81            [12] 1772 	dec	sp
                                   1773 ;	../../../platform/cc2530dk/./contiki-main.c:328: process_start(&viztool_process, NULL);
      000398 E4               [12] 1774 	clr	a
      000399 C0 E0            [24] 1775 	push	acc
      00039B C0 E0            [24] 1776 	push	acc
      00039D C0 E0            [24] 1777 	push	acc
      00039F 90 18 FA         [24] 1778 	mov	dptr,#_viztool_process
      0003A2 75 F0 00         [24] 1779 	mov	b,#0x00
      0003A5 78 0C            [12] 1780 	mov	r0,#_process_start
      0003A7 79 80            [12] 1781 	mov	r1,#(_process_start >> 8)
      0003A9 7A 03            [12] 1782 	mov	r2,#(_process_start >> 16)
      0003AB 12 05 9B         [24] 1783 	lcall	__sdcc_banked_call
      0003AE 15 81            [12] 1784 	dec	sp
      0003B0 15 81            [12] 1785 	dec	sp
      0003B2 15 81            [12] 1786 	dec	sp
                                   1787 ;	../../../platform/cc2530dk/./contiki-main.c:331: energest_init();
      0003B4 78 40            [12] 1788 	mov	r0,#_energest_init
      0003B6 79 BA            [12] 1789 	mov	r1,#(_energest_init >> 8)
      0003B8 7A 02            [12] 1790 	mov	r2,#(_energest_init >> 16)
      0003BA 12 05 9B         [24] 1791 	lcall	__sdcc_banked_call
                                   1792 ;	../../../platform/cc2530dk/./contiki-main.c:334: autostart_start(autostart_processes);
      0003BD 90 73 CA         [24] 1793 	mov	dptr,#_autostart_processes
      0003C0 75 F0 80         [24] 1794 	mov	b,#0x80
      0003C3 78 04            [12] 1795 	mov	r0,#_autostart_start
      0003C5 79 99            [12] 1796 	mov	r1,#(_autostart_start >> 8)
      0003C7 7A 04            [12] 1797 	mov	r2,#(_autostart_start >> 16)
      0003C9 12 05 9B         [24] 1798 	lcall	__sdcc_banked_call
                                   1799 ;	../../../platform/cc2530dk/./contiki-main.c:336: watchdog_start();
      0003CC 78 60            [12] 1800 	mov	r0,#_watchdog_start
      0003CE 79 93            [12] 1801 	mov	r1,#(_watchdog_start >> 8)
      0003D0 7A 03            [12] 1802 	mov	r2,#(_watchdog_start >> 16)
      0003D2 12 05 9B         [24] 1803 	lcall	__sdcc_banked_call
                                   1804 ;	../../../platform/cc2530dk/./contiki-main.c:340: do {
      0003D5                       1805 00113$:
                                   1806 ;	../../../platform/cc2530dk/./contiki-main.c:342: watchdog_periodic();
      0003D5 78 66            [12] 1807 	mov	r0,#_watchdog_periodic
      0003D7 79 93            [12] 1808 	mov	r1,#(_watchdog_periodic >> 8)
      0003D9 7A 03            [12] 1809 	mov	r2,#(_watchdog_periodic >> 16)
      0003DB 12 05 9B         [24] 1810 	lcall	__sdcc_banked_call
                                   1811 ;	../../../platform/cc2530dk/./contiki-main.c:345: if(sleep_flag) {
      0003DE 90 11 35         [24] 1812 	mov	dptr,#_sleep_flag
      0003E1 E0               [24] 1813 	movx	a,@dptr
      0003E2 60 57            [24] 1814 	jz	00112$
                                   1815 ;	../../../platform/cc2530dk/./contiki-main.c:346: if(etimer_pending() &&
      0003E4 78 46            [12] 1816 	mov	r0,#_etimer_pending
      0003E6 79 9C            [12] 1817 	mov	r1,#(_etimer_pending >> 8)
      0003E8 7A 03            [12] 1818 	mov	r2,#(_etimer_pending >> 16)
      0003EA 12 05 9B         [24] 1819 	lcall	__sdcc_banked_call
      0003ED E5 82            [12] 1820 	mov	a,dpl
      0003EF 85 83 F0         [24] 1821 	mov	b,dph
      0003F2 45 F0            [12] 1822 	orl	a,b
      0003F4 60 40            [24] 1823 	jz	00109$
                                   1824 ;	../../../platform/cc2530dk/./contiki-main.c:347: (etimer_next_expiration_time() - clock_time() - 1) > MAX_TICKS) {
      0003F6 78 64            [12] 1825 	mov	r0,#_etimer_next_expiration_time
      0003F8 79 9C            [12] 1826 	mov	r1,#(_etimer_next_expiration_time >> 8)
      0003FA 7A 03            [12] 1827 	mov	r2,#(_etimer_next_expiration_time >> 16)
      0003FC 12 05 9B         [24] 1828 	lcall	__sdcc_banked_call
      0003FF AE 82            [24] 1829 	mov	r6,dpl
      000401 AF 83            [24] 1830 	mov	r7,dph
      000403 C0 07            [24] 1831 	push	ar7
      000405 C0 06            [24] 1832 	push	ar6
      000407 78 BB            [12] 1833 	mov	r0,#_clock_time
      000409 79 3D            [12] 1834 	mov	r1,#(_clock_time >> 8)
      00040B 7A 00            [12] 1835 	mov	r2,#(_clock_time >> 16)
      00040D 12 05 9B         [24] 1836 	lcall	__sdcc_banked_call
      000410 AC 82            [24] 1837 	mov	r4,dpl
      000412 AD 83            [24] 1838 	mov	r5,dph
      000414 D0 06            [24] 1839 	pop	ar6
      000416 D0 07            [24] 1840 	pop	ar7
      000418 EE               [12] 1841 	mov	a,r6
      000419 C3               [12] 1842 	clr	c
      00041A 9C               [12] 1843 	subb	a,r4
      00041B FE               [12] 1844 	mov	r6,a
      00041C EF               [12] 1845 	mov	a,r7
      00041D 9D               [12] 1846 	subb	a,r5
      00041E FF               [12] 1847 	mov	r7,a
      00041F 1E               [12] 1848 	dec	r6
      000420 BE FF 01         [24] 1849 	cjne	r6,#0xff,00175$
      000423 1F               [12] 1850 	dec	r7
      000424                       1851 00175$:
      000424 C3               [12] 1852 	clr	c
      000425 74 FF            [12] 1853 	mov	a,#0xff
      000427 9E               [12] 1854 	subb	a,r6
      000428 74 7F            [12] 1855 	mov	a,#0x7f
      00042A 9F               [12] 1856 	subb	a,r7
      00042B 50 09            [24] 1857 	jnc	00109$
                                   1858 ;	../../../platform/cc2530dk/./contiki-main.c:348: etimer_request_poll();
      00042D 78 AC            [12] 1859 	mov	r0,#_etimer_request_poll
      00042F 79 99            [12] 1860 	mov	r1,#(_etimer_request_poll >> 8)
      000431 7A 03            [12] 1861 	mov	r2,#(_etimer_request_poll >> 16)
      000433 12 05 9B         [24] 1862 	lcall	__sdcc_banked_call
      000436                       1863 00109$:
                                   1864 ;	../../../platform/cc2530dk/./contiki-main.c:350: sleep_flag = 0;
      000436 90 11 35         [24] 1865 	mov	dptr,#_sleep_flag
      000439 E4               [12] 1866 	clr	a
      00043A F0               [24] 1867 	movx	@dptr,a
      00043B                       1868 00112$:
                                   1869 ;	../../../platform/cc2530dk/./contiki-main.c:353: r = process_run();
      00043B 78 84            [12] 1870 	mov	r0,#_process_run
      00043D 79 87            [12] 1871 	mov	r1,#(_process_run >> 8)
      00043F 7A 03            [12] 1872 	mov	r2,#(_process_run >> 16)
      000441 12 05 9B         [24] 1873 	lcall	__sdcc_banked_call
      000444 AE 82            [24] 1874 	mov	r6,dpl
      000446 AF 83            [24] 1875 	mov	r7,dph
                                   1876 ;	../../../platform/cc2530dk/./contiki-main.c:354: } while(r > 0);
      000448 EE               [12] 1877 	mov	a,r6
      000449 70 8A            [24] 1878 	jnz	00113$
                                   1879 ;	../../../platform/cc2530dk/./contiki-main.c:355: len = NETSTACK_RADIO.pending_packet();
      00044B 90 7D 52         [24] 1880 	mov	dptr,#(_cc2530_rf_driver + 0x0015)
      00044E E4               [12] 1881 	clr	a
      00044F 93               [24] 1882 	movc	a,@a+dptr
      000450 FD               [12] 1883 	mov	r5,a
      000451 A3               [24] 1884 	inc	dptr
      000452 E4               [12] 1885 	clr	a
      000453 93               [24] 1886 	movc	a,@a+dptr
      000454 FE               [12] 1887 	mov	r6,a
      000455 A3               [24] 1888 	inc	dptr
      000456 E4               [12] 1889 	clr	a
      000457 93               [24] 1890 	movc	a,@a+dptr
      000458 FF               [12] 1891 	mov	r7,a
      000459 C0 07            [24] 1892 	push	ar7
      00045B C0 06            [24] 1893 	push	ar6
      00045D C0 05            [24] 1894 	push	ar5
      00045F C0 05            [24] 1895 	push	ar5
      000461 C0 06            [24] 1896 	push	ar6
      000463 C0 07            [24] 1897 	push	ar7
      000465 D0 02            [24] 1898 	pop	ar2
      000467 D0 01            [24] 1899 	pop	ar1
      000469 D0 00            [24] 1900 	pop	ar0
      00046B 12 05 9B         [24] 1901 	lcall	__sdcc_banked_call
      00046E 85 82 08         [24] 1902 	mov	_len,dpl
      000471 85 83 09         [24] 1903 	mov	(_len + 1),dph
      000474 D0 05            [24] 1904 	pop	ar5
      000476 D0 06            [24] 1905 	pop	ar6
      000478 D0 07            [24] 1906 	pop	ar7
                                   1907 ;	../../../platform/cc2530dk/./contiki-main.c:356: if(len) {
      00047A E5 08            [12] 1908 	mov	a,_len
      00047C 45 09            [12] 1909 	orl	a,(_len + 1)
      00047E 70 03            [24] 1910 	jnz	00178$
      000480 02 03 D5         [24] 1911 	ljmp	00113$
      000483                       1912 00178$:
                                   1913 ;	../../../platform/cc2530dk/./contiki-main.c:357: packetbuf_clear();
      000483 78 60            [12] 1914 	mov	r0,#_packetbuf_clear
      000485 79 A1            [12] 1915 	mov	r1,#(_packetbuf_clear >> 8)
      000487 7A 04            [12] 1916 	mov	r2,#(_packetbuf_clear >> 16)
      000489 12 05 9B         [24] 1917 	lcall	__sdcc_banked_call
                                   1918 ;	../../../platform/cc2530dk/./contiki-main.c:358: len = NETSTACK_RADIO.read(packetbuf_dataptr(), PACKETBUF_SIZE);
      00048C 90 7D 49         [24] 1919 	mov	dptr,#(_cc2530_rf_driver + 0x000c)
      00048F E4               [12] 1920 	clr	a
      000490 93               [24] 1921 	movc	a,@a+dptr
      000491 FD               [12] 1922 	mov	r5,a
      000492 A3               [24] 1923 	inc	dptr
      000493 E4               [12] 1924 	clr	a
      000494 93               [24] 1925 	movc	a,@a+dptr
      000495 FE               [12] 1926 	mov	r6,a
      000496 A3               [24] 1927 	inc	dptr
      000497 E4               [12] 1928 	clr	a
      000498 93               [24] 1929 	movc	a,@a+dptr
      000499 FF               [12] 1930 	mov	r7,a
      00049A C0 07            [24] 1931 	push	ar7
      00049C C0 06            [24] 1932 	push	ar6
      00049E C0 05            [24] 1933 	push	ar5
      0004A0 78 A0            [12] 1934 	mov	r0,#_packetbuf_dataptr
      0004A2 79 A5            [12] 1935 	mov	r1,#(_packetbuf_dataptr >> 8)
      0004A4 7A 04            [12] 1936 	mov	r2,#(_packetbuf_dataptr >> 16)
      0004A6 12 05 9B         [24] 1937 	lcall	__sdcc_banked_call
      0004A9 AA 82            [24] 1938 	mov	r2,dpl
      0004AB AB 83            [24] 1939 	mov	r3,dph
      0004AD AC F0            [24] 1940 	mov	r4,b
      0004AF D0 05            [24] 1941 	pop	ar5
      0004B1 D0 06            [24] 1942 	pop	ar6
      0004B3 D0 07            [24] 1943 	pop	ar7
      0004B5 C0 07            [24] 1944 	push	ar7
      0004B7 C0 06            [24] 1945 	push	ar6
      0004B9 C0 05            [24] 1946 	push	ar5
      0004BB 74 80            [12] 1947 	mov	a,#0x80
      0004BD C0 E0            [24] 1948 	push	acc
      0004BF E4               [12] 1949 	clr	a
      0004C0 C0 E0            [24] 1950 	push	acc
      0004C2 C0 05            [24] 1951 	push	ar5
      0004C4 C0 06            [24] 1952 	push	ar6
      0004C6 C0 07            [24] 1953 	push	ar7
      0004C8 8A 82            [24] 1954 	mov	dpl,r2
      0004CA 8B 83            [24] 1955 	mov	dph,r3
      0004CC 8C F0            [24] 1956 	mov	b,r4
      0004CE D0 02            [24] 1957 	pop	ar2
      0004D0 D0 01            [24] 1958 	pop	ar1
      0004D2 D0 00            [24] 1959 	pop	ar0
      0004D4 12 05 9B         [24] 1960 	lcall	__sdcc_banked_call
      0004D7 85 82 08         [24] 1961 	mov	_len,dpl
      0004DA 85 83 09         [24] 1962 	mov	(_len + 1),dph
      0004DD 15 81            [12] 1963 	dec	sp
      0004DF 15 81            [12] 1964 	dec	sp
      0004E1 D0 05            [24] 1965 	pop	ar5
      0004E3 D0 06            [24] 1966 	pop	ar6
      0004E5 D0 07            [24] 1967 	pop	ar7
                                   1968 ;	../../../platform/cc2530dk/./contiki-main.c:359: if(len > 0) {
      0004E7 E5 08            [12] 1969 	mov	a,_len
      0004E9 45 09            [12] 1970 	orl	a,(_len + 1)
      0004EB 70 03            [24] 1971 	jnz	00179$
      0004ED 02 03 D5         [24] 1972 	ljmp	00113$
      0004F0                       1973 00179$:
                                   1974 ;	../../../platform/cc2530dk/./contiki-main.c:360: packetbuf_set_datalen(len);
      0004F0 85 08 82         [24] 1975 	mov	dpl,_len
      0004F3 85 09 83         [24] 1976 	mov	dph,(_len + 1)
      0004F6 78 92            [12] 1977 	mov	r0,#_packetbuf_set_datalen
      0004F8 79 A5            [12] 1978 	mov	r1,#(_packetbuf_set_datalen >> 8)
      0004FA 7A 04            [12] 1979 	mov	r2,#(_packetbuf_set_datalen >> 16)
      0004FC 12 05 9B         [24] 1980 	lcall	__sdcc_banked_call
                                   1981 ;	../../../platform/cc2530dk/./contiki-main.c:361: NETSTACK_RDC.input();
      0004FF 90 7D E5         [24] 1982 	mov	dptr,#(_nullrdc_driver + 0x000c)
      000502 E4               [12] 1983 	clr	a
      000503 93               [24] 1984 	movc	a,@a+dptr
      000504 FD               [12] 1985 	mov	r5,a
      000505 A3               [24] 1986 	inc	dptr
      000506 E4               [12] 1987 	clr	a
      000507 93               [24] 1988 	movc	a,@a+dptr
      000508 FE               [12] 1989 	mov	r6,a
      000509 A3               [24] 1990 	inc	dptr
      00050A E4               [12] 1991 	clr	a
      00050B 93               [24] 1992 	movc	a,@a+dptr
      00050C FF               [12] 1993 	mov	r7,a
      00050D C0 07            [24] 1994 	push	ar7
      00050F C0 06            [24] 1995 	push	ar6
      000511 C0 05            [24] 1996 	push	ar5
      000513 C0 05            [24] 1997 	push	ar5
      000515 C0 06            [24] 1998 	push	ar6
      000517 C0 07            [24] 1999 	push	ar7
      000519 D0 02            [24] 2000 	pop	ar2
      00051B D0 01            [24] 2001 	pop	ar1
      00051D D0 00            [24] 2002 	pop	ar0
      00051F 12 05 9B         [24] 2003 	lcall	__sdcc_banked_call
      000522 D0 05            [24] 2004 	pop	ar5
      000524 D0 06            [24] 2005 	pop	ar6
      000526 D0 07            [24] 2006 	pop	ar7
                                   2007 ;	../../../platform/cc2530dk/./contiki-main.c:428: }
      000528 02 03 D5         [24] 2008 	ljmp	00113$
                                   2009 	.area CSEG    (CODE)
                                   2010 	.area CONST   (CODE)
      00734F                       2011 ___str_0:
      00734F 73 68 74 32 30 20 69  2012 	.ascii "sht20 init"
             6E 69 74
      007359 0D                    2013 	.db 0x0d
      00735A 0A                    2014 	.db 0x0a
      00735B 00                    2015 	.db 0x00
      00735C                       2016 ___str_1:
      00735C 74 68 69 73 20 69 73  2017 	.ascii "this is print"
             20 70 72 69 6E 74
      007369 0D                    2018 	.db 0x0d
      00736A 0A                    2019 	.db 0x0a
      00736B 00                    2020 	.db 0x00
      00736C                       2021 ___str_2:
      00736C 43 6F 6E 74 69 6B 69  2022 	.ascii "Contiki 2.6"
             20 32 2E 36
      007377 0D                    2023 	.db 0x0d
      007378 0A                    2024 	.db 0x0a
      007379 00                    2025 	.db 0x00
      00737A                       2026 ___str_3:
      00737A 54 49 20 53 6D 61 72  2027 	.ascii "TI SmartRF05 EB"
             74 52 46 30 35 20 45
             42
      007389 0A                    2028 	.db 0x0a
      00738A 00                    2029 	.db 0x00
      00738B                       2030 ___str_4:
      00738B 63 63 32 35 33 30     2031 	.ascii "cc2530"
      007391 00                    2032 	.db 0x00
      007392                       2033 ___str_5:
      007392 63 63 32 35 33 31     2034 	.ascii "cc2531"
      007398 00                    2035 	.db 0x00
      007399                       2036 ___str_6:
      007399 63 63 32 35 33 33     2037 	.ascii "cc2533"
      00739F 00                    2038 	.db 0x00
      0073A0                       2039 ___str_7:
      0073A0 63 63 32 35 34 30     2040 	.ascii "cc2540"
      0073A6 00                    2041 	.db 0x00
      0073A7                       2042 ___str_8:
      0073A7 2D 46 32 35 36 2C 20  2043 	.ascii "-F256, "
      0073AE 00                    2044 	.db 0x00
      0073AF                       2045 ___str_9:
      0073AF 4B 42 20 53 52 41 4D  2046 	.ascii "KB SRAM"
      0073B6 0D                    2047 	.db 0x0d
      0073B7 0A                    2048 	.db 0x0a
      0073B8 00                    2049 	.db 0x00
                                   2050 	.area XINIT   (CODE)
                                   2051 	.area CABS    (ABS,CODE)
