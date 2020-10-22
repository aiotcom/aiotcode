;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module sicslowmac
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sicslowmac_driver
	.globl _send_list
	.globl _random_rand
	.globl _queuebuf_to_packetbuf
	.globl _packetbuf_addr
	.globl _packetbuf_set_addr
	.globl _packetbuf_attr
	.globl _packetbuf_hdrreduce
	.globl _packetbuf_hdralloc
	.globl _packetbuf_totlen
	.globl _packetbuf_datalen
	.globl _packetbuf_hdrptr
	.globl _packetbuf_dataptr
	.globl _frame802154_parse
	.globl _frame802154_create
	.globl _frame802154_hdrlen
	.globl _rimeaddr_cmp
	.globl _rimeaddr_copy
	.globl _memset
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
_mac_dsn:
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_mac_dst_pan_id:
	.ds 2
_mac_src_pan_id:
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
;Allocation info for local variables in function 'is_broadcast_addr'
;------------------------------------------------------------
;addr                      Allocated to stack - sp -5
;mode                      Allocated to registers r7 
;i                         Allocated to registers 
;------------------------------------------------------------
;	../../../core/net/mac/sicslowmac.c:85: is_broadcast_addr(uint8_t mode, uint8_t *addr)
;	-----------------------------------------
;	 function is_broadcast_addr
;	-----------------------------------------
_is_broadcast_addr:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dpl
;	../../../core/net/mac/sicslowmac.c:87: int i = mode == FRAME802154_SHORTADDRMODE ? 2 : 8;
	cjne	r7,#0x02,00108$
	mov	r6,#0x02
	mov	r7,#0x00
	sjmp	00109$
00108$:
	mov	r6,#0x08
	mov	r7,#0x00
