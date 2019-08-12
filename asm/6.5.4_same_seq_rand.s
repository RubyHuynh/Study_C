	.file	"6.5.4_same_seq_rand.c"
	.text
	.section	.rodata
.LC0:
	.string	"6.5.4_same_seq_rand.c"
.LC1:
	.string	"min < max"
.LC2:
	.string	"/dev/random"
.LC3:
	.string	"dev_rd_fd != -1"
	.text
	.globl	random_number
	.type	random_number, @function
random_number:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-36(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L2
	leaq	__PRETTY_FUNCTION__.3540(%rip), %rcx
	movl	$15, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
.L2:
	movl	dev_rd_fd.3536(%rip), %eax
	cmpl	$-1, %eax
	jne	.L3
	movl	$0, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, dev_rd_fd.3536(%rip)
	movl	dev_rd_fd.3536(%rip), %eax
	cmpl	$-1, %eax
	jne	.L3
	leaq	__PRETTY_FUNCTION__.3540(%rip), %rcx
	movl	$18, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L3:
	leaq	-28(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	$4, -24(%rbp)
.L4:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movl	dev_rd_fd.3536(%rip), %eax
	movq	-16(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	subl	%eax, -24(%rbp)
	movl	-20(%rbp), %eax
	cltq
	addq	%rax, -16(%rbp)
	cmpl	$0, -24(%rbp)
	jg	.L4
	movl	-28(%rbp), %eax
	movl	-40(%rbp), %edx
	subl	-36(%rbp), %edx
	addl	$1, %edx
	movl	%edx, %ecx
	movl	$0, %edx
	divl	%ecx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	random_number, .-random_number
	.section	.rodata
.LC4:
	.string	"a=%d, b=%d\n"
.LC5:
	.string	"dev_rd=%d\n"
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
	subq	$16, %rsp
	call	rand@PLT
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%eax, %edx
	andl	$7, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -8(%rbp)
	call	rand@PLT
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%eax, %edx
	andl	$7, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$8, %esi
	movl	$0, %edi
	call	random_number
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.3540, @object
	.size	__PRETTY_FUNCTION__.3540, 14
__PRETTY_FUNCTION__.3540:
	.string	"random_number"
	.data
	.align 4
	.type	dev_rd_fd.3536, @object
	.size	dev_rd_fd.3536, 4
dev_rd_fd.3536:
	.long	-1
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
