	.file	"7.5_read_self_path.c"
	.text
	.section	.rodata
.LC0:
	.string	"/proc/self/exe"
.LC1:
	.string	"dump %s\n\n\n"
.LC2:
	.string	"\tno any /\n"
	.text
	.globl	get_exec_path
	.type	get_exec_path, @function
get_exec_path:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -16(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	call	readlink@PLT
	testq	%rax, %rax
	jle	.L2
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strrchr@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L3
	addq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	subq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L2
.L3:
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
.L2:
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_exec_path, .-get_exec_path
	.section	.rodata
.LC3:
	.string	"trim = %d\n"
.LC4:
	.string	"rs = %s\n"
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
	subq	$4112, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-4112(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	get_exec_path
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-4112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
