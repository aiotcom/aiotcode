;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module csma
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _csma_driver
	.globl _memb_free
	.globl _memb_alloc
	.globl _memb_init
	.globl _list_item_next
	.globl _list_length
	.globl _list_remove
	.globl _list_add
	.globl _list_push
	.globl _list_pop
	.globl _list_head
	.globl _list_init
	.globl _random_rand
	.globl _ctimer_stop
	.globl _ctimer_set
	.globl _queuebuf_free
	.globl _queuebuf_update_attr_from_packetbuf
	.globl _queuebuf_new_from_packetbuf
	.globl _packetbuf_addr
	.globl _packetbuf_attr
	.globl _rimeaddr_cmp
	.globl _rimeaddr_copy
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
_neighbor_memb_memb_count:
	.ds 2
_neighbor_memb_memb_mem:
	.ds 84
_packet_memb_memb_count:
	.ds 6
_packet_memb_memb_mem:
	.ds 54
_metadata_memb_memb_count:
	.ds 6
_metadata_memb_memb_mem:
	.ds 42
_mac_status:
	.ds 2
_packet_sent_cb_sent_65536_193:
	.ds 3
_packet_sent_cb_cptr_65536_193:
	.ds 3
_packet_sent_cb_num_tx_65536_193:
	.ds 2
_send_packet_addr_131072_209:
	.ds 3
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_neighbor_memb:
	.ds 10
_packet_memb:
	.ds 10
_metadata_memb:
	.ds 10
_neighbor_list_list:
	.ds 3
