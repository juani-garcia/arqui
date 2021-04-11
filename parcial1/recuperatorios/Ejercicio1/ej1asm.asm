GLOBAL read
GLOBAL write

section .text


read:
	push rbp
	mov rbp, rsp

	mov rax, 0		
	syscall

	mov rsp, rbp
	pop rbp
	ret
	

write:
	push rbp
	mov rbp, rsp

	mov rax, 1
	syscall

	mov rsp, rbp
	pop rbp
	ret
