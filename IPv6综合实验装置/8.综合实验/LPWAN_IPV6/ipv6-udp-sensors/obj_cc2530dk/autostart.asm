;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module autostart
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _process_exit
	.globl _process_start
	.globl _autostart_start
	.globl _autostart_exit
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
;Allocation info for local variables in function 'autostart_start'
;------------------------------------------------------------
;processes                 Allocated to stack - sp -4
;i                         Allocated to registers r3 r4 
;sloc0                     Allocated to stack - sp -1
;------------------------------------------------------------
;	../../../core/sys/autostart.c:52: autostart_start(struct process * const processes[])
;	-----------------------------------------
;	 function autostart_start
;	-----------------------------------------
_autostart_start:
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
;	../../../core/sys/autostart.c:56: for(i = 0; processes[i] != NULL; ++i) {
	clr	a
	mov	r3,a
	mov	r4,a
	mov	a,#0x03
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
	mov	r0,sp
	dec	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
00103$:
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,sp
	add	a,#0xfd
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	a,r2
	orl	a,r3
	pop	ar4
	pop	ar3
	jz	00105$
;	../../../core/sys/autostart.c:57: process_start(processes[i], NULL);
	mov	a,sp
	add	a,#0xfc
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
	push	ar4
	push	ar3
	clr	a
	push	acc
	push	acc
	push	acc
	mov	dpl,r2
	mov	dph,r6
	mov	b,r7
	mov	r0,#_process_start
	mov	r1,#(_process_start >> 8)
	mov	r2,#(_process_start >> 16)
	lcall	__sdcc_banked_call
	dec	sp
	dec	sp
	dec	sp
	pop	ar3
	pop	ar4
;	../../../core/sys/autostart.c:56: for(i = 0; processes[i] != NULL; ++i) {
	mov	a,#0x03
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	r0,sp
	dec	r0
	mov	a,#0x03
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	ljmp	00103$
00105$:
;	../../../core/sys/autostart.c:60: }
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'autostart_exit'
;------------------------------------------------------------
;processes                 Allocated to stack - sp -4
;i                         Allocated to registers r3 r4 
;sloc0                     Allocated to stack - sp -1
;------------------------------------------------------------
;	../../../core/sys/autostart.c:63: autostart_exit(struct process * const processes[])
;	-----------------------------------------
;	 function autostart_exit
;	-----------------------------------------
_autostart_exit:
	push	dpl
	push	dph
	push	b
	inc	sp
	inc	sp
;	../../../core/sys/autostart.c:67: for(i = 0; processes[i] != NULL; ++i) {
	clr	a
	mov	r3,a
	mov	r4,a
	mov	a,#0x03
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
	mov	r0,sp
	dec	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
00103$:
	push	ar3
	push	ar4
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	a,sp
	add	a,#0xfd
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
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	a,r2
	orl	a,r3
	pop	ar4
	pop	ar3
	jz	00105$
;	../../../core/sys/autostart.c:68: process_exit(processes[i]);
	mov	a,sp
	add	a,#0xfc
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
	mov	r0,#_process_exit
	mov	r1,#(_process_exit >> 8)
	mov	r2,#(_process_exit >> 16)
	lcall	__sdcc_banked_call
	pop	ar3
	pop	ar4
;	../../../core/sys/autostart.c:67: for(i = 0; processes[i] != NULL; ++i) {
	mov	a,#0x03
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	r0,sp
	dec	r0
	mov	a,#0x03
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
	ljmp	00103$
00105$:
;	../../../core/sys/autostart.c:71: }
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
