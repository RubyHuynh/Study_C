	.file	"xxx_mc24581.c"
	.text
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
	.zero	128
	.long	4
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	224
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
	.zero	32
	.long	2
	.zero	4
	.quad	after_end_resp
	.long	1
	.zero	4
	.quad	transit_state
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
	.zero	32
	.long	2
	.zero	4
	.quad	forward_rtp
	.zero	16
	.zero	160
	.long	3
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	288
	.long	2
	.zero	4
	.quad	clean_up_queue
	.long	1
	.zero	4
	.quad	transit_state
	.zero	32
	.long	4
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	32
	.long	3
	.zero	4
	.quad	forward_rtp
	.zero	16
	.zero	160
	.zero	416
	.long	0
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	192
	.zero	3200
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
	.string	"ERROR: %s %ld \n"
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
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
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
	.string	"xxx_mc24581.c"
.LC2:
	.string	"rs"
.LC3:
	.string	"\t\t\talloc = %d %p\n"
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
	movq	%rax, %rsi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L3
	leaq	__PRETTY_FUNCTION__.4712(%rip), %rcx
	movl	$53, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L3:
	movl	nb_allocated(%rip), %eax
	addl	$1, %eax
	movl	%eax, nb_allocated(%rip)
	movl	nb_allocated(%rip), %eax
	movq	-8(%rbp), %rdx
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
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
.LC4:
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
	leaq	.LC4(%rip), %rdi
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
.LC5:
	.string	"G_START_STOP"
.LC6:
	.string	"G_IDLE"
.LC7:
	.string	"G_TAKEN"
.LC8:
	.string	"G_PENDING_REVOKE"
.LC9:
	.string	"G_RELEASING"
.LC10:
	.string	"G_RESERVED"
.LC11:
	.string	"INVALID"
	.text
	.type	dump_G_state, @function
