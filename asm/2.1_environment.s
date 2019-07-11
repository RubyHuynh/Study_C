	.file	"2.1_environment.c"
	.text
	.globl	new_key
	.section	.rodata
.LC0:
	.string	"TEMO"
	.section	.data.rel.local,"aw"
	.align 8
	.type	new_key, @object
	.size	new_key, 8
new_key:
	.quad	.LC0
	.section	.rodata
.LC1:
	.string	"Jeudi 20/06/2019 13:18"
.LC2:
	.string	"\n==========playing\n%s\n"
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
	movq	environ(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L2
.L3:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	puts@PLT
	addq	$8, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	movq	new_key(%rip), %rax
	movl	$1, %edx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	setenv@PLT
	movq	new_key(%rip), %rax
	movq	%rax, %rdi
	call	getenv@PLT
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$7, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
