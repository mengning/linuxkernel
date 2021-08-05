	.arch armv8-a
	.file	"compiler_reordering.c"
	.text
	.comm	flag,4,4
	.comm	data,4,4
	.align	2
	.global	function
	.type	function, %function
function:
	adrp	x0, :got:data
	ldr	x0, [x0, #:got_lo12:data]
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, :got:data
	ldr	x0, [x0, #:got_lo12:data]
	str	w1, [x0]
	adrp	x0, :got:flag
	ldr	x0, [x0, #:got_lo12:flag]
	mov	w1, 1
	str	w1, [x0]
	nop
	ret
	.size	function, .-function
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
