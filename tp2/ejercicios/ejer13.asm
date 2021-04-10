section .text
EXTERN exit
EXTERN print
EXTERN numtostr
GLOBAL _start

_start:
    push numstr
    mov eax, 0x14
    int 0x80
    push eax
    call numtostr
    mov ebx, newline
    call print
    mov ebx, 0
    call exit

section .data
newline db 10, 0
section .bss
numstr resb 10