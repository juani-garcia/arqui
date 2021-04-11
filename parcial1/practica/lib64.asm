;
;	Syscall Tables x86 (32-bit) && x86_64 (64-bit)
;
;	https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md
;
;*********************************************************************************************************

section .text
global myread
global mywrite
global myopen
global myexit
global myfork
global mypid
global myclose
global mystrlen
global creat
global time



; int myread(unsigned int fd, const char *buffer, int size);			// Lee del teclado (entrada estandar)
myread:
	push rbp
	mov rbp, rsp

	mov rax, 0		; SysCall PARA ABRIR ARCHIVO
	syscall

	mov rsp, rbp
	pop rbp
	ret

; int myopen(const char *filename, int access, int permit);			// Abre un archivo
myopen:
	push rbp
	mov rbp, rsp

	mov rax, 2		
	syscall

	mov rsp, rbp
	pop rbp
	ret

; int myclose(int fd);								// Cierra un archivo
myclose:
	push rbp
	mov rbp, rsp

	mov rax, 3
	syscall

	mov rsp, rbp
	pop rbp
	ret
; int mywrite(unsigned int fd, char *buffer, int size);			// Imprime (Salida Estandar)
mywrite:
	push rbp
	mov rbp, rsp

	mov rax, 1
	syscall

	mov rsp, rbp
	pop rbp
	ret
; void myexit(int return_value);						// Syscall de salida
myexit:
	push rbp
	mov rbp, rsp

	mov rax, 0x3c
	syscall

	mov rsp, rbp
	pop rbp
	ret

; int myfork(void);								// Hace un fork entre padre e hijo (ver Tema3)
myfork:
	push rbp
	mov rbp, rsp

	mov rax, 0x39
	syscall

	mov rsp, rbp
	pop rbp
	ret

; int mypid(void);								// Id del proceso
mypid:
	push rbp
	mov rbp, rsp

	mov rax, 0x27
	syscall

	mov rsp, rbp
	pop rbp
	ret

; unsigned int mystrlen(char* str);
mystrlen:
    push rbp			; Armado Stack Frame.
	mov rbp, rsp

    push rbx			; Guardo valor de rbx en stack.
    push rcx			; Guardo valor de rcx en stack.
    mov rbx, rdi
    mov rcx, 0

    .loop:
        cmp byte[rbx], 0
        je .finish
        inc rcx
        inc rbx
        jmp .loop

    .finish:
        mov rax, rcx
        pop rcx
        pop rbx
    
	mov rsp, rbp
	pop rbp				; Desarmado Stack Frame.
	ret
	
;int time();								// Obtener la fecha y hora del sistema en segundos en UTC! (ver Tema2)
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
	

;int creat();					// Crea un archivo (ver el tema de permisos). Usa el rodata
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

section .rodata
	filename db "arc.txt", 0
