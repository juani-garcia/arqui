
section .text

GLOBAL write
GLOBAL read

						
;-----------------------------------------------------------------------------------------------	WRITE (es el print)
;	
;	int write(int fd, void *buffer, int size);
;
;-----------------------------------------------------------------------------------------------	WRITE

write:

	push rbp
	mov rbp, rsp

	mov rax, 1
	syscall

	mov rsp, rbp
	pop rbp
	ret
	
	
;-----------------------------------------------------------------------------------------------	READ
;	
;	int read(int fd, char *buff, int size);
;
;-----------------------------------------------------------------------------------------------	READ


read:
 
 	push rbp
	mov rbp, rsp

	mov rax, 0		; SysCall PARA ABRIR ARCHIVO
	syscall

	mov rsp, rbp
	pop rbp
	ret   
    


