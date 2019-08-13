	.file	"7.3_read_proc.c"
	.text
	.section	.rodata
.LC0:
	.string	"/proc/%d/%s"
.LC1:
	.string	"getting %s...\n"
.LC2:
	.string	"\t%s\n"
.LC3:
	.string	"error open()"
	.text
	.globl	read_proc_info
	.type	read_proc_info, @function
read_proc_info:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$5168, %rsp
	movl	%edi, -5156(%rbp)
	movq	%rsi, -5168(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-5168(%rbp), %rcx
	movl	-5156(%rbp), %edx
	leaq	-5136(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-5136(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-5136(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -5152(%rbp)
	cmpl	$-1, -5152(%rbp)
	je	.L2
	movq	$0, -5144(%rbp)
	leaq	-4112(%rbp), %rcx
	movl	-5152(%rbp), %eax
	movl	$4096, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -5148(%rbp)
	movl	-5152(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	-5148(%rbp), %eax
	cltq
	movb	$0, -4112(%rbp,%rax)
	leaq	-4112(%rbp), %rax
	movq	%rax, -5144(%rbp)
	jmp	.L3
.L4:
	movq	-5144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-5144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	addq	%rax, -5144(%rbp)
.L3:
	movl	-5148(%rbp), %eax
	cltq
	leaq	-4112(%rbp), %rdx
	addq	%rdx, %rax
	cmpq	%rax, -5144(%rbp)
	jb	.L4
	jmp	.L7
.L2:
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
.L7:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	read_proc_info, .-read_proc_info
	.section	.rodata
.LC4:
	.string	"===========argv[1] is a pid"
.LC5:
	.string	"ls -p /proc/ | grep [0-9]/"
.LC6:
	.string	"===========argv[2] as below:"
.LC7:
	.string	"ls -p /proc/1/ | grep -v /"
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
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-20(%rbp), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	je	.L9
	cmpl	$2, %eax
	je	.L10
	testl	%eax, %eax
	jmp	.L13
.L9:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rdi
	call	system@PLT
	movl	$0, %edi
	call	exit@PLT
.L10:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rdi
	call	system@PLT
	movl	$0, %edi
	call	exit@PLT
.L13:
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -4(%rbp)
	movq	-32(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	read_proc_info
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
