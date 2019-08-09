	.file	"5.5.5_socket_server.c"
	.text
	.section	.rodata
.LC0:
	.string	"gets"
.LC1:
	.string	"quit"
	.text
	.globl	server
	.type	server, @function
server:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L5:
	leaq	-20(%rbp), %rcx
	movl	-36(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	testq	%rax, %rax
	jne	.L2
	movl	$0, %eax
	jmp	.L6
.L2:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	-20(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L5
	movl	$1, %eax
.L6:
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	server, .-server
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
	subq	$288, %rsp
	movl	%edi, -276(%rbp)
	movq	%rsi, -288(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-288(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -248(%rbp)
	movl	$0, %edx
	movl	$1, %esi
	movl	$1, %edi
	call	socket@PLT
	movl	%eax, -256(%rbp)
	movw	$1, -240(%rbp)
	movq	-248(%rbp), %rax
	leaq	-240(%rbp), %rdx
	addq	$2, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	leaq	-240(%rbp), %rax
	addq	$2, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leal	2(%rax), %edx
	leaq	-240(%rbp), %rcx
	movl	-256(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	movl	-256(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	listen@PLT
.L10:
	leaq	-264(%rbp), %rdx
	leaq	-128(%rbp), %rcx
	movl	-256(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	movl	%eax, -252(%rbp)
	cmpl	$0, -252(%rbp)
	je	.L9
	movl	-252(%rbp), %eax
	movl	%eax, %edi
	call	server
	movl	%eax, -260(%rbp)
	movl	-252(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L9:
	cmpl	$0, -260(%rbp)
	je	.L10
	movl	-256(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	unlink@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
