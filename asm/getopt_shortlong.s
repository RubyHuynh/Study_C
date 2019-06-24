	.file	"getopt_shortlong.c"
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
.LFB2:
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
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-8(%rbp), %rax
	pushq	$.LC4
	pushq	$118
	movl	$.LC1, %r9d
	movl	$111, %r8d
	movl	$.LC2, %ecx
	movl	$104, %edx
	movl	$.LC3, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	addq	$16, %rsp
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	exit
	.cfi_endproc
.LFE2:
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
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	%edi, -164(%rbp)
	movq	%rsi, -176(%rbp)
	movl	$0, -16(%rbp)
	movq	$.LC5, -24(%rbp)
	movq	$.LC2, -160(%rbp)
	movl	$0, -152(%rbp)
	movq	$0, -144(%rbp)
	movl	$104, -136(%rbp)
	movq	$.LC1, -128(%rbp)
	movl	$1, -120(%rbp)
	movq	$0, -112(%rbp)
	movl	$111, -104(%rbp)
	movq	$.LC4, -96(%rbp)
	movl	$0, -88(%rbp)
	movq	$0, -80(%rbp)
	movl	$118, -72(%rbp)
	movq	$0, -64(%rbp)
	movl	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movl	$0, -40(%rbp)
	movq	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	movq	-176(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, prg_name(%rip)
.L11:
	leaq	-160(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-176(%rbp), %rsi
	movl	-164(%rbp), %eax
	movl	$0, %r8d
	movl	%eax, %edi
	call	getopt_long
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	cmpl	$104, %eax
	je	.L4
	cmpl	$104, %eax
	jg	.L5
	cmpl	$-1, %eax
	je	.L13
	cmpl	$63, %eax
	je	.L7
	jmp	.L3
.L5:
	cmpl	$111, %eax
	je	.L8
	cmpl	$118, %eax
	je	.L9
	jmp	.L3
.L4:
	movq	stdout(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	usage
.L8:
	movq	optarg(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L10
.L9:
	movl	$2, -12(%rbp)
	jmp	.L10
.L7:
	movq	stderr(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	usage
.L3:
	call	abort
.L13:
	nop
.L10:
	cmpl	$-1, -16(%rbp)
	jne	.L11
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.3.1 20161221 (Red Hat 6.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
