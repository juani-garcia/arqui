; ----------------------------------------------------------------------------
; power.asm
;
; Command line application to compute x^y
; Syntax: power x y
; x and y are integers
; ----------------------------------------------------------------------------

GLOBAL  main
	extern	atoi
	extern	printf

section .text

main:
	push	rbx			; save the registers that must be sav2d
	push	rsi
	push	rdi
	cmp	rdi, 3			; must have exactly two arguments
	jne	error1
	mov     rcx,rsi
	mov	rdi, [rcx + 8]
	push    rcx		
	call	atoi
	pop     rcx
	mov	rbx, rsi	
	mov     rdi, [rcx + 16]
	call	atoi	
	
	cmp	eax, 0
	jl	error2
	mov     rdi, rax    
	dec	rdi	
	mov     rdx ,rax  
	mov     rax, rbx
	mov     rsi, rbx	
check:
	test	rdi, rdi		; we're counting y downto 0
	jz      gotit			; done
	imul	rax, rsi		; multiply in another x
	dec	rdi
	jmp	check
gotit:					; print report on success
	mov     rsi,rax
	mov     rdi,answer

	call    printf
	jmp	done
error1:					; print error message
	mov 	rdi,badArgumentCount
	call	printf
	jmp	done
error2:					; print error message
	mov	rdi,negativeExponent
	call	printf

done:					; restore saved registers
	pop	rdi
	pop	rsi
	pop	rbx
	ret

answer:
	db      '%d', 10, 0
badArgumentCount:
	db	'Requires exactly two arguments', 10, 0
negativeExponent:
	db	'The exponent may not be negative', 10, 0
