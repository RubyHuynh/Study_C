	.file	"4.4.2_mutex.c"
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
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	leaq	mutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L2
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movsd	_shared_var(%rip), %xmm2
	movsd	%xmm2, -24(%rbp)
	call	pthread_self@PLT
	movsd	-24(%rbp), %xmm0
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
	movsd	%xmm3, -24(%rbp)
	call	pthread_self@PLT
	movsd	-24(%rbp), %xmm0
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	leaq	mutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L3
.L2:
	call	pthread_self@PLT
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	thread_func, .-thread_func
	.section	.rodata
	.align 8
.LC4:
	.string	"BEGIN main thread=%d _shared_var=%.1lf\n"
	.align 8
.LC5:
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
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L6
.L7:
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
.L6:
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -56(%rbp)
	cmpl	$4, %eax
	jle	.L7
	movl	$0, -56(%rbp)
	jmp	.L8
.L9:
	movl	-56(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	-48(%rbp,%rax,8), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
.L8:
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -56(%rbp)
	cmpl	$4, %eax
	jle	.L9
	movsd	_shared_var(%rip), %xmm2
	movsd	%xmm2, -72(%rbp)
	call	pthread_self@PLT
	movsd	-72(%rbp), %xmm0
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
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
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
