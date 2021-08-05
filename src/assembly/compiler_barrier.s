	.arch armv8-a
	.file	"compiler_barrier.c"
	.text
	.align	2
	.p2align 3,,7
	.global	function
	.type	function, %function
function:
	adrp	x0, :got:data
	ldr	x0, [x0, #:got_lo12:data]
	ldr	w1, [x0]
	add	w1, w1, 1
	str	w1, [x0]
	adrp	x1, :got:flag
	mov	w2, 1
	ldr	x1, [x1, #:got_lo12:flag]
	str	w2, [x1]
	ret
	.size	function, .-function
	.comm	data,4,4
	.comm	flag,4,4
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
