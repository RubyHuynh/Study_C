	.file	"assert.c"
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
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$10, -4(%rbp)
	movq	$0, -16(%rbp)
	movl	$.LC0, %edi
	call	puts
	movq	$0, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L3
	movl	$__PRETTY_FUNCTION__.2718, %ecx
	movl	$14, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L5:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	cmpl	$2, -4(%rbp)
	jle	.L4
	movl	$__PRETTY_FUNCTION__.2718, %ecx
	movl	$24, %edx
	movl	$.LC1, %esi
	movl	$.LC4, %edi
	call	__assert_fail
.L4:
	subl	$1, -4(%rbp)
.L3:
	cmpl	$0, -4(%rbp)
	jne	.L5
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.2718, @object
	.size	__PRETTY_FUNCTION__.2718, 5
__PRETTY_FUNCTION__.2718:
	.string	"main"
	.ident	"GCC: (GNU) 6.3.1 20161221 (Red Hat 6.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
