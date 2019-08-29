	.file	"7.5_read_self_path.c"
	.text
	.section	.rodata
.LC0:
	.string	"/proc/self/exe"
.LC1:
	.string	"dump %s\n\n\n"
.LC2:
	.string	"\tno any /\n"
.LC3:
	.string	"\tcannot readlink /\n"
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
	jmp	.L5
.L3:
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	jmp	.L5
.L2:
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
.L5:
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_exec_path, .-get_exec_path
	.section	.rodata
.LC4:
	.string	"trim = %d\n"
.LC5:
	.string	"rs = %s\n"
.LC6:
	.string	"trim2 = %d\n"
.LC7:
	.string	"rs2 = %s\n"
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
	subq	$4128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-4112(%rbp), %rax
	movl	$4096, %esi
	movq	%rax, %rdi
	call	get_exec_path
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-4112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-4116(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	get_exec_path
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-4116(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
