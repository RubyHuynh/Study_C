	.file	"assert.c"
	.text
	.section	.rodata
.LC0:
	.string	"aaa"
.LC1:
	.string	"assert.c"
.LC2:
	.string	"j=NULL"
.LC3:
	.string	"%d "
.LC4:
	.string	"i < 3"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$10, -12(%rbp)
	movq	$0, -8(%rbp)
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movq	$0, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L3
	leaq	__PRETTY_FUNCTION__.2886(%rip), %rcx
	movl	$14, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L5:
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$2, -12(%rbp)
	jle	.L4
	leaq	__PRETTY_FUNCTION__.2886(%rip), %rcx
	movl	$24, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	__assert_fail@PLT
.L4:
	subl	$1, -12(%rbp)
.L3:
	cmpl	$0, -12(%rbp)
	jne	.L5
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.2886, @object
	.size	__PRETTY_FUNCTION__.2886, 5
__PRETTY_FUNCTION__.2886:
	.string	"main"
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
