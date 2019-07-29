	.file	"5.4.2_pipe.c"
	.text
	.globl	reader
	.type	reader, @function
reader:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1056, %rsp
	movq	%rdi, -1048(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	jmp	.L2
.L4:
	movq	stdout(%rip), %rdx
	leaq	-1040(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
.L2:
	movq	-1048(%rbp), %rax
	movq	%rax, %rdi
	call	feof@PLT
	testl	%eax, %eax
	jne	.L6
	movq	-1048(%rbp), %rax
	movq	%rax, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L6
	movq	-1048(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L4
.L6:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	reader, .-reader
	.section	.rodata
.LC0:
	.string	"%s-%d\n"
	.text
	.globl	writer
	.type	writer, @function
writer:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	jmp	.L8
.L9:
	movl	-12(%rbp), %ecx
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	$1, %edi
	call	sleep@PLT
	subl	$1, -12(%rbp)
.L8:
	cmpl	$0, -12(%rbp)
	jg	.L9
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	writer, .-writer
	.section	.rodata
.LC1:
	.string	"r"
.LC2:
	.string	"w"
.LC3:
	.string	"hello from parent"
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
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	pipe@PLT
	call	fork@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jne	.L11
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-16(%rbp), %eax
	leaq	.LC1(%rip), %rsi
	movl	%eax, %edi
	call	fdopen@PLT
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	reader
	movl	-16(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L12
.L11:
	movl	-16(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-12(%rbp), %eax
	leaq	.LC2(%rip), %rsi
	movl	%eax, %edi
	call	fdopen@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	$5, %esi
	leaq	.LC3(%rip), %rdi
	call	writer
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L12:
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
