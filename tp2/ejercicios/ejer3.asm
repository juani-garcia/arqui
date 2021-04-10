section .text
GLOBAL _start
EXTERN print
EXTERN exit
EXTERN numtostr

_start:
    mov eax, str_space
    push eax
    mov eax, 23
    push eax
    call numtostr
    mov ebx, end_line
    call print
    mov ebx, 0
    call exit


section .rodata
end_line db 10
section .bss
str_space resb 10
