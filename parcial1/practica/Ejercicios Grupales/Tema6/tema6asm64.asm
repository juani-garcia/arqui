GLOBAL read
GLOBAL write
GLOBAL creat
GLOBAL open
GLOBAL close

section .text


read:
	push rbp
	mov rbp, rsp

	mov rax, 0		; SysCall PARA ABRIR ARCHIVO
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

creat:
	push rbp
	mov rbp, rsp
	
	mov rax,0x55       ; syscall number for creat()
	mov rdi,filename ; argv[1], the file name
	mov esi,00644Q   ; rw,r,r
	syscall          ; call the kernel 
	
	mov rsp, rbp
	pop rbp
	ret

open:
	push rbp
	mov rbp, rsp

	mov rax, 2		
	syscall

	mov rsp, rbp
	pop rbp
	ret

close:
	push rbp
	mov rbp, rsp

	mov rax, 3
	syscall

	mov rsp, rbp
	pop rbp
	ret

section .rodata
	filename db "C.txt", 0
