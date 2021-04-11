; int sys_write(int fd, const char *buffer, int size);
; int sys_read(int fd, char * buffer, int size);

GLOBAL sys_read, sys_write

section .text

ALIGN 4 

sys_read:
    push rbp
    mov rbp, rsp

    mov rax, 0x0
    syscall

    mov rsp, rbp
    pop rbp
    ret

sys_write:
    push rbp
    mov rbp, rsp

    mov rax, 0x1
    syscall
    
    mov rsp, rbp
    pop rbp
    ret