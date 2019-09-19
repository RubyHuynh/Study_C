	.file	"10.6.2_file_race.c"
	.text
	.section	.rodata
.LC0:
	.string	"/dev/random"
.LC1:
	.string	"/tmp/%u"
	.text
	.globl	secure_temp_file
	.type	secure_temp_file, @function
secure_temp_file:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$312, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	random_fd.3610(%rip), %eax
	cmpl	$-1, %eax
	jne	.L2
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, random_fd.3610(%rip)
	movl	random_fd.3610(%rip), %eax
	cmpl	$-1, %eax
	jne	.L2
	movl	$-1, %eax
	jmp	.L11
.L2:
	movl	random_fd.3610(%rip), %eax
	leaq	-312(%rbp), %rcx
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	cmpq	$4, %rax
	je	.L4
	movl	$-1, %eax
	jmp	.L11
.L4:
	movl	-312(%rbp), %edx
	leaq	-160(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-160(%rbp), %rax
	movl	$384, %edx
	movl	$194, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -308(%rbp)
	cmpl	$-1, -308(%rbp)
	jne	.L5
	movl	$-1, %eax
	jmp	.L11
.L5:
	leaq	-304(%rbp), %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	lstat@PLT
	cmpl	$-1, %eax
	jne	.L6
	movl	$-1, %eax
	jmp	.L11
.L6:
	movl	-280(%rbp), %eax
	andl	$61440, %eax
	cmpl	$32768, %eax
	je	.L7
	movl	$-1, %eax
	jmp	.L11
.L7:
	movl	-276(%rbp), %ebx
	call	geteuid@PLT
	cmpl	%eax, %ebx
	jne	.L8
	movl	-272(%rbp), %ebx
	call	getegid@PLT
	cmpl	%eax, %ebx
	je	.L9
.L8:
	movl	$-1, %eax
	jmp	.L11
.L9:
	movl	-280(%rbp), %eax
	andl	$-385, %eax
	testl	%eax, %eax
	je	.L10
	movl	$-1, %eax
	jmp	.L11
.L10:
	movl	-308(%rbp), %eax
.L11:
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	addq	$312, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	secure_temp_file, .-secure_temp_file
	.section	.rodata
.LC2:
	.string	"rs = %d\n"
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
	movl	$0, %eax
	call	secure_temp_file
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.data
	.align 4
	.type	random_fd.3610, @object
	.size	random_fd.3610, 4
random_fd.3610:
	.long	-1
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
