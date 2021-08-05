	.arch armv8-a
	.file	"compiler_reordering.c"
	.text
	.align	2
	.p2align 3,,7
	.global	function
	.type	function, %function
function:
	adrp	x1, :got:data
	adrp	x3, :got:flag
	mov	w4, 1
	ldr	x1, [x1, #:got_lo12:data]
	ldr	x3, [x3, #:got_lo12:flag]
	ldr	w2, [x1]
	str	w4, [x3]
	add	w2, w2, w4
	str	w2, [x1]
	ret
	.size	function, .-function
	.comm	data,4,4
	.comm	flag,4,4
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
