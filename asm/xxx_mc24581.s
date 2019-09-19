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
	leaq	__PRETTY_FUNCTION__.4337(%rip), %rcx
	movl	$48, %edx
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
	.globl	dump_G_state
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
	.string	"G_EVT_CLIENT_RELEASE"
.LC24:
	.string	"G_EVT_RTP"
	.text
	.globl	dump_G_event
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
	cmpl	$12, -4(%rbp)
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
	.long	.L21-.L19
	.long	.L20-.L19
	.long	.L18-.L19
	.text
.L31:
	leaq	.LC12(%rip), %rax
	jmp	.L32
.L30:
	leaq	.LC13(%rip), %rax
	jmp	.L32
.L29:
	leaq	.LC14(%rip), %rax
	jmp	.L32
.L28:
	leaq	.LC15(%rip), %rax
	jmp	.L32
.L27:
	leaq	.LC16(%rip), %rax
	jmp	.L32
.L26:
	leaq	.LC17(%rip), %rax
	jmp	.L32
.L25:
	leaq	.LC18(%rip), %rax
	jmp	.L32
.L24:
	leaq	.LC19(%rip), %rax
	jmp	.L32
.L23:
	leaq	.LC20(%rip), %rax
	jmp	.L32
.L22:
	leaq	.LC21(%rip), %rax
	jmp	.L32
.L21:
	leaq	.LC22(%rip), %rax
	jmp	.L32
.L20:
	leaq	.LC23(%rip), %rax
	jmp	.L32
.L18:
	leaq	.LC24(%rip), %rax
	jmp	.L32
.L17:
	leaq	.LC11(%rip), %rax
.L32:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	dump_G_event, .-dump_G_event
	.section	.rodata
