	.file	"ejer7.c"
	.intel_syntax noprefix
	.text
	.comm	global_arr_unin,40,32
	.globl	global_arr_init
	.data
	.align 32
	.type	global_arr_init, @object
	.size	global_arr_init, 40
global_arr_init:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.text
	.globl	ej7_1
	.type	ej7_1, @function
ej7_1:
	push	ebp
	mov	ebp, esp
	sub	esp, 48
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	nop
	leave
	ret
	.size	ej7_1, .-ej7_1
	.globl	ej7_2
	.type	ej7_2, @function
ej7_2:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -8[ebp], 1936614765
	mov	DWORD PTR -4[ebp], 6646369
	nop
	leave
	ret
	.size	ej7_2, .-ej7_2
	.globl	ej7_3
	.type	ej7_3, @function
ej7_3:
	push	ebp
	mov	ebp, esp
	sub	esp, 80
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -80[ebp], 10
	nop
	leave
	ret
	.size	ej7_3, .-ej7_3
	.globl	ej7_4
	.type	ej7_4, @function
ej7_4:
	push	ebp
	mov	ebp, esp
	sub	esp, 48
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	DWORD PTR -40[ebp], 0
	mov	DWORD PTR -36[ebp], 1
	mov	DWORD PTR -32[ebp], 2
	mov	DWORD PTR -28[ebp], 3
	mov	DWORD PTR -24[ebp], 4
	mov	DWORD PTR -20[ebp], 5
	mov	DWORD PTR -16[ebp], 6
	mov	DWORD PTR -12[ebp], 7
	mov	DWORD PTR -8[ebp], 8
	mov	DWORD PTR -4[ebp], 9
	mov	DWORD PTR -20[ebp], 15
	nop
	leave
	ret
	.size	ej7_4, .-ej7_4
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
