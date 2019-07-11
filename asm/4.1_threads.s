	.file	"4.1_threads.c"
	.text
	.globl	shared_var
	.bss
	.align 4
	.type	shared_var, @object
	.size	shared_var, 4
shared_var:
	.zero	4
	.globl	not_shared_var
	.section	.tbss,"awT",@nobits
	.align 4
	.type	not_shared_var, @object
	.size	not_shared_var, 4
not_shared_var:
	.zero	4
	.section	.rodata
.LC0:
	.string	"\tthread %d %d\n"
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
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	pthread_setcancelstate@PLT
	call	getpid@PLT
	movl	%eax, %ebx
	call	pthread_self@PLT
	addl	%ebx, %eax
	movl	%eax, %fs:not_shared_var@tpoff
	movl	shared_var(%rip), %eax
	addl	$1, %eax
	movl	%eax, shared_var(%rip)
	movl	%fs:not_shared_var@tpoff, %ebx
	call	pthread_self@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-28(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	pthread_setcancelstate@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	thread_func, .-thread_func
	.section	.rodata
	.align 8
.LC1:
	.string	"shared_var=%d not_shared_var=%d\n\n"
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
	movl	$0, -76(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_attr_init@PLT
	leaq	-64(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	pthread_attr_setdetachstate@PLT
	jmp	.L5
.L6:
	leaq	-76(%rbp), %rdx
	leaq	-64(%rbp), %rsi
	leaq	-72(%rbp), %rax
	movq	%rdx, %rcx
	leaq	thread_func(%rip), %rdx
	movq	%rax, %rdi
	call	pthread_create@PLT
.L5:
	movl	-76(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -76(%rbp)
	cmpl	$4, %eax
	jle	.L6
	movl	$5, %edi
	call	sleep@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_attr_destroy@PLT
	movl	%fs:not_shared_var@tpoff, %edx
	movl	shared_var(%rip), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