dump_G_state:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$5, -4(%rbp)
	ja	.L7
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L9(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L9(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L9:
	.long	.L14-.L9
	.long	.L13-.L9
	.long	.L12-.L9
	.long	.L11-.L9
	.long	.L10-.L9
	.long	.L8-.L9
	.text
.L14:
	leaq	.LC5(%rip), %rax
	jmp	.L15
.L13:
	leaq	.LC6(%rip), %rax
	jmp	.L15
.L12:
	leaq	.LC7(%rip), %rax
	jmp	.L15
.L11:
	leaq	.LC8(%rip), %rax
	jmp	.L15
.L10:
	leaq	.LC9(%rip), %rax
	jmp	.L15
.L8:
	leaq	.LC10(%rip), %rax
	jmp	.L15
.L7:
	leaq	.LC11(%rip), %rax
.L15:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	dump_G_state, .-dump_G_state
	.section	.rodata
.LC12:
	.string	"G_EVT_DEFAULT"
.LC13:
	.string	"G_EVT_MC_IMPLICIT"
.LC14:
	.string	"G_EVT_MC_GRANTED"
.LC15:
	.string	"G_EVT_NEW_PARTICIPANT"
.LC16:
	.string	"G_EVT_NO_PARTICIPANT"
.LC17:
	.string	"G_EVT_TIMER_X_EXPIRE"
.LC18:
	.string	"G_EVT_TIMER_Y_EXPIRE"
.LC19:
	.string	"G_EVT_TM_RQ"
.LC20:
	.string	"G_EVT_TM_PRIORITY_RQ"
.LC21:
	.string	"G_EVT_TM_NO_PRIORITY_RQ"
.LC22:
	.string	"G_EVT_TM_END_RQ"
.LC23:
	.string	"G_EVT_CLIENT_RELEASE_1"
.LC24:
	.string	"G_EVT_CLIENT_RELEASE_2"
.LC25:
	.string	"G_EVT_RTP"
	.text
	.type	dump_G_event, @function
dump_G_event:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$14, -4(%rbp)
	ja	.L17
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L19(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L19(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L19:
	.long	.L32-.L19
	.long	.L31-.L19
	.long	.L30-.L19
	.long	.L29-.L19
	.long	.L28-.L19
	.long	.L27-.L19
	.long	.L26-.L19
	.long	.L25-.L19
	.long	.L24-.L19
	.long	.L23-.L19
	.long	.L22-.L19
	.long	.L17-.L19
	.long	.L21-.L19
	.long	.L20-.L19
	.long	.L18-.L19
	.text
.L32:
	leaq	.LC12(%rip), %rax
	jmp	.L33
.L31:
	leaq	.LC13(%rip), %rax
	jmp	.L33
.L30:
	leaq	.LC14(%rip), %rax
	jmp	.L33
.L29:
	leaq	.LC15(%rip), %rax
	jmp	.L33
.L28:
	leaq	.LC16(%rip), %rax
	jmp	.L33
.L27:
	leaq	.LC17(%rip), %rax
	jmp	.L33
.L26:
	leaq	.LC18(%rip), %rax
	jmp	.L33
.L25:
	leaq	.LC19(%rip), %rax
	jmp	.L33
.L24:
	leaq	.LC20(%rip), %rax
	jmp	.L33
.L23:
	leaq	.LC21(%rip), %rax
	jmp	.L33
.L22:
	leaq	.LC22(%rip), %rax
	jmp	.L33
.L21:
	leaq	.LC23(%rip), %rax
	jmp	.L33
.L20:
	leaq	.LC24(%rip), %rax
	jmp	.L33
.L18:
	leaq	.LC25(%rip), %rax
	jmp	.L33
.L17:
	leaq	.LC11(%rip), %rax
.L33:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	dump_G_event, .-dump_G_event
	.section	.rodata
.LC26:
	.string	"session"
	.text
	.globl	check_G_state
	.type	check_G_state, @function
check_G_state:
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
	cmpq	$0, -8(%rbp)
	jne	.L35
	leaq	__PRETTY_FUNCTION__.4748(%rip), %rcx
	movl	$119, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L35:
	movq	-8(%rbp), %rax
	movl	72(%rax), %eax
	andl	-12(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	sete	%al
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	check_G_state, .-check_G_state
	.section	.rodata
.LC27:
	.string	"---idx=%d recv=%d\n"
	.text
	.globl	search_callee_by_idx
	.type	search_callee_by_idx, @function
search_callee_by_idx:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L38
	cmpq	$0, -32(%rbp)
	je	.L38
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	100(%rax), %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %esi
	leaq	.LC27(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	sete	%al
	jmp	.L39
.L38:
	movl	$0, %eax
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	search_callee_by_idx, .-search_callee_by_idx
	.section	.rodata
.LC28:
	.string	"%s %d\n"
	.text
	.globl	start_timer
	.type	start_timer, @function
start_timer:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	leaq	__FUNCTION__.4757(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -4(%rbp)
	je	.L45
	cmpl	$2, -4(%rbp)
	je	.L46
	jmp	.L44
.L45:
	nop
	jmp	.L44
.L46:
	nop
.L44:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	start_timer, .-start_timer
	.globl	stop_timer
	.type	stop_timer, @function
stop_timer:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	leaq	__FUNCTION__.4765(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -4(%rbp)
	je	.L52
	cmpl	$2, -4(%rbp)
	je	.L53
	jmp	.L51
.L52:
	nop
	jmp	.L51
.L53:
	nop
.L51:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	stop_timer, .-stop_timer
	.globl	expire_timer
	.type	expire_timer, @function
expire_timer:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	$0, -8(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	leaq	__FUNCTION__.4774(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -20(%rbp)
	je	.L59
	cmpl	$2, -20(%rbp)
	je	.L56
	jmp	.L58
.L59:
	movq	-8(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L58
.L56:
	movq	-8(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	nop
.L58:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	expire_timer, .-expire_timer
	.section	.rodata
.LC29:
	.string	"!session"
	.text
	.globl	push_TM_queue
	.type	push_TM_queue, @function
push_TM_queue:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L61
	leaq	__PRETTY_FUNCTION__.4784(%rip), %rcx
	movl	$183, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC29(%rip), %rdi
	call	__assert_fail@PLT
.L61:
	movl	$184, %edx
	leaq	__FUNCTION__.4785(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$40, %edi
	call	my_alloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	leaq	112(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	append_node@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	push_TM_queue, .-push_TM_queue
	.section	.rodata
.LC30:
	.string	"pop TM queue "
	.text
	.globl	pop_TM_queue
	.type	pop_TM_queue, @function
pop_TM_queue:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC30(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	pop_TM_queue, .-pop_TM_queue
	.section	.rodata
	.align 8
.LC31:
	.string	"for each participants sending TM_IDLE --depending on basic & reception states "
	.text
	.globl	send_TM_idle
	.type	send_TM_idle, @function
send_TM_idle:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L64
	leaq	__PRETTY_FUNCTION__.4791(%rip), %rcx
	movl	$195, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L64:
	leaq	.LC31(%rip), %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	send_TM_idle, .-send_TM_idle
	.section	.rodata
	.align 8
.LC32:
	.string	"send TM_GRANT to granted participant "
	.text
	.globl	send_TM_grant
	.type	send_TM_grant, @function
send_TM_grant:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L69
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L69:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L67
	leaq	__PRETTY_FUNCTION__.4796(%rip), %rcx
	movl	$201, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L67:
	leaq	.LC32(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	send_TM_grant, .-send_TM_grant
	.section	.rodata
	.align 8
.LC33:
	.string	"send Media Transmission notify to the reception control "
	.text
	.globl	send_TM_media_notify
	.type	send_TM_media_notify, @function
send_TM_media_notify:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L74
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L74:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L72
	leaq	__PRETTY_FUNCTION__.4801(%rip), %rcx
	movl	$208, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L72:
	leaq	.LC33(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	send_TM_media_notify, .-send_TM_media_notify
	.section	.rodata
.LC34:
	.string	"send Queue Position Info "
	.text
	.globl	send_TM_queue_position
	.type	send_TM_queue_position, @function
send_TM_queue_position:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L79
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L79:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L77
	leaq	__PRETTY_FUNCTION__.4806(%rip), %rcx
	movl	$215, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L77:
	leaq	.LC34(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	send_TM_queue_position, .-send_TM_queue_position
	.section	.rodata
	.align 8
.LC35:
	.string	"send TM Revoke to unlucky one "
	.text
	.globl	send_TM_revoke
	.type	send_TM_revoke, @function
send_TM_revoke:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L84
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L84:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L82
	leaq	__PRETTY_FUNCTION__.4811(%rip), %rcx
	movl	$222, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L82:
	leaq	.LC35(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	send_TM_revoke, .-send_TM_revoke
	.section	.rodata
.LC36:
	.string	"send TM_END Response "
	.text
	.globl	send_TM_end_resp
	.type	send_TM_end_resp, @function
send_TM_end_resp:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L89
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L89:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L87
	leaq	__PRETTY_FUNCTION__.4816(%rip), %rcx
	movl	$229, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L87:
	leaq	.LC36(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	send_TM_end_resp, .-send_TM_end_resp
	.section	.rodata
.LC37:
	.string	"from %d\n"
	.align 8
.LC38:
	.string	"participant is found, idx=%d, is_recv_only=%d\n"
	.align 8
.LC39:
	.string	"participant is not found, invalid, discard"
.LC40:
	.string	"session->incoming_invite"
	.text
	.globl	recv_TM_request
	.type	recv_TM_request, @function
recv_TM_request:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$272, %rsp
	movq	%rdi, -264(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L91
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L91:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movq	-264(%rbp), %rax
	movq	%rax, -248(%rbp)
	movq	$0, -240(%rbp)
	cmpq	$0, -248(%rbp)
	jne	.L92
	leaq	__PRETTY_FUNCTION__.4822(%rip), %rcx
	movl	$238, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L92:
	movq	$0, -232(%rbp)
	movq	$0, -224(%rbp)
	movl	$8, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L93
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L94
.L93:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L94:
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L95
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L96
.L95:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L96:
	movq	(%rax), %rax
	movq	%rax, -224(%rbp)
	movl	$242, %edx
	leaq	__FUNCTION__.4826(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-232(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %esi
	leaq	.LC37(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-232(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	-248(%rbp), %rax
	movq	104(%rax), %rax
	leaq	search_callee_by_idx(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	search_first_node_dynamic@PLT
	movq	%rax, -240(%rbp)
	cmpq	$0, -240(%rbp)
	je	.L97
	movq	-240(%rbp), %rax
	movzbl	100(%rax), %eax
	movzbl	%al, %edx
	movq	-240(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %esi
	leaq	.LC38(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L98
.L97:
	leaq	.LC39(%rip), %rdi
	call	puts@PLT
.L98:
	movq	-248(%rbp), %rax
	movq	104(%rax), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L99
	movq	-240(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L100
.L99:
	movq	-248(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L101
	leaq	__PRETTY_FUNCTION__.4822(%rip), %rcx
	movl	$257, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC40(%rip), %rdi
	call	__assert_fail@PLT
.L101:
	movq	-248(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$3, %eax
	jne	.L102
	movq	-248(%rbp), %rax
	movq	24(%rax), %rax
	movzbl	3(%rax), %eax
	testb	%al, %al
	je	.L103
	movl	$16, %edi
	call	my_alloc
	movq	%rax, -216(%rbp)
	movq	-216(%rbp), %rax
	movq	-232(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-216(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	push_TM_queue
	jmp	.L100
.L103:
	movq	-240(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L100
.L102:
	movl	$275, %edx
	leaq	__FUNCTION__.4826(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-240(%rbp), %rax
	movzbl	100(%rax), %eax
	testb	%al, %al
	je	.L105
	movq	-240(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L100
.L105:
	movq	-240(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
.L100:
	movl	$0, %eax
	movq	-184(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L107
	call	__stack_chk_fail@PLT
.L107:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	recv_TM_request, .-recv_TM_request
	.section	.rodata
	.align 8
.LC41:
	.string	"instruct MDF to do something (start forwarding RTP, stop forwarding, ..). WAIT for result? "
	.text
	.globl	mdf_to_do_sth
	.type	mdf_to_do_sth, @function
mdf_to_do_sth:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L112
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L112:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L110
	leaq	__PRETTY_FUNCTION__.4832(%rip), %rcx
	movl	$298, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L110:
	leaq	.LC41(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	mdf_to_do_sth, .-mdf_to_do_sth
	.globl	send_idle
	.type	send_idle, @function
send_idle:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L119
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L119:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L115
	leaq	__PRETTY_FUNCTION__.4837(%rip), %rcx
	movl	$306, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L115:
	movq	-184(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	je	.L116
	movl	$0, %eax
	call	pop_TM_queue
	jmp	.L117
.L116:
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	send_TM_idle
	movq	-184(%rbp), %rax
	movl	$1, 12(%rax)
	movq	-184(%rbp), %rax
	movl	$0, 8(%rax)
	movl	$1, %edi
	call	start_timer
	movl	$2, %edi
	call	start_timer
.L117:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	send_idle, .-send_idle
	.globl	send_grant
	.type	send_grant, @function
send_grant:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L125
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L125:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L122
	leaq	__PRETTY_FUNCTION__.4842(%rip), %rcx
	movl	$323, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L122:
	movl	$1, %edi
	call	stop_timer
	movl	$2, %edi
	call	stop_timer
	movq	-184(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$2, %eax
	jg	.L123
	movq	-184(%rbp), %rax
	movl	8(%rax), %eax
	leal	1(%rax), %edx
	movq	-184(%rbp), %rax
	movl	%edx, 8(%rax)
.L123:
	movl	$4, %edi
	call	start_timer
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_TM_grant
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_TM_media_notify
	movl	$4, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, 96(%rax)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	send_grant, .-send_grant
	.globl	send_revoke
	.type	send_revoke, @function
send_revoke:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L130
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L130:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L128
	leaq	__PRETTY_FUNCTION__.4847(%rip), %rcx
	movl	$336, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L128:
	movl	$4, %edi
	call	stop_timer
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_TM_revoke
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_TM_queue_position
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	send_revoke, .-send_revoke
	.globl	forward_rtp
	.type	forward_rtp, @function
forward_rtp:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L135
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L135:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L133
	leaq	__PRETTY_FUNCTION__.4852(%rip), %rcx
	movl	$345, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L133:
	movl	$4, %edi
	call	stop_timer
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	mdf_to_do_sth
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	forward_rtp, .-forward_rtp
	.globl	after_end_resp
	.type	after_end_resp, @function
after_end_resp:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L140
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L140:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L138
	leaq	__PRETTY_FUNCTION__.4857(%rip), %rcx
	movl	$353, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L138:
	movl	$4, %edi
	call	stop_timer
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	after_end_resp, .-after_end_resp
	.section	.rodata
	.align 8
.LC42:
	.string	"cleanup queue position 6.3.4.5.4"
	.text
	.globl	clean_up_queue
	.type	clean_up_queue, @function
clean_up_queue:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L145
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L145:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L143
	leaq	__PRETTY_FUNCTION__.4862(%rip), %rcx
	movl	$360, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L143:
	leaq	.LC42(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	clean_up_queue, .-clean_up_queue
	.globl	retry_idle
	.type	retry_idle, @function
retry_idle:
.LFB32:
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
	je	.L149
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L149:
	leaq	__FUNCTION__.4866(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	retry_idle, .-retry_idle
	.globl	do_nothing
	.type	do_nothing, @function
do_nothing:
.LFB33:
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
	je	.L153
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L153:
	leaq	__FUNCTION__.4870(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	do_nothing, .-do_nothing
	.globl	send_TM_deny
	.type	send_TM_deny, @function
send_TM_deny:
.LFB34:
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
	je	.L157
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L157:
	leaq	__FUNCTION__.4874(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	send_TM_deny, .-send_TM_deny
	.globl	send_reject
	.type	send_reject, @function
send_reject:
.LFB35:
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
	je	.L161
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L161:
	leaq	__FUNCTION__.4878(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	send_reject, .-send_reject
	.globl	transit_state
	.type	transit_state, @function
transit_state:
.LFB36:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%rdi, -248(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L163
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L163:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movq	-248(%rbp), %rax
	movq	%rax, -224(%rbp)
	cmpq	$0, -224(%rbp)
	jne	.L164
	leaq	__PRETTY_FUNCTION__.4883(%rip), %rcx
	movl	$374, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L164:
	movl	$0, -228(%rbp)
	movq	$0, -216(%rbp)
	movl	$8, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L165
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L166
.L165:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L166:
	movl	(%rax), %eax
	movl	%eax, -228(%rbp)
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L167
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L168
.L167:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L168:
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
	movl	$377, %edx
	leaq	__FUNCTION__.4887(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-224(%rbp), %rax
	movl	72(%rax), %eax
	cmpl	$2, %eax
	je	.L169
	cmpl	$3, %eax
	je	.L170
	cmpl	$1, %eax
	jne	.L171
	movl	$380, %edx
	leaq	__FUNCTION__.4887(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-224(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_idle
	jmp	.L172
.L169:
	movl	$385, %edx
	leaq	__FUNCTION__.4887(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-224(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_grant
	jmp	.L172
.L170:
	movl	$390, %edx
	leaq	__FUNCTION__.4887(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-224(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_revoke
	jmp	.L172
.L171:
	movl	$395, %edx
	leaq	__FUNCTION__.4887(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
.L172:
	movl	$0, %eax
	movq	-184(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L174
	call	__stack_chk_fail@PLT
.L174:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	transit_state, .-transit_state
	.section	.rodata
	.align 8
.LC43:
	.string	"G_state changes from %s to %s, prev_state %s\n"
	.align 8
.LC44:
	.string	"G_state remains at %s, prev_state %s \n"
	.text
	.globl	set_next_state
	.type	set_next_state, @function
set_next_state:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L176
	leaq	__PRETTY_FUNCTION__.4898(%rip), %rcx
	movl	$402, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L176:
	movq	-24(%rbp), %rax
	movl	72(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 76(%rax)
	movq	-24(%rbp), %rax
	movl	72(%rax), %eax
	cmpl	%eax, -28(%rbp)
	je	.L177
	movq	-24(%rbp), %rax
	movl	76(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %r12
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movl	72(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 72(%rax)
	movq	-24(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, 80(%rax)
	jmp	.L179
.L177:
	movq	-24(%rbp), %rax
	movl	76(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %rbx
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rbx, %rdx
	movq	%rax, %rsi
	leaq	.LC44(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L179:
	nop
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	set_next_state, .-set_next_state
	.section	.rodata
	.align 8
.LC45:
	.string	"%s current_state=%s, event = %s, reject = %d\n"
.LC46:
	.string	"empty reject action"
.LC47:
	.string	"empty accept action"
	.text
	.globl	change_state
	.type	change_state, @function
change_state:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$264, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -264(%rbp)
	movl	%esi, -268(%rbp)
	movq	%rdx, -176(%rbp)
	movq	%rcx, -168(%rbp)
	movq	%r8, -160(%rbp)
	movq	%r9, -152(%rbp)
	testb	%al, %al
	je	.L181
	movaps	%xmm0, -144(%rbp)
	movaps	%xmm1, -128(%rbp)
	movaps	%xmm2, -112(%rbp)
	movaps	%xmm3, -96(%rbp)
	movaps	%xmm4, -80(%rbp)
	movaps	%xmm5, -64(%rbp)
	movaps	%xmm6, -48(%rbp)
	movaps	%xmm7, -32(%rbp)
.L181:
	movq	%fs:40, %rax
	movq	%rax, -200(%rbp)
	xorl	%eax, %eax
	movq	-264(%rbp), %rax
	movq	%rax, -240(%rbp)
	cmpq	$0, -240(%rbp)
	jne	.L182
	leaq	__PRETTY_FUNCTION__.4905(%rip), %rcx
	movl	$419, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L182:
	movl	$0, -248(%rbp)
	movq	$0, -232(%rbp)
	movl	$16, -224(%rbp)
	movl	$48, -220(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -216(%rbp)
	leaq	-192(%rbp), %rax
	movq	%rax, -208(%rbp)
	movl	-224(%rbp), %eax
	cmpl	$47, %eax
	ja	.L183
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L184
.L183:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L184:
	movl	(%rax), %eax
	movl	%eax, -248(%rbp)
	movl	-224(%rbp), %eax
	cmpl	$47, %eax
	ja	.L185
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L186
.L185:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L186:
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	movl	-268(%rbp), %eax
	movl	%eax, %edi
	call	dump_G_event
	movq	%rax, %rbx
	movq	-240(%rbp), %rax
	movl	72(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %rdx
	movl	-248(%rbp), %eax
	movl	%eax, %r8d
	movq	%rbx, %rcx
	leaq	__FUNCTION__.4909(%rip), %rsi
	leaq	.LC45(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$15, -268(%rbp)
	je	.L187
	cmpl	$1, -248(%rbp)
	jne	.L188
	movl	$426, %edx
	leaq	__FUNCTION__.4909(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-240(%rbp), %rax
	movl	72(%rax), %eax
	movl	-268(%rbp), %edx
	movl	%eax, %ecx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	16+state_matrix(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -244(%rbp)
	movl	-268(%rbp), %edx
	movl	-244(%rbp), %ecx
	movq	-240(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	set_next_state
	movq	-240(%rbp), %rax
	movl	76(%rax), %eax
	movl	-268(%rbp), %edx
	movl	%eax, %ecx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	24+state_matrix(%rip), %rax
	movq	(%rdx,%rax), %rax
	testq	%rax, %rax
	je	.L189
	movq	-240(%rbp), %rax
	movl	76(%rax), %eax
	movl	-268(%rbp), %edx
	movl	%eax, %ecx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	24+state_matrix(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-232(%rbp), %rcx
	movq	-240(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*%rdx
	jmp	.L193
.L189:
	leaq	.LC46(%rip), %rdi
	call	puts@PLT
	jmp	.L193
.L188:
	movl	$435, %edx
	leaq	__FUNCTION__.4909(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-240(%rbp), %rax
	movl	72(%rax), %eax
	movl	-268(%rbp), %edx
	movl	%eax, %ecx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	state_matrix(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -244(%rbp)
	movl	-268(%rbp), %edx
	movl	-244(%rbp), %ecx
	movq	-240(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	set_next_state
	movq	-240(%rbp), %rax
	movl	76(%rax), %eax
	movl	-268(%rbp), %edx
	movl	%eax, %ecx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+state_matrix(%rip), %rax
	movq	(%rdx,%rax), %rax
	testq	%rax, %rax
	je	.L192
	movq	-240(%rbp), %rax
	movl	76(%rax), %eax
	movl	-268(%rbp), %edx
	movl	%eax, %ecx
	movq	%rcx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+state_matrix(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-232(%rbp), %rcx
	movq	-240(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*%rdx
	jmp	.L193
.L192:
	leaq	.LC47(%rip), %rdi
	call	puts@PLT
	jmp	.L193
.L187:
	movl	$445, %esi
	leaq	__FUNCTION__.4909(%rip), %rdi
	call	err
.L193:
	movl	$0, %eax
	movq	-200(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L195
	call	__stack_chk_fail@PLT
.L195:
	addq	$264, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	change_state, .-change_state
	.section	.rodata
.LC48:
	.string	"new participant is allocated"
	.text
	.globl	allocate_participant
	.type	allocate_participant, @function
allocate_participant:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, %eax
	movb	%al, -24(%rbp)
	movl	$40, %edi
	call	my_alloc
	movq	%rax, -8(%rbp)
	movl	$120, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movzbl	-24(%rbp), %edx
	movb	%dl, 100(%rax)
	leaq	.LC48(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	allocate_participant, .-allocate_participant
	.section	.rodata
	.align 8
.LC49:
	.string	"new session=%d is allocated, participants=%d\n"
	.text
	.globl	allocate_session
	.type	allocate_session, @function
allocate_session:
.LFB40:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$120, %edi
	call	my_alloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movl	$0, %esi
	movl	$0, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 104(%rax)
	movl	$0, %esi
	movl	$1, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$104, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	append_node@PLT
	movl	$0, %esi
	movl	$2, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$104, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	append_node@PLT
	movl	$1, %esi
	movl	$3, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$104, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	append_node@PLT
	movq	-8(%rbp), %rax
	movq	104(%rax), %rax
	movl	(%rax), %edx
	movl	nb_session(%rip), %eax
	movl	%eax, %esi
	leaq	.LC49(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	nb_session(%rip), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 4(%rax)
	cmpq	$0, -24(%rbp)
	je	.L199
	movl	nb_session(%rip), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
.L199:
	movl	nb_session(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, nb_session(%rip)
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	all_sessions(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rcx,%rdx)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	allocate_session, .-allocate_session
	.section	.rodata
.LC50:
	.string	"invite"
.LC51:
	.string	"\n.session_idx = [0--%d]\n"
.LC52:
	.string	"%d"
.LC53:
	.string	"invite on existing session %d"
.LC54:
	.string	"from client?"
.LC55:
	.string	"confirmed is required"
	.text
	.globl	recv_invite
	.type	recv_invite, @function
recv_invite:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movl	$478, %edx
	leaq	__FUNCTION__.4924(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpq	$0, -40(%rbp)
	jne	.L202
	leaq	__PRETTY_FUNCTION__.4925(%rip), %rcx
	movl	$479, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC50(%rip), %rdi
	call	__assert_fail@PLT
.L202:
	movl	nb_session(%rip), %eax
	movl	%eax, %esi
	leaq	.LC51(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L203
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %esi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-40(%rbp), %rax
	movzbl	4(%rax), %eax
	testb	%al, %al
	je	.L204
	leaq	.LC54(%rip), %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-16(%rbp), %rax
	movq	104(%rax), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L205
	movq	-16(%rbp), %rax
	movl	$1, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L201
.L205:
	movq	-16(%rbp), %rax
	movq	104(%rax), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L201
.L203:
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L208
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	allocate_session
	movq	%rax, -16(%rbp)
	jmp	.L209
.L208:
	movl	$506, %esi
	leaq	__FUNCTION__.4924(%rip), %rdi
	call	err
.L209:
	movzbl	configuration(%rip), %eax
	testb	%al, %al
	je	.L204
	leaq	.LC55(%rip), %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	movzbl	2(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L204
	movq	-16(%rbp), %rax
	movl	$5, 72(%rax)
	jmp	.L201
.L204:
	movq	-40(%rbp), %rax
	movzbl	2(%rax), %eax
	testb	%al, %al
	je	.L210
	movl	$520, %edx
	leaq	__FUNCTION__.4924(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L201
.L210:
	movzbl	1+configuration(%rip), %eax
	testb	%al, %al
	je	.L212
	movl	$528, %edx
	leaq	__FUNCTION__.4924(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L201
.L212:
	movl	$531, %edx
	leaq	__FUNCTION__.4924(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movl	$1, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
.L201:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L214
	call	__stack_chk_fail@PLT
.L214:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE41:
	.size	recv_invite, .-recv_invite
	.section	.rodata
	.align 8
.LC56:
	.string	" 200 OK on exisiting participant, basic = %p"
.LC57:
	.string	"some_ssrc"
	.align 8
.LC58:
	.string	"200 on no participant, invalid case, discard "
	.text
	.globl	recv_200
	.type	recv_200, @function
recv_200:
.LFB42:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	movq	$0, -8(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L216
	leaq	__PRETTY_FUNCTION__.4934(%rip), %rcx
	movl	$541, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L216:
	movzbl	configuration(%rip), %eax
	testb	%al, %al
	je	.L217
	movq	-16(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	check_G_state
	testb	%al, %al
	je	.L217
	movq	-16(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	set_next_state
.L217:
	movq	-16(%rbp), %rax
	movq	104(%rax), %rax
	leaq	-24(%rbp), %rcx
	leaq	search_callee_by_idx(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	search_first_node_dynamic@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L218
	movq	-8(%rbp), %rax
	movq	104(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC56(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC57(%rip), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	104(%rax), %rax
	testq	%rax, %rax
	jne	.L220
	movl	$4, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 104(%rax)
	jmp	.L220
.L218:
	leaq	.LC58(%rip), %rdi
	call	puts@PLT
.L220:
	movzbl	1+configuration(%rip), %eax
	testb	%al, %al
	je	.L223
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	nop
.L223:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE42:
	.size	recv_200, .-recv_200
	.section	.rodata
.LC59:
	.string	"\n.session_idx = "
.LC60:
	.string	"\n.callee_idx = "
	.text
	.globl	eventFromSCU
	.type	eventFromSCU, @function
eventFromSCU:
.LFB43:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -44(%rbp)
	movl	$570, %edx
	leaq	__FUNCTION__.4939(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$4, -44(%rbp)
	ja	.L236
	movl	-44(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L227(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L227(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L227:
	.long	.L231-.L227
	.long	.L230-.L227
	.long	.L229-.L227
	.long	.L228-.L227
	.long	.L226-.L227
	.text
.L231:
	movl	$12, %edi
	call	my_alloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movb	$1, (%rax)
	movq	-40(%rbp), %rax
	movb	$1, 1(%rax)
	movq	-40(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-40(%rbp), %rax
	movb	$0, 4(%rax)
	movq	-40(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	recv_invite
	jmp	.L232
.L230:
	leaq	.LC59(%rip), %rdi
	call	puts@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC60(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-48(%rbp), %edx
	movl	-52(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	recv_200
	jmp	.L232
.L229:
	movl	$12, %edi
	call	my_alloc
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movb	$1, (%rax)
	movq	-32(%rbp), %rax
	movb	$1, 1(%rax)
	movq	-32(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-32(%rbp), %rax
	movb	$1, 4(%rax)
	movq	-32(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	recv_invite
	jmp	.L232
.L228:
	leaq	.LC59(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpq	$0, -24(%rbp)
	jne	.L233
	leaq	__PRETTY_FUNCTION__.4952(%rip), %rcx
	movl	$613, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L233:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$12, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L232
.L226:
	leaq	.LC59(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpq	$0, -16(%rbp)
	jne	.L234
	leaq	__PRETTY_FUNCTION__.4952(%rip), %rcx
	movl	$625, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L234:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$13, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L232
.L236:
	nop
.L232:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L235
	call	__stack_chk_fail@PLT
.L235:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE43:
	.size	eventFromSCU, .-eventFromSCU
	.section	.rodata
.LC61:
	.string	"\n.RTP from callee_idx = "
	.align 8
.LC62:
	.string	"invalid RTP? -- case never happen"
	.text
	.globl	eventMDF
	.type	eventMDF, @function
eventMDF:
.LFB44:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-152(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -140(%rbp)
	movl	$637, %edx
	leaq	__FUNCTION__.4962(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$0, -140(%rbp)
	jne	.L244
	leaq	.LC59(%rip), %rdi
	call	puts@PLT
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC61(%rip), %rdi
	call	puts@PLT
	leaq	-128(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-144(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L239
	leaq	__PRETTY_FUNCTION__.4968(%rip), %rcx
	movl	$650, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L239:
	movq	-136(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L240
	leaq	.LC62(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L242
.L240:
	movq	-136(%rbp), %rax
	movl	$14, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L242
.L244:
	nop
.L242:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L243
	call	__stack_chk_fail@PLT
.L243:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE44:
	.size	eventMDF, .-eventMDF
	.globl	eventRTCP
	.type	eventRTCP, @function
eventRTCP:
.LFB45:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-152(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -140(%rbp)
	movl	$669, %edx
	leaq	__FUNCTION__.4979(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC59(%rip), %rdi
	call	puts@PLT
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC60(%rip), %rdi
	call	puts@PLT
	leaq	-128(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-144(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	.L246
	leaq	__PRETTY_FUNCTION__.4980(%rip), %rcx
	movl	$676, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L246:
	cmpl	$0, -140(%rbp)
	je	.L247
	cmpl	$1, -140(%rbp)
	je	.L248
	jmp	.L250
.L247:
	leaq	-128(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	recv_TM_request
	jmp	.L250
.L248:
	movq	-136(%rbp), %rax
	movl	8(%rax), %eax
	leal	-1(%rax), %edx
	movq	-136(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_TM_end_resp
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	mdf_to_do_sth
	movq	-136(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jg	.L251
	movq	-136(%rbp), %rax
	subq	$8, %rsp
	pushq	-16(%rbp)
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	pushq	-40(%rbp)
	pushq	-48(%rbp)
	pushq	-56(%rbp)
	pushq	-64(%rbp)
	pushq	-72(%rbp)
	pushq	-80(%rbp)
	pushq	-88(%rbp)
	pushq	-96(%rbp)
	pushq	-104(%rbp)
	pushq	-112(%rbp)
	pushq	-120(%rbp)
	pushq	-128(%rbp)
	movl	$1, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	subq	$-128, %rsp
	jmp	.L254
.L251:
	movq	-136(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
.L254:
	nop
.L250:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L253
	call	__stack_chk_fail@PLT
.L253:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE45:
	.size	eventRTCP, .-eventRTCP
	.section	.rodata
	.align 8
.LC63:
	.string	"\n\n\n.event = [0 (SCU), 1 (RTCP), 2 (CONFIGURATION), 3 (MDF), 100 (EXIT)]"
	.align 8
.LC64:
	.string	"\n.event from SCU = [0 (INVITE), 1 (200 OK), 2 (IMPLICIT_INVITE), 3 (BYE), 4 (BYE_200 OK)]"
	.align 8
.LC65:
	.string	"\n.event RTCP = [0 (recv TM request), 1 (recv TM End request)]"
	.align 8
.LC66:
	.string	"\n.Set is_confirmed_indication = [0, 1]"
	.align 8
.LC67:
	.string	"\n.Set is_granting_implicit_on_established = [0, 1]"
.LC68:
	.string	"\n.event from MDF = [0 (RTP)]"
	.text
	.globl	main
	.type	main, @function
main:
.LFB46:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -12(%rbp)
.L263:
	leaq	.LC63(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L256
	cmpl	$1, %eax
	jg	.L257
	testl	%eax, %eax
	je	.L258
	jmp	.L262
.L257:
	cmpl	$2, %eax
	je	.L260
	cmpl	$3, %eax
	je	.L261
	jmp	.L262
.L258:
	leaq	.LC64(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	call	eventFromSCU
	jmp	.L262
.L256:
	leaq	.LC65(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	call	eventRTCP
	jmp	.L262
.L260:
	leaq	.LC66(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, configuration(%rip)
	leaq	.LC67(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, 1+configuration(%rip)
	jmp	.L262
.L261:
	leaq	.LC68(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	call	eventMDF
	nop
.L262:
	movl	-12(%rbp), %eax
	cmpl	$100, %eax
	jne	.L263
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L265
	call	__stack_chk_fail@PLT
.L265:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE46:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.4712, @object
	.size	__PRETTY_FUNCTION__.4712, 9
__PRETTY_FUNCTION__.4712:
	.string	"my_alloc"
	.align 8
	.type	__PRETTY_FUNCTION__.4748, @object
	.size	__PRETTY_FUNCTION__.4748, 14
__PRETTY_FUNCTION__.4748:
	.string	"check_G_state"
	.align 8
	.type	__FUNCTION__.4757, @object
	.size	__FUNCTION__.4757, 12
__FUNCTION__.4757:
	.string	"start_timer"
	.align 8
	.type	__FUNCTION__.4765, @object
	.size	__FUNCTION__.4765, 11
__FUNCTION__.4765:
	.string	"stop_timer"
	.align 8
	.type	__FUNCTION__.4774, @object
	.size	__FUNCTION__.4774, 13
__FUNCTION__.4774:
	.string	"expire_timer"
	.align 8
	.type	__PRETTY_FUNCTION__.4784, @object
	.size	__PRETTY_FUNCTION__.4784, 14
__PRETTY_FUNCTION__.4784:
	.string	"push_TM_queue"
	.align 8
	.type	__FUNCTION__.4785, @object
	.size	__FUNCTION__.4785, 14
__FUNCTION__.4785:
	.string	"push_TM_queue"
	.align 8
	.type	__PRETTY_FUNCTION__.4791, @object
	.size	__PRETTY_FUNCTION__.4791, 13
__PRETTY_FUNCTION__.4791:
	.string	"send_TM_idle"
	.align 8
	.type	__PRETTY_FUNCTION__.4796, @object
	.size	__PRETTY_FUNCTION__.4796, 14
__PRETTY_FUNCTION__.4796:
	.string	"send_TM_grant"
	.align 16
	.type	__PRETTY_FUNCTION__.4801, @object
	.size	__PRETTY_FUNCTION__.4801, 21
__PRETTY_FUNCTION__.4801:
	.string	"send_TM_media_notify"
	.align 16
	.type	__PRETTY_FUNCTION__.4806, @object
	.size	__PRETTY_FUNCTION__.4806, 23
__PRETTY_FUNCTION__.4806:
	.string	"send_TM_queue_position"
	.align 8
	.type	__PRETTY_FUNCTION__.4811, @object
	.size	__PRETTY_FUNCTION__.4811, 15
__PRETTY_FUNCTION__.4811:
	.string	"send_TM_revoke"
	.align 16
	.type	__PRETTY_FUNCTION__.4816, @object
	.size	__PRETTY_FUNCTION__.4816, 17
__PRETTY_FUNCTION__.4816:
	.string	"send_TM_end_resp"
	.align 16
	.type	__PRETTY_FUNCTION__.4822, @object
	.size	__PRETTY_FUNCTION__.4822, 16
__PRETTY_FUNCTION__.4822:
	.string	"recv_TM_request"
	.align 16
	.type	__FUNCTION__.4826, @object
	.size	__FUNCTION__.4826, 16
__FUNCTION__.4826:
	.string	"recv_TM_request"
	.align 8
	.type	__PRETTY_FUNCTION__.4832, @object
	.size	__PRETTY_FUNCTION__.4832, 14
__PRETTY_FUNCTION__.4832:
	.string	"mdf_to_do_sth"
	.align 8
	.type	__PRETTY_FUNCTION__.4837, @object
	.size	__PRETTY_FUNCTION__.4837, 10
__PRETTY_FUNCTION__.4837:
	.string	"send_idle"
	.align 8
	.type	__PRETTY_FUNCTION__.4842, @object
	.size	__PRETTY_FUNCTION__.4842, 11
__PRETTY_FUNCTION__.4842:
	.string	"send_grant"
	.align 8
	.type	__PRETTY_FUNCTION__.4847, @object
	.size	__PRETTY_FUNCTION__.4847, 12
__PRETTY_FUNCTION__.4847:
	.string	"send_revoke"
	.align 8
	.type	__PRETTY_FUNCTION__.4852, @object
	.size	__PRETTY_FUNCTION__.4852, 12
__PRETTY_FUNCTION__.4852:
	.string	"forward_rtp"
	.align 8
	.type	__PRETTY_FUNCTION__.4857, @object
	.size	__PRETTY_FUNCTION__.4857, 15
__PRETTY_FUNCTION__.4857:
	.string	"after_end_resp"
	.align 8
	.type	__PRETTY_FUNCTION__.4862, @object
	.size	__PRETTY_FUNCTION__.4862, 15
__PRETTY_FUNCTION__.4862:
	.string	"clean_up_queue"
	.align 8
	.type	__FUNCTION__.4866, @object
	.size	__FUNCTION__.4866, 11
__FUNCTION__.4866:
	.string	"retry_idle"
	.align 8
	.type	__FUNCTION__.4870, @object
	.size	__FUNCTION__.4870, 11
__FUNCTION__.4870:
	.string	"do_nothing"
	.align 8
	.type	__FUNCTION__.4874, @object
	.size	__FUNCTION__.4874, 13
__FUNCTION__.4874:
	.string	"send_TM_deny"
	.align 8
	.type	__FUNCTION__.4878, @object
	.size	__FUNCTION__.4878, 12
__FUNCTION__.4878:
	.string	"send_reject"
	.align 8
	.type	__PRETTY_FUNCTION__.4883, @object
	.size	__PRETTY_FUNCTION__.4883, 14
__PRETTY_FUNCTION__.4883:
	.string	"transit_state"
	.align 8
	.type	__FUNCTION__.4887, @object
	.size	__FUNCTION__.4887, 14
__FUNCTION__.4887:
	.string	"transit_state"
	.align 8
	.type	__PRETTY_FUNCTION__.4898, @object
	.size	__PRETTY_FUNCTION__.4898, 15
__PRETTY_FUNCTION__.4898:
	.string	"set_next_state"
	.align 8
	.type	__PRETTY_FUNCTION__.4905, @object
	.size	__PRETTY_FUNCTION__.4905, 13
__PRETTY_FUNCTION__.4905:
	.string	"change_state"
	.align 8
	.type	__FUNCTION__.4909, @object
	.size	__FUNCTION__.4909, 13
__FUNCTION__.4909:
	.string	"change_state"
	.align 8
	.type	__FUNCTION__.4924, @object
	.size	__FUNCTION__.4924, 12
__FUNCTION__.4924:
	.string	"recv_invite"
	.align 8
	.type	__PRETTY_FUNCTION__.4925, @object
	.size	__PRETTY_FUNCTION__.4925, 12
__PRETTY_FUNCTION__.4925:
	.string	"recv_invite"
	.align 8
	.type	__PRETTY_FUNCTION__.4934, @object
	.size	__PRETTY_FUNCTION__.4934, 9
__PRETTY_FUNCTION__.4934:
	.string	"recv_200"
	.align 8
	.type	__FUNCTION__.4939, @object
	.size	__FUNCTION__.4939, 13
__FUNCTION__.4939:
	.string	"eventFromSCU"
	.align 8
	.type	__PRETTY_FUNCTION__.4952, @object
	.size	__PRETTY_FUNCTION__.4952, 13
__PRETTY_FUNCTION__.4952:
	.string	"eventFromSCU"
	.align 8
	.type	__FUNCTION__.4962, @object
	.size	__FUNCTION__.4962, 9
__FUNCTION__.4962:
	.string	"eventMDF"
	.align 8
	.type	__PRETTY_FUNCTION__.4968, @object
	.size	__PRETTY_FUNCTION__.4968, 9
__PRETTY_FUNCTION__.4968:
	.string	"eventMDF"
	.align 8
	.type	__FUNCTION__.4979, @object
	.size	__FUNCTION__.4979, 10
__FUNCTION__.4979:
	.string	"eventRTCP"
	.align 8
	.type	__PRETTY_FUNCTION__.4980, @object
	.size	__PRETTY_FUNCTION__.4980, 10
__PRETTY_FUNCTION__.4980:
	.string	"eventRTCP"
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
