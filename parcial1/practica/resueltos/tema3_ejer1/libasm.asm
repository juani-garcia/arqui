section .text
GLOBAL sys_read, sys_write, sys_fork, sys_getpid, sys_sleep, sys_wait

sys_write: ; int sys_write(int fd, const char * buffer, int len)
    push ebp
    mov ebp, esp

    push ebx ; preservar ebx

    mov eax, 4
    mov ebx, [ebp+8]; fd = stdout
    mov ecx, [ebp+12] ; buffer
    mov edx, [ebp+16] ; length
    int 0x80 
    pop ebx
    mov esp, ebp
    pop ebp
    ret


sys_fork: ; int fork();
    push ebp
    mov ebp, esp

    mov eax,2   ;sys_fork op code
    int 80h
    
    mov esp, ebp
    pop ebp
    ret

sys_getpid: ; int sys_getpid();
    push ebp
    mov ebp, esp

	mov eax, 20
	int 80h

    mov esp, ebp
    pop ebp
    ret

sys_sleep:  ; void sys_sleep(int sec); sleep por n segundos y 0 nanosegundos
    push ebp
    mov ebp, esp

    mov dword [tv_sec], 1
    mov dword [tv_usec], 0
    mov eax, 162
    mov ebx, timeval
    mov ecx, 0
    int 80h

    mov esp, ebp
    pop ebp
    ret

sys_fork: ; int sys_fork();
    push ebp
    mov ebp, esp

    mov eax,2   ;sys_fork op code
    int 80h
    
    mov esp, ebp
    pop ebp
    ret

sys_getpid: ; int sys_getpid();
    push ebp
    mov ebp, esp

	mov eax, 20
	int 80h

    mov esp, ebp
    pop ebp
    ret

sys_sleep:  ; void sys_sleep();
    push ebp
    mov ebp, esp

    mov dword [tv_sec], 1
    mov dword [tv_usec], 0
    mov eax, 162
    mov ebx, timeval
    mov ecx, 0
    int 80h

    mov esp, ebp
    pop ebp
    ret

sys_wait: ; void wait();
    push ebp
    mov ebp, esp 

    mov eax, 7
    mov ebx, 0
    int 80h

    mov esp, ebp
    pop ebp
    ret

section .data

timeval:
    tv_sec dd 0
    tv_usec dd 0
