	.file	"xxx_mc24581.c"
	.text
	.globl	configuration
	.bss
	.type	configuration, @object
	.size	configuration, 2
configuration:
	.zero	2
	.globl	all_sessions
	.align 32
	.type	all_sessions, @object
	.size	all_sessions, 80
all_sessions:
	.zero	80
	.globl	nb_session
	.align 4
	.type	nb_session, @object
	.size	nb_session, 4
nb_session:
	.zero	4
	.globl	nb_allocated
	.align 4
	.type	nb_allocated, @object
	.size	nb_allocated, 4
nb_allocated:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%s error \n"
	.text
	.type	err, @function
err:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	__FUNCTION__.4232(%rip), %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	err, .-err
	.section	.rodata
.LC1:
	.string	"\t\t\talloc = %d\n"
	.text
	.globl	my_alloc
	.type	my_alloc, @function
my_alloc:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L3
	movl	$0, %eax
	call	err
.L3:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	nb_allocated(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, nb_allocated(%rip)
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	my_alloc, .-my_alloc
	.section	.rodata
.LC2:
	.string	"\t\t\tfree, alloc = %d\n"
	.text
	.globl	my_free
	.type	my_free, @function
my_free:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	nb_allocated(%rip), %eax
	subl	$1, %eax
	movl	%eax, nb_allocated(%rip)
	movl	nb_allocated(%rip), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	my_free, .-my_free
	.section	.rodata
	.align 8
.LC3:
	.string	"Forward RTP to reception/client"
	.text
	.globl	fwd_rtp
	.type	fwd_rtp, @function
fwd_rtp:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	fwd_rtp, .-fwd_rtp
	.section	.rodata
	.align 8
.LC4:
	.string	"Stop forward RTP to reception/client"
	.text
	.globl	stop_fwd_rtp
	.type	stop_fwd_rtp, @function
stop_fwd_rtp:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	stop_fwd_rtp, .-stop_fwd_rtp
	.section	.rodata
	.align 8
.LC5:
	.string	"send TM Reject to: %d with cause: %d \n"
	.text
	.globl	send_TM_reject
	.type	send_TM_reject, @function
send_TM_reject:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	send_TM_reject, .-send_TM_reject
	.section	.rodata
.LC6:
	.string	"recv TM request from %d \n"
.LC7:
	.string	"saving participant SSRC %s\n"
	.text
	.globl	recv_TM_request
	.type	recv_TM_request, @function
recv_TM_request:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpq	$0, -24(%rbp)
	je	.L12
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$10, %rdx
	movq	8(%rax,%rdx,8), %rax
	testq	%rax, %rax
	je	.L12
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$10, %rdx
	movq	8(%rax,%rdx,8), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L11
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$10, %rdx
	movq	8(%rax,%rdx,8), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L11:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$10, %rdx
	movq	8(%rax,%rdx,8), %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, (%rbx)
	movq	-24(%rbp), %rax
	movl	$5, %edx
	movl	$2, %esi
	movq	%rax, %rdi
	call	change_state
.L12:
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	recv_TM_request, .-recv_TM_request
	.section	.rodata
.LC8:
	.string	"recv TM End request "
.LC9:
	.string	"Cancel T4"
	.text
	.globl	recv_TM_end_request
	.type	recv_TM_end_request, @function
recv_TM_end_request:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	leal	-1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 4(%rax)
	movl	$0, %eax
	call	stop_fwd_rtp
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	pthread_cancel@PLT
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jne	.L15
	movq	-8(%rbp), %rax
	movl	$5, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	change_state
.L15:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	recv_TM_end_request, .-recv_TM_end_request
	.section	.rodata
.LC10:
	.string	"send TM Idle to all "
	.text
	.globl	send_TM_idle
	.type	send_TM_idle, @function
send_TM_idle:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	send_TM_idle, .-send_TM_idle
	.section	.rodata
	.align 8
.LC11:
	.string	"send TM Granted to 1 participant "
	.text
	.globl	send_TM_grant
	.type	send_TM_grant, @function
send_TM_grant:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	send_TM_grant, .-send_TM_grant
	.section	.rodata
	.align 8
.LC12:
	.string	"send TM Revoke to 1 participant "
	.text
	.globl	send_TM_revoke
	.type	send_TM_revoke, @function
send_TM_revoke:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	send_TM_revoke, .-send_TM_revoke
	.section	.rodata
	.align 8
.LC13:
	.string	"send TM Queue Position Info to 1 participant "
	.text
	.globl	send_TM_queue_position_info
	.type	send_TM_queue_position_info, @function
send_TM_queue_position_info:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	send_TM_queue_position_info, .-send_TM_queue_position_info
	.section	.rodata
	.align 8
.LC14:
	.string	"send Media transmission Notification to RECEPTION!!! "
	.text
	.globl	send_TM_media_notify
	.type	send_TM_media_notify, @function
send_TM_media_notify:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	send_TM_media_notify, .-send_TM_media_notify
	.section	.rodata
.LC15:
	.string	"\t\t\t\tStart T1: Inactivity "
	.align 8
.LC16:
	.string	"\t\t\t\tExpire T1: Inactivity, restarting "
	.text
	.globl	handle_T1
	.type	handle_T1, @function
handle_T1:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movl	$30, %edi
	call	sleep@PLT
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	handle_T1
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	handle_T1, .-handle_T1
	.section	.rodata
.LC17:
	.string	"\t\t\t\tStart T2: Transmit Idle "
	.align 8
.LC18:
	.string	"\t\t\t\tExpire T2: Transmit Idle, restarting "
	.text
	.globl	handle_T2
	.type	handle_T2, @function
handle_T2:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	movl	$5, %edi
	call	sleep@PLT
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %ecx
	movq	-8(%rbp), %rdx
	movl	%ecx, 8(%rdx)
	cmpl	$9, %eax
	jg	.L24
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	call	send_TM_idle
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	handle_T2
.L24:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	handle_T2, .-handle_T2
	.section	.rodata
	.align 8
.LC19:
	.string	"\t\t\t\tStart T4: Transmit Granted "
	.align 8
.LC20:
	.string	"\t\t\t\tExpire T4: Transmit Granted, restarting "
	.text
	.globl	handle_T4
	.type	handle_T4, @function
handle_T4:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	movl	$10, %edi
	call	sleep@PLT
	movq	-8(%rbp), %rax
	movl	12(%rax), %eax
	leal	1(%rax), %ecx
	movq	-8(%rbp), %rdx
	movl	%ecx, 12(%rdx)
	cmpl	$9, %eax
	jg	.L27
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	call	send_TM_grant
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	handle_T4
.L27:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	handle_T4, .-handle_T4
	.section	.rodata
.LC21:
	.string	"pop TM queue "
	.text
	.globl	pop_TM_queue
	.type	pop_TM_queue, @function
pop_TM_queue:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	pop_TM_queue, .-pop_TM_queue
	.section	.rodata
.LC22:
	.string	"push TM queue "
	.text
	.globl	push_TM_queue
	.type	push_TM_queue, @function
push_TM_queue:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	$0, -28(%rbp)
	movq	-40(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	leaq	.LC22(%rip), %rdi
	call	puts@PLT
	jmp	.L31
.L32:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L31:
	cmpq	$0, -24(%rbp)
	jne	.L32
	movl	$16, %edi
	call	my_alloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L33
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L35
.L33:
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 112(%rax)
.L35:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	push_TM_queue, .-push_TM_queue
	.section	.rodata
.LC23:
	.string	"to revoke if possible"
.LC24:
	.string	"auto_generated_ssrc"
	.text
	.globl	check_implicit_invite
	.type	check_implicit_invite, @function
check_implicit_invite:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$9, %eax
	jg	.L37
	movq	-40(%rbp), %rax
	leaq	.LC24(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	recv_TM_request
	jmp	.L43
.L37:
	movq	-40(%rbp), %rax
	movl	64(%rax), %eax
	testl	%eax, %eax
	je	.L42
	cmpl	$2, %eax
	je	.L40
	jmp	.L38
.L40:
	movq	-40(%rbp), %rax
	movq	96(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	104(%rax), %rax
	movq	%rax, -16(%rbp)
	movl	$8, %edi
	call	my_alloc
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	my_free
	movq	-40(%rbp), %rax
	movl	$5, %edx
	movl	$3, %esi
	movq	%rax, %rdi
	call	change_state
	jmp	.L38
.L42:
	nop
.L38:
.L43:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	check_implicit_invite, .-check_implicit_invite
	.section	.rodata
	.align 8
.LC25:
	.string	"originating call, MCVideoServer to initialise calls to invited participants.. "
.LC26:
	.string	"session=%d is allocated\n"
	.align 8
.LC27:
	.string	"implicit invite on existing session %d"
.LC28:
	.string	"... "
	.text
	.globl	recv_invite
	.type	recv_invite, @function
recv_invite:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L45
	movl	$0, %eax
	call	err
.L45:
	movq	-24(%rbp), %rax
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L46
	leaq	.LC25(%rip), %rdi
	call	puts@PLT
	movzbl	configuration(%rip), %eax
	testb	%al, %al
	jne	.L52
	movq	$0, -8(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L48
	movl	$120, %edi
	call	my_alloc
	movq	%rax, -8(%rbp)
	movl	nb_session(%rip), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movl	$32, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 88(%rax)
	movl	$32, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 96(%rax)
	movl	$32, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 104(%rax)
	movq	-8(%rbp), %rax
	leaq	change_state(%rip), %rdx
	movq	%rdx, 80(%rax)
	movl	nb_session(%rip), %eax
	movl	%eax, %esi
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	nb_session(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, nb_session(%rip)
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	all_sessions(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rcx,%rdx)
	jmp	.L49
.L48:
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %esi
	leaq	.LC27(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
.L49:
	movq	-24(%rbp), %rax
	movzbl	3(%rax), %eax
	testb	%al, %al
	je	.L52
	cmpq	$0, -8(%rbp)
	je	.L52
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	check_implicit_invite
	jmp	.L52
.L46:
	leaq	.LC28(%rip), %rdi
	call	puts@PLT
	nop
.L52:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	recv_invite, .-recv_invite
	.section	.rodata
	.align 8
.LC29:
	.string	"200 on originating, to generate basic state machine "
.LC30:
	.string	"..."
	.text
	.globl	recv_200
	.type	recv_200, @function
recv_200:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movq	$0, -16(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L54
	movl	$0, %eax
	call	err
.L54:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L55
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	movq	-16(%rbp), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	addq	$10, %rdx
	movq	8(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L56
	movl	$16, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
.L56:
	movq	-16(%rbp), %rax
	movq	80(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	$0, %edx
	movl	$1, %esi
	movq	%rcx, %rdi
	call	*%rax
	jmp	.L53
.L55:
	leaq	.LC30(%rip), %rdi
	call	puts@PLT
	nop
.L53:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	recv_200, .-recv_200
	.globl	recv_rtp
	.type	recv_rtp, @function
recv_rtp:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$2, %eax
	jne	.L62
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	pthread_cancel@PLT
	jmp	.L61
.L62:
	nop
.L61:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	recv_rtp, .-recv_rtp
	.section	.rodata
.LC31:
	.string	"G_START_STOP"
.LC32:
	.string	"G_IDLE"
.LC33:
	.string	"G_TAKEN"
.LC34:
	.string	"G_PENDING_REVOKE"
.LC35:
	.string	"G_RELEASING"
.LC36:
	.string	"aaa"
	.text
	.globl	dump_state
	.type	dump_state, @function
dump_state:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$5, -4(%rbp)
	je	.L64
	cmpl	$4, -4(%rbp)
	ja	.L73
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L67(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L67(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L67:
	.long	.L71-.L67
	.long	.L70-.L67
	.long	.L69-.L67
	.long	.L68-.L67
	.long	.L66-.L67
	.text
.L71:
	leaq	.LC31(%rip), %rax
	jmp	.L72
.L70:
	leaq	.LC32(%rip), %rax
	jmp	.L72
.L69:
	leaq	.LC33(%rip), %rax
	jmp	.L72
.L68:
	leaq	.LC34(%rip), %rax
	jmp	.L72
.L66:
	leaq	.LC35(%rip), %rax
	jmp	.L72
.L73:
	nop
.L64:
	leaq	.LC36(%rip), %rax
.L72:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	dump_state, .-dump_state
	.section	.rodata
.LC37:
	.string	"implicit_ssrc_where"
.LC38:
	.string	"cancel T1 & T2"
	.align 8
.LC39:
	.string	"G_state changes from %s to %s\n"
.LC40:
	.string	"G_state remains at %s\n"
	.text
	.globl	change_state
	.type	change_state, @function
change_state:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -104(%rbp)
	movl	%esi, -108(%rbp)
	movl	%edx, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-104(%rbp), %rax
	movq	%rax, -88(%rbp)
	cmpl	$5, -108(%rbp)
	je	.L75
	cmpl	$2, -108(%rbp)
	je	.L76
	cmpl	$3, -108(%rbp)
	je	.L77
	cmpl	$1, -108(%rbp)
	jne	.L91
	movq	-88(%rbp), %rax
	movq	16(%rax), %rax
	movzbl	2(%rax), %eax
	testb	%al, %al
	je	.L79
	movq	-88(%rbp), %rax
	movl	$5, %edx
	movl	$2, %esi
	movq	%rax, %rdi
	call	change_state
	jmp	.L80
.L79:
	movzbl	1+configuration(%rip), %eax
	testb	%al, %al
	je	.L81
	movq	-88(%rbp), %rax
	leaq	.LC37(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	recv_TM_request
	jmp	.L84
.L81:
	movq	-88(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	je	.L83
	movl	$0, %eax
	call	pop_TM_queue
	movq	-88(%rbp), %rax
	movl	$5, %edx
	movl	$2, %esi
	movq	%rax, %rdi
	call	change_state
	jmp	.L80
.L83:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_attr_init@PLT
	movq	-88(%rbp), %rax
	leaq	32(%rax), %rdi
	movq	-88(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rcx
	leaq	handle_T1(%rip), %rdx
	movq	%rax, %rsi
	call	pthread_create@PLT
	movq	-88(%rbp), %rax
	leaq	40(%rax), %rdi
	movq	-88(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rcx
	leaq	handle_T2(%rip), %rdx
	movq	%rax, %rsi
	call	pthread_create@PLT
	movl	$0, %eax
	call	send_TM_idle
	movq	-88(%rbp), %rax
	movl	$0, 4(%rax)
	jmp	.L84
.L76:
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_attr_init@PLT
	movq	-88(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$1, %eax
	jne	.L85
	leaq	.LC38(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-88(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	pthread_cancel@PLT
	movq	-88(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rdi
	call	pthread_cancel@PLT
.L85:
	movq	-88(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	-88(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-88(%rbp), %rax
	leaq	56(%rax), %rdi
	movq	-88(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rcx
	leaq	handle_T4(%rip), %rdx
	movq	%rax, %rsi
	call	pthread_create@PLT
	movl	$0, %eax
	call	send_TM_grant
	movl	$0, %eax
	call	send_TM_media_notify
	movq	-88(%rbp), %rax
	movq	72(%rax), %rax
	testq	%rax, %rax
	jne	.L92
	movl	$4, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, 72(%rax)
	jmp	.L92
.L77:
	movq	-88(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$2, %eax
	jne	.L87
	movq	-88(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, %rdi
	call	pthread_cancel@PLT
.L87:
	movl	$0, %eax
	call	send_TM_revoke
	movl	$0, %eax
	call	send_TM_queue_position_info
	jmp	.L84
.L91:
	nop
	jmp	.L84
.L92:
	nop
.L84:
	movq	-88(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	%eax, -108(%rbp)
	je	.L88
	movl	-108(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	dump_state
	movq	%rax, %rbx
	movq	-88(%rbp), %rax
	movl	64(%rax), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	dump_state
	movq	%rbx, %rdx
	movq	%rax, %rsi
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-88(%rbp), %rax
	movl	-108(%rbp), %edx
	movl	%edx, 64(%rax)
	jmp	.L75
.L88:
	movl	-108(%rbp), %eax
	movl	$5, %esi
	movl	%eax, %edi
	call	dump_state
	movq	%rax, %rsi
	leaq	.LC40(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L75:
	movl	$0, %eax
.L80:
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L90
	call	__stack_chk_fail@PLT
.L90:
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	change_state, .-change_state
	.section	.rodata
	.align 8
.LC41:
	.string	"\n--------[1_INVITE,  2_200 OK,  3_TM_rq,  4_rtp,  5_TM_end] ??? "
.LC42:
	.string	"%d"
.LC43:
	.string	"Recv INVITE..."
.LC44:
	.string	"initial? [0 or number]"
.LC45:
	.string	"nb=? [0 .. %d]\n"
.LC46:
	.string	"fmtp:mc_granted? [0,1]"
.LC47:
	.string	"fmtp:mc_implicit? [0,1]"
.LC48:
	.string	"Recv 200 OK on what session?"
.LC49:
	.string	"From which callee [1 or 2]?"
	.align 8
.LC50:
	.string	"Recv TM Request on what session?"
	.align 8
.LC51:
	.string	"From which participant [0, 1 or 2]?"
.LC52:
	.string	"ssrc_%d_ssrc"
.LC53:
	.string	"Recv RTP on what session?"
.LC54:
	.string	"Recv TM End on what session?"
	.text
	.globl	main
	.type	main, @function
main:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -88(%rbp)
	movl	$0, -76(%rbp)
	movw	$0, -90(%rbp)
.L103:
	leaq	.LC41(%rip), %rdi
	call	puts@PLT
	leaq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-88(%rbp), %eax
	cmpl	$5, %eax
	ja	.L106
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L96(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L96(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L96:
	.long	.L106-.L96
	.long	.L100-.L96
	.long	.L99-.L96
	.long	.L98-.L96
	.long	.L97-.L96
	.long	.L95-.L96
	.text
.L100:
	movl	$8, %edi
	call	my_alloc
	movq	%rax, -72(%rbp)
	leaq	.LC43(%rip), %rdi
	call	puts@PLT
	movq	-72(%rbp), %rax
	movb	$1, 1(%rax)
	leaq	.LC44(%rip), %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %eax
	testl	%eax, %eax
	setne	%dl
	movq	-72(%rbp), %rax
	movb	%dl, (%rax)
	movl	-80(%rbp), %eax
	testl	%eax, %eax
	jne	.L101
	movl	nb_session(%rip), %eax
	movl	%eax, %esi
	leaq	.LC45(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, 4(%rax)
.L101:
	leaq	.LC46(%rip), %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %eax
	testl	%eax, %eax
	setne	%dl
	movq	-72(%rbp), %rax
	movb	%dl, 2(%rax)
	leaq	.LC47(%rip), %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %eax
	testl	%eax, %eax
	setne	%dl
	movq	-72(%rbp), %rax
	movb	%dl, 3(%rax)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	recv_invite
	jmp	.L102
.L99:
	movl	$0, -84(%rbp)
	movl	$0, -80(%rbp)
	leaq	.LC48(%rip), %rdi
	call	puts@PLT
	leaq	-84(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC49(%rip), %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	recv_200
	jmp	.L102
.L98:
	movl	$0, -84(%rbp)
	movl	$0, -80(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movw	$0, -16(%rbp)
	leaq	.LC50(%rip), %rdi
	call	puts@PLT
	leaq	-84(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC51(%rip), %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %edx
	leaq	-64(%rbp), %rax
	leaq	.LC52(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movl	-80(%rbp), %ecx
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	-64(%rbp), %rdx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	recv_TM_request
	jmp	.L102
.L97:
	movl	$0, -84(%rbp)
	movl	$0, -80(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movw	$0, -16(%rbp)
	leaq	.LC53(%rip), %rdi
	call	puts@PLT
	leaq	-84(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC51(%rip), %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	all_sessions(%rip), %rax
	movq	(%rcx,%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	recv_rtp
	jmp	.L102
.L95:
	movl	$0, -84(%rbp)
	movl	$0, -80(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movw	$0, -16(%rbp)
	leaq	.LC54(%rip), %rdi
	call	puts@PLT
	leaq	-84(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC51(%rip), %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %edx
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	all_sessions(%rip), %rax
	movq	(%rcx,%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	recv_TM_end_request
	jmp	.L102
.L106:
	nop
.L102:
	movl	-88(%rbp), %eax
	cmpl	$100, %eax
	jne	.L103
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L105
	call	__stack_chk_fail@PLT
.L105:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	main, .-main
	.section	.rodata
	.type	__FUNCTION__.4232, @object
	.size	__FUNCTION__.4232, 4
__FUNCTION__.4232:
	.string	"err"
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
