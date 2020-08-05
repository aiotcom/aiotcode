;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.4 #10774 (Linux)
;--------------------------------------------------------
	.module ifft
	.optsdcc -mmcs51 --model-huge
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ifft
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
;Allocation info for local variables in function 'bitrev'
;------------------------------------------------------------
;nu                        Allocated to stack - sp -6
;j                         Allocated to stack - sp -1
;k                         Allocated to registers r7 r6 
;------------------------------------------------------------
;	../../../core/lib/ifft.c:62: static uint16_t bitrev(uint16_t j, uint16_t nu)
;	-----------------------------------------
;	 function bitrev
;	-----------------------------------------
_bitrev:
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
;	../../../core/lib/ifft.c:65: k = 0;
	clr	a
	mov	r7,a
	mov	r6,a
	mov	a,sp
	add	a,#0xfa
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
00103$:
;	../../../core/lib/ifft.c:66: for (; nu > 0; nu--) {
	mov	a,r2
	orl	a,r3
	jz	00101$
;	../../../core/lib/ifft.c:67: k  = (k << 1) + (j & 1);
	mov	a,r7
	add	a,r7
	mov	r4,a
	mov	a,r6
	rlc	a
	mov	r5,a
	mov	r0,sp
	dec	r0
	mov	a,#0x01
	anl	a,@r0
	mov	r7,#0x00
	add	a,r4
	mov	r4,a
	mov	a,r7
	addc	a,r5
	mov	r5,a
	mov	ar7,r4
	mov	ar6,r5
;	../../../core/lib/ifft.c:68: j = j >> 1;
	mov	r0,sp
	mov	a,@r0
	dec	r0
	clr	c
	rrc	a
	xch	a,@r0
	rrc	a
	xch	a,@r0
	inc	r0
	mov	@r0,a
;	../../../core/lib/ifft.c:66: for (; nu > 0; nu--) {
	dec	r2
	cjne	r2,#0xff,00119$
	dec	r3
00119$:
	sjmp	00103$
00101$:
;	../../../core/lib/ifft.c:70: return k;
	mov	dpl,r7
	mov	dph,r6
;	../../../core/lib/ifft.c:71: }
	dec	sp
	dec	sp
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sinI'
;------------------------------------------------------------
;angleMilli                Allocated to registers r6 r7 
;pos                       Allocated to registers r4 r5 
;------------------------------------------------------------
;	../../../core/lib/ifft.c:75: static int16_t sinI(uint16_t angleMilli)
;	-----------------------------------------
;	 function sinI
;	-----------------------------------------
_sinI:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/lib/ifft.c:78: pos = (uint16_t) ((SIN_TAB_LEN * (uint32_t) angleMilli) / 1000);
	mov	r5,#0x00
	mov	r4,#0x00
	push	ar6
	push	ar7
	push	ar5
	push	ar4
	mov	dptr,#(0x78&0x00ff)
	clr	a
	mov	b,a
	lcall	__mullong
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xe8
	push	acc
	mov	a,#0x03
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	__divulong
	mov	r4,dpl
	mov	r5,dph
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	../../../core/lib/ifft.c:79: return SIN_TAB[pos % SIN_TAB_LEN];
	mov	a,#0x78
	push	acc
	clr	a
	push	acc
	mov	dpl,r4
	mov	dph,r5
	lcall	__moduint
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	mov	a,r6
	add	a,#_SIN_TAB
	mov	dpl,a
	mov	a,r7
	addc	a,#(_SIN_TAB >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	dpl,r7
	mov	dph,r6
;	../../../core/lib/ifft.c:80: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'cosI'
;------------------------------------------------------------
;angleMilli                Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../../core/lib/ifft.c:82: static int16_t cosI(uint16_t angleMilli)
;	-----------------------------------------
;	 function cosI
;	-----------------------------------------
_cosI:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/lib/ifft.c:84: return sinI(angleMilli + 250);
	mov	a,#0xfa
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_sinI
	mov	r1,#(_sinI >> 8)
	mov	r2,#(_sinI >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov  r7,dph
;	../../../core/lib/ifft.c:85: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ilog2'
;------------------------------------------------------------
;val                       Allocated to registers r6 r7 
;log                       Allocated to registers r4 r5 
;------------------------------------------------------------
;	../../../core/lib/ifft.c:87: static uint16_t ilog2(uint16_t val)
;	-----------------------------------------
;	 function ilog2
;	-----------------------------------------
_ilog2:
	mov	r6,dpl
	mov	r7,dph
;	../../../core/lib/ifft.c:90: log = 0;
;	../../../core/lib/ifft.c:91: val = val >> 1; /* The 20 = 1 => log = 0 => val = 0 */
	clr	a
	mov	r4,a
	mov	r5,a
	mov	a,r7
	clr	c
	rrc	a
	xch	a,r6
	rrc	a
	xch	a,r6
	mov	r7,a
;	../../../core/lib/ifft.c:92: while (val > 0) {
00101$:
	mov	a,r6
	orl	a,r7
	jz	00108$
;	../../../core/lib/ifft.c:93: val = val >> 1;
	mov	a,r7
	clr	c
	rrc	a
	xch	a,r6
	rrc	a
	xch	a,r6
	mov	r7,a
;	../../../core/lib/ifft.c:94: log++;
	inc	r4
	cjne	r4,#0x00,00101$
	inc	r5
	sjmp	00101$
00108$:
;	../../../core/lib/ifft.c:96: return log;
	mov	dpl,r4
	mov	dph,r5
;	../../../core/lib/ifft.c:97: }
	ljmp	__sdcc_banked_ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ifft'
;------------------------------------------------------------
;xim                       Allocated to stack - sp -56
;n                         Allocated to stack - sp -58
;xre                       Allocated to stack - sp -50
;nu                        Allocated to stack - sp -19
;n2                        Allocated to stack - sp -17
;nu1                       Allocated to registers r7 r6 
;p                         Allocated to registers r3 r4 
;k                         Allocated to registers 
;l                         Allocated to registers 
;i                         Allocated to registers 
;c                         Allocated to stack - sp -15
;s                         Allocated to stack - sp -11
;tr                        Allocated to stack - sp -7
;ti                        Allocated to stack - sp -3
;sloc0                     Allocated to stack - sp -47
;sloc1                     Allocated to stack - sp -45
;sloc2                     Allocated to stack - sp -43
;sloc3                     Allocated to stack - sp -41
;sloc4                     Allocated to stack - sp -39
;sloc5                     Allocated to stack - sp -7
;sloc6                     Allocated to stack - sp -37
;sloc7                     Allocated to stack - sp -34
;sloc8                     Allocated to stack - sp -30
;sloc9                     Allocated to stack - sp -26
;sloc10                    Allocated to stack - sp -23
;------------------------------------------------------------
;	../../../core/lib/ifft.c:114: ifft(int16_t xre[], int16_t xim[], uint16_t n)
;	-----------------------------------------
;	 function ifft
;	-----------------------------------------
_ifft:
	push	dpl
	push	dph
	push	b
	mov	a,sp
	add	a,#0x30
;	../../../core/lib/ifft.c:122: nu = ilog2(n);
	mov	sp,a
	add	a,#0xc6
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	mov	r0,#_ilog2
	mov	r1,#(_ilog2 >> 8)
	mov	r2,#(_ilog2 >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r4,dph
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
;	../../../core/lib/ifft.c:123: nu1 = nu - 1;
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	mov	a,@r0
	add	a,#0xff
	mov	r7,a
	inc	r0
	mov	a,@r0
	addc	a,#0xff
	mov	r6,a
;	../../../core/lib/ifft.c:124: n2 = n / 2;
	mov	a,sp
	add	a,#0xc6
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	a,@r0
	clr	c
	rrc	a
	xch	a,r2
	rrc	a
	xch	a,r2
	mov	r4,a
;	../../../core/lib/ifft.c:126: for (i = 0; i < n; i++)
	mov	a,sp
	add	a,#0xd1
	mov	r0,a
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
00110$:
	push	ar2
	push	ar4
	mov	a,sp
	add	a,#0xcf
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,sp
	add	a,#0xc4
	mov	r0,a
	clr	c
	mov	a,r3
	subb	a,@r0
	mov	a,r4
	inc	r0
	subb	a,@r0
	pop	ar4
	pop	ar2
	jnc	00101$
;	../../../core/lib/ifft.c:127: xim[i] = 0;
	push	ar2
	push	ar4
	mov	a,sp
	add	a,#0xcf
	mov	r0,a
	mov	a,@r0
	add	a,@r0
	mov	r3,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r4,a
	mov	a,sp
	add	a,#0xc6
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
	mov	dpl,r3
	mov	dph,r4
	mov	b,r2
	clr	a
	lcall	__gptrput
	inc	dptr
	lcall	__gptrput
;	../../../core/lib/ifft.c:126: for (i = 0; i < n; i++)
	mov	a,sp
	add	a,#0xcf
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00214$
	inc	r0
	inc	@r0
00214$:
	pop	ar4
	pop	ar2
	sjmp	00110$
00101$:
;	../../../core/lib/ifft.c:129: for (l = 1; l <= nu; l++) {
	mov	a,sp
	add	a,#0xd1
	mov	r0,a
	mov	@r0,#0x01
	inc	r0
	mov	@r0,#0x00
	mov	a,sp
	add	a,#0xd3
	mov	r0,a
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar6
00119$:
	push	ar2
	push	ar4
	mov	a,sp
	add	a,#0xcf
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,sp
	add	a,#0xeb
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,r3
	inc	r0
	mov	a,@r0
	subb	a,r4
	pop	ar4
	pop	ar2
	jnc	00215$
	ljmp	00104$
00215$:
;	../../../core/lib/ifft.c:130: for (k = 0; k < n; k += n2) {
	mov	a,sp
	add	a,#0xd5
	mov	r0,a
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
00116$:
	push	ar2
	push	ar4
	mov	a,sp
	add	a,#0xd3
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,sp
	add	a,#0xc4
	mov	r0,a
	clr	c
	mov	a,r3
	subb	a,@r0
	mov	a,r4
	inc	r0
	subb	a,@r0
	pop	ar4
	pop	ar2
	jc	00216$
	ljmp	00103$
00216$:
;	../../../core/lib/ifft.c:131: for (i = 1; i <= n2; i++) {
	mov	a,sp
	add	a,#0xd7
	mov	r0,a
	mov	@r0,#0x01
	inc	r0
	mov	@r0,#0x00
	mov	a,sp
	add	a,#0xd5
	mov	r0,a
	mov	a,sp
	add	a,#0xd9
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
00113$:
	mov	a,sp
	add	a,#0xd7
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar7,@r0
	clr	c
	mov	a,r2
	subb	a,r3
	mov	a,r4
	subb	a,r7
	jnc	00217$
	ljmp	00149$
00217$:
;	../../../core/lib/ifft.c:132: p = bitrev(k >> nu1, nu);
	mov	a,sp
	add	a,#0xd3
	mov	r0,a
	mov	b,@r0
	inc	b
	mov	a,sp
	add	a,#0xd9
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	a,@r0
	mov	r7,a
	rlc	a
	mov	ov,c
	sjmp	00219$
00218$:
	mov	c,ov
	mov	a,r7
	rrc	a
	mov	r7,a
	mov	a,r3
	rrc	a
	mov	r3,a
00219$:
	djnz	b,00218$
	push	ar4
	push	ar2
	mov	a,sp
	add	a,#0xeb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r3
	mov	dph,r7
	mov	r0,#_bitrev
	mov	r1,#(_bitrev >> 8)
	mov	r2,#(_bitrev >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
;	../../../core/lib/ifft.c:133: c = cosI((1000 * p) / n);
	push	ar6
	push	ar7
	mov	dptr,#0x03e8
	lcall	__mulint
	mov	r6,dpl
	mov	r7,dph
	dec	sp
	dec	sp
	mov	a,sp
	add	a,#0xc4
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r6
	mov	dph,r7
	lcall	__divuint
	mov	r7,dpl
	mov	r6,dph
	dec	sp
	dec	sp
	pop	ar2
	pop	ar4
	mov	dpl,r7
	mov	dph,r6
	push	ar7
	push	ar6
	push	ar4
	push	ar2
	mov	r0,#_cosI
	mov	r1,#(_cosI >> 8)
	mov	r2,#(_cosI >> 16)
	lcall	__sdcc_banked_call
	mov	r3,dpl
	mov	r5,dph
	pop	ar2
	pop	ar4
	pop	ar6
	pop	ar7
	mov	a,sp
	add	a,#0xf1
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar5
	mov	a,r5
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
;	../../../core/lib/ifft.c:134: s = sinI((1000 * p) / n);
	mov	dpl,r7
	mov	dph,r6
	push	ar4
	push	ar2
	mov	r0,#_sinI
	mov	r1,#(_sinI >> 8)
	mov	r2,#(_sinI >> 16)
	lcall	__sdcc_banked_call
	mov	r6,dpl
	mov	r7,dph
	pop	ar2
	pop	ar4
	mov	a,sp
	add	a,#0xf5
	mov	r0,a
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	mov	a,r7
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
;	../../../core/lib/ifft.c:136: tr = ((xre[k + n2] * c + xim[k + n2] * s) >> RESOLUTION);
	mov	a,sp
	add	a,#0xd9
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	mov	a,r2
	add	a,r6
	mov	r6,a
	mov	a,r4
	addc	a,r7
	mov	r7,a
	mov	a,r6
	add	a,r6
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r5,a
	push	ar2
	push	ar4
	mov	a,sp
	add	a,#0xcc
	mov	r0,a
	mov	a,sp
	add	a,#0xd9
	mov	r1,a
	mov	a,r6
	add	a,@r0
	mov	@r1,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xd9
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
	mov	r7,a
	mov	a,sp
	add	a,#0xdc
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar7
	mov	a,r7
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
	push	ar6
	push	ar5
	push	ar4
	push	ar2
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
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xd4
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	xch	a,r0
	mov	a,sp
	add	a,#0xd8
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar2
	pop	ar4
	pop	ar5
	pop	ar6
	mov	a,sp
	add	a,#0xc6
	mov	r0,a
	mov	a,sp
	add	a,#0xe4
	mov	r1,a
	mov	a,r6
	add	a,@r0
	mov	@r1,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xe4
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
	mov	r6,a
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar6
	mov	a,r6
	rlc	a
	subb	a,acc
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,a
	push	ar4
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
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xe2
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r2,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar4
	mov	a,sp
	add	a,#0xe0
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	r5,a
	mov	a,r6
	inc	r0
	addc	a,@r0
	mov	r6,a
	mov	a,r7
	inc	r0
	addc	a,@r0
	mov	r7,a
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	@r0,ar2
	mov	a,r5
	mov	c,acc.7
	xch	a,@r0
	rlc	a
	xch	a,@r0
	rlc	a
	xch	a,@r0
	anl	a,#0x01
	inc	r0
	mov	@r0,a
	mov	a,r6
	add	a,r6
	orl	a,@r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar6
	mov	a,r7
	mov	c,acc.7
	xch	a,@r0
	rlc	a
	xch	a,@r0
	rlc	a
	xch	a,@r0
	anl	a,#0x01
	jnb	acc.0,00220$
	orl	a,#0xfe
00220$:
	inc	r0
	mov	@r0,a
;	../../../core/lib/ifft.c:137: ti = ((xim[k + n2] * c - xre[k + n2] * s) >> RESOLUTION);
	push	ar4
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
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xe1
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	xch	a,r0
	mov	a,sp
	add	a,#0xe1
	xch	a,r0
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar2
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
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xd7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	__mullong
	mov	r2,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar4
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	a,@r0
	clr	c
	subb	a,r2
	mov	r2,a
	inc	r0
	mov	a,@r0
	subb	a,r5
	mov	r5,a
	inc	r0
	mov	a,@r0
	subb	a,r6
	mov	r6,a
	inc	r0
	mov	a,@r0
	subb	a,r7
	mov	r7,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	@r0,ar2
	mov	a,r5
	mov	c,acc.7
	xch	a,@r0
	rlc	a
	xch	a,@r0
	rlc	a
	xch	a,@r0
	anl	a,#0x01
	inc	r0
	mov	@r0,a
	mov	a,r6
	add	a,r6
	orl	a,@r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar6
	mov	a,r7
	mov	c,acc.7
	xch	a,@r0
	rlc	a
	xch	a,@r0
	rlc	a
	xch	a,@r0
	anl	a,#0x01
	jnb	acc.0,00221$
	orl	a,#0xfe
00221$:
	inc	r0
	mov	@r0,a
;	../../../core/lib/ifft.c:139: xre[k + n2] = xre[k] - tr;
	mov	a,sp
	add	a,#0xd7
	mov	r0,a
	mov	a,sp
	add	a,#0xe7
	mov	r1,a
	mov	a,@r0
	add	a,@r0
	mov	@r1,a
	inc	r0
	mov	a,@r0
	rlc	a
	inc	r1
	mov	@r1,a
	mov	a,sp
	add	a,#0xcc
	mov	r0,a
	mov	a,sp
	add	a,#0xe7
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,sp
	add	a,#0xe0
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xf7
	mov	r0,a
	mov	a,sp
	add	a,#0xdc
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xe0
	mov	r0,a
	mov	a,sp
	add	a,#0xdc
	mov	r1,a
	mov	a,@r0
	clr	c
	subb	a,@r1
	mov	r2,a
	inc	r0
	mov	a,@r0
	inc	r1
	subb	a,@r1
	mov	r4,a
	mov	a,sp
	add	a,#0xd9
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/lib/ifft.c:140: xim[k + n2] = xim[k] - ti;
	mov	a,sp
	add	a,#0xc6
	mov	r0,a
	mov	a,sp
	add	a,#0xe7
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	push	acc
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	pop	acc
	mov	@r0,a
	dec	r0
	pop	acc
	mov	@r0,a
	dec	r0
	pop	acc
	mov	@r0,a
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,sp
	add	a,#0xe0
	mov	r1,a
	lcall	__gptrget
	mov	@r1,a
	inc	dptr
	lcall	__gptrget
	inc	r1
	mov	@r1,a
	mov	a,sp
	add	a,#0xfb
	mov	r0,a
	mov	a,sp
	add	a,#0xd9
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xe0
	mov	r0,a
	mov	a,sp
	add	a,#0xd9
	mov	r1,a
	mov	a,@r0
	clr	c
	subb	a,@r1
	mov	r3,a
	inc	r0
	mov	a,@r0
	inc	r1
	subb	a,@r1
	mov	r4,a
	mov	a,sp
	add	a,#0xe4
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/lib/ifft.c:141: xre[k] += tr;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	a,sp
	add	a,#0xdc
	mov	r0,a
	mov	a,@r0
	add	a,r3
	mov	r3,a
	inc	r0
	mov	a,@r0
	addc	a,r4
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/lib/ifft.c:142: xim[k] += ti;
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,sp
	add	a,#0xd9
	mov	r0,a
	mov	a,@r0
	add	a,r6
	mov	r6,a
	inc	r0
	mov	a,@r0
	addc	a,r7
	mov	r7,a
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,r6
	lcall	__gptrput
	inc	dptr
	mov	a,r7
	lcall	__gptrput
;	../../../core/lib/ifft.c:143: k++;
	mov	a,sp
	add	a,#0xd7
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00222$
	inc	r0
	inc	@r0
00222$:
;	../../../core/lib/ifft.c:131: for (i = 1; i <= n2; i++) {
	mov	a,sp
	add	a,#0xd5
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00223$
	inc	r0
	inc	@r0
00223$:
	pop	ar4
	pop	ar2
	ljmp	00113$
00149$:
	mov	a,sp
	add	a,#0xd9
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
;	../../../core/lib/ifft.c:130: for (k = 0; k < n; k += n2) {
	mov	a,sp
	add	a,#0xd5
	mov	r0,a
	mov	a,r2
	add	a,r6
	mov	@r0,a
	mov	a,r4
	addc	a,r7
	inc	r0
	mov	@r0,a
	ljmp	00116$
00103$:
;	../../../core/lib/ifft.c:146: nu1--;
	mov	a,sp
	add	a,#0xd3
	mov	r0,a
	dec	@r0
	cjne	@r0,#0xff,00224$
	inc	r0
	dec	@r0
00224$:
;	../../../core/lib/ifft.c:147: n2 = n2 / 2;
	mov	a,r4
	clr	c
	rrc	a
	xch	a,r2
	rrc	a
	xch	a,r2
	mov	r4,a
;	../../../core/lib/ifft.c:129: for (l = 1; l <= nu; l++) {
	mov	a,sp
	add	a,#0xd1
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00225$
	inc	r0
	inc	@r0
00225$:
	ljmp	00119$
00104$:
;	../../../core/lib/ifft.c:150: for (k = 0; k < n; k++) {
	mov	r6,#0x00
	mov	r7,#0x00
00122$:
	mov	ar4,r6
	mov	ar5,r7
	mov	a,sp
	add	a,#0xc6
	mov	r0,a
	clr	c
	mov	a,r4
	subb	a,@r0
	mov	a,r5
	inc	r0
	subb	a,@r0
	jc	00226$
	ljmp	00107$
00226$:
;	../../../core/lib/ifft.c:151: p = bitrev(k, nu);
	push	ar7
	push	ar6
	mov	a,sp
	add	a,#0xeb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	r0,#_bitrev
	mov	r1,#(_bitrev >> 8)
	mov	r2,#(_bitrev >> 16)
	lcall	__sdcc_banked_call
	mov	r5,dpl
	mov	r4,dph
	dec	sp
	dec	sp
	pop	ar6
	pop	ar7
	mov	ar3,r5
;	../../../core/lib/ifft.c:152: if (p > k) {
	clr	c
	mov	a,r6
	subb	a,r3
	mov	a,r7
	xrl	a,#0x80
	mov	b,r4
	xrl	b,#0x80
	subb	a,b
	jc	00227$
	ljmp	00123$
00227$:
;	../../../core/lib/ifft.c:153: n2 = xre[k];
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	a,r6
	add	a,r6
	mov	@r0,a
	mov	a,r7
	rlc	a
	inc	r0
	mov	@r0,a
	push	ar6
	push	ar7
	mov	a,sp
	add	a,#0xcc
	mov	r0,a
	mov	a,sp
	add	a,#0xe7
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,sp
	add	a,#0xe4
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
;	../../../core/lib/ifft.c:154: xre[k] = xre[p];
	mov	a,sp
	add	a,#0xe0
	mov	r0,a
	mov	a,r3
	add	a,r3
	mov	@r0,a
	mov	a,r4
	rlc	a
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xcc
	mov	r0,a
	mov	a,sp
	add	a,#0xe0
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	push	acc
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xdb
	mov	r0,a
	pop	acc
	mov	@r0,a
	dec	r0
	pop	acc
	mov	@r0,a
	dec	r0
	pop	acc
	mov	@r0,a
	mov	a,sp
	add	a,#0xdc
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/lib/ifft.c:155: xre[p] = n2;
	mov	a,sp
	add	a,#0xdc
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,sp
	add	a,#0xe4
	mov	r1,a
	mov	a,@r1
	lcall	__gptrput
	inc	dptr
	inc	r1
	mov	a,@r1
	lcall	__gptrput
;	../../../core/lib/ifft.c:157: n2 = xim[k];
	mov	a,sp
	add	a,#0xc6
	mov	r0,a
	mov	a,sp
	add	a,#0xe7
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
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,sp
	add	a,#0xed
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
;	../../../core/lib/ifft.c:158: xim[k] = xim[p];
	mov	a,sp
	add	a,#0xc6
	mov	r0,a
	mov	a,sp
	add	a,#0xe0
	mov	r1,a
	mov	a,@r1
	add	a,@r0
	push	acc
	inc	r1
	mov	a,@r1
	inc	r0
	addc	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	pop	acc
	mov	@r0,a
	dec	r0
	pop	acc
	mov	@r0,a
	dec	r0
	pop	acc
	mov	@r0,a
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
	lcall	__gptrput
	inc	dptr
	mov	a,r4
	lcall	__gptrput
;	../../../core/lib/ifft.c:159: xim[p] = n2;
	mov	a,sp
	add	a,#0xe7
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	mov	a,sp
	add	a,#0xed
	mov	r1,a
	mov	a,@r1
	lcall	__gptrput
	inc	dptr
	inc	r1
	mov	a,@r1
	lcall	__gptrput
;	../../../core/lib/ifft.c:165: for (i = 0, n2 = n / 2; i < n2; i++) {
	pop	ar7
	pop	ar6
;	../../../core/lib/ifft.c:159: xim[p] = n2;
00123$:
;	../../../core/lib/ifft.c:150: for (k = 0; k < n; k++) {
	inc	r6
	cjne	r6,#0x00,00228$
	inc	r7
00228$:
	ljmp	00122$
00107$:
;	../../../core/lib/ifft.c:165: for (i = 0, n2 = n / 2; i < n2; i++) {
	mov	a,sp
	add	a,#0xde
	mov	r0,a
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xc6
	mov	r0,a
	mov	a,sp
	add	a,#0xe2
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	mov	a,@r0
	clr	c
	rrc	a
	xch	a,@r1
	rrc	a
	xch	a,@r1
	inc	r1
	mov	@r1,a
00125$:
	mov	a,sp
	add	a,#0xde
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	mov	a,sp
	add	a,#0xe2
	mov	r0,a
	clr	c
	mov	a,r2
	subb	a,@r0
	mov	a,r3
	inc	r0
	subb	a,@r0
	jc	00229$
	ljmp	00127$
00229$:
;	../../../core/lib/ifft.c:166: xre[i] = (ABS(xre[i]) + ABS(xim[i]));
	mov	a,sp
	add	a,#0xde
	mov	r0,a
	mov	a,@r0
	add	a,@r0
	mov	r2,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r3,a
	mov	a,sp
	add	a,#0xce
	mov	r0,a
	mov	a,sp
	add	a,#0xe9
	mov	r1,a
	mov	a,r2
	add	a,@r0
	mov	@r1,a
	mov	a,r3
	inc	r0
	addc	a,@r0
	inc	r1
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	mov	a,sp
	add	a,#0xe9
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	lcall	__gptrget
	inc	dptr
	lcall	__gptrget
	jnb	acc.7,00129$
	mov	a,sp
	add	a,#0xde
	mov	r0,a
	mov	a,@r0
	add	a,@r0
	mov	r2,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r3,a
	mov	a,sp
	add	a,#0xce
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r3
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r5
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	clr	c
	clr	a
	subb	a,r2
	mov	@r0,a
	clr	a
	subb	a,r3
	inc	r0
	mov	@r0,a
	sjmp	00130$
00129$:
	mov	a,sp
	add	a,#0xde
	mov	r0,a
	mov	a,@r0
	add	a,@r0
	mov	r2,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r3,a
	mov	a,sp
	add	a,#0xce
	mov	r0,a
	mov	a,r2
	add	a,@r0
	mov	r2,a
	mov	a,r3
	inc	r0
	addc	a,@r0
	mov	r3,a
	inc	r0
	mov	ar5,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r5
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	lcall	__gptrget
	mov	@r0,a
	inc	dptr
	lcall	__gptrget
	inc	r0
	mov	@r0,a
00130$:
	mov	a,sp
	add	a,#0xde
	mov	r0,a
	mov	a,@r0
	add	a,@r0
	mov	r4,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r5,a
	mov	a,sp
	add	a,#0xc8
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	r4,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar3,@r0
	mov	dpl,r4
	mov	dph,r5
	mov	b,r3
	lcall	__gptrget
	inc	dptr
	lcall	__gptrget
	jnb	acc.7,00131$
	mov	a,sp
	add	a,#0xde
	mov	r0,a
	mov	a,@r0
	add	a,@r0
	mov	r4,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r5,a
	mov	a,sp
	add	a,#0xc8
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	r4,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	r5,a
	inc	r0
	mov	ar3,@r0
	mov	dpl,r4
	mov	dph,r5
	mov	b,r3
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	clr	c
	clr	a
	subb	a,r4
	mov	r4,a
	clr	a
	subb	a,r5
	mov	r5,a
	sjmp	00132$
00131$:
	mov	a,sp
	add	a,#0xde
	mov	r0,a
	mov	a,@r0
	add	a,@r0
	mov	r2,a
	inc	r0
	mov	a,@r0
	rlc	a
	mov	r3,a
	mov	a,sp
	add	a,#0xc8
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
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
00132$:
	mov	a,sp
	add	a,#0xe6
	mov	r0,a
	mov	a,r4
	add	a,@r0
	mov	r4,a
	mov	a,r5
	inc	r0
	addc	a,@r0
	mov	r5,a
	mov	a,sp
	add	a,#0xe9
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
;	../../../core/lib/ifft.c:165: for (i = 0, n2 = n / 2; i < n2; i++) {
	mov	a,sp
	add	a,#0xde
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00232$
	inc	r0
	inc	@r0
00232$:
	ljmp	00125$
00127$:
;	../../../core/lib/ifft.c:168: }
	mov	a,sp
	add	a,#0xcd
	mov	sp,a
	ljmp	__sdcc_banked_ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
_SIN_TAB:
	.db #0x00	;  0
	.db #0x06	;  6
	.db #0x0d	;  13
	.db #0x14	;  20
	.db #0x1a	;  26
	.db #0x21	;  33
	.db #0x27	;  39
	.db #0x2d	;  45
	.db #0x34	;  52	'4'
	.db #0x3a	;  58
	.db #0x3f	;  63
	.db #0x45	;  69	'E'
	.db #0x4b	;  75	'K'
	.db #0x50	;  80	'P'
	.db #0x55	;  85	'U'
	.db #0x5a	;  90	'Z'
	.db #0x5f	;  95
	.db #0x63	;  99	'c'
	.db #0x67	;  103	'g'
	.db #0x6b	;  107	'k'
	.db #0x6e	;  110	'n'
	.db #0x72	;  114	'r'
	.db #0x74	;  116	't'
	.db #0x77	;  119	'w'
	.db #0x79	;  121	'y'
	.db #0x7b	;  123
	.db #0x7d	;  125
	.db #0x7e	;  126
	.db #0x7f	;  127
	.db #0x7f	;  127
	.db #0x7f	;  127
	.db #0x7f	;  127
	.db #0x7f	;  127
	.db #0x7e	;  126
	.db #0x7d	;  125
	.db #0x7b	;  123
	.db #0x79	;  121	'y'
	.db #0x77	;  119	'w'
	.db #0x74	;  116	't'
	.db #0x72	;  114	'r'
	.db #0x6e	;  110	'n'
	.db #0x6b	;  107	'k'
	.db #0x67	;  103	'g'
	.db #0x63	;  99	'c'
	.db #0x5f	;  95
	.db #0x5a	;  90	'Z'
	.db #0x55	;  85	'U'
	.db #0x50	;  80	'P'
	.db #0x4b	;  75	'K'
	.db #0x45	;  69	'E'
	.db #0x3f	;  63
	.db #0x3a	;  58
	.db #0x34	;  52	'4'
	.db #0x2d	;  45
	.db #0x27	;  39
	.db #0x21	;  33
	.db #0x1a	;  26
	.db #0x14	;  20
	.db #0x0d	;  13
	.db #0x06	;  6
	.db #0x00	;  0
	.db #0xfa	; -6
	.db #0xf3	; -13
	.db #0xec	; -20
	.db #0xe6	; -26
	.db #0xdf	; -33
	.db #0xd9	; -39
	.db #0xd3	; -45
	.db #0xcc	; -52
	.db #0xc6	; -58
	.db #0xc1	; -63
	.db #0xbb	; -69
	.db #0xb5	; -75
	.db #0xb0	; -80
	.db #0xab	; -85
	.db #0xa6	; -90
	.db #0xa1	; -95
	.db #0x9d	; -99
	.db #0x99	; -103
	.db #0x95	; -107
	.db #0x92	; -110
	.db #0x8e	; -114
	.db #0x8c	; -116
	.db #0x89	; -119
	.db #0x87	; -121
	.db #0x85	; -123
	.db #0x83	; -125
	.db #0x82	; -126
	.db #0x81	; -127
	.db #0x81	; -127
	.db #0x81	; -127
	.db #0x81	; -127
	.db #0x81	; -127
	.db #0x82	; -126
	.db #0x83	; -125
	.db #0x85	; -123
	.db #0x87	; -121
	.db #0x89	; -119
	.db #0x8c	; -116
	.db #0x8e	; -114
	.db #0x92	; -110
	.db #0x95	; -107
	.db #0x99	; -103
	.db #0x9d	; -99
	.db #0xa1	; -95
	.db #0xa6	; -90
	.db #0xab	; -85
	.db #0xb0	; -80
	.db #0xb5	; -75
	.db #0xbb	; -69
	.db #0xc1	; -63
	.db #0xc6	; -58
	.db #0xcc	; -52
	.db #0xd3	; -45
	.db #0xd9	; -39
	.db #0xdf	; -33
	.db #0xe6	; -26
	.db #0xec	; -20
	.db #0xf3	; -13
	.db #0xfa	; -6
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
