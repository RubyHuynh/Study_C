	.file	"mkstemp.c"
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
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movabsq	$7882834469880427567, %rax
	movq	%rax, -32(%rbp)
	movabsq	$6365935209750736496, %rax
	movq	%rax, -24(%rbp)
	movb	$0, -16(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	mkstemp
	movl	%eax, fd(%rip)
	movl	fd(%rip), %eax
	leaq	-48(%rbp), %rcx
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	-48(%rbp), %rdx
	movl	fd(%rip), %eax
	movq	-40(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	unlink
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	write_tmp, .-write_tmp
	.globl	read_tmp
	.type	read_tmp, @function
read_tmp:
.LFB3:
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
	call	lseek
	movl	fd(%rip), %eax
	movq	-24(%rbp), %rcx
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movl	fd(%rip), %eax
	movq	-8(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	fd(%rip), %eax
	movl	%eax, %edi
	call	close
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
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
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	$.LC0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	write_tmp
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	read_tmp
	movq	-16(%rbp), %rax
	movl	%eax, %ecx
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	%ecx, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$9, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.3.1 20161221 (Red Hat 6.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
