section .text
EXTERN exit
EXTERN print
EXTERN numtostr
GLOBAL _start

_start:
    mov ebx, msg1
    call print
    mov eax, 162
    mov ebx, timeval
    mov ecx, 0
    int 0x80
    mov ebx, msg2
    call print
    mov ebx, 0
    call exit

section .data
timeval dd 5, 0

msg1 db "Espero 5 segundos...", 10, 0
msg2 db "Continuo.", 10, 0
