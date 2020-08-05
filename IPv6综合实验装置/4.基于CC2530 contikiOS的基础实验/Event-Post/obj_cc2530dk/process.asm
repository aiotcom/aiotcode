;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module process
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _process_current
	.globl _process_list
	.globl _process_alloc_event
	.globl _process_start
	.globl _process_exit
	.globl _process_init
	.globl _process_run
	.globl _process_nevents
	.globl _process_post
	.globl _process_post_synch
	.globl _process_poll
	.globl _process_is_running
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
_lastevent:
	.ds 1
_nevents:
	.ds 1
_fevent:
	.ds 1
_events:
	.ds 224
_poll_requested:
	.ds 1
_do_event_ev_65536_91:
	.ds 1
_do_event_data_65536_91:
	.ds 3
_do_event_receiver_65536_91:
	.ds 3
_do_event_p_65536_91:
	.ds 3
_process_post_snum_65536_105:
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_process_list::
	.ds 3
_process_current::
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
;Allocation info for local variables in function 'process_alloc_event'
;------------------------------------------------------------
;	../../../core/sys/process.c:93: process_alloc_event(void)
;	-----------------------------------------
;	 function process_alloc_event
;	-----------------------------------------
_process_alloc_event:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	../../../core/sys/process.c:95: return lastevent++;
	mov	dptr,#_lastevent
	movx	a,@dptr
	mov	r7,a
	inc	a
	movx	@dptr,a
	mov	dpl,r7
;	../../../core/sys/process.c:96: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'process_start'
;------------------------------------------------------------
;arg                       Allocated to stack - sp -5
;p                         Allocated to registers r5 r6 r7 
;q                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	../../../core/sys/process.c:99: process_start(struct process *p, const char *arg)
;	-----------------------------------------
;	 function process_start
;	-----------------------------------------
_process_start:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/sys/process.c:105: for(q = process_list; q != p && q != NULL; q = q->next);
	mov	dptr,#_process_list
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
00106$:
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
	jz	00101$
	mov	a,r2
	orl	a,r3
	jz	00101$
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
	sjmp	00106$
