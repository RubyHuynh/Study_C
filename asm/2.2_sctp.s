	.file	"2.2_sctp.c"
	.text
	.comm	shm,8,8
	.globl	SCTP_PORT
	.data
	.align 4
	.type	SCTP_PORT, @object
	.size	SCTP_PORT, 4
SCTP_PORT:
	.long	63322
	.text
	.globl	mm
	.type	mm, @function
mm:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$3, -8(%rbp)
	movl	$33, -4(%rbp)
	movl	-4(%rbp), %ecx
	movl	-8(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$-1, %r8d
	movq	%rax, %rsi
	movl	$0, %edi
	call	mmap@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	mm, .-mm
	.section	.rodata
.LC0:
	.string	"buffer sent from child %d"
.LC1:
	.string	"127.0.0.1"
.LC2:
	.string	"send=%s\n"
.LC3:
	.string	"%p burn server_sock=%d\n"
	.text
	.globl	child_process
	.type	child_process, @function
child_process:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movl	%edi, -148(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$2, %edi
	call	sleep@PLT
	movl	-148(%rbp), %edx
	leaq	-112(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movl	$132, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -136(%rbp)
	movw	$2, -128(%rbp)
	leaq	.LC1(%rip), %rdi
	call	inet_addr@PLT
	movl	%eax, -124(%rbp)
	movl	SCTP_PORT(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	htons@PLT
	movw	%ax, -126(%rbp)
	leaq	-128(%rbp), %rcx
	movl	-136(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect@PLT
	movl	%eax, -132(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-112(%rbp), %rcx
	movl	-136(%rbp), %eax
	movl	$100, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	%eax, -132(%rbp)
	movl	-136(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	cmpl	$5, -148(%rbp)
	jne	.L6
	movl	$10, -140(%rbp)
	movq	shm(%rip), %rax
	movl	(%rax), %edx
	movq	shm(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	shm(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	shm(%rip), %rax
	movl	-140(%rbp), %edx
	movl	%edx, (%rax)
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
.LFE7:
	.size	child_process, .-child_process
	.section	.rodata
	.align 8
.LC4:
	.string	"failure server socker %d %s \n "
	.align 8
.LC5:
	.string	"(%p %d) server_sock =%d pid=%d\n"
	.align 8
.LC6:
	.string	"failure bind server socker %d \n "
.LC7:
	.string	"Awaiting a new connection"
.LC8:
	.string	"Cannot accept"
.LC9:
	.string	"\trecv=%s\n"
	.align 8
.LC10:
	.string	"tobe shutting down SERVER_SOCK=%d\n"
.LC11:
	.string	"failure shutting down"
.LC12:
	.string	"done, to be aborted"
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
	pushq	%rbx
	subq	$1096, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$5, -1092(%rbp)
	movl	$5, -1088(%rbp)
	movl	$0, -1096(%rbp)
	movl	$0, -1084(%rbp)
	movl	$0, -1080(%rbp)
	movl	$0, -1076(%rbp)
	movl	$4, %edi
	call	mm
	movq	%rax, shm(%rip)
	jmp	.L8
.L10:
	call	fork@PLT
	testl	%eax, %eax
	jne	.L9
	movl	-1092(%rbp), %eax
	movl	%eax, %edi
	call	child_process
	movl	$0, %edi
	call	exit@PLT
.L9:
	subl	$1, -1092(%rbp)
.L8:
	cmpl	$0, -1092(%rbp)
	jg	.L10
	movl	$132, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -1096(%rbp)
	movl	-1096(%rbp), %eax
	cmpl	$-1, %eax
	jne	.L11
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rbx
	call	__errno_location@PLT
	movl	(%rax), %eax
	movq	%rbx, %rdx
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L12
.L11:
	movq	shm(%rip), %rax
	movl	-1096(%rbp), %edx
	movl	%edx, (%rax)
	call	getpid@PLT
	movl	%eax, %esi
	movl	-1096(%rbp), %ecx
	movq	shm(%rip), %rax
	movl	(%rax), %edx
	movq	shm(%rip), %rax
	movl	%esi, %r8d
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movw	$2, -1072(%rbp)
	movl	$0, %edi
	call	htonl@PLT
	movl	%eax, -1068(%rbp)
	movl	SCTP_PORT(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	htons@PLT
	movw	%ax, -1070(%rbp)
	movl	-1096(%rbp), %eax
	leaq	-1072(%rbp), %rcx
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	movl	%eax, -1076(%rbp)
	cmpl	$-1, -1076(%rbp)
	jne	.L13
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L12
.L13:
	movl	-1096(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	listen@PLT
	movl	%eax, -1076(%rbp)
	jmp	.L14
.L17:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	-1096(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	accept@PLT
	movl	%eax, -1084(%rbp)
	cmpl	$-1, -1084(%rbp)
	jne	.L15
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	jmp	.L16
.L15:
	leaq	-1056(%rbp), %rcx
	movl	-1084(%rbp), %eax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -1080(%rbp)
	movl	-1080(%rbp), %eax
	cltq
	movb	$0, -1056(%rbp,%rax)
	leaq	-1056(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L16:
	subl	$1, -1088(%rbp)
.L14:
	cmpl	$0, -1088(%rbp)
	jg	.L17
	movq	shm(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$30, %edi
	call	sleep@PLT
	movq	shm(%rip), %rax
	movl	(%rax), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	shutdown@PLT
	movl	%eax, -1076(%rbp)
	cmpl	$-1, -1076(%rbp)
	jne	.L18
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L12
.L18:
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	movl	-1096(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	%eax, -1076(%rbp)
	movq	shm(%rip), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	munmap@PLT
	movl	$0, %eax
	jmp	.L21
.L12:
	movl	-1096(%rbp), %eax
	testl	%eax, %eax
	je	.L20
	movl	-1096(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L20:
	movq	shm(%rip), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	munmap@PLT
	movl	$99, %eax
.L21:
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	addq	$1096, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
