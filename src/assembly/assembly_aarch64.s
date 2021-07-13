	.arch armv8-a
	.file	"assembly.c"
	.text
	.align	2
	.global	g
	.type	g, %function
g:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	add	w0, w0, 3
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	g, .-g
	.align	2
	.global	f
	.type	f, %function
f:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29, 28]
	ldr	w0, [x29, 28]
	bl	g
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE1:
	.size	f, .-f
	.align	2
	.global	main
	.type	main, %function
main:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	mov	w0, 8
	bl	f
	add	w0, w0, 1
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
