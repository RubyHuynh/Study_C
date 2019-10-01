	.file	"xxx_mc24581.c"
	.text
	.globl	state_matrix
	.section	.data.rel.local,"aw"
	.align 32
	.type	state_matrix, @object
	.size	state_matrix, 3200
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
	.globl	basic_state_matrix
	.align 32
	.type	basic_state_matrix, @object
	.size	basic_state_matrix, 4480
basic_state_matrix:
	.long	0
	.zero	4
	.quad	do_nothing
	.zero	16
	.long	1
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	576
	.long	1
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	608
	.long	2
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	608
	.long	3
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	608
	.long	4
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	608
	.long	5
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	608
	.long	6
	.zero	4
	.quad	transit_state
	.zero	16
	.zero	608
	.globl	reception_state_matrix
	.bss
	.align 32
	.type	reception_state_matrix, @object
	.size	reception_state_matrix, 4480
reception_state_matrix:
	.zero	4480
	.globl	basic_reception_state_matrix
	.align 32
	.type	basic_reception_state_matrix, @object
	.size	basic_reception_state_matrix, 4480
basic_reception_state_matrix:
	.zero	4480
	.globl	configuration
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
	.string	"\t\t\talloc = %d %p (sz=%d)\n"
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
	leaq	__PRETTY_FUNCTION__.4728(%rip), %rcx
	movl	$53, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L3:
	movq	-24(%rbp), %rax
	movl	%eax, %ecx
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
	.string	"EVT_DEFAULT"
.LC13:
	.string	"EVT_MC_IMPLICIT"
.LC14:
	.string	"EVT_MC_GRANTED"
.LC15:
	.string	"EVT_NEW_PARTICIPANT"
.LC16:
	.string	"EVT_NO_PARTICIPANT"
.LC17:
	.string	"EVT_TIMER_X_EXPIRE"
.LC18:
	.string	"EVT_TIMER_Y_EXPIRE"
.LC19:
	.string	"EVT_TM_RQ"
.LC20:
	.string	"EVT_TM_PRIORITY_RQ"
.LC21:
	.string	"EVT_TM_NO_PRIORITY_RQ"
.LC22:
	.string	"EVT_TM_END_RQ"
.LC23:
	.string	"EVT_CLIENT_RELEASE_1"
.LC24:
	.string	"EVT_CLIENT_RELEASE_2"
