	.file	"5.5.5_socket_server_multi.c"
	.text
	.section	.rodata
.LC0:
	.string	"Could not create socket"
.LC1:
	.string	"Socket created"
.LC2:
	.string	"bind failed. Error"
.LC3:
	.string	"bind done"
	.align 8
.LC4:
	.string	"Waiting for incoming connections..."
.LC5:
	.string	"Connection accepted"
.LC6:
	.string	"could not create thread"
.LC7:
	.string	"Handler assigned"
.LC8:
	.string	"accept failed"
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
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -72(%rbp)
	cmpl	$-1, -72(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L2:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movw	$2, -48(%rbp)
	movl	$0, -44(%rbp)
	movl	$9999, %edi
	call	htons@PLT
	movw	%ax, -46(%rbp)
	leaq	-48(%rbp), %rcx
	movl	-72(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	testl	%eax, %eax
	jns	.L3
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L9
.L3:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	-72(%rbp), %eax
	movl	$3, %esi
	movl	%eax, %edi
	call	listen@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$16, -76(%rbp)
	jmp	.L5
.L7:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	-68(%rbp), %edx
	movl	%edx, (%rax)
	movq	-56(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	leaq	connection_handler(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	jns	.L6
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L9
.L6:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
.L5:
	leaq	-76(%rbp), %rdx
	leaq	-32(%rbp), %rcx
	movl	-72(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept@PLT
	movl	%eax, -68(%rbp)
	cmpl	$0, -68(%rbp)
	jne	.L7
	cmpl	$0, -68(%rbp)
	jns	.L8
	leaq	.LC8(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L9
.L8:
	movl	$0, %eax
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
	.section	.rodata
	.align 8
.LC9:
	.string	"Greetings! I am your connection handler\n"
	.align 8
.LC10:
	.string	"Now type something and i shall repeat what you type \n"
.LC11:
	.string	"Client disconnected"
.LC12:
	.string	"recv failed"
	.text
	.globl	connection_handler
	.type	connection_handler, @function
connection_handler:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2048, %rsp
	movq	%rdi, -2040(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-2040(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -2032(%rbp)
	leaq	.LC9(%rip), %rax
	movq	%rax, -2024(%rbp)
	movq	-2024(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-2024(%rbp), %rcx
	movl	-2032(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, -2024(%rbp)
	movq	-2024(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-2024(%rbp), %rcx
	movl	-2032(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	jmp	.L12
.L13:
	leaq	-2016(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-2016(%rbp), %rcx
	movl	-2032(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
.L12:
	leaq	-2016(%rbp), %rsi
	movl	-2032(%rbp), %eax
	movl	$0, %ecx
	movl	$2000, %edx
	movl	%eax, %edi
	call	recv@PLT
	movl	%eax, -2028(%rbp)
	cmpl	$0, -2028(%rbp)
	jg	.L13
	cmpl	$0, -2028(%rbp)
	jne	.L14
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	jmp	.L15
.L14:
	cmpl	$-1, -2028(%rbp)
	jne	.L15
	leaq	.LC12(%rip), %rdi
	call	perror@PLT
.L15:
	movq	-2040(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	connection_handler, .-connection_handler
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
