	.file	"5.4.3_dup2.c"
	.text
	.section	.rodata
.LC0:
	.string	"sort"
.LC1:
	.string	"w"
.LC2:
	.string	"those were\n"
.LC3:
	.string	"the happy\n"
.LC4:
	.string	"moments\n"
.LC5:
	.string	"I'd ever got\n"
	.align 8
.LC6:
	.string	"Il y a tranquillement aujourd'hui...\n"
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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	pipe@PLT
	call	fork@PLT
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jne	.L2
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-16(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	dup2@PLT
	movl	$0, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	execlp@PLT
	jmp	.L3
.L2:
	movl	-16(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-12(%rbp), %eax
	leaq	.LC1(%rip), %rsi
	movl	%eax, %edi
	call	fdopen@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
	call	fwrite@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$8, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	fwrite@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$13, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	fwrite@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-28(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	waitpid@PLT
.L3:
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
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
