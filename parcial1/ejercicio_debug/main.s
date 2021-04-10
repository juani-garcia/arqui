	.file	"main.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"fue leido de a.txt \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 7 40
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x6,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$60, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%ecx, %esi
	.loc 1 10 8
	movl	$1819043144, -61(%ebp)
	movl	$842080367, -57(%ebp)
	movw	$13363, -53(%ebp)
	movb	$0, -51(%ebp)
	.loc 1 11 6
	cmpl	$4, (%esi)
	je	.L2
	.loc 1 12 12
	movl	$-7, %eax
	jmp	.L11
.L2:
	.loc 1 15 24
	movl	4(%esi), %eax
	addl	$4, %eax
	.loc 1 15 14
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	openf@PLT
	addl	$16, %esp
	movl	%eax, -28(%ebp)
	.loc 1 16 8
	cmpl	$0, -28(%ebp)
	jns	.L4
	.loc 1 16 24 discriminator 1
	movl	-28(%ebp), %eax
	jmp	.L11
.L4:
	.loc 1 17 23
	movl	4(%esi), %eax
	addl	$8, %eax
	.loc 1 17 13
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	openf@PLT
	addl	$16, %esp
	movl	%eax, -32(%ebp)
	.loc 1 18 8
	cmpl	$0, -32(%ebp)
	jns	.L5
	.loc 1 18 24 discriminator 1
	movl	-32(%ebp), %eax
	jmp	.L11
.L5:
	.loc 1 19 24
	movl	4(%esi), %eax
	addl	$12, %eax
	.loc 1 19 14
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	openf@PLT
	addl	$16, %esp
	movl	%eax, -36(%ebp)
	.loc 1 20 8
	cmpl	$0, -36(%ebp)
	jns	.L6
	.loc 1 20 24 discriminator 1
	movl	-36(%ebp), %eax
	jmp	.L11
.L6:
	.loc 1 24 16
	subl	$4, %esp
	pushl	$10
	leal	-61(%ebp), %eax
	pushl	%eax
	pushl	-28(%ebp)
	call	read@PLT
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	.loc 1 25 8
	cmpl	$0, -40(%ebp)
	jns	.L7
	.loc 1 25 26 discriminator 1
	movl	-40(%ebp), %eax
	jmp	.L11
.L7:
	.loc 1 26 12
	subl	$4, %esp
	pushl	$10
	leal	-50(%ebp), %eax
	pushl	%eax
	pushl	-32(%ebp)
	call	read@PLT
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	.loc 1 27 8
	cmpl	$0, -40(%ebp)
	jns	.L8
	.loc 1 27 26 discriminator 1
	movl	-40(%ebp), %eax
	jmp	.L11
.L8:
	.loc 1 28 5
	subl	$4, %esp
	pushl	$10
	leal	-61(%ebp), %eax
	pushl	%eax
	pushl	$1
	call	write@PLT
	addl	$16, %esp
	.loc 1 29 5
	subl	$4, %esp
	pushl	$20
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$1
	call	write@PLT
	addl	$16, %esp
	.loc 1 31 12
	subl	$4, %esp
	pushl	$10
	leal	-61(%ebp), %eax
	pushl	%eax
	pushl	-36(%ebp)
	call	write@PLT
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	.loc 1 32 8
	cmpl	$0, -40(%ebp)
	jns	.L9
	.loc 1 32 26 discriminator 1
	movl	-40(%ebp), %eax
	jmp	.L11
.L9:
	.loc 1 33 12
	subl	$4, %esp
	pushl	$10
	leal	-50(%ebp), %eax
	pushl	%eax
	pushl	-36(%ebp)
	call	write@PLT
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	.loc 1 34 8
	cmpl	$0, -40(%ebp)
	jns	.L10
	.loc 1 34 26 discriminator 1
	movl	-40(%ebp), %eax
	jmp	.L11
.L10:
	.loc 1 36 5
	subl	$12, %esp
	pushl	-28(%ebp)
	call	closef@PLT
	addl	$16, %esp
	.loc 1 37 5
	subl	$12, %esp
	pushl	-32(%ebp)
	call	closef@PLT
	addl	$16, %esp
	.loc 1 38 5
	subl	$12, %esp
	pushl	-36(%ebp)
	call	closef@PLT
	addl	$16, %esp
	.loc 1 40 12
	movl	$0, %eax
.L11:
	.loc 1 41 1 discriminator 1
	leal	-12(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB1:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE1:
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xf4
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF7
	.byte	0xc
	.long	.LASF8
	.long	.LASF9
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF10
	.byte	0x1
	.byte	0x7
	.byte	0x5
	.long	0xb5
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0xb5
	.uleb128 0x3
	.long	.LASF0
	.byte	0x1
	.byte	0x7
	.byte	0xe
	.long	0xb5
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x3
	.long	.LASF1
	.byte	0x1
	.byte	0x7
	.byte	0x20
	.long	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4
	.long	.LASF2
	.byte	0x1
	.byte	0x9
	.byte	0x8
	.long	0xd4
	.uleb128 0x2
	.byte	0x75
	.sleb128 -50
	.uleb128 0x4
	.long	.LASF3
	.byte	0x1
	.byte	0xa
	.byte	0x8
	.long	0xeb
	.uleb128 0x2
	.byte	0x75
	.sleb128 -61
	.uleb128 0x5
	.string	"f1"
	.byte	0x1
	.byte	0xf
	.byte	0x9
	.long	0xb5
	.uleb128 0x2
	.byte	0x75
	.sleb128 -28
	.uleb128 0x5
	.string	"f2"
	.byte	0x1
	.byte	0x11
	.byte	0x8
	.long	0xb5
	.uleb128 0x2
	.byte	0x75
	.sleb128 -32
	.uleb128 0x5
	.string	"f3"
	.byte	0x1
	.byte	0x13
	.byte	0x9
	.long	0xb5
	.uleb128 0x2
	.byte	0x75
	.sleb128 -36
	.uleb128 0x4
	.long	.LASF4
	.byte	0x1
	.byte	0x18
	.byte	0x9
	.long	0xb5
	.uleb128 0x2
	.byte	0x75
	.sleb128 -40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x7
	.byte	0x4
	.long	0xc2
	.uleb128 0x7
	.byte	0x4
	.long	0xcf
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x9
	.long	0xc8
	.uleb128 0xa
	.long	0xc8
	.long	0xe4
	.uleb128 0xb
	.long	0xe4
	.byte	0x9
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0xc
	.long	0xc8
	.uleb128 0xb
	.long	0xe4
	.byte	0xa
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
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF6:
	.string	"unsigned int"
.LASF0:
	.string	"argc"
.LASF4:
	.string	"test"
.LASF8:
	.string	"main.c"
.LASF9:
	.string	"/home/juani/arqui/parcial1/ejercicio_debug"
.LASF10:
	.string	"main"
.LASF3:
	.string	"string1"
.LASF2:
	.string	"string2"
.LASF7:
	.string	"GNU C17 8.3.0 -m32 -mtune=generic -march=i686 -g"
.LASF5:
	.string	"char"
.LASF1:
	.string	"argv"
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
