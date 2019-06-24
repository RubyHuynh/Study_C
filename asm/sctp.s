	.file	"sctp.c"
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
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$3, -4(%rbp)
	movl	$33, -8(%rbp)
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$-1, %r8d
	movq	%rax, %rsi
	movl	$0, %edi
	call	mmap
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
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
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movl	%edi, -148(%rbp)
	movl	$2, %edi
	call	sleep
	movl	-148(%rbp), %edx
	leaq	-112(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	movl	$132, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket
	movl	%eax, -4(%rbp)
	movw	$2, -128(%rbp)
	movl	$.LC1, %edi
	call	inet_addr
	movl	%eax, -124(%rbp)
	movl	SCTP_PORT(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	htons
	movw	%ax, -126(%rbp)
	leaq	-128(%rbp), %rcx
	movl	-4(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect
	movl	%eax, -8(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	leaq	-112(%rbp), %rcx
	movl	-4(%rbp), %eax
	movl	$100, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close
	cmpl	$5, -148(%rbp)
	jne	.L5
	movl	$10, -132(%rbp)
	movq	shm(%rip), %rax
	movl	(%rax), %edx
	movq	shm(%rip), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	shm(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	close
	movq	shm(%rip), %rax
	movl	-132(%rbp), %edx
	movl	%edx, (%rax)
.L5:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	child_process, .-child_process
	.section	.rodata
.LC4:
	.string	"failure server socker %d \n "
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
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1088, %rsp
	movl	$5, -4(%rbp)
	movl	$5, -8(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$4, %edi
	call	mm
	movq	%rax, shm(%rip)
	jmp	.L7
.L9:
	call	fork
	testl	%eax, %eax
	jne	.L8
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	child_process
	movl	$0, %edi
	call	exit
.L8:
	subl	$1, -4(%rbp)
.L7:
	cmpl	$0, -4(%rbp)
	jg	.L9
	movl	$132, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	cmpl	$-1, %eax
	jne	.L10
	call	__errno_location
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	jmp	.L11
.L10:
	movq	shm(%rip), %rax
	movl	-24(%rbp), %edx
	movl	%edx, (%rax)
	call	getpid
	movl	%eax, %esi
	movl	-24(%rbp), %ecx
	movq	shm(%rip), %rax
	movl	(%rax), %edx
	movq	shm(%rip), %rax
	movl	%esi, %r8d
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movw	$2, -48(%rbp)
	movl	$0, %edi
	call	htonl
	movl	%eax, -44(%rbp)
	movl	SCTP_PORT(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	htons
	movw	%ax, -46(%rbp)
	movl	-24(%rbp), %eax
	leaq	-48(%rbp), %rcx
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L12
	call	__errno_location
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	jmp	.L11
.L12:
	movl	-24(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	listen
	movl	%eax, -20(%rbp)
	jmp	.L13
.L16:
	movl	$.LC7, %edi
	call	puts
	movl	-24(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	accept
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L14
	movl	$.LC8, %edi
	call	puts
	jmp	.L15
.L14:
	leaq	-1088(%rbp), %rcx
	movl	-12(%rbp), %eax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	cltq
	movb	$0, -1088(%rbp,%rax)
	leaq	-1088(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
.L15:
	subl	$1, -8(%rbp)
.L13:
	cmpl	$0, -8(%rbp)
	jg	.L16
	movq	shm(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	printf
	movl	$30, %edi
	call	sleep
	movq	shm(%rip), %rax
	movl	(%rax), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	shutdown
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L17
	movl	$.LC11, %edi
	call	puts
	jmp	.L11
.L17:
	movl	$.LC12, %edi
	call	puts
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	close
	movl	%eax, -20(%rbp)
	movq	shm(%rip), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	munmap
	movl	$0, %eax
	jmp	.L20
.L11:
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	je	.L19
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	close
.L19:
	movq	shm(%rip), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	munmap
	movl	$99, %eax
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.3.1 20161221 (Red Hat 6.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
