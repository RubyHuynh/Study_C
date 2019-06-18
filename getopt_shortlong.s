	.file	"getopt_shortlong.c"
	.text
.Ltext0:
	.comm	prg_name,8,8
	.section	.rodata
.LC0:
	.string	"Usage %s options\n"
.LC1:
	.string	"output"
.LC2:
	.string	"help"
	.align 8
.LC3:
	.string	"-%c --%s \n-%c --%s out_file \n-%c --%s \n"
.LC4:
	.string	"verbose"
	.text
	.globl	usage
	.type	usage, @function
usage:
.LFB6:
	.file 1 "getopt_shortlong.c"
	.loc 1 14 41
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	.loc 1 15 5
	movq	prg_name(%rip), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 16 5
	movq	-8(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	pushq	%rdx
	pushq	$118
	leaq	.LC1(%rip), %r9
	movl	$111, %r8d
	leaq	.LC2(%rip), %rcx
	movl	$104, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	.loc 1 21 5
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	usage, .-usage
	.section	.rodata
.LC5:
	.string	"ho:v"
	.align 8
.LC6:
	.string	"=====\n Done: output=%s verbose=%d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.loc 1 24 34
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movl	%edi, -180(%rbp)
	movq	%rsi, -192(%rbp)
	.loc 1 24 34
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 25 9
	movl	$0, -164(%rbp)
	.loc 1 26 23
	leaq	.LC5(%rip), %rax
	movq	%rax, -152(%rbp)
	.loc 1 27 25
	leaq	.LC2(%rip), %rax
	movq	%rax, -144(%rbp)
	movl	$0, -136(%rbp)
	movq	$0, -128(%rbp)
	movl	$104, -120(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -112(%rbp)
	movl	$1, -104(%rbp)
	movq	$0, -96(%rbp)
	movl	$111, -88(%rbp)
	leaq	.LC4(%rip), %rax
	movq	%rax, -80(%rbp)
	movl	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movl	$118, -56(%rbp)
	movq	$0, -48(%rbp)
	movl	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -24(%rbp)
	.loc 1 33 17
	movq	$0, -160(%rbp)
	.loc 1 34 9
	movl	$0, -168(%rbp)
	.loc 1 36 20
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 36 14
	movq	%rax, prg_name(%rip)
.L11:
	.loc 1 38 20
	leaq	-144(%rbp), %rcx
	movq	-152(%rbp), %rdx
	movq	-192(%rbp), %rsi
	movl	-180(%rbp), %eax
	movl	$0, %r8d
	movl	%eax, %edi
	call	getopt_long@PLT
	movl	%eax, -164(%rbp)
	.loc 1 39 9
	cmpl	$104, -164(%rbp)
	je	.L3
	cmpl	$104, -164(%rbp)
	jg	.L4
	cmpl	$-1, -164(%rbp)
	je	.L14
	cmpl	$63, -164(%rbp)
	je	.L6
	jmp	.L7
.L4:
	cmpl	$111, -164(%rbp)
	je	.L8
	cmpl	$118, -164(%rbp)
	je	.L9
	jmp	.L7
.L3:
	.loc 1 41 17
	movq	stdout(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	usage
.L8:
	.loc 1 44 24
	movq	optarg(%rip), %rax
	movq	%rax, -160(%rbp)
	.loc 1 45 13
	jmp	.L10
.L9:
	.loc 1 48 25
	movl	$2, -168(%rbp)
	.loc 1 49 13
	jmp	.L10
.L6:
	.loc 1 55 17
	movq	stderr(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	usage
.L7:
	.loc 1 58 17
	call	abort@PLT
.L14:
	.loc 1 52 13
	nop
.L10:
	.loc 1 61 5
	cmpl	$-1, -164(%rbp)
	jne	.L11
	.loc 1 63 5
	movl	-168(%rbp), %edx
	movq	-160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 64 12
	movl	$0, %eax
	.loc 1 65 1
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
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/8/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/getopt_ext.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x467
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF70
	.byte	0xc
	.long	.LASF71
	.long	.LASF72
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.byte	0x1b
	.long	0x39
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x96
	.byte	0x12
	.long	0x6c
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x97
	.byte	0x12
	.long	0x6c
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x7
	.long	0x91
	.uleb128 0x8
	.long	.LASF55
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x224
	.uleb128 0x9
	.long	.LASF11
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8b
	.byte	0x10
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8b
	.byte	0x18
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8b
	.byte	0x20
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8b
	.byte	0x28
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8b
	.byte	0x30
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8b
	.byte	0x38
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8b
	.byte	0x48
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8b
	.byte	0x50
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8b
	.byte	0x58
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x23d
	.byte	0x60
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x243
	.byte	0x68
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x65
	.byte	0x70
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x65
	.byte	0x74
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x73
	.byte	0x78
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x57
	.byte	0x82
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x249
	.byte	0x83
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x259
	.byte	0x88
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x7f
	.byte	0x90
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x264
	.byte	0x98
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x26f
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x243
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x47
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x65
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x275
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x9d
	.uleb128 0xa
	.long	.LASF73
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF41
	.uleb128 0x6
	.byte	0x8
	.long	0x238
	.uleb128 0x6
	.byte	0x8
	.long	0x9d
	.uleb128 0xc
	.long	0x91
	.long	0x259
	.uleb128 0xd
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x230
	.uleb128 0xb
	.long	.LASF42
	.uleb128 0x6
	.byte	0x8
	.long	0x25f
	.uleb128 0xb
	.long	.LASF43
	.uleb128 0x6
	.byte	0x8
	.long	0x26a
	.uleb128 0xc
	.long	0x91
	.long	0x285
	.uleb128 0xd
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF44
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x291
	.uleb128 0x6
	.byte	0x8
	.long	0x224
	.uleb128 0xe
	.long	.LASF45
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x291
	.uleb128 0xe
	.long	.LASF46
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x291
	.uleb128 0xe
	.long	.LASF47
	.byte	0x7
	.byte	0x1a
	.byte	0xc
	.long	0x65
	.uleb128 0xc
	.long	0x2d1
	.long	0x2c6
	.uleb128 0xf
	.byte	0
	.uleb128 0x7
	.long	0x2bb
	.uleb128 0x6
	.byte	0x8
	.long	0x98
	.uleb128 0x7
	.long	0x2cb
	.uleb128 0xe
	.long	.LASF48
	.byte	0x7
	.byte	0x1b
	.byte	0x1a
	.long	0x2c6
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF49
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF50
	.uleb128 0xe
	.long	.LASF51
	.byte	0x8
	.byte	0x24
	.byte	0xe
	.long	0x8b
	.uleb128 0xe
	.long	.LASF52
	.byte	0x8
	.byte	0x32
	.byte	0xc
	.long	0x65
	.uleb128 0xe
	.long	.LASF53
	.byte	0x8
	.byte	0x37
	.byte	0xc
	.long	0x65
	.uleb128 0xe
	.long	.LASF54
	.byte	0x8
	.byte	0x3b
	.byte	0xc
	.long	0x65
	.uleb128 0x8
	.long	.LASF56
	.byte	0x20
	.byte	0x9
	.byte	0x32
	.byte	0x8
	.long	0x362
	.uleb128 0x9
	.long	.LASF57
	.byte	0x9
	.byte	0x34
	.byte	0xf
	.long	0x2cb
	.byte	0
	.uleb128 0x9
	.long	.LASF58
	.byte	0x9
	.byte	0x37
	.byte	0x7
	.long	0x65
	.byte	0x8
	.uleb128 0x9
	.long	.LASF59
	.byte	0x9
	.byte	0x38
	.byte	0x8
	.long	0x367
	.byte	0x10
	.uleb128 0x10
	.string	"val"
	.byte	0x9
	.byte	0x39
	.byte	0x7
	.long	0x65
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.long	0x320
	.uleb128 0x6
	.byte	0x8
	.long	0x65
	.uleb128 0x11
	.long	.LASF60
	.byte	0x1
	.byte	0x5
	.byte	0xd
	.long	0x2cb
	.uleb128 0x9
	.byte	0x3
	.quad	prg_name
	.uleb128 0x12
	.long	.LASF74
	.byte	0x1
	.byte	0x18
	.byte	0x5
	.long	0x65
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x416
	.uleb128 0x13
	.long	.LASF61
	.byte	0x1
	.byte	0x18
	.byte	0xe
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -196
	.uleb128 0x13
	.long	.LASF62
	.byte	0x1
	.byte	0x18
	.byte	0x1a
	.long	0x416
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x14
	.long	.LASF63
	.byte	0x1
	.byte	0x19
	.byte	0x9
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x14
	.long	.LASF64
	.byte	0x1
	.byte	0x1a
	.byte	0x17
	.long	0x2d1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x14
	.long	.LASF65
	.byte	0x1
	.byte	0x1b
	.byte	0x19
	.long	0x42c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x14
	.long	.LASF66
	.byte	0x1
	.byte	0x21
	.byte	0x11
	.long	0x2cb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x14
	.long	.LASF67
	.byte	0x1
	.byte	0x22
	.byte	0x9
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8b
	.uleb128 0xc
	.long	0x362
	.long	0x42c
	.uleb128 0xd
	.long	0x39
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	0x41c
	.uleb128 0x15
	.long	.LASF75
	.byte	0x1
	.byte	0xe
	.byte	0x6
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.long	.LASF68
	.byte	0x1
	.byte	0xe
	.byte	0x12
	.long	0x291
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.long	.LASF69
	.byte	0x1
	.byte	0xe
	.byte	0x1e
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"__off_t"
.LASF12:
	.string	"_IO_read_ptr"
.LASF24:
	.string	"_chain"
.LASF56:
	.string	"option"
.LASF65:
	.string	"long_opts"
.LASF7:
	.string	"size_t"
.LASF30:
	.string	"_shortbuf"
.LASF68:
	.string	"stream"
.LASF18:
	.string	"_IO_buf_base"
.LASF50:
	.string	"long long unsigned int"
.LASF66:
	.string	"o_file"
.LASF33:
	.string	"_codecvt"
.LASF49:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF25:
	.string	"_fileno"
.LASF13:
	.string	"_IO_read_end"
.LASF6:
	.string	"long int"
.LASF11:
	.string	"_flags"
.LASF19:
	.string	"_IO_buf_end"
.LASF28:
	.string	"_cur_column"
.LASF42:
	.string	"_IO_codecvt"
.LASF27:
	.string	"_old_offset"
.LASF32:
	.string	"_offset"
.LASF41:
	.string	"_IO_marker"
.LASF72:
	.string	"/workspace/Study_C"
.LASF1:
	.string	"unsigned int"
.LASF36:
	.string	"_freeres_buf"
.LASF70:
	.string	"GNU C17 8.3.0 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF0:
	.string	"long unsigned int"
.LASF16:
	.string	"_IO_write_ptr"
.LASF57:
	.string	"name"
.LASF47:
	.string	"sys_nerr"
.LASF3:
	.string	"short unsigned int"
.LASF20:
	.string	"_IO_save_base"
.LASF44:
	.string	"stdin"
.LASF31:
	.string	"_lock"
.LASF26:
	.string	"_flags2"
.LASF38:
	.string	"_mode"
.LASF45:
	.string	"stdout"
.LASF69:
	.string	"exit_code"
.LASF51:
	.string	"optarg"
.LASF52:
	.string	"optind"
.LASF17:
	.string	"_IO_write_end"
.LASF73:
	.string	"_IO_lock_t"
.LASF55:
	.string	"_IO_FILE"
.LASF48:
	.string	"sys_errlist"
.LASF23:
	.string	"_markers"
.LASF35:
	.string	"_freeres_list"
.LASF64:
	.string	"short_opts"
.LASF2:
	.string	"unsigned char"
.LASF5:
	.string	"short int"
.LASF43:
	.string	"_IO_wide_data"
.LASF59:
	.string	"flag"
.LASF29:
	.string	"_vtable_offset"
.LASF40:
	.string	"FILE"
.LASF54:
	.string	"optopt"
.LASF60:
	.string	"prg_name"
.LASF10:
	.string	"char"
.LASF67:
	.string	"verbose"
.LASF53:
	.string	"opterr"
.LASF9:
	.string	"__off64_t"
.LASF14:
	.string	"_IO_read_base"
.LASF22:
	.string	"_IO_save_end"
.LASF58:
	.string	"has_arg"
.LASF75:
	.string	"usage"
.LASF37:
	.string	"__pad5"
.LASF39:
	.string	"_unused2"
.LASF46:
	.string	"stderr"
.LASF62:
	.string	"argv"
.LASF21:
	.string	"_IO_backup_base"
.LASF61:
	.string	"argc"
.LASF71:
	.string	"getopt_shortlong.c"
.LASF34:
	.string	"_wide_data"
.LASF74:
	.string	"main"
.LASF15:
	.string	"_IO_write_base"
.LASF63:
	.string	"next_opt"
	.ident	"GCC: (Ubuntu 8.3.0-6ubuntu1~18.10.1) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
