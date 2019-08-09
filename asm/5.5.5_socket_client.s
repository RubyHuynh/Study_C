	.file	"5.5.5_socket_client.c"
	.text
	.globl	write_text
	.type	write_text, @function
write_text:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	leaq	-12(%rbp), %rcx
	movl	-20(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rcx
	movl	-20(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	write_text, .-write_text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	%edi, -164(%rbp)
	movq	%rsi, -176(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-176(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -144(%rbp)
	movq	-176(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -136(%rbp)
	movl	$0, %edx
	movl	$1, %esi
	movl	$1, %edi
	call	socket@PLT
	movl	%eax, -148(%rbp)
	movw	$1, -128(%rbp)
	movq	-144(%rbp), %rax
	leaq	-128(%rbp), %rdx
	addq	$2, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	leaq	-128(%rbp), %rax
	addq	$2, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leal	2(%rax), %edx
	leaq	-128(%rbp), %rcx
	movl	-148(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	movq	-136(%rbp), %rdx
	movl	-148(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	write_text
	movl	-148(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
