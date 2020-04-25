g:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	$3, %eax
	popq	%rbp
	ret
f:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	g
	leave
	ret
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$8, %edi
	call	f
	addl	$1, %eax
	popq	%rbp
	ret
