	.file	"interpositioning.c"
	.text
	.globl	total_mem
	.bss
	.align 4
	.type	total_mem, @object
	.size	total_mem, 4
total_mem:
	.zero	4
	.text
	.globl	mymalloc
	.type	mymalloc, @function
mymalloc:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	total_mem(%rip), %eax
	addl	$1, %eax
	movl	%eax, total_mem(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	mymalloc, .-mymalloc
	.section	.rodata
.LC0:
	.string	"%p total=%d\n"
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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$19, %edi
	call	mymalloc
	movq	%rax, -24(%rbp)
	movl	$19, %edi
	call	mymalloc
	movq	%rax, -16(%rbp)
	movl	total_mem(%rip), %edx
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
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
