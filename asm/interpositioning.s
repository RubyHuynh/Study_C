	.file	"interpositioning.c"
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
.LFB2:
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
	call	malloc
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	mymalloc, .-mymalloc
	.section	.rodata
.LC0:
	.string	"%p total=%d\n"
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
	subq	$16, %rsp
	movl	$19, %edi
	call	mymalloc
	movq	%rax, -16(%rbp)
	movl	$19, %edi
	call	mymalloc
	movq	%rax, -8(%rbp)
	movl	total_mem(%rip), %edx
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
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
