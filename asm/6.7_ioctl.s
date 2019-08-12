	.file	"6.7_ioctl.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d.%s :%s\n"
.LC1:
	.string	"error exec ioctl\n"
.LC2:
	.string	"error opening socket\n"
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
	subq	$5168, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -5164(%rbp)
	cmpl	$0, -5164(%rbp)
	js	.L2
	movl	$4096, -5152(%rbp)
	leaq	-4112(%rbp), %rax
	movq	%rax, -5144(%rbp)
	leaq	-5152(%rbp), %rdx
	movl	-5164(%rbp), %eax
	movl	$35090, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	ioctl@PLT
	testl	%eax, %eax
	js	.L3
	movl	$0, -5168(%rbp)
	leaq	-4112(%rbp), %rax
	movq	%rax, -5160(%rbp)
	jmp	.L4
.L7:
	movq	-5160(%rbp), %rax
	movzwl	16(%rax), %eax
	movzwl	%ax, %eax
	cmpl	$2, %eax
	jne	.L12
	addl	$1, -5168(%rbp)
	movq	-5160(%rbp), %rax
	addq	$16, %rax
	leaq	4(%rax), %rsi
	movq	-5160(%rbp), %rax
	movzwl	16(%rax), %eax
	movzwl	%ax, %eax
	leaq	-5136(%rbp), %rdx
	movl	$1024, %ecx
	movl	%eax, %edi
	call	inet_ntop@PLT
	movq	%rax, %rcx
	movq	-5160(%rbp), %rdx
	movl	-5168(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L12:
	nop
.L6:
	addq	$40, -5160(%rbp)
.L4:
	movl	-5152(%rbp), %eax
	cltq
	leaq	-4112(%rbp), %rdx
	addq	%rdx, %rax
	cmpq	%rax, -5160(%rbp)
	jb	.L7
	movl	-5164(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	jmp	.L9
.L3:
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	jmp	.L9
.L2:
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
.L9:
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
