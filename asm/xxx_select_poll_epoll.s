	.file	"xxx_select_poll_epoll.c"
	.text
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
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$304, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$2, %edi
	call	sleep@PLT
	movq	$0, -288(%rbp)
	movq	$0, -280(%rbp)
	movl	$1, -304(%rbp)
	call	getpid@PLT
	movl	%eax, %edi
	call	srandom@PLT
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -300(%rbp)
	movw	$2, -288(%rbp)
	movl	$2000, %edi
	call	htons@PLT
	movw	%ax, -286(%rbp)
	leaq	.LC0(%rip), %rdi
	call	inet_addr@PLT
	movl	%eax, -284(%rbp)
	leaq	-288(%rbp), %rcx
	movl	-300(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	call	getpid@PLT
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	call	random@PLT
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
	movl	%eax, -296(%rbp)
	addl	$1, -304(%rbp)
	movl	-296(%rbp), %eax
	movl	%eax, %edi
	call	sleep@PLT
	call	getpid@PLT
	movl	%eax, %ecx
	movl	-304(%rbp), %edx
	leaq	-272(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-272(%rbp), %rcx
	movl	-300(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	%eax, -292(%rbp)
	jmp	.L2
	.cfi_endproc
.LFE6:
	.size	child_process, .-child_process
	.section	.rodata
.LC3:
	.string	"round again"
	.text
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
	subq	$496, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -480(%rbp)
	movl	$0, -484(%rbp)
	jmp	.L5
.L7:
	call	fork@PLT
	testl	%eax, %eax
	jne	.L6
	call	child_process
	movl	$0, %edi
	call	exit@PLT
.L6:
	addl	$1, -484(%rbp)
.L5:
	cmpl	$4, -484(%rbp)
	jle	.L7
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -476(%rbp)
	leaq	-464(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movw	$2, -464(%rbp)
	movl	$2000, %edi
	call	htons@PLT
	movw	%ax, -462(%rbp)
	movl	$0, -460(%rbp)
	leaq	-464(%rbp), %rcx
	movl	-476(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	movl	-476(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	listen@PLT
	movl	$0, -484(%rbp)
	jmp	.L8
.L10:
	leaq	-448(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$16, -488(%rbp)
	leaq	-488(%rbp), %rdx
	leaq	-448(%rbp), %rcx
	movl	-476(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	movl	%eax, %edx
	movl	-484(%rbp), %eax
	cltq
	movl	%edx, -432(%rbp,%rax,4)
	movl	-484(%rbp), %eax
	cltq
	movl	-432(%rbp,%rax,4), %eax
	cmpl	%eax, -480(%rbp)
	jge	.L9
	movl	-484(%rbp), %eax
	cltq
	movl	-432(%rbp,%rax,4), %eax
	movl	%eax, -480(%rbp)
.L9:
	addl	$1, -484(%rbp)
.L8:
	cmpl	$4, -484(%rbp)
	jle	.L10
.L16:
	movl	$0, %eax
	movl	$16, %ecx
	leaq	-400(%rbp), %rdx
	movq	%rdx, %rdi
#APP
# 83 "xxx_select_poll_epoll.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax
	movl	%ecx, %edx
	movl	%edx, -472(%rbp)
	movl	%eax, -468(%rbp)
	movl	$0, -484(%rbp)
	jmp	.L11
.L12:
	movl	-484(%rbp), %eax
	cltq
	movl	-432(%rbp,%rax,4), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	movl	%eax, %esi
	movslq	%esi, %rax
	movq	-400(%rbp,%rax,8), %rdi
	movl	-484(%rbp), %eax
	cltq
	movl	-432(%rbp,%rax,4), %eax
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
	movq	%rdx, -400(%rbp,%rax,8)
	addl	$1, -484(%rbp)
.L11:
	cmpl	$4, -484(%rbp)
	jle	.L12
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	-480(%rbp), %eax
	leal	1(%rax), %edi
	leaq	-400(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	call	select@PLT
	movl	$0, -484(%rbp)
	jmp	.L13
.L15:
	movl	-484(%rbp), %eax
	cltq
	movl	-432(%rbp,%rax,4), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movq	-400(%rbp,%rax,8), %rsi
	movl	-484(%rbp), %eax
	cltq
	movl	-432(%rbp,%rax,4), %eax
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
	je	.L14
	leaq	-272(%rbp), %rax
	movl	$256, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	-484(%rbp), %eax
	cltq
	movl	-432(%rbp,%rax,4), %eax
	leaq	-272(%rbp), %rcx
	movl	$256, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	leaq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L14:
	addl	$1, -484(%rbp)
.L13:
	cmpl	$4, -484(%rbp)
	jle	.L15
	jmp	.L16
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
