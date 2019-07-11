	.file	"4.4.4_mutex_nonblocking_test.c"
	.text
	.globl	_shared_var
	.bss
	.align 8
	.type	_shared_var, @object
	.size	_shared_var, 8
_shared_var:
	.zero	8
	.globl	mutex
	.align 32
	.type	mutex, @object
	.size	mutex, 40
mutex:
	.zero	40
	.section	.rodata
.LC0:
	.string	"errno=%d"
	.align 8
.LC1:
	.string	"\t begin thread=%d _shared_var=%.1lf\n"
	.align 8
.LC2:
	.string	"\t\t end thread=%d _shared_var=%.1lf\n"
	.align 8
.LC3:
	.string	"\t errno thread=%d errno=%d(%s) ret=%d(%s)\n"
.LC4:
	.string	"\t\t end thread"
	.align 8
.LC5:
	.string	"\t errno cannot lock thread=%d\n"
	.text
	.globl	thread_func
	.type	thread_func, @function
thread_func:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movl	$0, -36(%rbp)
	leaq	mutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jne	.L2
	leaq	mutex(%rip), %rdi
	call	pthread_mutex_trylock@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jne	.L3
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movsd	_shared_var(%rip), %xmm2
	movsd	%xmm2, -56(%rbp)
	call	pthread_self@PLT
	movsd	-56(%rbp), %xmm0
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	call	pthread_self@PLT
	cvtsi2sd	%eax, %xmm1
	movsd	_shared_var(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, _shared_var(%rip)
	movsd	_shared_var(%rip), %xmm3
	movsd	%xmm3, -56(%rbp)
	call	pthread_self@PLT
	movsd	-56(%rbp), %xmm0
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	leaq	mutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L4
.L3:
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %r13
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %r12
	call	__errno_location@PLT
	movl	(%rax), %ebx
	call	pthread_self@PLT
	movl	%eax, %esi
	movl	-36(%rbp), %eax
	movq	%r13, %r9
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%ebx, %edx
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L4:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	leaq	mutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L5
.L2:
	call	pthread_self@PLT
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L5:
	movl	$0, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	thread_func, .-thread_func
	.section	.rodata
	.align 8
.LC6:
	.string	"BEGIN main thread=%d _shared_var=%.1lf\n"
	.align 8
.LC7:
	.string	"END main thread=%d _shared_var=%.1lf\n"
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
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -56(%rbp)
	leaq	-52(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	pthread_mutexattr_settype@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, %rsi
	leaq	mutex(%rip), %rdi
	call	pthread_mutex_init@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_mutexattr_destroy@PLT
	movsd	_shared_var(%rip), %xmm1
	movsd	%xmm1, -72(%rbp)
	call	pthread_self@PLT
	movsd	-72(%rbp), %xmm0
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L8
.L9:
	movl	-56(%rbp), %eax
	leal	-1(%rax), %edx
	leaq	-48(%rbp), %rax
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movl	$0, %ecx
	leaq	thread_func(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
.L8:
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -56(%rbp)
	cmpl	$4, %eax
	jle	.L9
	movl	$0, -56(%rbp)
	jmp	.L10
.L11:
	movl	-56(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	-48(%rbp,%rax,8), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
.L10:
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -56(%rbp)
	cmpl	$4, %eax
	jle	.L11
	movsd	_shared_var(%rip), %xmm2
	movsd	%xmm2, -72(%rbp)
	call	pthread_self@PLT
	movsd	-72(%rbp), %xmm0
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