.LC25:
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
	jne	.L34
	leaq	__PRETTY_FUNCTION__.4372(%rip), %rcx
	movl	$112, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L34:
	movq	-8(%rbp), %rax
	movl	64(%rax), %eax
	andl	-12(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	sete	%al
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	check_G_state, .-check_G_state
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
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L37
	cmpq	$0, -32(%rbp)
	je	.L37
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	sete	%al
	jmp	.L38
.L37:
	movl	$0, %eax
.L38:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	search_callee_by_idx, .-search_callee_by_idx
	.section	.rodata
.LC26:
	.string	"%s %d"
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
	leaq	__FUNCTION__.4381(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -4(%rbp)
	je	.L44
	cmpl	$2, -4(%rbp)
	je	.L45
	jmp	.L43
.L44:
	nop
	jmp	.L43
.L45:
	nop
.L43:
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
	leaq	__FUNCTION__.4389(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -4(%rbp)
	je	.L51
	cmpl	$2, -4(%rbp)
	je	.L52
	jmp	.L50
.L51:
	nop
	jmp	.L50
.L52:
	nop
.L50:
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
	leaq	__FUNCTION__.4398(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -20(%rbp)
	je	.L58
	cmpl	$2, -20(%rbp)
	je	.L55
	jmp	.L57
.L58:
	movq	-8(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L57
.L55:
	movq	-8(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	nop
.L57:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	expire_timer, .-expire_timer
	.section	.rodata
	.align 8
.LC27:
	.string	"for each participants sending TM_IDLE --depending on basic & reception states "
	.text
	.globl	send_TM_idles
	.type	send_TM_idles, @function
send_TM_idles:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L60
	leaq	__PRETTY_FUNCTION__.4406(%rip), %rcx
	movl	$172, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L60:
	leaq	.LC27(%rip), %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	send_TM_idles, .-send_TM_idles
	.section	.rodata
.LC28:
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
	leaq	.LC28(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	pop_TM_queue, .-pop_TM_queue
	.section	.rodata
.LC29:
	.string	"!session"
	.text
	.globl	push_TM_queue
	.type	push_TM_queue, @function
push_TM_queue:
.LFB18:
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
	je	.L63
	leaq	__PRETTY_FUNCTION__.4414(%rip), %rcx
	movl	$183, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC29(%rip), %rdi
	call	__assert_fail@PLT
.L63:
	movl	$40, %edi
	call	my_alloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	leaq	104(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	append_node@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	push_TM_queue, .-push_TM_queue
	.globl	send_idle
	.type	send_idle, @function
send_idle:
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
	je	.L70
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L70:
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	.L66
	leaq	__PRETTY_FUNCTION__.4419(%rip), %rcx
	movl	$198, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L66:
	movq	-184(%rbp), %rax
	movq	104(%rax), %rax
	testq	%rax, %rax
	je	.L67
	movl	$0, %eax
	call	pop_TM_queue
	jmp	.L68
.L67:
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	send_TM_idles
	movq	-184(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-184(%rbp), %rax
	movl	$0, 4(%rax)
	movl	$1, %edi
	call	start_timer
	movl	$2, %edi
	call	start_timer
.L68:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	send_idle, .-send_idle
	.section	.rodata
.LC30:
	.string	"%s %d\n"
.LC31:
	.string	"from %d\n"
.LC32:
	.string	"participant is found"
	.align 8
.LC33:
	.string	"participant is not found, invalid, discard"
	.text
	.globl	recv_TM_request
	.type	recv_TM_request, @function
recv_TM_request:
.LFB20:
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
	je	.L72
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L72:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movq	-248(%rbp), %rax
	movq	%rax, -240(%rbp)
	movq	$0, -232(%rbp)
	cmpq	$0, -240(%rbp)
	jne	.L73
	leaq	__PRETTY_FUNCTION__.4425(%rip), %rcx
	movl	$218, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L73:
	movq	$0, -224(%rbp)
	movq	$0, -216(%rbp)
	movl	$8, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L74
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L75
.L74:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L75:
	movq	(%rax), %rax
	movq	%rax, -224(%rbp)
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L76
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L77
.L76:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L77:
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
	movl	$222, %edx
	leaq	__FUNCTION__.4429(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-224(%rbp), %rax
	movq	%rax, -232(%rbp)
	movq	-232(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %esi
	leaq	.LC31(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-232(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	-240(%rbp), %rax
	movq	96(%rax), %rax
	leaq	search_callee_by_idx(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	search_first_node_dynamic@PLT
	movq	%rax, -232(%rbp)
	cmpq	$0, -232(%rbp)
	je	.L78
	leaq	.LC32(%rip), %rdi
	call	puts@PLT
	jmp	.L79
.L78:
	leaq	.LC33(%rip), %rdi
	call	puts@PLT
.L79:
	movl	$0, %eax
	movq	-184(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L81
	call	__stack_chk_fail@PLT
.L81:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	recv_TM_request, .-recv_TM_request
	.globl	retry_idle
	.type	retry_idle, @function
retry_idle:
.LFB21:
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
	je	.L85
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L85:
	leaq	__FUNCTION__.4433(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	retry_idle, .-retry_idle
	.globl	send_granted
	.type	send_granted, @function
send_granted:
.LFB22:
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
	leaq	__FUNCTION__.4437(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	send_granted, .-send_granted
	.globl	send_revoke
	.type	send_revoke, @function
send_revoke:
.LFB23:
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
	je	.L93
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L93:
	leaq	__FUNCTION__.4441(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	send_revoke, .-send_revoke
	.globl	do_nothing
	.type	do_nothing, @function
do_nothing:
.LFB24:
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
	je	.L97
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L97:
	leaq	__FUNCTION__.4445(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	do_nothing, .-do_nothing
	.globl	send_TM_end_resp
	.type	send_TM_end_resp, @function
send_TM_end_resp:
.LFB25:
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
	je	.L101
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L101:
	leaq	__FUNCTION__.4449(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	send_TM_end_resp, .-send_TM_end_resp
	.globl	send_TM_deny
	.type	send_TM_deny, @function
send_TM_deny:
.LFB26:
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
	je	.L105
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L105:
	leaq	__FUNCTION__.4453(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	send_TM_deny, .-send_TM_deny
	.globl	send_TM_grant
	.type	send_TM_grant, @function
send_TM_grant:
.LFB27:
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
	je	.L109
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L109:
	leaq	__FUNCTION__.4457(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	send_TM_grant, .-send_TM_grant
	.globl	send_reject
	.type	send_reject, @function
send_reject:
.LFB28:
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
	je	.L113
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L113:
	leaq	__FUNCTION__.4461(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	send_reject, .-send_reject
	.globl	transit_state
	.type	transit_state, @function
transit_state:
.LFB29:
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
	je	.L115
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L115:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movq	-248(%rbp), %rax
	movq	%rax, -224(%rbp)
	cmpq	$0, -224(%rbp)
	jne	.L116
	leaq	__PRETTY_FUNCTION__.4466(%rip), %rcx
	movl	$250, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L116:
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
	ja	.L117
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L118
.L117:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L118:
	movl	(%rax), %eax
	movl	%eax, -228(%rbp)
	movl	-208(%rbp), %eax
	cmpl	$47, %eax
	ja	.L119
	movq	-192(%rbp), %rax
	movl	-208(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-208(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -208(%rbp)
	jmp	.L120
.L119:
	movq	-200(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -200(%rbp)
.L120:
	movq	(%rax), %rax
	movq	%rax, -216(%rbp)
	movl	$253, %edx
	leaq	__FUNCTION__.4470(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-224(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	$1, %eax
	je	.L121
	cmpl	$2, %eax
	je	.L122
	jmp	.L127
.L121:
	movl	$256, %edx
	leaq	__FUNCTION__.4470(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-224(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	send_idle
	jmp	.L124
.L122:
	movl	$261, %edx
	leaq	__FUNCTION__.4470(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	stop_timer
	movl	$2, %edi
	call	stop_timer
	movl	$0, %edi
	movl	$0, %eax
	call	send_granted
	jmp	.L124
.L127:
	movl	$268, %edx
	leaq	__FUNCTION__.4470(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
.L124:
	movl	$0, %eax
	movq	-184(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L126
	call	__stack_chk_fail@PLT
.L126:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	transit_state, .-transit_state
	.section	.rodata
	.align 8
.LC34:
	.string	"G_state changes from %s to %s\n"
.LC35:
	.string	"G_state remains at %s\n"
	.text
	.globl	manual_change_state
	.type	manual_change_state, @function
manual_change_state:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L129
	leaq	__PRETTY_FUNCTION__.4480(%rip), %rcx
	movl	$275, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L129:
	movq	-24(%rbp), %rax
	movl	64(%rax), %eax
	cmpl	%eax, -28(%rbp)
	je	.L130
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movl	64(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rbx, %rdx
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	64(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 68(%rax)
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 64(%rax)
	movq	-24(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, 72(%rax)
	jmp	.L132
.L130:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L132:
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	manual_change_state, .-manual_change_state
	.section	.rodata
	.align 8
.LC36:
	.string	"%s current_state=%s, event = %s, reject = %d\n"
.LC37:
	.string	"empty reject action"
.LC38:
	.string	"empty accept action"
	.text
	.globl	change_state
	.type	change_state, @function
change_state:
.LFB31:
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
	je	.L134
	movaps	%xmm0, -144(%rbp)
	movaps	%xmm1, -128(%rbp)
	movaps	%xmm2, -112(%rbp)
	movaps	%xmm3, -96(%rbp)
	movaps	%xmm4, -80(%rbp)
	movaps	%xmm5, -64(%rbp)
	movaps	%xmm6, -48(%rbp)
	movaps	%xmm7, -32(%rbp)
.L134:
	movq	%fs:40, %rax
	movq	%rax, -200(%rbp)
	xorl	%eax, %eax
	movq	-264(%rbp), %rax
	movq	%rax, -240(%rbp)
	cmpq	$0, -240(%rbp)
	jne	.L135
	leaq	__PRETTY_FUNCTION__.4487(%rip), %rcx
	movl	$292, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L135:
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
	ja	.L136
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L137
.L136:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L137:
	movl	(%rax), %eax
	movl	%eax, -248(%rbp)
	movl	-224(%rbp), %eax
	cmpl	$47, %eax
	ja	.L138
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L139
.L138:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L139:
	movq	(%rax), %rax
	movq	%rax, -232(%rbp)
	movl	-268(%rbp), %eax
	movl	%eax, %edi
	call	dump_G_event
	movq	%rax, %rbx
	movq	-240(%rbp), %rax
	movl	64(%rax), %eax
	movl	%eax, %edi
	call	dump_G_state
	movq	%rax, %rdx
	movl	-248(%rbp), %eax
	movl	%eax, %r8d
	movq	%rbx, %rcx
	leaq	__FUNCTION__.4491(%rip), %rsi
	leaq	.LC36(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$13, -268(%rbp)
	je	.L140
	cmpl	$1, -248(%rbp)
	jne	.L141
	movl	$299, %edx
	leaq	__FUNCTION__.4491(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-240(%rbp), %rax
	movl	64(%rax), %eax
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
	call	manual_change_state
	movq	-240(%rbp), %rax
	movl	68(%rax), %eax
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
	je	.L142
	movq	-240(%rbp), %rax
	movl	68(%rax), %eax
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
	jmp	.L146
.L142:
	leaq	.LC37(%rip), %rdi
	call	puts@PLT
	jmp	.L146
.L141:
	movl	$308, %edx
	leaq	__FUNCTION__.4491(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-240(%rbp), %rax
	movl	64(%rax), %eax
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
	call	manual_change_state
	movq	-240(%rbp), %rax
	movl	68(%rax), %eax
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
	je	.L145
	movq	-240(%rbp), %rax
	movl	68(%rax), %eax
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
	jmp	.L146
.L145:
	leaq	.LC38(%rip), %rdi
	call	puts@PLT
	jmp	.L146
.L140:
	movl	$318, %esi
	leaq	__FUNCTION__.4491(%rip), %rdi
	call	err
.L146:
	movl	$0, %eax
	movq	-200(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L148
	call	__stack_chk_fail@PLT
.L148:
	addq	$264, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	change_state, .-change_state
	.section	.rodata
.LC39:
	.string	"new participant is allocated"
	.text
	.globl	allocate_participant
	.type	allocate_participant, @function
allocate_participant:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$40, %edi
	call	my_alloc
	movq	%rax, -8(%rbp)
	movl	$32, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 8(%rax)
	leaq	.LC39(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	allocate_participant, .-allocate_participant
	.section	.rodata
	.align 8
.LC40:
	.string	"new session=%d is allocated, participants=%d\n"
	.text
	.globl	allocate_session
	.type	allocate_session, @function
allocate_session:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$112, %edi
	call	my_alloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movl	$0, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 96(%rax)
	movl	$1, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$96, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	append_node@PLT
	movl	$2, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$96, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	append_node@PLT
	movl	$3, %edi
	call	allocate_participant
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$96, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	append_node@PLT
	movq	-8(%rbp), %rax
	movq	96(%rax), %rax
	movl	(%rax), %edx
	movl	nb_session(%rip), %eax
	movl	%eax, %esi
	leaq	.LC40(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpq	$0, -24(%rbp)
	je	.L152
	movl	nb_session(%rip), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 4(%rax)
.L152:
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
.LFE33:
	.size	allocate_session, .-allocate_session
	.section	.rodata
.LC41:
	.string	"invite"
.LC42:
	.string	"\n.session_idx = [0--%d]\n"
.LC43:
	.string	"%d"
.LC44:
	.string	"invite on existing session %d"
.LC45:
	.string	"confirmed is required"
	.text
	.globl	recv_invite
	.type	recv_invite, @function
recv_invite:
.LFB34:
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
	movq	$0, -56(%rbp)
	movl	$349, %edx
	leaq	__FUNCTION__.4505(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpq	$0, -72(%rbp)
	jne	.L155
	leaq	__PRETTY_FUNCTION__.4506(%rip), %rcx
	movl	$350, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC41(%rip), %rdi
	call	__assert_fail@PLT
.L155:
	movl	nb_session(%rip), %eax
	movl	%eax, %esi
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-60(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L156
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %esi
	leaq	.LC44(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-72(%rbp), %rax
	movzbl	3(%rax), %eax
	testb	%al, %al
	je	.L157
	movq	-56(%rbp), %rax
	movq	96(%rax), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L158
	movq	-56(%rbp), %rax
	movl	$1, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L154
.L158:
	movq	-56(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L154
.L156:
	movq	-72(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L161
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	allocate_session
	movq	%rax, -56(%rbp)
	jmp	.L162
.L161:
	movl	$372, %esi
	leaq	__FUNCTION__.4505(%rip), %rdi
	call	err
.L162:
	movzbl	configuration(%rip), %eax
	testb	%al, %al
	je	.L157
	leaq	.LC45(%rip), %rdi
	call	puts@PLT
	movq	-72(%rbp), %rax
	movzbl	2(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L157
	movq	-56(%rbp), %rax
	movl	$5, 64(%rax)
	jmp	.L154
.L157:
	movq	-72(%rbp), %rax
	movzbl	2(%rax), %eax
	testb	%al, %al
	je	.L163
	movl	$386, %edx
	leaq	__FUNCTION__.4505(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-56(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L154
.L163:
	movzbl	1+configuration(%rip), %eax
	testb	%al, %al
	je	.L165
	movl	$391, %edx
	leaq	__FUNCTION__.4505(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -40(%rbp)
	leaq	-48(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L154
.L165:
	movl	$397, %edx
	leaq	__FUNCTION__.4505(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-56(%rbp), %rax
	movl	$1, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
.L154:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L167
	call	__stack_chk_fail@PLT
.L167:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	recv_invite, .-recv_invite
	.section	.rodata
	.align 8
.LC46:
	.string	" 200 OK on exisiting participant, basic = %p"
.LC47:
	.string	"some_ssrc"
	.align 8
.LC48:
	.string	"200 on no participant, invalid case, discard "
	.text
	.globl	recv_200
	.type	recv_200, @function
recv_200:
.LFB35:
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
	jne	.L169
	leaq	__PRETTY_FUNCTION__.4514(%rip), %rcx
	movl	$407, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L169:
	movzbl	configuration(%rip), %eax
	testb	%al, %al
	je	.L170
	movq	-16(%rbp), %rax
	movl	$5, %esi
	movq	%rax, %rdi
	call	check_G_state
	testb	%al, %al
	je	.L170
	movq	-16(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	manual_change_state
.L170:
	movq	-16(%rbp), %rax
	movq	96(%rax), %rax
	leaq	-24(%rbp), %rcx
	leaq	search_callee_by_idx(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	search_first_node_dynamic@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L171
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC46(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	leaq	.LC47(%rip), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L173
	movl	$16, %edi
	call	my_alloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	jmp	.L173
.L171:
	leaq	.LC48(%rip), %rdi
	call	puts@PLT
.L173:
	movzbl	1+configuration(%rip), %eax
	testb	%al, %al
	je	.L176
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	nop
.L176:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	recv_200, .-recv_200
	.section	.rodata
.LC49:
	.string	"\n.session_idx = "
.LC50:
	.string	"\n.callee_idx = "
	.text
	.globl	eventFromSCU
	.type	eventFromSCU, @function
eventFromSCU:
.LFB36:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -28(%rbp)
	movl	$436, %edx
	leaq	__FUNCTION__.4519(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -28(%rbp)
	je	.L178
	cmpl	$2, -28(%rbp)
	je	.L179
	cmpl	$0, -28(%rbp)
	jne	.L183
	movl	$8, %edi
	call	my_alloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movb	$1, (%rax)
	movq	-24(%rbp), %rax
	movb	$1, 1(%rax)
	movq	-24(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-24(%rbp), %rax
	movb	$0, 3(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 4(%rax)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	recv_invite
	jmp	.L181
.L178:
	leaq	.LC49(%rip), %rdi
	call	puts@PLT
	leaq	-36(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC50(%rip), %rdi
	call	puts@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-32(%rbp), %edx
	movl	-36(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	recv_200
	jmp	.L181
.L179:
	movl	$8, %edi
	call	my_alloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movb	$1, (%rax)
	movq	-16(%rbp), %rax
	movb	$1, 1(%rax)
	movq	-16(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-16(%rbp), %rax
	movb	$1, 3(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 4(%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	recv_invite
	jmp	.L181
.L183:
	nop
.L181:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L182
	call	__stack_chk_fail@PLT
.L182:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	eventFromSCU, .-eventFromSCU
	.globl	eventRTCP
	.type	eventRTCP, @function
eventRTCP:
.LFB37:
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
	movl	%eax, -60(%rbp)
	movl	$479, %edx
	leaq	__FUNCTION__.4533(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$0, -60(%rbp)
	jne	.L191
	leaq	.LC49(%rip), %rdi
	call	puts@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC50(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	all_sessions(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L186
	leaq	__PRETTY_FUNCTION__.4539(%rip), %rcx
	movl	$492, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L186:
	movq	-56(%rbp), %rax
	movq	96(%rax), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L187
	movq	-56(%rbp), %rax
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	pushq	-40(%rbp)
	pushq	-48(%rbp)
	movl	$1, %edx
	movl	$7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	addq	$32, %rsp
	jmp	.L189
.L187:
	movq	-56(%rbp), %rax
	movl	$7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	change_state
	jmp	.L189
.L191:
	nop
.L189:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L190
	call	__stack_chk_fail@PLT
.L190:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	eventRTCP, .-eventRTCP
	.section	.rodata
	.align 8
.LC51:
	.string	"\n\n\n.event = [0 (SCU), 1 (MDF), 2 (CONFIGURATION), 100 (EXIT)]"
	.align 8
.LC52:
	.string	"\n.event from SCU = [0 (INVITE), 1 (200 OK), 2 (IMPLICIT_INVITE)]"
	.align 8
.LC53:
	.string	"\n.event RTCP = [0 (recv TM request)]"
	.align 8
.LC54:
	.string	"\n.Set is_confirmed_indication = [0, 1]"
	.align 8
.LC55:
	.string	"\n.Set is_granting_implicit_on_established = [0, 1]"
	.text
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -20(%rbp)
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$88, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
.L197:
	leaq	.LC51(%rip), %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	cmpl	$1, %eax
	je	.L193
	cmpl	$2, %eax
	je	.L194
	testl	%eax, %eax
	jne	.L200
	leaq	.LC52(%rip), %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rdi
	call	eventFromSCU
	jmp	.L196
.L193:
	leaq	.LC53(%rip), %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rdi
	call	eventRTCP
	jmp	.L196
.L194:
	leaq	.LC54(%rip), %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, configuration(%rip)
	leaq	.LC55(%rip), %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC43(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	testl	%eax, %eax
	setne	%al
	movb	%al, 1+configuration(%rip)
	jmp	.L196
.L200:
	nop
.L196:
	movl	-20(%rbp), %eax
	cmpl	$100, %eax
	jne	.L197
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L199
	call	__stack_chk_fail@PLT
.L199:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.4337, @object
	.size	__PRETTY_FUNCTION__.4337, 9
__PRETTY_FUNCTION__.4337:
	.string	"my_alloc"
	.align 8
	.type	__PRETTY_FUNCTION__.4372, @object
	.size	__PRETTY_FUNCTION__.4372, 14
__PRETTY_FUNCTION__.4372:
	.string	"check_G_state"
	.align 8
	.type	__FUNCTION__.4381, @object
	.size	__FUNCTION__.4381, 12
__FUNCTION__.4381:
	.string	"start_timer"
	.align 8
	.type	__FUNCTION__.4389, @object
	.size	__FUNCTION__.4389, 11
__FUNCTION__.4389:
	.string	"stop_timer"
	.align 8
	.type	__FUNCTION__.4398, @object
	.size	__FUNCTION__.4398, 13
__FUNCTION__.4398:
	.string	"expire_timer"
	.align 8
	.type	__PRETTY_FUNCTION__.4406, @object
	.size	__PRETTY_FUNCTION__.4406, 14
__PRETTY_FUNCTION__.4406:
	.string	"send_TM_idles"
	.align 8
	.type	__PRETTY_FUNCTION__.4414, @object
	.size	__PRETTY_FUNCTION__.4414, 14
__PRETTY_FUNCTION__.4414:
	.string	"push_TM_queue"
	.align 8
	.type	__PRETTY_FUNCTION__.4419, @object
	.size	__PRETTY_FUNCTION__.4419, 10
__PRETTY_FUNCTION__.4419:
	.string	"send_idle"
	.align 16
	.type	__PRETTY_FUNCTION__.4425, @object
	.size	__PRETTY_FUNCTION__.4425, 16
__PRETTY_FUNCTION__.4425:
	.string	"recv_TM_request"
	.align 16
	.type	__FUNCTION__.4429, @object
	.size	__FUNCTION__.4429, 16
__FUNCTION__.4429:
	.string	"recv_TM_request"
	.align 8
	.type	__FUNCTION__.4433, @object
	.size	__FUNCTION__.4433, 11
__FUNCTION__.4433:
	.string	"retry_idle"
	.align 8
	.type	__FUNCTION__.4437, @object
	.size	__FUNCTION__.4437, 13
__FUNCTION__.4437:
	.string	"send_granted"
	.align 8
	.type	__FUNCTION__.4441, @object
	.size	__FUNCTION__.4441, 12
__FUNCTION__.4441:
	.string	"send_revoke"
	.align 8
	.type	__FUNCTION__.4445, @object
	.size	__FUNCTION__.4445, 11
__FUNCTION__.4445:
	.string	"do_nothing"
	.align 16
	.type	__FUNCTION__.4449, @object
	.size	__FUNCTION__.4449, 17
__FUNCTION__.4449:
	.string	"send_TM_end_resp"
	.align 8
	.type	__FUNCTION__.4453, @object
	.size	__FUNCTION__.4453, 13
__FUNCTION__.4453:
	.string	"send_TM_deny"
	.align 8
	.type	__FUNCTION__.4457, @object
	.size	__FUNCTION__.4457, 14
__FUNCTION__.4457:
	.string	"send_TM_grant"
	.align 8
	.type	__FUNCTION__.4461, @object
	.size	__FUNCTION__.4461, 12
__FUNCTION__.4461:
	.string	"send_reject"
	.align 8
	.type	__PRETTY_FUNCTION__.4466, @object
	.size	__PRETTY_FUNCTION__.4466, 14
__PRETTY_FUNCTION__.4466:
	.string	"transit_state"
	.align 8
	.type	__FUNCTION__.4470, @object
	.size	__FUNCTION__.4470, 14
__FUNCTION__.4470:
	.string	"transit_state"
	.align 16
	.type	__PRETTY_FUNCTION__.4480, @object
	.size	__PRETTY_FUNCTION__.4480, 20
__PRETTY_FUNCTION__.4480:
	.string	"manual_change_state"
	.align 8
	.type	__PRETTY_FUNCTION__.4487, @object
	.size	__PRETTY_FUNCTION__.4487, 13
__PRETTY_FUNCTION__.4487:
	.string	"change_state"
	.align 8
	.type	__FUNCTION__.4491, @object
	.size	__FUNCTION__.4491, 13
__FUNCTION__.4491:
	.string	"change_state"
	.align 8
	.type	__FUNCTION__.4505, @object
	.size	__FUNCTION__.4505, 12
__FUNCTION__.4505:
	.string	"recv_invite"
	.align 8
	.type	__PRETTY_FUNCTION__.4506, @object
	.size	__PRETTY_FUNCTION__.4506, 12
__PRETTY_FUNCTION__.4506:
	.string	"recv_invite"
	.align 8
	.type	__PRETTY_FUNCTION__.4514, @object
	.size	__PRETTY_FUNCTION__.4514, 9
__PRETTY_FUNCTION__.4514:
	.string	"recv_200"
	.align 8
	.type	__FUNCTION__.4519, @object
	.size	__FUNCTION__.4519, 13
__FUNCTION__.4519:
	.string	"eventFromSCU"
	.align 8
	.type	__FUNCTION__.4533, @object
	.size	__FUNCTION__.4533, 10
__FUNCTION__.4533:
	.string	"eventRTCP"
	.align 8
	.type	__PRETTY_FUNCTION__.4539, @object
	.size	__PRETTY_FUNCTION__.4539, 10
__PRETTY_FUNCTION__.4539:
	.string	"eventRTCP"
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
