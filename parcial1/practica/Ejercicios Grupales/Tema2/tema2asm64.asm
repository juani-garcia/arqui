GLOBAL time
GLOBAL write

section .text

time:
	push rbp
	mov rbp, rsp

	
	mov rax, 0xc9
	push rax
	mov rdi, rsp
	syscall
	pop rax
	
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
