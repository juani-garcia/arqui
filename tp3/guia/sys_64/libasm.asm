; int sys_write(int fd, const char *buffer, int size);
; int sys_read(int fd, char * buffer, int size);
; int sys_close(int fd);
; int sys_open(const char * fileName, int mode, int perm);

GLOBAL sys_write
GLOBAL sys_read
GLOBAL sys_close
GLOBAL sys_open

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

sys_close:
    push rbp
    mov rbp, rsp

    mov rax, 0x3
    syscall

    mov rsp, rbp
    pop rbp
    ret

sys_open:
    push rbp
    mov rbp, rsp

    mov rax, 0x2
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

; Para compilar, usar estos comandos
;nasm -f elf64 start.asm
;gcc -fno-stack-protector -m64 -c main.c
;gcc -m64 *.o