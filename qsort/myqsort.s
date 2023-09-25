.globl	QkSort
QkSort:
	cmp	w1, w2		
	b.gt	.end	// left > right 直接结束

	stp	x29, x30, [sp, #-48]!           
	str	x21, [sp, #16]              
	mov	x29, sp
	stp	x20, x19, [sp, #32]          

	ldr	w8, [x0, w1, sxtw #2]
	mov	w19, w2
	mov	x20, x0
	sxtw	x9, w1
	mov	w21, w1
	cmp	w1, w2
	b.eq	.LBB0_9

	mov	x10, #4294967296
	mov	x11, #-4294967296
	mov	w13, w1
	mov	w12, w19
.LBB0_3:
	sxtw	x18, w12
	sxtw	x13, w13
	add	w12, w12, #1
	add	x17, x10, x18, lsl #32
.LBB0_4:
	ldr	w15, [x20, x18, lsl #2]
	sub	x16, x18, #1
	mov	w14, w12
	add	x17, x17, x11
	sub	w12, w12, #1
	cmp	w15, w8
	ccmp	x18, x13, #4, ge
	mov	x18, x16
	b.gt	.LBB0_4

	asr	x18, x17, #32
	add	x17, x20, x13, lsl #2
.LBB0_6:
	ldr	w0, [x17], #4
	add	x2, x13, #1
	cmp	w0, w8
	ccmp	x18, x13, #4, le
	mov	x13, x2
	b.gt	.LBB0_6

	add	x16, x20, x16, lsl #2
	sub	w13, w2, #1
	cmp	w14, w2
	stur	w15, [x17, #-4]
	str	w0, [x16, #4]
	b.ne	.LBB0_3

	mov	w21, w13
.LBB0_9:
	sbfiz	x10, x21, #2, #32
	sub	w2, w21, #1
	mov	x0, x20
                 
	ldr	w11, [x20, x10]
	str	w11, [x20, x9, lsl #2]
	str	w8, [x20, x10]
	bl	QkSort
	add	w1, w21, #1
	mov	x0, x20
	mov	w2, w19
	bl	QkSort

	ldp	x20, x19, [sp, #32]         
	ldr	x21, [sp, #16]          
	ldp	x29, x30, [sp], #48    
.end:
	ret