.LC25:
	.string	"EVT_RTP"
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
	leaq	__PRETTY_FUNCTION__.4764(%rip), %rcx
	movl	$119, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L35:
	movq	-8(%rbp), %rax
	movl	92(%rax), %eax
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
	movzbl	12(%rax), %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC27(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
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
	leaq	__FUNCTION__.4773(%rip), %rsi
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
	leaq	__FUNCTION__.4781(%rip), %rsi
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
	leaq	__FUNCTION__.4790(%rip), %rsi
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
	movl	$5, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L58
.L56:
	movq	-8(%rbp), %rax
	movl	$6, %edx
	movq	%rax, %rsi
	movl	$0, %edi
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
	leaq	__PRETTY_FUNCTION__.4800(%rip), %rcx
	movl	$183, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC29(%rip), %rdi
	call	__assert_fail@PLT
.L61:
	movl	$184, %edx
	leaq	__FUNCTION__.4801(%rip), %rsi
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
	leaq	80(%rax), %rdx
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
	leaq	__PRETTY_FUNCTION__.4807(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4812(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4817(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4822(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4827(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4832(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4838(%rip), %rcx
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
	leaq	__FUNCTION__.4842(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-232(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC37(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-232(%rbp), %rcx
	movq	-248(%rbp), %rax
	movq	72(%rax), %rax
	leaq	search_callee_by_idx(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	search_first_node_dynamic@PLT
	movq	%rax, -240(%rbp)
	cmpq	$0, -240(%rbp)
	je	.L97
	movq	-240(%rbp), %rax
	movzbl	12(%rax), %eax
	movzbl	%al, %edx
	movq	-240(%rbp), %rax
	movl	(%rax), %eax
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
	movq	72(%rax), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L99
	movq	-240(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %r8
	movl	$1, %ecx
	movl	$7, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L100
.L99:
	movq	-248(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	jne	.L101
	leaq	__PRETTY_FUNCTION__.4838(%rip), %rcx
	movl	$257, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC40(%rip), %rdi
	call	__assert_fail@PLT
.L101:
	movq	-248(%rbp), %rax
	movl	4(%rax), %eax
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
	movq	%rdx, %r8
	movl	$1, %ecx
	movl	$7, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L100
.L102:
	movl	$275, %edx
	leaq	__FUNCTION__.4842(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-240(%rbp), %rax
	movzbl	12(%rax), %eax
	testb	%al, %al
	je	.L105
	movq	-240(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %r8
	movl	$1, %ecx
	movl	$7, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L100
.L105:
	movq	-240(%rbp), %rdx
	movq	-248(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$7, %edx
	movq	%rax, %rsi
	movl	$0, %edi
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
	leaq	__PRETTY_FUNCTION__.4848(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4853(%rip), %rcx
	movl	$306, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L115:
	movq	-184(%rbp), %rax
	movq	80(%rax), %rax
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
	movl	$1, 8(%rax)
	movq	-184(%rbp), %rax
	movl	$0, 4(%rax)
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
	leaq	__PRETTY_FUNCTION__.4858(%rip), %rcx
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
	movl	4(%rax), %eax
	cmpl	$2, %eax
	jg	.L123
	movq	-184(%rbp), %rax
	movl	4(%rax), %eax
	leal	1(%rax), %edx
	movq	-184(%rbp), %rax
	movl	%edx, 4(%rax)
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
	movl	$24, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, 112(%rax)
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
	leaq	__PRETTY_FUNCTION__.4863(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4868(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4873(%rip), %rcx
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
	leaq	__PRETTY_FUNCTION__.4878(%rip), %rcx
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
	leaq	__FUNCTION__.4882(%rip), %rdi
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
	leaq	__FUNCTION__.4886(%rip), %rdi
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
	leaq	__FUNCTION__.4890(%rip), %rdi
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
	leaq	__FUNCTION__.4894(%rip), %rdi
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
	leaq	__PRETTY_FUNCTION__.4899(%rip), %rcx
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
	leaq	__FUNCTION__.4903(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-224(%rbp), %rax
	movl	92(%rax), %eax
	cmpl	$2, %eax
	je	.L169
	cmpl	$3, %eax
	je	.L170
	cmpl	$1, %eax
	jne	.L171
	movl	$380, %edx
	leaq	__FUNCTION__.4903(%rip), %rsi
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
	leaq	__FUNCTION__.4903(%rip), %rsi
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
	leaq	__FUNCTION__.4903(%rip), %rsi
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
	leaq	__FUNCTION__.4903(%rip), %rsi
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
.LC43:
	.string	"session_sm"
	.align 8
.LC44:
	.string	"G_state changes from %s to %s, prev_state %s\n"
	.align 8
.LC45:
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
	leaq	__PRETTY_FUNCTION__.4914(%rip), %rcx
	movl	$402, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC43(%rip), %rdi
	call	__assert_fail@PLT
.L176:
	movq	-24(%rbp), %rax
	movl	4(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	-24(%rbp), %rax
	movl	4(%rax), %edx
	movl	-28(%rbp), %eax
	cmpl	%eax, %edx
	je	.L177
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %r12
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movq	%rax, %rsi
	leaq	.LC44(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-28(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-24(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, 12(%rax)
	jmp	.L179
.L177:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %rbx
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rbx, %rdx
	movq	%rax, %rsi
	leaq	.LC45(%rip), %rdi
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
.LC46:
	.string	"empty reject action"
.LC47:
	.string	"empty accept action"
	.text
	.globl	get_state_action
	.type	get_state_action, @function
get_state_action:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, %eax
	movq	%r8, -48(%rbp)
	movq	%r9, -56(%rbp)
	movb	%al, -40(%rbp)
	cmpb	$0, -40(%rbp)
	je	.L181
	movl	$419, %edx
	leaq	__FUNCTION__.4924(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	movl	4(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$7, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	salq	$5, %rax
	addq	%rdx, %rax
	addq	$16, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %ecx
	movl	-36(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	set_next_state
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$7, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	salq	$5, %rax
	addq	%rdx, %rax
	addq	$24, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L182
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$7, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	salq	$5, %rax
	addq	%rdx, %rax
	addq	$24, %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*%rdx
	jmp	.L186
.L182:
	leaq	.LC46(%rip), %rdi
	call	puts@PLT
	jmp	.L186
.L181:
	movl	$428, %edx
	leaq	__FUNCTION__.4924(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	movl	4(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$7, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	salq	$5, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %ecx
	movl	-36(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	set_next_state
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$7, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	salq	$5, %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L185
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$7, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	salq	$5, %rax
	addq	%rdx, %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	*%rdx
	jmp	.L186
.L185:
	leaq	.LC47(%rip), %rdi
	call	puts@PLT
.L186:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	get_state_action, .-get_state_action
	.section	.rodata
	.align 8
.LC48:
	.string	"%s current_state=%s, event = %s, reject = %d\n"
	.text
	.globl	change_state
	.type	change_state, @function
change_state:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$248, %rsp
	.cfi_offset 3, -24
	movl	%edi, -244(%rbp)
	movq	%rsi, -256(%rbp)
	movl	%edx, -248(%rbp)
	movq	%rcx, -168(%rbp)
	movq	%r8, -160(%rbp)
	movq	%r9, -152(%rbp)
	testb	%al, %al
	je	.L188
	movaps	%xmm0, -144(%rbp)
	movaps	%xmm1, -128(%rbp)
	movaps	%xmm2, -112(%rbp)
	movaps	%xmm3, -96(%rbp)
	movaps	%xmm4, -80(%rbp)
	movaps	%xmm5, -64(%rbp)
	movaps	%xmm6, -48(%rbp)
	movaps	%xmm7, -32(%rbp)
.L188:
	movq	%fs:40, %rax
	movq	%rax, -200(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -256(%rbp)
	jne	.L189
	leaq	__PRETTY_FUNCTION__.4931(%rip), %rcx
	movl	$441, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L189:
	movl	$0, -236(%rbp)
	movq	$0, -232(%rbp)
	movl	$24, -224(%rbp)
	movl	$48, -220(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -216(%rbp)
	leaq	-192(%rbp), %rax
	movq	%rax, -208(%rbp)
	movl	-224(%rbp), %eax
	cmpl	$47, %eax
	ja	.L190
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L191
.L190:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L191:
	movl	(%rax), %eax
	movl	%eax, -236(%rbp)
	movl	-224(%rbp), %eax
	cmpl	$47, %eax
	ja	.L192
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L193
.L192:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L193:
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	movl	-248(%rbp), %eax
	movl	%eax, %edi
	call	dump_G_event
	movq	%rax, %rbx
	movq	-256(%rbp), %rax
	movl	92(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %rdx
	movl	-236(%rbp), %eax
	movl	%eax, %r8d
	movq	%rbx, %rcx
	leaq	__FUNCTION__.4935(%rip), %rsi
	leaq	.LC48(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -244(%rbp)
	je	.L194
	cmpl	$0, -244(%rbp)
	je	.L195
	cmpl	$2, -244(%rbp)
	je	.L196
	cmpl	$3, -244(%rbp)
	je	.L197
	jmp	.L198
.L195:
	cmpl	$0, -236(%rbp)
	setne	%al
	movzbl	%al, %edx
	movq	-256(%rbp), %rax
	leaq	88(%rax), %rsi
	movq	-232(%rbp), %rdi
	movq	-256(%rbp), %rcx
	movl	-248(%rbp), %eax
	movq	%rdi, %r9
	movq	%rcx, %r8
	movl	%edx, %ecx
	movl	%eax, %edx
	leaq	state_matrix(%rip), %rdi
	call	get_state_action
.L194:
	cmpl	$0, -236(%rbp)
	setne	%al
	movzbl	%al, %ecx
	movq	-256(%rbp), %rax
	movq	72(%rax), %rax
	movq	8(%rax), %rax
	movq	32(%rax), %rax
	movq	-232(%rbp), %rdi
	movq	-256(%rbp), %rsi
	movl	-248(%rbp), %edx
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	basic_state_matrix(%rip), %rdi
	call	get_state_action
	jmp	.L198
.L196:
	cmpl	$0, -236(%rbp)
	setne	%al
	movzbl	%al, %ecx
	movq	-256(%rbp), %rax
	movq	112(%rax), %rax
	movq	-232(%rbp), %rdi
	movq	-256(%rbp), %rsi
	movl	-248(%rbp), %edx
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	reception_state_matrix(%rip), %rdi
	call	get_state_action
	jmp	.L198
.L197:
	cmpl	$0, -236(%rbp)
	setne	%al
	movzbl	%al, %ecx
	movq	-256(%rbp), %rax
	movq	72(%rax), %rax
	movq	8(%rax), %rax
	movq	40(%rax), %rax
	movq	-232(%rbp), %rdi
	movq	-256(%rbp), %rsi
	movl	-248(%rbp), %edx
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	basic_reception_state_matrix(%rip), %rdi
	call	get_state_action
	nop
.L198:
	movl	$0, %eax
	movq	-200(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L200
	call	__stack_chk_fail@PLT
.L200:
	addq	$248, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	change_state, .-change_state
	.section	.rodata
.LC49:
	.string	"new participant is allocated"
	.text
	.globl	allocate_participant
	.type	allocate_participant, @function
allocate_participant:
.LFB40:
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
	movl	$48, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movzbl	-24(%rbp), %edx
	movb	%dl, 12(%rax)
	leaq	.LC49(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	allocate_participant, .-allocate_participant
	.section	.rodata
	.align 8
.LC50:
	.string	"new session=%d is allocated, participants=%d\n"
	.text
	.globl	allocate_session
	.type	allocate_session, @function
allocate_session:
.LFB41:
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
	movq	%rdx, 72(%rax)
	movl	$0, %esi
	movl	$1, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$72, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	append_node@PLT
	movl	$0, %esi
	movl	$2, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$72, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	append_node@PLT
	movl	$1, %esi
	movl	$3, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$72, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	append_node@PLT
	movq	-8(%rbp), %rax
	movq	72(%rax), %rax
	movl	(%rax), %edx
	movl	nb_session(%rip), %eax
	movl	%eax, %esi
	leaq	.LC50(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	nb_session(%rip), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	cmpq	$0, -24(%rbp)
	je	.L204
	movl	nb_session(%rip), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
.L204:
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
.LFE41:
	.size	allocate_session, .-allocate_session
	.section	.rodata
.LC51:
	.string	"invite"
.LC52:
	.string	"\n.session_idx = [0--%d]\n"
.LC53:
	.string	"%d"
.LC54:
	.string	"invite on existing session %d"
.LC55:
	.string	"from client?"
.LC56:
	.string	"confirmed is required"
	.text
	.globl	recv_invite
	.type	recv_invite, @function
recv_invite:
.LFB42:
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
	movl	$489, %edx
	leaq	__FUNCTION__.4955(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpq	$0, -40(%rbp)
	jne	.L207
	leaq	__PRETTY_FUNCTION__.4956(%rip), %rcx
	movl	$490, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC51(%rip), %rdi
	call	__assert_fail@PLT
.L207:
	movl	nb_session(%rip), %eax
	movl	%eax, %esi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L208
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %esi
	leaq	.LC54(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-40(%rbp), %rax
	movzbl	4(%rax), %eax
	testb	%al, %al
	je	.L209
	leaq	.LC55(%rip), %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-16(%rbp), %rax
	movq	72(%rax), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L210
	movq	-16(%rbp), %rax
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L206
.L210:
	movq	-16(%rbp), %rax
	movq	72(%rax), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L206
.L208:
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L213
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	allocate_session
	movq	%rax, -16(%rbp)
	jmp	.L214
.L213:
	movl	$517, %esi
	leaq	__FUNCTION__.4955(%rip), %rdi
	call	err
.L214:
	movzbl	configuration(%rip), %eax
	testb	%al, %al
	je	.L209
	leaq	.LC56(%rip), %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	movzbl	2(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L209
	movq	-16(%rbp), %rax
	movl	$5, 92(%rax)
	jmp	.L206
.L209:
	movq	-40(%rbp), %rax
	movzbl	2(%rax), %eax
	testb	%al, %al
	je	.L215
	movl	$531, %edx
	leaq	__FUNCTION__.4955(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L206
.L215:
	movzbl	1+configuration(%rip), %eax
	testb	%al, %al
	je	.L217
	movl	$539, %edx
	leaq	__FUNCTION__.4955(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L206
.L217:
	movl	$542, %edx
	leaq	__FUNCTION__.4955(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
.L206:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L219
	call	__stack_chk_fail@PLT
.L219:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE42:
	.size	recv_invite, .-recv_invite
	.section	.rodata
	.align 8
.LC57:
	.string	" 200 OK on exisiting participant, basic = %p"
.LC58:
	.string	"some_ssrc"
	.align 8
.LC59:
	.string	"200 on no participant, invalid case, discard "
	.text
	.globl	recv_200
	.type	recv_200, @function
recv_200:
.LFB43:
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
	jne	.L221
	leaq	__PRETTY_FUNCTION__.4965(%rip), %rcx
	movl	$552, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L221:
	movzbl	configuration(%rip), %eax
	testb	%al, %al
	je	.L222
	movq	-16(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	check_G_state
	testb	%al, %al
	je	.L222
	movq	-16(%rbp), %rax
	addq	$88, %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	set_next_state
.L222:
	movq	-16(%rbp), %rax
	movq	72(%rax), %rax
	leaq	-24(%rbp), %rcx
	leaq	search_callee_by_idx(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	search_first_node_dynamic@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L223
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC57(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC58(%rip), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L225
	movl	$24, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movzbl	4(%rax), %eax
	testb	%al, %al
	je	.L225
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L225
.L223:
	leaq	.LC59(%rip), %rdi
	call	puts@PLT
.L225:
	movzbl	1+configuration(%rip), %eax
	testb	%al, %al
	je	.L228
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	nop
.L228:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE43:
	.size	recv_200, .-recv_200
	.section	.rodata
.LC60:
	.string	"\n.session_idx = "
.LC61:
	.string	"\n.callee_idx = "
	.text
	.globl	eventFromSCU
	.type	eventFromSCU, @function
eventFromSCU:
.LFB44:
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
	movl	$585, %edx
	leaq	__FUNCTION__.4970(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$4, -44(%rbp)
	ja	.L241
	movl	-44(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L232(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L232(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L232:
	.long	.L236-.L232
	.long	.L235-.L232
	.long	.L234-.L232
	.long	.L233-.L232
	.long	.L231-.L232
	.text
.L236:
	movl	$16, %edi
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
	jmp	.L237
.L235:
	leaq	.LC60(%rip), %rdi
	call	puts@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC61(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-48(%rbp), %edx
	movl	-52(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	recv_200
	jmp	.L237
.L234:
	movl	$16, %edi
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
	jmp	.L237
.L233:
	leaq	.LC60(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpq	$0, -24(%rbp)
	jne	.L238
	leaq	__PRETTY_FUNCTION__.4983(%rip), %rcx
	movl	$628, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L238:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$12, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L237
.L231:
	leaq	.LC60(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpq	$0, -16(%rbp)
	jne	.L239
	leaq	__PRETTY_FUNCTION__.4983(%rip), %rcx
	movl	$640, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L239:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$13, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L237
.L241:
	nop
.L237:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L240
	call	__stack_chk_fail@PLT
.L240:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE44:
	.size	eventFromSCU, .-eventFromSCU
	.section	.rodata
.LC62:
	.string	"\n.RTP from callee_idx = "
	.align 8
.LC63:
	.string	"invalid RTP? -- case never happen"
	.text
	.globl	eventMDF
	.type	eventMDF, @function
eventMDF:
.LFB45:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-88(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -76(%rbp)
	movl	$652, %edx
	leaq	__FUNCTION__.4993(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$0, -76(%rbp)
	jne	.L249
	leaq	.LC60(%rip), %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC62(%rip), %rdi
	call	puts@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L244
	leaq	__PRETTY_FUNCTION__.4999(%rip), %rcx
	movl	$665, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L244:
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jne	.L245
	leaq	.LC63(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L247
.L245:
	movq	-72(%rbp), %rax
	movl	$14, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	jmp	.L247
.L249:
	nop
.L247:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L248
	call	__stack_chk_fail@PLT
.L248:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE45:
	.size	eventMDF, .-eventMDF
	.globl	eventRTCP
	.type	eventRTCP, @function
eventRTCP:
.LFB46:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-88(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -76(%rbp)
	movl	$684, %edx
	leaq	__FUNCTION__.5010(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC60(%rip), %rdi
	call	puts@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC61(%rip), %rdi
	call	puts@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-80(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L251
	leaq	__PRETTY_FUNCTION__.5011(%rip), %rcx
	movl	$691, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
.L251:
	cmpl	$0, -76(%rbp)
	je	.L252
	cmpl	$1, -76(%rbp)
	je	.L253
	jmp	.L255
.L252:
	leaq	-64(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	recv_TM_request
	jmp	.L255
.L253:
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	leal	-1(%rax), %edx
	movq	-72(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_TM_end_resp
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	mdf_to_do_sth
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	testl	%eax, %eax
	jg	.L256
	movq	-72(%rbp), %rax
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	pushq	-40(%rbp)
	pushq	-48(%rbp)
	pushq	-56(%rbp)
	pushq	-64(%rbp)
	movl	$1, %ecx
	movl	$10, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
	addq	$48, %rsp
	jmp	.L259
.L256:
	movq	-72(%rbp), %rax
	movl	$10, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	change_state
.L259:
	nop
.L255:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L258
	call	__stack_chk_fail@PLT
.L258:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE46:
	.size	eventRTCP, .-eventRTCP
	.section	.rodata
	.align 8
.LC64:
	.string	"\n\n\n.event = [0 (SCU), 1 (RTCP), 2 (CONFIGURATION), 3 (MDF), 100 (EXIT)]"
	.align 8
.LC65:
	.string	"\n.event from SCU = [0 (INVITE), 1 (200 OK), 2 (IMPLICIT_INVITE), 3 (BYE), 4 (BYE_200 OK)]"
	.align 8
.LC66:
	.string	"\n.event RTCP = [0 (recv TM request), 1 (recv TM End request)]"
	.align 8
.LC67:
	.string	"\n.Set is_confirmed_indication = [0, 1]"
	.align 8
.LC68:
	.string	"\n.Set is_granting_implicit_on_established = [0, 1]"
.LC69:
	.string	"\n.event from MDF = [0 (RTP)]"
	.text
	.globl	main
	.type	main, @function
main:
.LFB47:
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
.L268:
	leaq	.LC64(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L261
	cmpl	$1, %eax
	jg	.L262
	testl	%eax, %eax
	je	.L263
	jmp	.L267
.L262:
	cmpl	$2, %eax
	je	.L265
	cmpl	$3, %eax
	je	.L266
	jmp	.L267
.L263:
	leaq	.LC65(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	call	eventFromSCU
	jmp	.L267
.L261:
	leaq	.LC66(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	call	eventRTCP
	jmp	.L267
.L265:
	leaq	.LC67(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, configuration(%rip)
	leaq	.LC68(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, 1+configuration(%rip)
	jmp	.L267
.L266:
	leaq	.LC69(%rip), %rdi
	call	puts@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC53(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	call	eventMDF
	nop
.L267:
	movl	-12(%rbp), %eax
	cmpl	$100, %eax
	jne	.L268
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L270
	call	__stack_chk_fail@PLT
.L270:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE47:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.4728, @object
	.size	__PRETTY_FUNCTION__.4728, 9
__PRETTY_FUNCTION__.4728:
	.string	"my_alloc"
	.align 8
	.type	__PRETTY_FUNCTION__.4764, @object
	.size	__PRETTY_FUNCTION__.4764, 14
__PRETTY_FUNCTION__.4764:
	.string	"check_G_state"
	.align 8
	.type	__FUNCTION__.4773, @object
	.size	__FUNCTION__.4773, 12
__FUNCTION__.4773:
	.string	"start_timer"
	.align 8
	.type	__FUNCTION__.4781, @object
	.size	__FUNCTION__.4781, 11
__FUNCTION__.4781:
	.string	"stop_timer"
	.align 8
	.type	__FUNCTION__.4790, @object
	.size	__FUNCTION__.4790, 13
__FUNCTION__.4790:
	.string	"expire_timer"
	.align 8
	.type	__PRETTY_FUNCTION__.4800, @object
	.size	__PRETTY_FUNCTION__.4800, 14
__PRETTY_FUNCTION__.4800:
	.string	"push_TM_queue"
	.align 8
	.type	__FUNCTION__.4801, @object
	.size	__FUNCTION__.4801, 14
__FUNCTION__.4801:
	.string	"push_TM_queue"
	.align 8
	.type	__PRETTY_FUNCTION__.4807, @object
	.size	__PRETTY_FUNCTION__.4807, 13
__PRETTY_FUNCTION__.4807:
	.string	"send_TM_idle"
	.align 8
	.type	__PRETTY_FUNCTION__.4812, @object
	.size	__PRETTY_FUNCTION__.4812, 14
__PRETTY_FUNCTION__.4812:
	.string	"send_TM_grant"
	.align 16
	.type	__PRETTY_FUNCTION__.4817, @object
	.size	__PRETTY_FUNCTION__.4817, 21
__PRETTY_FUNCTION__.4817:
	.string	"send_TM_media_notify"
	.align 16
	.type	__PRETTY_FUNCTION__.4822, @object
	.size	__PRETTY_FUNCTION__.4822, 23
__PRETTY_FUNCTION__.4822:
	.string	"send_TM_queue_position"
	.align 8
	.type	__PRETTY_FUNCTION__.4827, @object
	.size	__PRETTY_FUNCTION__.4827, 15
__PRETTY_FUNCTION__.4827:
	.string	"send_TM_revoke"
	.align 16
	.type	__PRETTY_FUNCTION__.4832, @object
	.size	__PRETTY_FUNCTION__.4832, 17
__PRETTY_FUNCTION__.4832:
	.string	"send_TM_end_resp"
	.align 16
	.type	__PRETTY_FUNCTION__.4838, @object
	.size	__PRETTY_FUNCTION__.4838, 16
__PRETTY_FUNCTION__.4838:
	.string	"recv_TM_request"
	.align 16
	.type	__FUNCTION__.4842, @object
	.size	__FUNCTION__.4842, 16
__FUNCTION__.4842:
	.string	"recv_TM_request"
	.align 8
	.type	__PRETTY_FUNCTION__.4848, @object
	.size	__PRETTY_FUNCTION__.4848, 14
__PRETTY_FUNCTION__.4848:
	.string	"mdf_to_do_sth"
	.align 8
	.type	__PRETTY_FUNCTION__.4853, @object
	.size	__PRETTY_FUNCTION__.4853, 10
__PRETTY_FUNCTION__.4853:
	.string	"send_idle"
	.align 8
	.type	__PRETTY_FUNCTION__.4858, @object
	.size	__PRETTY_FUNCTION__.4858, 11
__PRETTY_FUNCTION__.4858:
	.string	"send_grant"
	.align 8
	.type	__PRETTY_FUNCTION__.4863, @object
	.size	__PRETTY_FUNCTION__.4863, 12
__PRETTY_FUNCTION__.4863:
	.string	"send_revoke"
	.align 8
	.type	__PRETTY_FUNCTION__.4868, @object
	.size	__PRETTY_FUNCTION__.4868, 12
__PRETTY_FUNCTION__.4868:
	.string	"forward_rtp"
	.align 8
	.type	__PRETTY_FUNCTION__.4873, @object
	.size	__PRETTY_FUNCTION__.4873, 15
__PRETTY_FUNCTION__.4873:
	.string	"after_end_resp"
	.align 8
	.type	__PRETTY_FUNCTION__.4878, @object
	.size	__PRETTY_FUNCTION__.4878, 15
__PRETTY_FUNCTION__.4878:
	.string	"clean_up_queue"
	.align 8
	.type	__FUNCTION__.4882, @object
	.size	__FUNCTION__.4882, 11
__FUNCTION__.4882:
	.string	"retry_idle"
	.align 8
	.type	__FUNCTION__.4886, @object
	.size	__FUNCTION__.4886, 11
__FUNCTION__.4886:
	.string	"do_nothing"
	.align 8
	.type	__FUNCTION__.4890, @object
	.size	__FUNCTION__.4890, 13
__FUNCTION__.4890:
	.string	"send_TM_deny"
	.align 8
	.type	__FUNCTION__.4894, @object
	.size	__FUNCTION__.4894, 12
__FUNCTION__.4894:
	.string	"send_reject"
	.align 8
	.type	__PRETTY_FUNCTION__.4899, @object
	.size	__PRETTY_FUNCTION__.4899, 14
__PRETTY_FUNCTION__.4899:
	.string	"transit_state"
	.align 8
	.type	__FUNCTION__.4903, @object
	.size	__FUNCTION__.4903, 14
__FUNCTION__.4903:
	.string	"transit_state"
	.align 8
	.type	__PRETTY_FUNCTION__.4914, @object
	.size	__PRETTY_FUNCTION__.4914, 15
__PRETTY_FUNCTION__.4914:
	.string	"set_next_state"
	.align 16
	.type	__FUNCTION__.4924, @object
	.size	__FUNCTION__.4924, 17
__FUNCTION__.4924:
	.string	"get_state_action"
	.align 8
	.type	__PRETTY_FUNCTION__.4931, @object
	.size	__PRETTY_FUNCTION__.4931, 13
__PRETTY_FUNCTION__.4931:
	.string	"change_state"
	.align 8
	.type	__FUNCTION__.4935, @object
	.size	__FUNCTION__.4935, 13
__FUNCTION__.4935:
	.string	"change_state"
	.align 8
	.type	__FUNCTION__.4955, @object
	.size	__FUNCTION__.4955, 12
__FUNCTION__.4955:
	.string	"recv_invite"
	.align 8
	.type	__PRETTY_FUNCTION__.4956, @object
	.size	__PRETTY_FUNCTION__.4956, 12
__PRETTY_FUNCTION__.4956:
	.string	"recv_invite"
	.align 8
	.type	__PRETTY_FUNCTION__.4965, @object
	.size	__PRETTY_FUNCTION__.4965, 9
__PRETTY_FUNCTION__.4965:
	.string	"recv_200"
	.align 8
	.type	__FUNCTION__.4970, @object
	.size	__FUNCTION__.4970, 13
__FUNCTION__.4970:
	.string	"eventFromSCU"
	.align 8
	.type	__PRETTY_FUNCTION__.4983, @object
	.size	__PRETTY_FUNCTION__.4983, 13
__PRETTY_FUNCTION__.4983:
	.string	"eventFromSCU"
	.align 8
	.type	__FUNCTION__.4993, @object
	.size	__FUNCTION__.4993, 9
__FUNCTION__.4993:
	.string	"eventMDF"
	.align 8
	.type	__PRETTY_FUNCTION__.4999, @object
	.size	__PRETTY_FUNCTION__.4999, 9
__PRETTY_FUNCTION__.4999:
	.string	"eventMDF"
	.align 8
	.type	__FUNCTION__.5010, @object
	.size	__FUNCTION__.5010, 10
__FUNCTION__.5010:
	.string	"eventRTCP"
	.align 8
	.type	__PRETTY_FUNCTION__.5011, @object
	.size	__PRETTY_FUNCTION__.5011, 10
__PRETTY_FUNCTION__.5011:
	.string	"eventRTCP"
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