00101$:
;	../../../core/sys/process.c:108: if(q == p) {
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
	jnz	00103$
;	../../../core/sys/process.c:109: return;
	ljmp	__sdcc_banked_ret
00103$:
;	../../../core/sys/process.c:112: p->next = process_list;
	mov	dptr,#_process_list
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
;	../../../core/sys/process.c:113: process_list = p;
	mov	dptr,#_process_list
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/sys/process.c:114: p->state = PROCESS_STATE_RUNNING;
	mov	a,#0x0b
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/sys/process.c:115: PT_INIT(&p->pt);
	mov	a,#0x09
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
;	../../../core/sys/process.c:120: process_post_synch(p, PROCESS_EVENT_INIT, (process_data_t)arg);
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
	mov	a,#0x81
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_process_post_synch
	mov	r1,#(_process_post_synch >> 8)
	mov	r2,#(_process_post_synch >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/sys/process.c:121: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'exit_process'
;------------------------------------------------------------
;fromprocess               Allocated to stack - sp -11
;p                         Allocated to stack - sp -5
;q                         Allocated to registers r7 r6 r5 
;old_current               Allocated to stack - sp -2
;------------------------------------------------------------
;	../../../core/sys/process.c:124: exit_process(struct process *p, struct process *fromprocess)
;	-----------------------------------------
;	 function exit_process
;	-----------------------------------------
_exit_process:
	push	dpl
	push	dph
	push	b
	inc	sp
	inc	sp
	inc	sp
;	../../../core/sys/process.c:127: struct process *old_current = process_current;
	mov	dptr,#_process_current
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
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
;	../../../core/sys/process.c:133: for(q = process_list; q != p && q != NULL; q = q->next);
	mov	dptr,#_process_list
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
00120$:
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
	jz	00101$
	mov	a,r2
	orl	a,r3
	jz	00101$
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
	sjmp	00120$
00101$:
;	../../../core/sys/process.c:134: if(q == NULL) {
	mov	a,r2
	orl	a,r3
	jnz	00103$
;	../../../core/sys/process.c:135: return;
	ljmp	00128$
00103$:
;	../../../core/sys/process.c:138: if(process_is_running(p)) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_process_is_running
	mov	r1,#(_process_is_running >> 8)
	mov	r2,#(_process_is_running >> 16)
	lcall	__sdcc_banked_call
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00203$
	ljmp	00111$
00203$:
;	../../../core/sys/process.c:140: p->state = PROCESS_STATE_NONE;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,#0x0b
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
;	../../../core/sys/process.c:147: for(q = process_list; q != NULL; q = q->next) {
	mov	dptr,#_process_list
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	ar7,r2
	mov	ar6,r3
	mov	ar5,r4
00123$:
	mov	a,r7
	orl	a,r6
	jz	00106$
;	../../../core/sys/process.c:148: if(p != q) {
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	push	ar7
	push	ar6
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
	jz	00124$
;	../../../core/sys/process.c:149: call_process(q, PROCESS_EVENT_EXITED, (process_data_t)p);
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
	push	ar2
	push	ar3
	push	ar4
	mov	a,#0x87
	push	acc
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	r0,#_call_process
	mov	r1,#(_call_process >> 8)
	mov	r2,#(_call_process >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar6
	pop	ar7
00124$:
;	../../../core/sys/process.c:147: for(q = process_list; q != NULL; q = q->next) {
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__gptrget
	mov	r7,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	sjmp	00123$
00106$:
;	../../../core/sys/process.c:153: if(p->thread != NULL && p != fromprocess) {
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
	jnz	00206$
	ljmp	00111$
00206$:
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xf5
	mov	r1,a
	mov	a,@r1
	push	acc
	inc	r1
	mov	a,@r1
	push	acc
	inc	r1
	mov	a,@r1
	push	acc
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
;	../../../core/sys/process.c:155: process_current = p;
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	dptr,#_process_current
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
;	../../../core/sys/process.c:156: p->thread(&p->pt, PROCESS_EVENT_EXIT, NULL);
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
	mov	a,#0x09
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
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x83
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
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar2
	pop	ar3
	pop	ar4
00111$:
;	../../../core/sys/process.c:160: if(p == process_list) {
	mov	dptr,#_process_list
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
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
	jz	00209$
	sjmp	00116$
00209$:
;	../../../core/sys/process.c:161: process_list = process_list->next;
	mov	dptr,#_process_list
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
	mov	dptr,#_process_list
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	ljmp	00117$
00116$:
;	../../../core/sys/process.c:163: for(q = process_list; q != NULL; q = q->next) {
	mov	dptr,#_process_list
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
00126$:
	mov	a,r5
	orl	a,r6
	jnz	00210$
	ljmp	00117$
00210$:
;	../../../core/sys/process.c:164: if(q->next == p) {
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
	jz	00212$
	sjmp	00127$
00212$:
;	../../../core/sys/process.c:165: q->next = p->next;
	mov	a,sp
	add	a,#0xfb
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
;	../../../core/sys/process.c:166: break;
	sjmp	00117$
00127$:
;	../../../core/sys/process.c:163: for(q = process_list; q != NULL; q = q->next) {
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
	ljmp	00126$
00117$:
;	../../../core/sys/process.c:171: process_current = old_current;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dptr,#_process_current
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
00128$:
;	../../../core/sys/process.c:172: }
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'call_process'
;------------------------------------------------------------
;ev                        Allocated to stack - sp -6
;data                      Allocated to stack - sp -9
;p                         Allocated to stack - sp -2
;ret                       Allocated to registers r2 r7 
;------------------------------------------------------------
;	../../../core/sys/process.c:175: call_process(struct process *p, process_event_t ev, process_data_t data)
;	-----------------------------------------
;	 function call_process
;	-----------------------------------------
_call_process:
	push	dpl
	push	dph
	push	b
;	../../../core/sys/process.c:185: if((p->state & PROCESS_STATE_RUNNING) &&
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0b
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
	jb	acc.0,00127$
	ljmp	00109$
00127$:
;	../../../core/sys/process.c:186: p->thread != NULL) {
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
	jnz	00128$
	ljmp	00109$
00128$:
;	../../../core/sys/process.c:188: process_current = p;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	dptr,#_process_current
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
;	../../../core/sys/process.c:189: p->state = PROCESS_STATE_CALLED;
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x0b
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
;	../../../core/sys/process.c:190: ret = p->thread(&p->pt, ev, data);
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
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	r0,sp
	dec	r0
	dec	r0
	mov	a,#0x09
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
	add	a,#0xf5
	mov	r0,a
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
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar4
	mov	r7,#0x00
;	../../../core/sys/process.c:191: if(ret == PT_EXITED ||
	cjne	r2,#0x02,00129$
	cjne	r7,#0x00,00129$
	sjmp	00101$
00129$:
;	../../../core/sys/process.c:192: ret == PT_ENDED ||
	cjne	r2,#0x03,00130$
	cjne	r7,#0x00,00130$
	sjmp	00101$
00130$:
;	../../../core/sys/process.c:193: ev == PROCESS_EVENT_EXIT) {
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	cjne	@r0,#0x83,00102$
00101$:
;	../../../core/sys/process.c:194: exit_process(p, p);
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
	add	a,#0xfb
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	r0,#_exit_process
	mov	r1,#(_exit_process >> 8)
	mov	r2,#(_exit_process >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	sjmp	00109$
00102$:
;	../../../core/sys/process.c:196: p->state = PROCESS_STATE_RUNNING;
	mov	r0,sp
	dec	r0
	dec	r0
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
	mov	a,#0x01
	lcall	__gptrput
00109$:
;	../../../core/sys/process.c:199: }
	dec	sp
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'process_exit'
;------------------------------------------------------------
;p                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/sys/process.c:202: process_exit(struct process *p)
;	-----------------------------------------
;	 function process_exit
;	-----------------------------------------
_process_exit:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/sys/process.c:204: exit_process(p, PROCESS_CURRENT());
	mov	dptr,#_process_current
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
	mov	r0,#_exit_process
	mov	r1,#(_exit_process >> 8)
	mov	r2,#(_exit_process >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
;	../../../core/sys/process.c:205: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'process_init'
;------------------------------------------------------------
;	../../../core/sys/process.c:208: process_init(void)
;	-----------------------------------------
;	 function process_init
;	-----------------------------------------
_process_init:
;	../../../core/sys/process.c:210: lastevent = PROCESS_EVENT_MAX;
	mov	dptr,#_lastevent
	mov	a,#0x8a
	movx	@dptr,a
;	../../../core/sys/process.c:212: nevents = fevent = 0;
	mov	dptr,#_fevent
	clr	a
	movx	@dptr,a
	mov	dptr,#_nevents
	movx	@dptr,a
;	../../../core/sys/process.c:217: process_current = process_list = NULL;
	mov	dptr,#_process_list
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_process_current
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../core/sys/process.c:218: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'do_poll'
;------------------------------------------------------------
;p                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/sys/process.c:225: do_poll(void)
;	-----------------------------------------
;	 function do_poll
;	-----------------------------------------
_do_poll:
;	../../../core/sys/process.c:229: poll_requested = 0;
	mov	dptr,#_poll_requested
	clr	a
	movx	@dptr,a
;	../../../core/sys/process.c:231: for(p = process_list; p != NULL; p = p->next) {
	mov	dptr,#_process_list
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
00105$:
	mov	a,r5
	orl	a,r6
	jnz	00121$
	ljmp	__sdcc_banked_ret
00121$:
;	../../../core/sys/process.c:232: if(p->needspoll) {
	mov	a,#0x0c
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
	jz	00106$
;	../../../core/sys/process.c:233: p->state = PROCESS_STATE_RUNNING;
	mov	a,#0x0b
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,#0x01
	lcall	__gptrput
;	../../../core/sys/process.c:234: p->needspoll = 0;
	mov	a,#0x0c
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
;	../../../core/sys/process.c:235: call_process(p, PROCESS_EVENT_POLL, NULL);
	push	ar7
	push	ar6
	push	ar5
	push	acc
	push	acc
	push	acc
	mov	a,#0x82
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_call_process
	mov	r1,#(_call_process >> 8)
	mov	r2,#(_call_process >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar6
	pop	ar7
00106$:
;	../../../core/sys/process.c:231: for(p = process_list; p != NULL; p = p->next) {
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
;	../../../core/sys/process.c:238: }
	ljmp	00105$
;------------------------------------------------------------
;Allocation info for local variables in function 'do_event'
;------------------------------------------------------------
;ev                        Allocated with name '_do_event_ev_65536_91'
;data                      Allocated with name '_do_event_data_65536_91'
;receiver                  Allocated with name '_do_event_receiver_65536_91'
;p                         Allocated with name '_do_event_p_65536_91'
;------------------------------------------------------------
;	../../../core/sys/process.c:246: do_event(void)
;	-----------------------------------------
;	 function do_event
;	-----------------------------------------
_do_event:
;	../../../core/sys/process.c:261: if(nevents > 0) {
	mov	dptr,#_nevents
	movx	a,@dptr
	jnz	00140$
	ljmp	__sdcc_banked_ret
00140$:
;	../../../core/sys/process.c:264: ev = events[fevent].ev;
	mov	dptr,#_fevent
	movx	a,@dptr
	mov	r7,a
	mov	b,#0x07
	mul	ab
	mov	r5,a
	mov	r6,b
	add	a,#_events
	mov	dpl,a
	mov	a,r6
	addc	a,#(_events >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dptr,#_do_event_ev_65536_91
	movx	@dptr,a
;	../../../core/sys/process.c:266: data = events[fevent].data;
	mov	a,r5
	add	a,#_events
	mov	r5,a
	mov	a,r6
	addc	a,#(_events >> 8)
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_do_event_data_65536_91
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	../../../core/sys/process.c:267: receiver = events[fevent].p;
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	inc	dptr
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_do_event_receiver_65536_91
	mov	a,r4
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../core/sys/process.c:271: fevent = (process_num_events_t) (fevent + 1) % PROCESS_CONF_NUMEVENTS;
	inc	r7
	anl	ar7,#0x1f
	mov	r6,#0x00
	mov	dptr,#_fevent
	mov	a,r7
	movx	@dptr,a
;	../../../core/sys/process.c:272: --nevents;
	mov	dptr,#_nevents
	movx	a,@dptr
	dec	a
	movx	@dptr,a
;	../../../core/sys/process.c:276: if(receiver == PROCESS_BROADCAST) {
	mov	dptr,#_do_event_receiver_65536_91
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jz	00141$
	ljmp	00107$
00141$:
;	../../../core/sys/process.c:277: for(p = process_list; p != NULL; p = p->next) {
	mov	dptr,#_process_list
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_do_event_p_65536_91
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
00112$:
	mov	dptr,#_do_event_p_65536_91
	movx	a,@dptr
	mov	b,a
	inc	dptr
	movx	a,@dptr
	orl	a,b
	jnz	00142$
	ljmp	__sdcc_banked_ret
00142$:
;	../../../core/sys/process.c:281: if(poll_requested) {
	mov	dptr,#_poll_requested
	movx	a,@dptr
	jz	00102$
;	../../../core/sys/process.c:282: do_poll();
	mov	r0,#_do_poll
	mov	r1,#(_do_poll >> 8)
	mov	r2,#(_do_poll >> 16)
	lcall	__sdcc_banked_call
00102$:
;	../../../core/sys/process.c:284: call_process(p, ev, data);
	mov	dptr,#_do_event_p_65536_91
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_do_event_data_65536_91
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	dptr,#_do_event_ev_65536_91
	movx	a,@dptr
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_call_process
	mov	r1,#(_call_process >> 8)
	mov	r2,#(_call_process >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/sys/process.c:277: for(p = process_list; p != NULL; p = p->next) {
	mov	dptr,#_do_event_p_65536_91
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
	mov	dptr,#_do_event_p_65536_91
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	sjmp	00112$
00107$:
;	../../../core/sys/process.c:291: if(ev == PROCESS_EVENT_INIT) {
	mov	dptr,#_do_event_ev_65536_91
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x81,00105$
;	../../../core/sys/process.c:292: receiver->state = PROCESS_STATE_RUNNING;
	mov	dptr,#_do_event_receiver_65536_91
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x0b
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
00105$:
;	../../../core/sys/process.c:296: call_process(receiver, ev, data);
	mov	dptr,#_do_event_receiver_65536_91
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_do_event_data_65536_91
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	dptr,#_do_event_ev_65536_91
	movx	a,@dptr
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_call_process
	mov	r1,#(_call_process >> 8)
	mov	r2,#(_call_process >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/sys/process.c:299: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'process_run'
;------------------------------------------------------------
;	../../../core/sys/process.c:302: process_run(void)
;	-----------------------------------------
;	 function process_run
;	-----------------------------------------
_process_run:
;	../../../core/sys/process.c:305: if(poll_requested) {
	mov	dptr,#_poll_requested
	movx	a,@dptr
	jz	00102$
;	../../../core/sys/process.c:306: do_poll();
	mov	r0,#_do_poll
	mov	r1,#(_do_poll >> 8)
	mov	r2,#(_do_poll >> 16)
	lcall	__sdcc_banked_call
00102$:
;	../../../core/sys/process.c:310: do_event();
	mov	r0,#_do_event
	mov	r1,#(_do_event >> 8)
	mov	r2,#(_do_event >> 16)
	lcall	__sdcc_banked_call
;	../../../core/sys/process.c:312: return nevents + poll_requested;
	mov	dptr,#_nevents
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	dptr,#_poll_requested
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
	addc	a,r6
	mov	r6,a
	mov	dpl,r7
	mov	dph,r6
;	../../../core/sys/process.c:313: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'process_nevents'
;------------------------------------------------------------
;	../../../core/sys/process.c:316: process_nevents(void)
;	-----------------------------------------
;	 function process_nevents
;	-----------------------------------------
_process_nevents:
;	../../../core/sys/process.c:318: return nevents + poll_requested;
	mov	dptr,#_nevents
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	dptr,#_poll_requested
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	add	a,r7
	mov	r7,a
	mov	a,r4
	addc	a,r6
	mov	r6,a
	mov	dpl,r7
	mov	dph,r6
;	../../../core/sys/process.c:319: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'process_post'
;------------------------------------------------------------
;ev                        Allocated to stack - sp -3
;data                      Allocated to stack - sp -6
;p                         Allocated to registers r5 r6 r7 
;snum                      Allocated with name '_process_post_snum_65536_105'
;------------------------------------------------------------
;	../../../core/sys/process.c:322: process_post(struct process *p, process_event_t ev, process_data_t data)
;	-----------------------------------------
;	 function process_post
;	-----------------------------------------
_process_post:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/sys/process.c:335: if(nevents == PROCESS_CONF_NUMEVENTS) {
	mov	dptr,#_nevents
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0x20,00102$
;	../../../core/sys/process.c:343: return PROCESS_ERR_FULL;
	mov	dptr,#0x0001
	ljmp	__sdcc_banked_ret
00102$:
;	../../../core/sys/process.c:346: snum = (process_num_events_t)(fevent + nevents) % PROCESS_CONF_NUMEVENTS;
	mov	dptr,#_nevents
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_fevent
	movx	a,@dptr
	add	a,r4
	mov	r4,a
	anl	ar4,#0x1f
	mov	dptr,#_process_post_snum_65536_105
	mov	a,r4
	movx	@dptr,a
;	../../../core/sys/process.c:347: events[snum].ev = ev;
	mov	a,r4
	mov	b,#0x07
	mul	ab
	add	a,#_events
	mov	dpl,a
	mov	a,#(_events >> 8)
	addc	a,b
	mov	dph,a
	mov	a,sp
	add	a,#0xfd
	mov	r0,a
	mov	a,@r0
	movx	@dptr,a
;	../../../core/sys/process.c:348: events[snum].data = data;
	mov	dptr,#_process_post_snum_65536_105
	movx	a,@dptr
	mov	b,#0x07
	mul	ab
	add	a,#_events
	mov	r3,a
	mov	a,#(_events >> 8)
	addc	a,b
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	inc	dptr
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
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
;	../../../core/sys/process.c:349: events[snum].p = p;
	mov	dptr,#_process_post_snum_65536_105
	movx	a,@dptr
	mov	b,#0x07
	mul	ab
	add	a,#_events
	mov	r3,a
	mov	a,#(_events >> 8)
	addc	a,b
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	inc	dptr
	inc	dptr
	inc	dptr
	inc	dptr
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../core/sys/process.c:350: ++nevents;
	mov	dptr,#_nevents
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	../../../core/sys/process.c:358: return PROCESS_ERR_OK;
	mov	dptr,#0x0000
;	../../../core/sys/process.c:359: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'process_post_synch'
;------------------------------------------------------------
;ev                        Allocated to stack - sp -3
;data                      Allocated to stack - sp -6
;p                         Allocated to registers r5 r6 r7 
;caller                    Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	../../../core/sys/process.c:362: process_post_synch(struct process *p, process_event_t ev, process_data_t data)
;	-----------------------------------------
;	 function process_post_synch
;	-----------------------------------------
_process_post_synch:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/sys/process.c:364: struct process *caller = process_current;
	mov	dptr,#_process_current
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
;	../../../core/sys/process.c:366: call_process(p, ev, data);
	push	ar4
	push	ar3
	push	ar2
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
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	push	acc
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	r0,#_call_process
	mov	r1,#(_call_process >> 8)
	mov	r2,#(_call_process >> 16)
	lcall	__sdcc_banked_call
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar2
	pop	ar3
	pop	ar4
;	../../../core/sys/process.c:367: process_current = caller;
	mov	dptr,#_process_current
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
;	../../../core/sys/process.c:368: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'process_poll'
;------------------------------------------------------------
;p                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/sys/process.c:371: process_poll(struct process *p)
;	-----------------------------------------
;	 function process_poll
;	-----------------------------------------
_process_poll:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/sys/process.c:373: if(p != NULL) {
	mov	a,r5
	orl	a,r6
	jz	00106$
;	../../../core/sys/process.c:374: if(p->state == PROCESS_STATE_RUNNING ||
	mov	a,#0x0b
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
	cjne	r2,#0x01,00117$
	sjmp	00101$
00117$:
;	../../../core/sys/process.c:375: p->state == PROCESS_STATE_CALLED) {
	mov	a,#0x0b
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
	cjne	r2,#0x02,00106$
00101$:
;	../../../core/sys/process.c:376: p->needspoll = 1;
	mov	a,#0x0c
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
;	../../../core/sys/process.c:377: poll_requested = 1;
	mov	dptr,#_poll_requested
	movx	@dptr,a
00106$:
;	../../../core/sys/process.c:380: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'process_is_running'
;------------------------------------------------------------
;p                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../../core/sys/process.c:383: process_is_running(struct process *p)
;	-----------------------------------------
;	 function process_is_running
;	-----------------------------------------
_process_is_running:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../../core/sys/process.c:385: return p->state != PROCESS_STATE_NONE;
	mov	a,#0x0b
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
	cjne	a,#0x01,00103$
00103$:
	cpl	c
	mov	b0,c
	clr	a
	rlc	a
	mov	r6,a
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
;	../../../core/sys/process.c:386: }
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
__xinit__process_list:
; generic printIvalPtr
	.byte #0x00,#0x00,#0x00
__xinit__process_current:
; generic printIvalPtr
	.byte #0x00,#0x00,#0x00
	.area CABS    (ABS,CODE)
