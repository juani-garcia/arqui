GLOBAL getTime
GLOBAL write


section .text


getTime:
	push ebp
	mov ebp, esp    ;armado de stackframe

	mov eax, 13
	push eax
	mov ebx, esp
	int 0x80
	pop eax

	mov esp, ebp    ;desarmado de stackframe
	pop ebp
	ret
  
 write:
	push ebp
	mov ebp, esp
	
	push ebx	; preservar ebx
	
	mov eax, 0x4		; write
	mov ebx, [ebp+8]	; fd
	mov ecx, [ebp+12]	; buffer
	mov edx, [ebp+16]	; length
	int 80h		; write file descriptor
	
	pop ebx
	
	mov esp, ebp
	pop ebp
	ret