_neighbor_list:
	.ds 3
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
;Allocation info for local variables in function 'neighbor_queue_from_addr'
;------------------------------------------------------------
;addr                      Allocated to stack - sp -2
;n                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:123: neighbor_queue *neighbor_queue_from_addr(const rimeaddr_t *addr) {
;	-----------------------------------------
;	 function neighbor_queue_from_addr
;	-----------------------------------------
_neighbor_queue_from_addr:
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
;	../../../core/net/mac/csma.c:124: struct neighbor_queue *n = list_head(neighbor_list);
	mov	dptr,#_neighbor_list
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	../../../core/net/mac/csma.c:125: while(n != NULL) {
00103$:
	mov	a,r2
	orl	a,r3
	jz	00105$
;	../../../core/net/mac/csma.c:126: if(rimeaddr_cmp(&n->addr, addr)) {
	mov	a,#0x03
	add	a,r2
	mov	r5,a
	clr	a
	addc	a,r3
	mov	r6,a
	mov	ar7,r4
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
	pop	ar2
	pop	ar3
	pop	ar4
	mov	a,r6
	orl	a,r7
	jz	00102$
;	../../../core/net/mac/csma.c:127: return n;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	sjmp	00106$
00102$:
;	../../../core/net/mac/csma.c:129: n = list_item_next(n);
	mov	ar5,r2
	mov	ar6,r3
	mov	ar7,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_list_item_next
	mov	r1,#(_list_item_next >> 8)
	mov	r2,#(_list_item_next >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	ar2,r5
	mov	ar3,r6
	mov	ar4,r7
	sjmp	00103$
00105$:
;	../../../core/net/mac/csma.c:131: return NULL;
	mov	dptr,#0x0000
	mov	b,#0x00
00106$:
;	../../../core/net/mac/csma.c:132: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'default_timebase'
;------------------------------------------------------------
;time                      Allocated to registers r4 r7 
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:135: default_timebase(void)
;	-----------------------------------------
;	 function default_timebase
;	-----------------------------------------
_default_timebase:
;	../../../core/net/mac/csma.c:140: time = NETSTACK_RDC.channel_check_interval();
	mov	dptr,#(_nullrdc_driver + 0x0015)
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
	mov	ar4,r5
	mov	ar7,r6
;	../../../core/net/mac/csma.c:145: if(time == 0) {
	mov	a,r5
	orl	a,r6
;	../../../core/net/mac/csma.c:146: time = CLOCK_SECOND / NETSTACK_RDC_CHANNEL_CHECK_RATE;
	jnz	00102$
	mov	r4,#0x10
	mov	r7,a
00102$:
;	../../../core/net/mac/csma.c:148: return time;
	mov	dpl,r4
	mov	dph,r7
;	../../../core/net/mac/csma.c:149: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'transmit_packet_list'
;------------------------------------------------------------
;ptr                       Allocated to registers r5 r6 r7 
;n                         Allocated to stack - sp -5
;q                         Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:152: transmit_packet_list(void *ptr)
;	-----------------------------------------
;	 function transmit_packet_list
;	-----------------------------------------
_transmit_packet_list:
	mov	a,sp
	add	a,#0x06
	mov	sp,a
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/mac/csma.c:154: struct neighbor_queue *n = ptr;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/mac/csma.c:155: if(n) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00115$
	ljmp	00105$
00115$:
;	../../../core/net/mac/csma.c:156: struct rdc_buf_list *q = list_head(n->queued_packet_list);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
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
;	../../../core/net/mac/csma.c:157: if(q != NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00116$
	ljmp	00105$
00116$:
;	../../../core/net/mac/csma.c:161: NETSTACK_RDC.send_list(packet_sent, n, q);
	mov	dptr,#(_nullrdc_driver + 0x0009)
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
	push	ar5
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	push	ar4
	mov	dptr,#_packet_sent
	mov	b,#(_packet_sent >> 16)
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/net/mac/csma.c:163: packet_sent_cb(n, mac_status);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_mac_status
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_packet_sent_cb
	mov	r1,#(_packet_sent_cb >> 8)
	mov	r2,#(_packet_sent_cb >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
00105$:
;	../../../core/net/mac/csma.c:167: }
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'free_first_packet'
;------------------------------------------------------------
;n                         Allocated to stack - sp -7
;q                         Allocated to stack - sp -2
;sloc0                     Allocated to stack - sp -4
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:170: free_first_packet(struct neighbor_queue *n)
;	-----------------------------------------
;	 function free_first_packet
;	-----------------------------------------
_free_first_packet:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x05
;	../../../core/net/mac/csma.c:172: struct rdc_buf_list *q = list_head(n->queued_packet_list);
	mov	sp,a
	add	a,#0xf9
	mov	r0,a
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
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
;	../../../core/net/mac/csma.c:173: if(q != NULL) {
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00116$
	ljmp	00106$
00116$:
;	../../../core/net/mac/csma.c:175: queuebuf_free(q->buf);
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_queuebuf_free
	mov	r1,#(_queuebuf_free >> 8)
	mov	r2,#(_queuebuf_free >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/mac/csma.c:176: list_pop(n->queued_packet_list);
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
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
	mov	r0,#_list_pop
	mov	r1,#(_list_pop >> 8)
	mov	r2,#(_list_pop >> 16)
	lcall	__sdcc_banked_call
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/net/mac/csma.c:177: memb_free(&metadata_memb, q->ptr);
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
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_metadata_memb
	mov	b,#0x00
	mov	r0,#_memb_free
	mov	r1,#(_memb_free >> 8)
	mov	r2,#(_memb_free >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/net/mac/csma.c:178: memb_free(&packet_memb, q);
	mov	r0,sp
	dec	r0
	dec	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	push	ar4
	push	ar3
	push	ar2
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_packet_memb
	mov	b,#0x00
	mov	r0,#_memb_free
	mov	r1,#(_memb_free >> 8)
	mov	r2,#(_memb_free >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/net/mac/csma.c:181: if(list_head(n->queued_packet_list)) {
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
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	a,r5
	orl	a,r6
	jnz	00117$
	ljmp	00102$
00117$:
;	../../../core/net/mac/csma.c:183: n->transmissions = 0;
	mov	a,sp
	add	a,#0xf9
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
;	../../../core/net/mac/csma.c:184: n->collisions = 0;
	mov	a,sp
	add	a,#0xf9
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
	clr	a
	lcall	__gptrput
;	../../../core/net/mac/csma.c:185: n->deferrals = 0;
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,#0x23
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
;	../../../core/net/mac/csma.c:187: ctimer_set(&n->transmit_timer, default_timebase(), transmit_packet_list, n);
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_default_timebase
	mov	r1,#(_default_timebase >> 8)
	mov	r2,#(_default_timebase >> 16)
	lcall	__sdcc_banked_call
	xch	a,r0
	mov	a,sp
	add	a,#0xf9
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	pop	ar2
	pop	ar3
	pop	ar4
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,#0x0b
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	push	ar2
	push	ar3
	push	ar4
	mov	a,#_transmit_packet_list
	push	acc
	mov	a,#(_transmit_packet_list >> 8)
	push	acc
	mov	a,#(_transmit_packet_list >> 16)
	push	acc
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_ctimer_set
	mov	r1,#(_ctimer_set >> 8)
	mov	r2,#(_ctimer_set >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
	ljmp	00106$
00102$:
;	../../../core/net/mac/csma.c:190: ctimer_stop(&n->transmit_timer);
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	a,#0x0b
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
	mov	r0,#_ctimer_stop
	mov	r1,#(_ctimer_stop >> 8)
	mov	r2,#(_ctimer_stop >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/mac/csma.c:191: list_remove(neighbor_list, n);
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_neighbor_list
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
	mov	r0,#_list_remove
	mov	r1,#(_list_remove >> 8)
	mov	r2,#(_list_remove >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/mac/csma.c:192: memb_free(&neighbor_memb, n);
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_neighbor_memb
	mov	b,#0x00
	mov	r0,#_memb_free
	mov	r1,#(_memb_free >> 8)
	mov	r2,#(_memb_free >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00106$:
;	../../../core/net/mac/csma.c:195: }
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'packet_sent'
;------------------------------------------------------------
;status                    Allocated to stack - sp -4
;num_transmissions         Allocated to stack - sp -6
;ptr                       Allocated to registers 
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:201: packet_sent(void *ptr, int status, int num_transmissions)
;	-----------------------------------------
;	 function packet_sent
;	-----------------------------------------
_packet_sent:
;	../../../core/net/mac/csma.c:203: mac_status = status;
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	dptr,#_mac_status
	mov	a,@r0
	movx	@dptr,a
	inc	r0
	mov	a,@r0
	inc	dptr
	movx	@dptr,a
;	../../../core/net/mac/csma.c:204: return;
;	../../../core/net/mac/csma.c:205: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'packet_sent_cb'
;------------------------------------------------------------
;status                    Allocated to stack - sp -17
;ptr                       Allocated to registers r5 r6 r7 
;n                         Allocated to stack - sp -10
;q                         Allocated to stack - sp -7
;metadata                  Allocated to stack - sp -4
;time                      Allocated to registers 
;backoff_transmissions     Allocated to stack - sp -1
;sloc0                     Allocated to stack - sp -12
;sent                      Allocated with name '_packet_sent_cb_sent_65536_193'
;cptr                      Allocated with name '_packet_sent_cb_cptr_65536_193'
;num_tx                    Allocated with name '_packet_sent_cb_num_tx_65536_193'
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:208: packet_sent_cb(void *ptr, int status)
;	-----------------------------------------
;	 function packet_sent_cb
;	-----------------------------------------
_packet_sent_cb:
	mov	a,sp
	add	a,#0x0d
	mov	sp,a
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/net/mac/csma.c:214: struct neighbor_queue *n = ptr;
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/mac/csma.c:215: struct rdc_buf_list *q = list_head(n->queued_packet_list);
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_list_head
	mov	r1,#(_list_head >> 8)
	mov	r2,#(_list_head >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	a,sp
	add	a,#0xf9
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
;	../../../core/net/mac/csma.c:216: struct qbuf_metadata *metadata = (struct qbuf_metadata *)q->ptr;
	mov	a,sp
	add	a,#0xf9
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
	add	a,#0xfc
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
;	../../../core/net/mac/csma.c:223: switch(status) {
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	cjne	@r0,#0x00,00177$
	inc	r0
	cjne	@r0,#0x00,00177$
	sjmp	00102$
00177$:
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	cjne	@r0,#0x01,00178$
	inc	r0
	cjne	@r0,#0x00,00178$
	sjmp	00103$
00178$:
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	cjne	@r0,#0x02,00179$
	inc	r0
	cjne	@r0,#0x00,00179$
	sjmp	00102$
00179$:
	mov	a,sp
	add	a,#0xef
	mov	r0,a
;	../../../core/net/mac/csma.c:225: case MAC_TX_NOACK:
	cjne	@r0,#0x03,00105$
	inc	r0
	cjne	@r0,#0x00,00105$
	sjmp	00104$
00102$:
;	../../../core/net/mac/csma.c:226: n->transmissions++;
	mov	a,sp
	add	a,#0xf6
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
	mov	r7,a
	inc	r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/mac/csma.c:227: break;
;	../../../core/net/mac/csma.c:228: case MAC_TX_COLLISION:
	sjmp	00105$
00103$:
;	../../../core/net/mac/csma.c:229: n->collisions++;
	mov	a,sp
	add	a,#0xf6
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
	mov	r4,a
	inc	r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/mac/csma.c:230: break;
;	../../../core/net/mac/csma.c:231: case MAC_TX_DEFERRED:
	sjmp	00105$
00104$:
;	../../../core/net/mac/csma.c:232: n->deferrals++;
	mov	a,sp
	add	a,#0xf6
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
	mov	r4,a
	inc	r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/mac/csma.c:295: mac_call_sent_callback(sent, cptr, status, num_tx);
;	../../../core/net/mac/csma.c:234: }
00105$:
;	../../../core/net/mac/csma.c:236: sent = metadata->sent;
	mov	a,sp
	add	a,#0xfc
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
	mov	dptr,#_packet_sent_cb_sent_65536_193
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/mac/csma.c:237: cptr = metadata->cptr;
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
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
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	dptr,#_packet_sent_cb_cptr_65536_193
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/net/mac/csma.c:238: num_tx = n->transmissions;
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	a,#0x21
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
	mov	dptr,#_packet_sent_cb_num_tx_65536_193
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	../../../core/net/mac/csma.c:240: if(status == MAC_TX_COLLISION ||
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	cjne	@r0,#0x01,00181$
	inc	r0
	cjne	@r0,#0x00,00181$
	sjmp	00109$
00181$:
;	../../../core/net/mac/csma.c:241: status == MAC_TX_NOACK) {
	mov	a,sp
	add	a,#0xef
	mov	r0,a
	cjne	@r0,#0x02,00182$
	inc	r0
	cjne	@r0,#0x00,00182$
	sjmp	00183$
00182$:
	ljmp	00126$
00183$:
;	../../../core/net/mac/csma.c:255: }
00109$:
;	../../../core/net/mac/csma.c:259: time = default_timebase();
	mov	r0,#_default_timebase
	mov	r1,#(_default_timebase >> 8)
	mov	r2,#(_default_timebase >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
;	../../../core/net/mac/csma.c:264: backoff_transmissions = n->transmissions + 1;
	mov	a,sp
	add	a,#0xf6
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
	lcall	__gptrget
	mov	r3,a
	mov	r5,#0x00
	mov	r0,sp
	dec	r0
	mov	a,#0x01
	add	a,r3
	mov	@r0,a
	clr	a
	addc	a,r5
	inc	r0
	mov	@r0,a
;	../../../core/net/mac/csma.c:269: if(backoff_transmissions > 3) {
	mov	r0,sp
	dec	r0
	clr	c
	mov	a,#0x03
	subb	a,@r0
	mov	a,#(0x00 ^ 0x80)
	inc	r0
	mov	b,@r0
	xrl	b,#0x80
	subb	a,b
	jnc	00111$
;	../../../core/net/mac/csma.c:270: backoff_transmissions = 3;
	mov	r0,sp
	dec	r0
	mov	@r0,#0x03
	inc	r0
	mov	@r0,#0x00
00111$:
;	../../../core/net/mac/csma.c:273: time = time + (random_rand() % (backoff_transmissions * time));
	push	ar7
	push	ar6
	mov	r0,#_random_rand
	mov	r1,#(_random_rand >> 8)
	mov	r2,#(_random_rand >> 16)
	lcall	__sdcc_banked_call
	mov	r4,dpl
	mov	r5,dph
	pop	ar6
	pop	ar7
	mov	r0,sp
	dec	r0
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	dec	sp
	dec	sp
	pop	ar4
	pop	ar5
	push	ar2
	push	ar3
	mov	dpl,r4
	mov	dph,r5
	lcall	__moduint
	mov	r4,dpl
	mov	r5,dph
	dec	sp
	dec	sp
	pop	ar6
	pop	ar7
	mov	a,sp
	add	a,#0xf4
	mov	r0,a
	mov	a,r4
	add	a,r6
	mov	@r0,a
	mov	a,r5
	addc	a,r7
	inc	r0
	mov	@r0,a
;	../../../core/net/mac/csma.c:275: if(n->transmissions < metadata->max_transmissions) {
	mov	a,sp
	add	a,#0xf6
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
	lcall	__gptrget
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	r0,a
	mov	a,#0x06
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r4,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r2
	mov	dph,r4
	mov	b,r5
	lcall	__gptrget
	mov	r2,a
	clr	c
	mov	a,r3
	subb	a,r2
	jc	00185$
	ljmp	00118$
00185$:
;	../../../core/net/mac/csma.c:278: transmit_packet_list, n);
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
;	../../../core/net/mac/csma.c:277: ctimer_set(&n->transmit_timer, time,
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	a,#0x0b
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	push	ar3
	push	ar4
	push	ar5
	mov	a,#_transmit_packet_list
	push	acc
	mov	a,#(_transmit_packet_list >> 8)
	push	acc
	mov	a,#(_transmit_packet_list >> 16)
	push	acc
	mov	a,sp
	add	a,#0xee
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	mov	r0,#_ctimer_set
	mov	r1,#(_ctimer_set >> 8)
	mov	r2,#(_ctimer_set >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xf8
;	../../../core/net/mac/csma.c:281: queuebuf_update_attr_from_packetbuf(q->buf);
	mov	sp,a
	add	a,#0xf9
	mov	r0,a
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
	mov	r0,#_queuebuf_update_attr_from_packetbuf
	mov	r1,#(_queuebuf_update_attr_from_packetbuf >> 8)
	mov	r2,#(_queuebuf_update_attr_from_packetbuf >> 16)
	lcall	__sdcc_banked_call
	ljmp	00129$
00118$:
;	../../../core/net/mac/csma.c:285: free_first_packet(n);
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_free_first_packet
	mov	r1,#(_free_first_packet >> 8)
	mov	r2,#(_free_first_packet >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/mac/csma.c:286: mac_call_sent_callback(sent, cptr, status, num_tx);
	mov	dptr,#_packet_sent_cb_sent_65536_193
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00186$
	ljmp	00129$
00186$:
	mov	dptr,#_packet_sent_cb_cptr_65536_193
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_packet_sent_cb_num_tx_65536_193
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dptr,#_packet_sent_cb_sent_65536_193
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	sjmp	00129$
00126$:
;	../../../core/net/mac/csma.c:294: free_first_packet(n);
	mov	a,sp
	add	a,#0xf6
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_free_first_packet
	mov	r1,#(_free_first_packet >> 8)
	mov	r2,#(_free_first_packet >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/mac/csma.c:295: mac_call_sent_callback(sent, cptr, status, num_tx);
	mov	dptr,#_packet_sent_cb_sent_65536_193
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00129$
	mov	dptr,#_packet_sent_cb_cptr_65536_193
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_packet_sent_cb_num_tx_65536_193
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dptr,#_packet_sent_cb_sent_65536_193
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
00129$:
;	../../../core/net/mac/csma.c:297: }
	mov	a,sp
	add	a,#0xf3
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'send_packet'
;------------------------------------------------------------
;ptr                       Allocated to stack - sp -17
;sent                      Allocated to stack - sp -11
;q                         Allocated to stack - sp -8
;n                         Allocated to stack - sp -5
;metadata                  Allocated to stack - sp -2
;addr                      Allocated with name '_send_packet_addr_131072_209'
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:300: send_packet(mac_callback_t sent, void *ptr)
;	-----------------------------------------
;	 function send_packet
;	-----------------------------------------
_send_packet:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x09
	mov	sp,a
;	../../../core/net/mac/csma.c:308: &rimeaddr_null)) {
;	../../../core/net/mac/csma.c:307: if(!rimeaddr_cmp(packetbuf_addr(PACKETBUF_ADDR_RECEIVER),
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
	jz	00190$
	ljmp	00134$
00190$:
;	../../../core/net/mac/csma.c:310: addr = packetbuf_addr(PACKETBUF_ADDR_RECEIVER);
	mov	dpl,#0x19
	mov	r0,#_packetbuf_addr
	mov	r1,#(_packetbuf_addr >> 8)
	mov	r2,#(_packetbuf_addr >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	dptr,#_send_packet_addr_131072_209
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	../../../core/net/mac/csma.c:313: n = neighbor_queue_from_addr(addr);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_neighbor_queue_from_addr
	mov	r1,#(_neighbor_queue_from_addr >> 8)
	mov	r2,#(_neighbor_queue_from_addr >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
;	../../../core/net/mac/csma.c:314: if(n == NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00191$
	ljmp	00107$
00191$:
;	../../../core/net/mac/csma.c:316: n = memb_alloc(&neighbor_memb);
	mov	dptr,#_neighbor_memb
	mov	b,#0x00
	mov	r0,#_memb_alloc
	mov	r1,#(_memb_alloc >> 8)
	mov	r2,#(_memb_alloc >> 16)
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
;	../../../core/net/mac/csma.c:317: if(n != NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00192$
	ljmp	00107$
00192$:
;	../../../core/net/mac/csma.c:319: rimeaddr_copy(&n->addr, addr);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x03
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_send_packet_addr_131072_209
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_rimeaddr_copy
	mov	r1,#(_rimeaddr_copy >> 8)
	mov	r2,#(_rimeaddr_copy >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/mac/csma.c:320: n->transmissions = 0;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x21
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
;	../../../core/net/mac/csma.c:321: n->collisions = 0;
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
;	../../../core/net/mac/csma.c:322: n->deferrals = 0;
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
	clr	a
	lcall	__gptrput
;	../../../core/net/mac/csma.c:324: LIST_STRUCT_INIT(n, queued_packet_list);
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
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x24
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
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	r0,#_list_init
	mov	r1,#(_list_init >> 8)
	mov	r2,#(_list_init >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/mac/csma.c:326: list_add(neighbor_list, n);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	dptr,#_neighbor_list
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
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
;	../../../core/net/mac/csma.c:384: sent(ptr, mac_status, 1);
;	../../../core/net/mac/csma.c:326: list_add(neighbor_list, n);
00107$:
;	../../../core/net/mac/csma.c:330: if(n != NULL) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00193$
	ljmp	00128$
00193$:
;	../../../core/net/mac/csma.c:332: q = memb_alloc(&packet_memb);
	mov	dptr,#_packet_memb
	mov	b,#0x00
	mov	r0,#_memb_alloc
	mov	r1,#(_memb_alloc >> 8)
	mov	r2,#(_memb_alloc >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
;	../../../core/net/mac/csma.c:333: if(q != NULL) {
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00194$
	ljmp	00121$
00194$:
;	../../../core/net/mac/csma.c:334: q->ptr = memb_alloc(&metadata_memb);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x06
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	mov	dptr,#_metadata_memb
	mov	b,#0x00
	push	ar7
	push	ar6
	push	ar5
	mov	r0,#_memb_alloc
	mov	r1,#(_memb_alloc >> 8)
	mov	r2,#(_memb_alloc >> 16)
	lcall	__sdcc_banked_call
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
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
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/net/mac/csma.c:335: if(q->ptr != NULL) {
	mov	a,r2
	orl	a,r3
	jnz	00195$
	ljmp	00119$
00195$:
;	../../../core/net/mac/csma.c:336: q->buf = queuebuf_new_from_packetbuf();
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
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_queuebuf_new_from_packetbuf
	mov	r1,#(_queuebuf_new_from_packetbuf >> 8)
	mov	r2,#(_queuebuf_new_from_packetbuf >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	pop	ar2
	pop	ar3
	pop	ar4
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
;	../../../core/net/mac/csma.c:337: if(q->buf != NULL) {
	mov	a,r5
	orl	a,r6
	jnz	00196$
	ljmp	00117$
00196$:
;	../../../core/net/mac/csma.c:338: struct qbuf_metadata *metadata = (struct qbuf_metadata *)q->ptr;
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x06
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
	mov	r0,sp
	dec	r0
	dec	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	../../../core/net/mac/csma.c:340: if(packetbuf_attr(PACKETBUF_ATTR_MAX_MAC_TRANSMISSIONS) == 0) {
	mov	dpl,#0x09
	mov	r0,#_packetbuf_attr
	mov	r1,#(_packetbuf_attr >> 8)
	mov	r2,#(_packetbuf_attr >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00109$
;	../../../core/net/mac/csma.c:342: metadata->max_transmissions = CSMA_MAX_MAC_TRANSMISSIONS;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x06
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
	sjmp	00110$
00109$:
;	../../../core/net/mac/csma.c:344: metadata->max_transmissions =
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x06
	add	a,@r0
	mov	r2,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar4,@r0
;	../../../core/net/mac/csma.c:345: packetbuf_attr(PACKETBUF_ATTR_MAX_MAC_TRANSMISSIONS);
	mov	dpl,#0x09
	push	ar4
	push	ar3
	push	ar2
	mov	r0,#_packetbuf_attr
	mov	r1,#(_packetbuf_attr >> 8)
	mov	r2,#(_packetbuf_attr >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	pop	ar2
	pop	ar3
	pop	ar4
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r6
	lcall	__gptrput
00110$:
;	../../../core/net/mac/csma.c:347: metadata->sent = sent;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,sp
	add	a,#0xf5
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
;	../../../core/net/mac/csma.c:348: metadata->cptr = ptr;
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
	add	a,#0xef
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
;	../../../core/net/mac/csma.c:350: if(packetbuf_attr(PACKETBUF_ATTR_PACKET_TYPE) ==
	mov	dpl,#0x0e
	mov	r0,#_packetbuf_attr
	mov	r1,#(_packetbuf_attr >> 8)
	mov	r2,#(_packetbuf_attr >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00112$
	cjne	r7,#0x00,00112$
;	../../../core/net/mac/csma.c:352: list_push(n->queued_packet_list, q);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
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
	mov	r0,#_list_push
	mov	r1,#(_list_push >> 8)
	mov	r2,#(_list_push >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	sjmp	00113$
00112$:
;	../../../core/net/mac/csma.c:354: list_add(n->queued_packet_list, q);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
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
00113$:
;	../../../core/net/mac/csma.c:358: if(list_head(n->queued_packet_list) == q) {
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
	add	a,#0xf8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
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
	jz	00201$
	sjmp	00115$
00201$:
;	../../../core/net/mac/csma.c:359: ctimer_set(&n->transmit_timer, 0, transmit_packet_list, n);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0b
	add	a,@r0
	mov	r5,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	r6,a
	inc	r0
	mov	ar7,@r0
	push	ar2
	push	ar3
	push	ar4
	mov	a,#_transmit_packet_list
	push	acc
	mov	a,#(_transmit_packet_list >> 8)
	push	acc
	mov	a,#(_transmit_packet_list >> 16)
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_ctimer_set
	mov	r1,#(_ctimer_set >> 8)
	mov	r2,#(_ctimer_set >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
00115$:
;	../../../core/net/mac/csma.c:361: return;
	ljmp	00136$
00117$:
;	../../../core/net/mac/csma.c:363: memb_free(&metadata_memb, q->ptr);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x06
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
	mov	dptr,#_metadata_memb
	mov	b,#0x00
	mov	r0,#_memb_free
	mov	r1,#(_memb_free >> 8)
	mov	r2,#(_memb_free >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00119$:
;	../../../core/net/mac/csma.c:366: memb_free(&packet_memb, q);
	mov	a,sp
	add	a,#0xf8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	push	ar2
	push	ar3
	push	ar4
	mov	dptr,#_packet_memb
	mov	b,#0x00
	mov	r0,#_memb_free
	mov	r1,#(_memb_free >> 8)
	mov	r2,#(_memb_free >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
00121$:
;	../../../core/net/mac/csma.c:370: if(list_length(n->queued_packet_list) == 0) {
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
	mov	r0,#_list_length
	mov	r1,#(_list_length >> 8)
	mov	r2,#(_list_length >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00128$
;	../../../core/net/mac/csma.c:371: list_remove(neighbor_list, n);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	dptr,#_neighbor_list
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
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
;	../../../core/net/mac/csma.c:372: memb_free(&neighbor_memb, n);
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	push	ar2
	push	ar3
	push	ar4
	mov	dptr,#_neighbor_memb
	mov	b,#0x00
	mov	r0,#_memb_free
	mov	r1,#(_memb_free >> 8)
	mov	r2,#(_memb_free >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/net/mac/csma.c:378: mac_call_sent_callback(sent, ptr, MAC_TX_ERR, 1);
00128$:
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jnz	00203$
	ljmp	00136$
00203$:
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#0x04
	push	acc
	clr	a
	push	acc
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
	mov	a,sp
	add	a,#0xe8
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
	ljmp	00136$
00134$:
;	../../../core/net/mac/csma.c:382: NETSTACK_RDC.send(packet_sent, ptr);
	mov	dptr,#(_nullrdc_driver + 0x0006)
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
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#_packet_sent
	mov	b,#(_packet_sent >> 16)
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar5
	pop	ar6
	pop	ar7
;	../../../core/net/mac/csma.c:383: if(sent) {
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	a,@r0
	inc	r0
	orl	a,@r0
	jz	00136$
;	../../../core/net/mac/csma.c:384: sent(ptr, mac_status, 1);
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	dptr,#_mac_status
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
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
	mov	a,sp
	add	a,#0xe8
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
00136$:
;	../../../core/net/mac/csma.c:390: }
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'input_packet'
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:393: input_packet(void)
;	-----------------------------------------
;	 function input_packet
;	-----------------------------------------
_input_packet:
;	../../../core/net/mac/csma.c:395: NETSTACK_NETWORK.input();
	mov	dptr,#(_sicslowpan_driver + 0x0006)
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
;	../../../core/net/mac/csma.c:396: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'on'
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:399: on(void)
;	-----------------------------------------
;	 function on
;	-----------------------------------------
_on:
;	../../../core/net/mac/csma.c:401: return NETSTACK_RDC.on();
	mov	dptr,#(_nullrdc_driver + 0x000f)
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
;	../../../core/net/mac/csma.c:402: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'off'
;------------------------------------------------------------
;keep_radio_on             Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:405: off(int keep_radio_on)
;	-----------------------------------------
;	 function off
;	-----------------------------------------
_off:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/net/mac/csma.c:407: return NETSTACK_RDC.off(keep_radio_on);
	mov	dptr,#(_nullrdc_driver + 0x0012)
	clr	a
	movc	a,@a+dptr
	mov	r3,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	push	ar5
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,r6
	mov	dph,r7
	pop	ar2
	pop	ar1
	pop	ar0
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r4,dph
	pop	ar5
	mov	dpl,r3
	mov	dph,r4
;	../../../core/net/mac/csma.c:408: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'channel_check_interval'
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:411: channel_check_interval(void)
;	-----------------------------------------
;	 function channel_check_interval
;	-----------------------------------------
_channel_check_interval:
;	../../../core/net/mac/csma.c:413: if(NETSTACK_RDC.channel_check_interval) {
	mov	dptr,#(_nullrdc_driver + 0x0015)
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
	mov	a,r5
	orl	a,r6
	jz	00102$
;	../../../core/net/mac/csma.c:414: return NETSTACK_RDC.channel_check_interval();
	mov	dptr,#(_nullrdc_driver + 0x0015)
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
	sjmp	00103$
00102$:
;	../../../core/net/mac/csma.c:416: return 0;
	mov	dptr,#0x0000
00103$:
;	../../../core/net/mac/csma.c:417: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init'
;------------------------------------------------------------
;	../../../core/net/mac/csma.c:420: init(void)
;	-----------------------------------------
;	 function init
;	-----------------------------------------
_init:
;	../../../core/net/mac/csma.c:422: memb_init(&packet_memb);
	mov	dptr,#_packet_memb
	mov	b,#0x00
	mov	r0,#_memb_init
	mov	r1,#(_memb_init >> 8)
	mov	r2,#(_memb_init >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/mac/csma.c:423: memb_init(&metadata_memb);
	mov	dptr,#_metadata_memb
	mov	b,#0x00
	mov	r0,#_memb_init
	mov	r1,#(_memb_init >> 8)
	mov	r2,#(_memb_init >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/mac/csma.c:424: memb_init(&neighbor_memb);
	mov	dptr,#_neighbor_memb
	mov	b,#0x00
	mov	r0,#_memb_init
	mov	r1,#(_memb_init >> 8)
	mov	r2,#(_memb_init >> 16)
	lcall	__sdcc_banked_call
;	../../../core/net/mac/csma.c:425: }
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
_csma_driver:
	.byte __str_0, (__str_0 >> 8),#0x80
	.byte _init, (_init >> 8), (_init >> 16)
	.byte _send_packet, (_send_packet >> 8), (_send_packet >> 16)
	.byte _input_packet, (_input_packet >> 8), (_input_packet >> 16)
	.byte _on, (_on >> 8), (_on >> 16)
	.byte _off, (_off >> 8), (_off >> 16)
	.byte _channel_check_interval, (_channel_check_interval >> 8), (_channel_check_interval >> 16)
__str_0:
	.ascii "CSMA"
	.db 0x00
	.area XINIT   (CODE)
__xinit__neighbor_memb:
	.byte #0x2a,#0x00	; 42
	.byte #0x02,#0x00	; 2
	.byte _neighbor_memb_memb_count, (_neighbor_memb_memb_count >> 8),#0x00
	.byte _neighbor_memb_memb_mem, (_neighbor_memb_memb_mem >> 8),#0x00
__xinit__packet_memb:
	.byte #0x09,#0x00	; 9
	.byte #0x06,#0x00	; 6
	.byte _packet_memb_memb_count, (_packet_memb_memb_count >> 8),#0x00
	.byte _packet_memb_memb_mem, (_packet_memb_memb_mem >> 8),#0x00
__xinit__metadata_memb:
	.byte #0x07,#0x00	; 7
	.byte #0x06,#0x00	; 6
	.byte _metadata_memb_memb_count, (_metadata_memb_memb_count >> 8),#0x00
	.byte _metadata_memb_memb_mem, (_metadata_memb_memb_mem >> 8),#0x00
__xinit__neighbor_list_list:
; generic printIvalPtr
	.byte #0x00,#0x00,#0x00
__xinit__neighbor_list:
	.byte _neighbor_list_list, (_neighbor_list_list >> 8),#0x00
	.area CABS    (ABS,CODE)
