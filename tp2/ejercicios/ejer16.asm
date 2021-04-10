section .text
GLOBAL _start
EXTERN to_upper
EXTERN print
EXTERN exit

_start:
    mov ebx, message
    call print
    mov ebx, 0 ; file descriptor de stdin
    mov eax, 3 
    mov ecx, string
    mov edx, 100
    int 80h ; llamo al SO
    mov ebx, string
    call to_upper
    mov ebx, string
    call print
    call exit

section .data
message db "Escriba un string para pasarlo a mayuscula:", 10, 0
section .bss
string resb 100