	.file	"xxx_multiarr.c"
	.text
	.globl	send_idle
	.type	send_idle, @function
send_idle:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L4
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L4:
	leaq	__FUNCTION__.2903(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	send_idle, .-send_idle
	.globl	retry_idle
	.type	retry_idle, @function
retry_idle:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L8
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L8:
	leaq	__FUNCTION__.2907(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	retry_idle, .-retry_idle
	.globl	send_granted
	.type	send_granted, @function
send_granted:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L12
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L12:
	leaq	__FUNCTION__.2911(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	send_granted, .-send_granted
	.globl	send_revoke
	.type	send_revoke, @function
send_revoke:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L16
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L16:
	leaq	__FUNCTION__.2915(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	send_revoke, .-send_revoke
	.globl	do_nothing
	.type	do_nothing, @function
do_nothing:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L20
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L20:
	leaq	__FUNCTION__.2919(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	do_nothing, .-do_nothing
	.globl	recv_TM_request
	.type	recv_TM_request, @function
recv_TM_request:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L24
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L24:
	leaq	__FUNCTION__.2923(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	recv_TM_request, .-recv_TM_request
	.globl	send_TM_end_resp
	.type	send_TM_end_resp, @function
send_TM_end_resp:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L28
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L28:
	leaq	__FUNCTION__.2927(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	send_TM_end_resp, .-send_TM_end_resp
	.globl	send_TM_deny
	.type	send_TM_deny, @function
send_TM_deny:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L32
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L32:
	leaq	__FUNCTION__.2931(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	send_TM_deny, .-send_TM_deny
	.globl	send_TM_grant
	.type	send_TM_grant, @function
send_TM_grant:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L36
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L36:
	leaq	__FUNCTION__.2935(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	send_TM_grant, .-send_TM_grant
	.globl	transit_state
	.type	transit_state, @function
transit_state:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L40
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L40:
	leaq	__FUNCTION__.2939(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	transit_state, .-transit_state
	.globl	send_reject
	.type	send_reject, @function
send_reject:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L44
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L44:
	leaq	__FUNCTION__.2943(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	send_reject, .-send_reject
	.globl	state_matrix
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	state_matrix, @object
	.size	state_matrix, 6400
state_matrix:
	.long	0
	.zero	4
	.quad	do_nothing
	.zero	16
	.long	1
	.zero	4
	.quad	recv_TM_request
	.long	1
	.zero	4
	.quad	transit_state
	.long	2
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	544
	.long	1
	.zero	4
	.quad	transit_state
	.zero	16
	.long	2
	.zero	4
	.quad	transit_state
	.long	1
	.zero	4
	.quad	send_reject
	.zero	96
	.long	1
	.zero	4
	.quad	transit_state
	.long	4
	.zero	4
	.quad	transit_state
	.long	1
	.zero	4
	.quad	transit_state
	.zero	16
	.long	2
	.zero	4
	.quad	transit_state
	.long	1
	.zero	4
	.quad	send_reject
	.zero	384
	.long	2
	.zero	4
	.quad	transit_state
	.zero	16
	.long	2
	.zero	4
	.quad	transit_state
	.long	1
	.zero	4
	.quad	send_reject
	.zero	96
	.long	2
	.zero	4
	.quad	transit_state
	.long	2
	.zero	4
	.quad	do_nothing
	.zero	32
	.long	2
	.zero	4
	.quad	send_TM_grant
	.zero	16
	.long	2
	.zero	4
	.quad	transit_state
	.long	3
	.zero	4
	.quad	transit_state
	.long	2
	.zero	4
	.quad	transit_state
	.long	2
	.zero	4
	.quad	send_TM_deny
	.long	2
	.zero	4
	.quad	transit_state
	.long	3
	.zero	4
	.quad	transit_state
	.long	2
	.zero	4
	.quad	do_nothing
	.long	1
	.zero	4
	.quad	transit_state
	.long	2
	.zero	4
	.quad	do_nothing
	.zero	16
	.zero	224
	.long	3
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	288
	.long	2
	.zero	4
	.quad	transit_state
	.long	1
	.zero	4
	.quad	transit_state
	.long	4
	.zero	4
	.quad	transit_state
	.zero	16
	.long	3
	.zero	4
	.quad	do_nothing
	.zero	16
	.zero	224
	.long	0
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	608
	.zero	3200
	.text
	.globl	main
	.type	main, @function
main:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	transit_state(%rip), %rdx
	movl	$0, %edi
	movl	$0, %eax
	call	*%rdx
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__FUNCTION__.2903, @object
	.size	__FUNCTION__.2903, 10
__FUNCTION__.2903:
	.string	"send_idle"
	.align 8
	.type	__FUNCTION__.2907, @object
	.size	__FUNCTION__.2907, 11
__FUNCTION__.2907:
	.string	"retry_idle"
	.align 8
	.type	__FUNCTION__.2911, @object
	.size	__FUNCTION__.2911, 13
__FUNCTION__.2911:
	.string	"send_granted"
	.align 8
	.type	__FUNCTION__.2915, @object
	.size	__FUNCTION__.2915, 12
__FUNCTION__.2915:
	.string	"send_revoke"
	.align 8
	.type	__FUNCTION__.2919, @object
	.size	__FUNCTION__.2919, 11
__FUNCTION__.2919:
	.string	"do_nothing"
	.align 16
	.type	__FUNCTION__.2923, @object
	.size	__FUNCTION__.2923, 16
__FUNCTION__.2923:
	.string	"recv_TM_request"
	.align 16
	.type	__FUNCTION__.2927, @object
	.size	__FUNCTION__.2927, 17
__FUNCTION__.2927:
	.string	"send_TM_end_resp"
	.align 8
	.type	__FUNCTION__.2931, @object
	.size	__FUNCTION__.2931, 13
__FUNCTION__.2931:
	.string	"send_TM_deny"
	.align 8
	.type	__FUNCTION__.2935, @object
	.size	__FUNCTION__.2935, 14
__FUNCTION__.2935:
	.string	"send_TM_grant"
	.align 8
	.type	__FUNCTION__.2939, @object
	.size	__FUNCTION__.2939, 14
__FUNCTION__.2939:
	.string	"transit_state"
	.align 8
	.type	__FUNCTION__.2943, @object
	.size	__FUNCTION__.2943, 12
__FUNCTION__.2943:
	.string	"send_reject"
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
