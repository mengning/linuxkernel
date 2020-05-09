	.file	"time.c"
	.text
	.section	.rodata
.LC0:
	.string	"time: %d/%d/%d  %d:%d:%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -24(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	localtime@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-16(%rbp), %rax
	movl	4(%rax), %r8d
	movq	-16(%rbp), %rax
	movl	8(%rax), %edi
	movq	-16(%rbp), %rax
	movl	12(%rax), %edx
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	movq	-16(%rbp), %rsi
	movl	20(%rsi), %esi
	addl	$1900, %esi
	subq	$8, %rsp
	pushq	%rcx
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	%edx, %ecx
	movl	%eax, %edx
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
