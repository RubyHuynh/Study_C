	.file	"select_poll_epoll.c"
	.section	.rodata
.LC0:
	.string	"127.0.0.1"
.LC1:
	.string	"child {%d} connected \n"
	.align 8
.LC2:
	.string	"Test message %d from client %d"
	.text
	.globl	child_process
	.type	child_process, @function
child_process:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	movl	$2, %edi
	call	sleep
	movq	$0, -288(%rbp)
	movq	$0, -280(%rbp)
	movl	$1, -4(%rbp)
	call	getpid
	movl	%eax, %edi
	call	srandom
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket
	movl	%eax, -8(%rbp)
	movw	$2, -288(%rbp)
	movl	$2000, %edi
	call	htons
	movw	%ax, -286(%rbp)
	movl	$.LC0, %edi
	call	inet_addr
	movl	%eax, -284(%rbp)
	leaq	-288(%rbp), %rcx
	movl	-8(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect
	call	getpid
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
.L2:
	call	random
	movq	%rax, %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$2, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	subq	%rax, %rcx
	movq	%rcx, %rdx
	movl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	addl	$1, -4(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	sleep
	call	getpid
	movl	%eax, %ecx
	movl	-4(%rbp), %edx
	leaq	-272(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	-272(%rbp), %rcx
	movl	-8(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -16(%rbp)
	jmp	.L2
	.cfi_endproc
.LFE2:
	.size	child_process, .-child_process
	.section	.rodata
.LC3:
	.string	"round again"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$528, %rsp
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L4
.L6:
	call	fork
	testl	%eax, %eax
	jne	.L5
	call	child_process
	movl	$0, %edi
	call	exit
.L5:
	addl	$1, -4(%rbp)
.L4:
	cmpl	$4, -4(%rbp)
	jle	.L6
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket
	movl	%eax, -12(%rbp)
	leaq	-336(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movw	$2, -336(%rbp)
	movl	$2000, %edi
	call	htons
	movw	%ax, -334(%rbp)
	movl	$0, -332(%rbp)
	leaq	-336(%rbp), %rcx
	movl	-12(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind
	movl	-12(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	listen
	movl	$0, -4(%rbp)
	jmp	.L7
.L9:
	leaq	-352(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movl	$16, -356(%rbp)
	leaq	-356(%rbp), %rdx
	leaq	-352(%rbp), %rcx
	movl	-12(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, -320(%rbp,%rax,4)
	movl	-4(%rbp), %eax
	cltq
	movl	-320(%rbp,%rax,4), %eax
	cmpl	-8(%rbp), %eax
	jle	.L8
	movl	-4(%rbp), %eax
	cltq
	movl	-320(%rbp,%rax,4), %eax
	movl	%eax, -8(%rbp)
.L8:
	addl	$1, -4(%rbp)
.L7:
	cmpl	$4, -4(%rbp)
	jle	.L9
.L15:
	movl	$0, %eax
	movl	$16, %ecx
	leaq	-528(%rbp), %rdx
	movq	%rdx, %rdi
#APP
# 83 "select_poll_epoll.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax
	movl	%ecx, %edx
	movl	%edx, -16(%rbp)
	movl	%eax, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L10
.L11:
	movl	-4(%rbp), %eax
	cltq
	movl	-320(%rbp,%rax,4), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-528(%rbp,%rax,8), %rdi
	movl	-4(%rbp), %eax
	cltq
	movl	-320(%rbp,%rax,4), %eax
	cltd
	shrl	$26, %edx
	addl	%edx, %eax
	andl	$63, %eax
	subl	%edx, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movq	%rdx, %rax
	orq	%rax, %rdi
	movq	%rdi, %rdx
	movslq	%esi, %rax
	movq	%rdx, -528(%rbp,%rax,8)
	addl	$1, -4(%rbp)
.L10:
	cmpl	$4, -4(%rbp)
	jle	.L11
	movl	$.LC3, %edi
	call	puts
	movl	-8(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-528(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select
	movl	$0, -4(%rbp)
	jmp	.L12
.L14:
	movl	-4(%rbp), %eax
	cltq
	movl	-320(%rbp,%rax,4), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-528(%rbp,%rax,8), %rsi
	movl	-4(%rbp), %eax
	cltq
	movl	-320(%rbp,%rax,4), %eax
	cltd
	shrl	$26, %edx
	addl	%edx, %eax
	andl	$63, %eax
	subl	%edx, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	salq	%cl, %rdx
	movq	%rdx, %rax
	andq	%rsi, %rax
	testq	%rax, %rax
	je	.L13
	leaq	-288(%rbp), %rax
	movl	$256, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movl	-4(%rbp), %eax
	cltq
	movl	-320(%rbp,%rax,4), %eax
	leaq	-288(%rbp), %rcx
	movl	$256, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	puts
.L13:
	addl	$1, -4(%rbp)
.L12:
	cmpl	$4, -4(%rbp)
	jle	.L14
	jmp	.L15
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.3.1 20161221 (Red Hat 6.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
