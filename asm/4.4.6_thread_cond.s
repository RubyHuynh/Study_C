	.file	"4.4.6_thread_cond.c"
	.text
	.globl	cond1
	.bss
	.align 32
	.type	cond1, @object
	.size	cond1, 48
cond1:
	.zero	48
	.globl	lock
	.align 32
	.type	lock, @object
	.size	lock, 40
lock:
	.zero	40
	.globl	done
	.data
	.align 4
	.type	done, @object
	.size	done, 4
done:
	.long	1
	.section	.rodata
.LC0:
	.string	"beginning thread %d\n"
	.align 8
.LC1:
	.string	"Waiting on condition variable cond1"
	.align 8
.LC2:
	.string	"Signaling condition variable cond1"
.LC3:
	.string	"Returning thread %d\n"
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
.L5:
	call	pthread_self@PLT
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	lock(%rip), %rdi
	call	pthread_mutex_lock@PLT
	movl	done(%rip), %eax
	cmpl	$1, %eax
	jne	.L2
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	leaq	lock(%rip), %rsi
	leaq	cond1(%rip), %rdi
	call	pthread_cond_wait@PLT
	jmp	.L6
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	lock(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	movl	$0, %eax
	jmp	.L7
.L6:
	leaq	lock(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	call	pthread_self@PLT
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L5
.L7:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	foo, .-foo
	.section	.rodata
.LC4:
	.string	"set by main thread /n"
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
	movl	$0, -68(%rbp)
	jmp	.L9
.L10:
	leaq	-64(%rbp), %rax
	movl	-68(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movl	$0, %ecx
	leaq	foo(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
.L9:
	movl	-68(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -68(%rbp)
	cmpl	$4, %eax
	jle	.L10
	movl	$1, %edi
	call	sleep@PLT
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$2, done(%rip)
	leaq	cond1(%rip), %rdi
	call	pthread_cond_broadcast@PLT
	movl	$0, -68(%rbp)
	jmp	.L11
.L12:
	movl	-68(%rbp), %eax
	cltq
	movq	-64(%rbp,%rax,8), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
.L11:
	movl	-68(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -68(%rbp)
	cmpl	$4, %eax
	jle	.L12
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
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
