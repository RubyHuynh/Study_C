	.file	"mkstemp.c"
	.text
	.globl	fd
	.data
	.align 4
	.type	fd, @object
	.size	fd, 4
fd:
	.long	-1
	.text
	.globl	write_tmp
	.type	write_tmp, @function
write_tmp:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$7882834469880427567, %rax
	movabsq	$6365935209750736496, %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movb	$0, -16(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	mkstemp@PLT
	movl	%eax, fd(%rip)
	movl	fd(%rip), %eax
	leaq	-48(%rbp), %rcx
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	-48(%rbp), %rdx
	movl	fd(%rip), %eax
	movq	-40(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	unlink@PLT
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
	.size	write_tmp, .-write_tmp
	.globl	read_tmp
	.type	read_tmp, @function
read_tmp:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	$0, -8(%rbp)
	movl	fd(%rip), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	movl	fd(%rip), %eax
	movq	-24(%rbp), %rcx
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movl	fd(%rip), %eax
	movq	-8(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	fd(%rip), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	read_tmp, .-read_tmp
	.section	.rodata
.LC0:
	.string	"Cette Jeudi 2019!"
.LC1:
	.string	"(%d) %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
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
	leaq	.LC0(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	write_tmp
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	read_tmp
	movq	-24(%rbp), %rax
	movl	%eax, %ecx
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	movl	%ecx, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$9, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
