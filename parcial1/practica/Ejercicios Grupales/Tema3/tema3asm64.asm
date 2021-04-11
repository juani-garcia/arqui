GLOBAL fork

section .text

fork:
	push rbp
	mov rbp, rsp

	mov rax, 0x39
	syscall
	cmp rax, 0
	jz .son
	jmp .father
	
	
.son:
	call pid
	mov rdi, 1
	mov rsi, sonstr
	mov rdx, 11
	call write
		
	call final
	
.father:
	call pid
	mov rdi, 1
	mov rsi, dadstr
	mov rdx, 13
	call write
	
	call final	

final:
	mov rax, 0x3c           ; sys_exit
	mov rdi, 0             ; 0
	syscall
	
	

write:
	push rbp
	mov rbp, rsp

	mov rax, 1
	syscall

	mov rsp, rbp
	pop rbp
	ret


pid:
	push rbp
	mov rbp, rsp

	mov rax, 0x27
	syscall

	mov rsp, rbp
	pop rbp
	ret
	
section .rodata
	dadstr db "Soy el padre", 10
	sonstr db "Soy el hijo", 10

