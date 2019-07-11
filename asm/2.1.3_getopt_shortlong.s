	.file	"2.1.3_getopt_shortlong.c"
	.text
	.comm	prg_name,8,8
	.section	.rodata
.LC0:
	.string	"Usage %s options\n"
.LC1:
	.string	"output"
.LC2:
	.string	"help"
	.align 8
.LC3:
	.string	"-%c --%s \n-%c --%s out_file \n-%c --%s \n"
.LC4:
	.string	"verbose"
	.text
	.globl	usage
	.type	usage, @function
usage:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	prg_name(%rip), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	pushq	%rdx
	pushq	$118
	leaq	.LC1(%rip), %r9
	movl	$111, %r8d
	leaq	.LC2(%rip), %rcx
	movl	$104, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	usage, .-usage
	.section	.rodata
.LC5:
	.string	"ho:v"
	.align 8
.LC6:
	.string	"=====\n Done: output=%s verbose=%d \n"
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
	subq	$192, %rsp
	movl	%edi, -180(%rbp)
	movq	%rsi, -192(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -164(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, -152(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, -144(%rbp)
	movl	$0, -136(%rbp)
	movq	$0, -128(%rbp)
	movl	$104, -120(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -112(%rbp)
	movl	$1, -104(%rbp)
	movq	$0, -96(%rbp)
	movl	$111, -88(%rbp)
	leaq	.LC4(%rip), %rax
	movq	%rax, -80(%rbp)
	movl	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movl	$118, -56(%rbp)
	movq	$0, -48(%rbp)
	movl	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -24(%rbp)
	movq	$0, -160(%rbp)
	movl	$0, -168(%rbp)
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, prg_name(%rip)
.L11:
	leaq	-144(%rbp), %rcx
	movq	-152(%rbp), %rdx
	movq	-192(%rbp), %rsi
	movl	-180(%rbp), %eax
	movl	$0, %r8d
	movl	%eax, %edi
	call	getopt_long@PLT
	movl	%eax, -164(%rbp)
	cmpl	$104, -164(%rbp)
	je	.L3
	cmpl	$104, -164(%rbp)
	jg	.L4
	cmpl	$-1, -164(%rbp)
	je	.L14
	cmpl	$63, -164(%rbp)
	je	.L6
	jmp	.L7
.L4:
	cmpl	$111, -164(%rbp)
	je	.L8
	cmpl	$118, -164(%rbp)
	je	.L9
	jmp	.L7
.L3:
	movq	stdout(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	usage
.L8:
	movq	optarg(%rip), %rax
	movq	%rax, -160(%rbp)
	jmp	.L10
.L9:
	movl	$2, -168(%rbp)
	jmp	.L10
.L6:
	movq	stderr(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	usage
.L7:
	call	abort@PLT
.L14:
	nop
.L10:
	cmpl	$-1, -164(%rbp)
	jne	.L11
	movl	-168(%rbp), %edx
	movq	-160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
