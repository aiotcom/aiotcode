;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module nullrdc_noframer
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _nullrdc_noframer_driver
	.globl _queuebuf_to_packetbuf
	.globl _packetbuf_totlen
	.globl _packetbuf_hdrptr
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
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
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
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
;Allocation info for local variables in function 'send_packet'
;------------------------------------------------------------
;ptr                       Allocated to stack - sp -10
;sent                      Allocated to stack - sp -4
;ret                       Allocated to registers r6 r7 
;sloc0                     Allocated to stack - sp -1
;------------------------------------------------------------
;	../../../core/net/mac/nullrdc-noframer.c:48: send_packet(mac_callback_t sent, void *ptr)
;	-----------------------------------------
;	 function send_packet
;	-----------------------------------------
_send_packet:
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
	inc	sp
	inc	sp
;	../../../core/net/mac/nullrdc-noframer.c:51: if(NETSTACK_RADIO.send(packetbuf_hdrptr(), packetbuf_totlen()) == RADIO_TX_OK) {
	mov	dptr,#(_cc2530_rf_driver + 0x0009)
	clr	a
	movc	a,@a+dptr
	mov	r2,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r3,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_packetbuf_totlen
	mov	r1,#(_packetbuf_totlen >> 8)
	mov	r2,#(_packetbuf_totlen >> 16)
	lcall	__sdcc_banked_call
	xch	a,r0
	mov	a,sp
	add	a,#0xfc
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	mov	r0,#_packetbuf_hdrptr
	mov	r1,#(_packetbuf_hdrptr >> 8)
	mov	r2,#(_packetbuf_hdrptr >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	pop	ar2
	pop	ar3
	pop	ar4
	push	ar4
	mov	r0,sp
	dec	r0
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
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	dec	sp
	dec	sp
	pop	ar4
	mov	a,r2
	orl	a,r3
;	../../../core/net/mac/nullrdc-noframer.c:52: ret = MAC_TX_OK;
	jnz	00102$
	mov	r6,a
	mov	r7,a
	sjmp	00106$
00102$:
;	../../../core/net/mac/nullrdc-noframer.c:54: ret =  MAC_TX_ERR;
	mov	r6,#0x04
	mov	r7,#0x00
;	../../../core/net/mac/nullrdc-noframer.c:56: mac_call_sent_callback(sent, ptr, ret, 1);
00106$:
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00109$
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	push	ar6
	push	ar7
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
	mov	a,sp
	add	a,#0xef
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
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
00109$:
;	../../../core/net/mac/nullrdc-noframer.c:57: }
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'send_list'
;------------------------------------------------------------
;ptr                       Allocated to stack - sp -5
;buf_list                  Allocated to stack - sp -8
;sent                      Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/mac/nullrdc-noframer.c:60: send_list(mac_callback_t sent, void *ptr, struct rdc_buf_list *buf_list)
;	-----------------------------------------
;	 function send_list
;	-----------------------------------------
_send_list:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/mac/nullrdc-noframer.c:62: if(buf_list != NULL) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00103$
;	../../../core/net/mac/nullrdc-noframer.c:63: queuebuf_to_packetbuf(buf_list->buf);
	mov	a,sp
	add	a,#0xf8
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
	mov	r0,#_queuebuf_to_packetbuf
	mov	r1,#(_queuebuf_to_packetbuf >> 8)
	mov	r2,#(_queuebuf_to_packetbuf >> 16)
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/mac/nullrdc-noframer.c:64: send_packet(sent, ptr);
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_send_packet
	mov	r1,#(_send_packet >> 8)
	mov	r2,#(_send_packet >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00103$:
;	../../../core/net/mac/nullrdc-noframer.c:66: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'packet_input'
;------------------------------------------------------------
;	../../../core/net/mac/nullrdc-noframer.c:69: packet_input(void)
;	-----------------------------------------
;	 function packet_input
;	-----------------------------------------
_packet_input:
;	../../../core/net/mac/nullrdc-noframer.c:71: NETSTACK_MAC.input();
	mov	dptr,#(_csma_driver + 0x0009)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r6,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	push	ar7
	push	ar6
	push	ar5
	push	ar5
	push	ar6
	push	ar7
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/mac/nullrdc-noframer.c:72: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'on'
;------------------------------------------------------------
;	../../../core/net/mac/nullrdc-noframer.c:75: on(void)
;	-----------------------------------------
;	 function on
;	-----------------------------------------
_on:
;	../../../core/net/mac/nullrdc-noframer.c:77: return NETSTACK_RADIO.on();
	mov	dptr,#(_cc2530_rf_driver + 0x0018)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r6,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	push	ar7
	push	ar5
	push	ar6
	push	ar7
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
;	../../../core/net/mac/nullrdc-noframer.c:78: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'off'
;------------------------------------------------------------
;keep_radio_on             Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/mac/nullrdc-noframer.c:81: off(int keep_radio_on)
;	-----------------------------------------
;	 function off
;	-----------------------------------------
_off:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/net/mac/nullrdc-noframer.c:83: if(keep_radio_on) {
	mov	a,r6
	orl	a,r7
	jz	00102$
;	../../../core/net/mac/nullrdc-noframer.c:84: return NETSTACK_RADIO.on();
	mov	dptr,#(_cc2530_rf_driver + 0x0018)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r6,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	push	ar7
	push	ar5
	push	ar6
	push	ar7
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	sjmp	00104$
00102$:
;	../../../core/net/mac/nullrdc-noframer.c:86: return NETSTACK_RADIO.off();
	mov	dptr,#(_cc2530_rf_driver + 0x001b)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r6,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	push	ar7
	push	ar5
	push	ar6
	push	ar7
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
00104$:
;	../../../core/net/mac/nullrdc-noframer.c:88: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'channel_check_interval'
;------------------------------------------------------------
;	../../../core/net/mac/nullrdc-noframer.c:91: channel_check_interval(void)
;	-----------------------------------------
;	 function channel_check_interval
;	-----------------------------------------
_channel_check_interval:
;	../../../core/net/mac/nullrdc-noframer.c:93: return 0;
	mov	dptr,#0x0000
;	../../../core/net/mac/nullrdc-noframer.c:94: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init'
;------------------------------------------------------------
;	../../../core/net/mac/nullrdc-noframer.c:97: init(void)
;	-----------------------------------------
;	 function init
;	-----------------------------------------
_init:
;	../../../core/net/mac/nullrdc-noframer.c:99: on();
	mov	r0,#_on
	mov	r1,#(_on >> 8)
	mov	r2,#(_on >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/mac/nullrdc-noframer.c:100: }
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
_nullrdc_noframer_driver:
	.byte __str_0, (__str_0 >> 8),#0x80
	.byte _init, (_init >> 8), (_init >> 16)
	.byte _send_packet, (_send_packet >> 8), (_send_packet >> 16)
	.byte _send_list, (_send_list >> 8), (_send_list >> 16)
	.byte _packet_input, (_packet_input >> 8), (_packet_input >> 16)
	.byte _on, (_on >> 8), (_on >> 16)
	.byte _off, (_off >> 8), (_off >> 16)
	.byte _channel_check_interval, (_channel_check_interval >> 8), (_channel_check_interval >> 16)
__str_0:
	.ascii "nullrdc-noframer"
	.db 0x00
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
