	.file	"5.5.5_socket_client_multi.c"
	.text
	.section	.rodata
.LC0:
	.string	"Could not create socket"
.LC1:
	.string	"Socket created"
.LC2:
	.string	"127.0.0.1"
.LC3:
	.string	"connect failed. Error"
.LC4:
	.string	"Connected\n"
.LC5:
	.string	"Enter message : "
.LC6:
	.string	"%s"
.LC7:
	.string	"Send failed"
.LC8:
	.string	"recv failed"
.LC9:
	.string	"Server reply :"
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
	subq	$3072, %rsp
	movl	%edi, -3060(%rbp)
	movq	%rsi, -3072(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -3044(%rbp)
	cmpl	$-1, -3044(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rdi
	call	inet_addr@PLT
	movl	%eax, -3036(%rbp)
	movw	$2, -3040(%rbp)
	movl	$8888, %edi
	call	htons@PLT
	movw	%ax, -3038(%rbp)
	leaq	-3040(%rbp), %rcx
	movl	-3044(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	testl	%eax, %eax
	jns	.L3
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L9
.L3:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
.L8:
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-3024(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-3024(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-3024(%rbp), %rsi
	movl	-3044(%rbp), %eax
	movl	$0, %ecx
	movl	%eax, %edi
	call	send@PLT
	testq	%rax, %rax
	jns	.L5
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L9
.L5:
	leaq	-2016(%rbp), %rsi
	movl	-3044(%rbp), %eax
	movl	$0, %ecx
	movl	$2000, %edx
	movl	%eax, %edi
	call	recv@PLT
	testq	%rax, %rax
	jns	.L6
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	nop
	movl	-3044(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
	jmp	.L9
.L6:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	-2016(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L8
.L9:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