00109$:
;	../../../core/net/mac/sicslowmac.c:88: while(i-- > 0) {
00103$:
	clr	c
	clr	a
	subb	a,r6
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00105$
	dec	r6
	cjne	r6,#0xff,00129$
	dec	r7
00129$:
;	../../../core/net/mac/sicslowmac.c:89: if(addr[i] != 0xff) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,r6
	add	a,@r0
	mov	r3,a
	mov	a,r7
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
	cjne	r3,#0xff,00130$
	sjmp	00103$
00130$:
;	../../../core/net/mac/sicslowmac.c:90: return 0;
	mov	dptr,#0x0000
	sjmp	00106$
00105$:
;	../../../core/net/mac/sicslowmac.c:93: return 1;
	mov	dptr,#0x0001
00106$:
;	../../../core/net/mac/sicslowmac.c:94: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'send_packet'
;------------------------------------------------------------
;ptr                       Allocated to stack - sp -61
;sent                      Allocated to stack - sp -55
;params                    Allocated to stack - sp -49
;len                       Allocated to stack - sp +0
;ret                       Allocated to registers r7 r6 
;sloc0                     Allocated to stack - sp -52
;------------------------------------------------------------
;	../../../core/net/mac/sicslowmac.c:97: send_packet(mac_callback_t sent, void *ptr)
;	-----------------------------------------
;	 function send_packet
;	-----------------------------------------
_send_packet:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x35
;	../../../core/net/mac/sicslowmac.c:103: memset(&params, 0, sizeof(params));
	mov	sp,a
	add	a,#0xcf
	mov	r1,a
	mov	r2,a
	mov	r3,#0x00
	mov	r4,#0x40
	push	ar1
	mov	a,#0x31
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
	pop	ar1
;	../../../core/net/mac/sicslowmac.c:106: params.fcf.frame_type = FRAME802154_DATAFRAME;
	mov	@r1,#0x01
;	../../../core/net/mac/sicslowmac.c:107: params.fcf.security_enabled = 0;
	mov	a,r1
	inc	a
	mov	r0,a
	mov	@r0,#0x00
;	../../../core/net/mac/sicslowmac.c:108: params.fcf.frame_pending = 0;
	mov	a,#0x02
	add	a,r1
	mov	r0,a
	mov	@r0,#0x00
;	../../../core/net/mac/sicslowmac.c:109: params.fcf.ack_required = packetbuf_attr(PACKETBUF_ATTR_RELIABLE);
	mov	a,#0x03
	add	a,r1
	mov	r0,a
	mov	dpl,#0x0c
	push	ar1
	push	ar0
	mov	r0,#_packetbuf_attr
	mov	r1,#(_packetbuf_attr >> 8)
	mov	r2,#(_packetbuf_attr >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	pop	ar0
	pop	ar1
	mov	@r0,ar3
;	../../../core/net/mac/sicslowmac.c:110: params.fcf.panid_compression = 0;
	mov	a,#0x04
	add	a,r1
	mov	r0,a
	mov	@r0,#0x00
;	../../../core/net/mac/sicslowmac.c:113: params.fcf.frame_version = FRAME802154_IEEE802154_2003;
	mov	a,#0x06
	add	a,r1
	mov	r0,a
	mov	@r0,#0x00
;	../../../core/net/mac/sicslowmac.c:116: params.seq = mac_dsn++;
	mov	a,#0x08
	add	a,r1
	mov	r0,a
	mov	dptr,#_mac_dsn
	movx	a,@dptr
	mov	r4,a
	inc	a
	movx	@dptr,a
	mov	@r0,ar4
;	../../../core/net/mac/sicslowmac.c:123: params.fcf.src_addr_mode = FRAME802154_LONGADDRMODE;
	mov	a,#0x07
	add	a,r1
	mov	r0,a
	mov	@r0,#0x03
;	../../../core/net/mac/sicslowmac.c:124: params.dest_pid = mac_dst_pan_id;
	mov	a,#0x09
	add	a,r1
	mov	r1,a
	mov	dptr,#_mac_dst_pan_id
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	@r1,ar3
	inc	r1
	mov	@r1,ar4
;	../../../core/net/mac/sicslowmac.c:130: if(rimeaddr_cmp(packetbuf_addr(PACKETBUF_ADDR_RECEIVER), &rimeaddr_null)) {
	mov	dpl,#0x19
	mov	r0,#_packetbuf_addr
	mov	r1,#(_packetbuf_addr >> 8)
	mov	r2,#(_packetbuf_addr >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	a,#_rimeaddr_null
	push	acc
	mov	a,#(_rimeaddr_null >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_rimeaddr_cmp
	mov	r1,#(_rimeaddr_cmp >> 8)
	mov	r2,#(_rimeaddr_cmp >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r4,dph
	dec	sp
	dec	sp
	dec	sp
	mov	a,r3
	orl	a,r4
	jz	00102$
;	../../../core/net/mac/sicslowmac.c:132: params.fcf.dest_addr_mode = FRAME802154_SHORTADDRMODE;
	mov	a,sp
	add	a,#0xcf
	add	a,#0x05
	mov	r0,a
	mov	@r0,#0x02
;	../../../core/net/mac/sicslowmac.c:133: params.dest_addr[0] = 0xFF;
	mov	a,sp
	add	a,#0xcf
	mov	r4,a
	add	a,#0x0b
	mov	r0,a
	mov	@r0,#0xff
;	../../../core/net/mac/sicslowmac.c:134: params.dest_addr[1] = 0xFF;
	mov	a,#0x0c
	add	a,r4
	mov	r0,a
	mov	@r0,#0xff
	sjmp	00103$
00102$:
;	../../../core/net/mac/sicslowmac.c:138: packetbuf_addr(PACKETBUF_ADDR_RECEIVER));
	mov	dpl,#0x19
	mov	r0,#_packetbuf_addr
	mov	r1,#(_packetbuf_addr >> 8)
	mov	r2,#(_packetbuf_addr >> 16)
	lcall	__sdcc_banked_call
	xch	a,r0
	mov	a,sp
	add	a,#0xcc
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
;	../../../core/net/mac/sicslowmac.c:137: rimeaddr_copy((rimeaddr_t *)&params.dest_addr,
	mov	a,sp
	add	a,#0xcf
	mov	r7,a
	add	a,#0x0b
	mov	r4,a
	mov	r5,#0x00
	mov	r6,#0x40
	push	ar7
	mov	a,sp
	add	a,#0xcb
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
	mov	r0,#_rimeaddr_copy
	mov	r1,#(_rimeaddr_copy >> 8)
	mov	r2,#(_rimeaddr_copy >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar7
;	../../../core/net/mac/sicslowmac.c:139: params.fcf.dest_addr_mode = FRAME802154_LONGADDRMODE;
	mov	a,#0x05
	add	a,r7
	mov	r0,a
	mov	@r0,#0x03
;	../../../core/net/mac/sicslowmac.c:171: }
;	../../../core/net/mac/sicslowmac.c:139: params.fcf.dest_addr_mode = FRAME802154_LONGADDRMODE;
00103$:
;	../../../core/net/mac/sicslowmac.c:143: params.src_pid = mac_src_pan_id;
	mov	a,sp
	add	a,#0xcf
	mov	r4,a
	add	a,#0x13
	mov	r1,a
	mov	dptr,#_mac_src_pan_id
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	@r1,ar2
	inc	r1
	mov	@r1,ar3
;	../../../core/net/mac/sicslowmac.c:149: rimeaddr_copy((rimeaddr_t *)&params.src_addr, &rimeaddr_node_addr);
	mov	a,#0x15
	add	a,r4
	mov	r2,a
	mov	r3,#0x00
	mov	r7,#0x40
	push	ar4
	mov	a,#_rimeaddr_node_addr
	push	acc
	mov	a,#(_rimeaddr_node_addr >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	mov	r0,#_rimeaddr_copy
	mov	r1,#(_rimeaddr_copy >> 8)
	mov	r2,#(_rimeaddr_copy >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar4
;	../../../core/net/mac/sicslowmac.c:151: params.payload = packetbuf_dataptr();
	mov	a,#0x2d
	add	a,r4
	mov	r1,a
	push	ar4
	push	ar1
	mov	r0,#_packetbuf_dataptr
	mov	r1,#(_packetbuf_dataptr >> 8)
	mov	r2,#(_packetbuf_dataptr >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	pop	ar1
	pop	ar4
	mov	@r1,ar5
	inc	r1
	mov	@r1,ar6
	inc	r1
	mov	@r1,ar7
;	../../../core/net/mac/sicslowmac.c:152: params.payload_len = packetbuf_datalen();
	mov	a,#0x30
	add	a,r4
	mov	r1,a
	push	ar4
	push	ar1
	mov	r0,#_packetbuf_datalen
	mov	r1,#(_packetbuf_datalen >> 8)
	mov	r2,#(_packetbuf_datalen >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	pop	ar1
	pop	ar4
	mov	@r1,ar6
;	../../../core/net/mac/sicslowmac.c:153: len = frame802154_hdrlen(&params);
	mov	r7,#0x00
	mov	r6,#0x40
	mov	dpl,r4
	mov	dph,r7
	mov	b,r6
	mov	r0,#_frame802154_hdrlen
	mov	r1,#(_frame802154_hdrlen >> 8)
	mov	r2,#(_frame802154_hdrlen >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	r0,sp
	mov	@r0,ar7
;	../../../core/net/mac/sicslowmac.c:154: if(packetbuf_hdralloc(len)) {
	mov	r0,sp
	mov	ar6,@r0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_packetbuf_hdralloc
	mov	r1,#(_packetbuf_hdralloc >> 8)
	mov	r2,#(_packetbuf_hdralloc >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00134$
	ljmp	00111$
00134$:
;	../../../core/net/mac/sicslowmac.c:156: frame802154_create(&params, packetbuf_hdrptr(), len);
	mov	r0,#_packetbuf_hdrptr
	mov	r1,#(_packetbuf_hdrptr >> 8)
	mov	r2,#(_packetbuf_hdrptr >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	a,sp
	add	a,#0xcf
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	r0,sp
	mov	a,@r0
	push	acc
	push	ar2
	push	ar3
	push	ar4
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	r0,#_frame802154_create
	mov	r1,#(_frame802154_create >> 8)
	mov	r2,#(_frame802154_create >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/net/mac/sicslowmac.c:162: ret = NETSTACK_RADIO.send(packetbuf_hdrptr(), packetbuf_totlen());
	mov	dptr,#(_cc2530_rf_driver + 0x0009)
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
	mov	r0,#_packetbuf_totlen
	mov	r1,#(_packetbuf_totlen >> 8)
	mov	r2,#(_packetbuf_totlen >> 16)
	lcall	__sdcc_banked_call
	xch	a,r0
	mov	a,sp
	add	a,#0xc9
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	mov	r0,#_packetbuf_hdrptr
	mov	r1,#(_packetbuf_hdrptr >> 8)
	mov	r2,#(_packetbuf_hdrptr >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	pop	ar5
	pop	ar6
	pop	ar7
	push	ar7
	mov	a,sp
	add	a,#0xcb
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
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	pop	ar7
	mov	ar7,r5
;	../../../core/net/mac/sicslowmac.c:163: if(sent) {
	mov	a,sp
	add	a,#0xc9
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00135$
	ljmp	00111$
00135$:
;	../../../core/net/mac/sicslowmac.c:164: switch(ret) {
	cjne	r7,#0x00,00136$
	cjne	r6,#0x00,00136$
	sjmp	00104$
00136$:
;	../../../core/net/mac/sicslowmac.c:165: case RADIO_TX_OK:
	cjne	r7,#0x01,00111$
	cjne	r6,#0x00,00111$
	sjmp	00105$
00104$:
;	../../../core/net/mac/sicslowmac.c:166: sent(ptr, MAC_TX_OK, 1);
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,sp
	add	a,#0xc5
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
	add	a,#0xbc
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
;	../../../core/net/mac/sicslowmac.c:167: break;
;	../../../core/net/mac/sicslowmac.c:168: case RADIO_TX_ERR:
	sjmp	00111$
00105$:
;	../../../core/net/mac/sicslowmac.c:169: sent(ptr, MAC_TX_ERR, 1);
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#0x04
	push	acc
	clr	a
	push	acc
	mov	a,sp
	add	a,#0xc5
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
	add	a,#0xbc
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
;	../../../core/net/mac/sicslowmac.c:171: }
00111$:
;	../../../core/net/mac/sicslowmac.c:176: }
	mov	a,sp
	add	a,#0xc8
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'send_list'
;------------------------------------------------------------
;ptr                       Allocated to stack - sp -5
;buf_list                  Allocated to stack - sp -8
;sent                      Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/net/mac/sicslowmac.c:179: send_list(mac_callback_t sent, void *ptr, struct rdc_buf_list *buf_list)
;	-----------------------------------------
;	 function send_list
;	-----------------------------------------
_send_list:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/mac/sicslowmac.c:181: if(buf_list != NULL) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00103$
;	../../../core/net/mac/sicslowmac.c:182: queuebuf_to_packetbuf(buf_list->buf);
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
;	../../../core/net/mac/sicslowmac.c:183: send_packet(sent, ptr);
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
;	../../../core/net/mac/sicslowmac.c:185: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'input_packet'
;------------------------------------------------------------
;frame                     Allocated to stack - sp -50
;len                       Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -51
;------------------------------------------------------------
;	../../../core/net/mac/sicslowmac.c:188: input_packet(void)
;	-----------------------------------------
;	 function input_packet
;	-----------------------------------------
_input_packet:
	mov	a,sp
	add	a,#0x34
	mov	sp,a
;	../../../core/net/mac/sicslowmac.c:193: len = packetbuf_datalen();
	mov	r0,#_packetbuf_datalen
	mov	r1,#(_packetbuf_datalen >> 8)
	mov	r2,#(_packetbuf_datalen >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	mov	r0,sp
	dec	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/mac/sicslowmac.c:195: if(frame802154_parse(packetbuf_dataptr(), len, &frame) &&
	mov	a,sp
	add	a,#0xce
	mov	r5,a
	mov	r4,#0x00
	mov	r3,#0x40
	mov	r0,sp
	dec	r0
	mov	a,sp
	add	a,#0xcd
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	push	ar5
	push	ar4
	push	ar3
	mov	r0,#_packetbuf_dataptr
	mov	r1,#(_packetbuf_dataptr >> 8)
	mov	r2,#(_packetbuf_dataptr >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,sp
	add	a,#0xca
	mov	r0,a
	mov	a,@r0
	push	acc
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	mov	r0,#_frame802154_parse
	mov	r1,#(_frame802154_parse >> 8)
	mov	r2,#(_frame802154_parse >> 16)
	lcall	__sdcc_banked_call
	mov	r7,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r7
	jnz	00143$
	ljmp	00113$
00143$:
;	../../../core/net/mac/sicslowmac.c:196: packetbuf_hdrreduce(len - frame.payload_len)) {
	mov	a,sp
	add	a,#0xce
	add	a,#0x30
	mov	r1,a
	mov	ar7,@r1
	mov	r6,#0x00
	mov	r0,sp
	dec	r0
	mov	a,@r0
	clr	c
	subb	a,r7
	mov	r7,a
	inc	r0
	mov	a,@r0
	subb	a,r6
	mov	r6,a
	mov	dpl,r7
	mov	dph,r6
	mov	r0,#_packetbuf_hdrreduce
	mov	r1,#(_packetbuf_hdrreduce >> 8)
	mov	r2,#(_packetbuf_hdrreduce >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00144$
	ljmp	00113$
00144$:
;	../../../core/net/mac/sicslowmac.c:197: if(frame.fcf.dest_addr_mode) {
	mov	a,sp
	add	a,#0xce
	add	a,#0x05
	mov	r1,a
	mov	a,@r1
	jnz	00145$
	ljmp	00109$
00145$:
;	../../../core/net/mac/sicslowmac.c:198: if(frame.dest_pid != mac_src_pan_id &&
	mov	a,sp
	add	a,#0xce
	add	a,#0x09
	mov	r1,a
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	mov	dptr,#_mac_src_pan_id
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,r6
	cjne	a,ar4,00146$
	mov	a,r7
	cjne	a,ar5,00146$
	sjmp	00102$
00146$:
;	../../../core/net/mac/sicslowmac.c:199: frame.dest_pid != FRAME802154_BROADCASTPANDID) {
	mov	a,sp
	add	a,#0xce
	add	a,#0x09
	mov	r1,a
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	cjne	r6,#0xff,00147$
	cjne	r7,#0xff,00147$
	sjmp	00102$
00147$:
;	../../../core/net/mac/sicslowmac.c:202: return;
	ljmp	00113$
00102$:
;	../../../core/net/mac/sicslowmac.c:204: if(!is_broadcast_addr(frame.fcf.dest_addr_mode, frame.dest_addr)) {
	mov	a,sp
	add	a,#0xce
	mov	r7,a
	add	a,#0x0b
	mov	r6,a
	mov	r5,#0x00
	mov	r4,#0x40
	mov	a,#0x05
	add	a,r7
	mov	r1,a
	mov	ar7,@r1
	push	ar6
	push	ar5
	push	ar4
	mov	dpl,r7
	mov	r0,#_is_broadcast_addr
	mov	r1,#(_is_broadcast_addr >> 8)
	mov	r2,#(_is_broadcast_addr >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	dec	sp
	mov	a,r6
	orl	a,r7
	jnz	00109$
;	../../../core/net/mac/sicslowmac.c:205: packetbuf_set_addr(PACKETBUF_ADDR_RECEIVER, (rimeaddr_t *)&frame.dest_addr);
	mov	a,sp
	add	a,#0xce
	add	a,#0x0b
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	dpl,#0x19
	mov	r0,#_packetbuf_set_addr
	mov	r1,#(_packetbuf_set_addr >> 8)
	mov	r2,#(_packetbuf_set_addr >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/mac/sicslowmac.c:207: &rimeaddr_node_addr)) {
;	../../../core/net/mac/sicslowmac.c:206: if(!rimeaddr_cmp(packetbuf_addr(PACKETBUF_ADDR_RECEIVER),
	mov	dpl,#0x19
	mov	r0,#_packetbuf_addr
	mov	r1,#(_packetbuf_addr >> 8)
	mov	r2,#(_packetbuf_addr >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,#_rimeaddr_node_addr
	push	acc
	mov	a,#(_rimeaddr_node_addr >> 8)
	push	acc
	clr	a
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rimeaddr_cmp
	mov	r1,#(_rimeaddr_cmp >> 8)
	mov	r2,#(_rimeaddr_cmp >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	dec	sp
	mov	a,r6
	orl	a,r7
;	../../../core/net/mac/sicslowmac.c:210: return;
	jz	00113$
00109$:
;	../../../core/net/mac/sicslowmac.c:214: packetbuf_set_addr(PACKETBUF_ADDR_SENDER, (rimeaddr_t *)&frame.src_addr);
	mov	a,sp
	add	a,#0xce
	add	a,#0x15
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	push	ar7
	push	ar6
	push	ar5
	mov	dpl,#0x18
	mov	r0,#_packetbuf_set_addr
	mov	r1,#(_packetbuf_set_addr >> 8)
	mov	r2,#(_packetbuf_set_addr >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/mac/sicslowmac.c:220: NETSTACK_MAC.input();
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
00113$:
;	../../../core/net/mac/sicslowmac.c:224: }
	mov	a,sp
	add	a,#0xcc
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'on'
;------------------------------------------------------------
;	../../../core/net/mac/sicslowmac.c:227: on(void)
;	-----------------------------------------
;	 function on
;	-----------------------------------------
_on:
;	../../../core/net/mac/sicslowmac.c:229: return NETSTACK_RADIO.on();
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
;	../../../core/net/mac/sicslowmac.c:230: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'off'
;------------------------------------------------------------
;keep_radio_on             Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/mac/sicslowmac.c:233: off(int keep_radio_on)
;	-----------------------------------------
;	 function off
;	-----------------------------------------
_off:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/net/mac/sicslowmac.c:235: if(keep_radio_on) {
	mov	a,r6
	orl	a,r7
	jz	00102$
;	../../../core/net/mac/sicslowmac.c:236: return NETSTACK_RADIO.on();
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
;	../../../core/net/mac/sicslowmac.c:238: return NETSTACK_RADIO.off();
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
;	../../../core/net/mac/sicslowmac.c:240: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init'
;------------------------------------------------------------
;	../../../core/net/mac/sicslowmac.c:243: init(void)
;	-----------------------------------------
;	 function init
;	-----------------------------------------
_init:
;	../../../core/net/mac/sicslowmac.c:245: mac_dsn = random_rand() % 256;
	mov	r0,#_random_rand
	mov	r1,#(_random_rand >> 8)
	mov	r2,#(_random_rand >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	mov	r6,a
	mov	dptr,#_mac_dsn
	mov	a,r6
	movx	@dptr,a
;	../../../core/net/mac/sicslowmac.c:247: NETSTACK_RADIO.on();
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
;	../../../core/net/mac/sicslowmac.c:248: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'channel_check_interval'
;------------------------------------------------------------
;	../../../core/net/mac/sicslowmac.c:251: channel_check_interval(void)
;	-----------------------------------------
;	 function channel_check_interval
;	-----------------------------------------
_channel_check_interval:
;	../../../core/net/mac/sicslowmac.c:253: return 0;
	mov	dptr,#0x0000
;	../../../core/net/mac/sicslowmac.c:254: }
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
_sicslowmac_driver:
	.byte __str_0, (__str_0 >> 8),#0x80
	.byte _init, (_init >> 8), (_init >> 16)
	.byte _send_packet, (_send_packet >> 8), (_send_packet >> 16)
	.byte _send_list, (_send_list >> 8), (_send_list >> 16)
	.byte _input_packet, (_input_packet >> 8), (_input_packet >> 16)
	.byte _on, (_on >> 8), (_on >> 16)
	.byte _off, (_off >> 8), (_off >> 16)
	.byte _channel_check_interval, (_channel_check_interval >> 8), (_channel_check_interval >> 16)
__str_0:
	.ascii "sicslowmac"
	.db 0x00
	.area XINIT   (CODE)
__xinit__mac_dst_pan_id:
	.byte #0x49,#0x54	; 21577
__xinit__mac_src_pan_id:
	.byte #0x49,#0x54	; 21577
	.area CABS    (ABS,CODE)
