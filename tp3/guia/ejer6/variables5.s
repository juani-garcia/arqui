	.file	"variables5.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR numero@GOTOFF[eax], 10
	nop
	pop	ebp
	ret
	.size	foo, .-foo
	.globl	numero
	.data
	.align 4
	.type	numero, @object
	.size	numero, 4
numero:
	.long	21
	.text
	.globl	bar
	.type	bar, @function
bar:
	push	ebp
	mov	ebp, esp
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR numero@GOTOFF[eax], 30
	nop
	pop	ebp
	ret
	.size	bar, .-bar
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
