section .text
GLOBAL _start
EXTERN numtostr
EXTERN exit
EXTERN print
EXTERN factorial

_start:
    mov ebx, n
    call factorial
    push numstr
    push ebx
    call numtostr
    mov ebx, end_line
    call print
    mov ebx, 0
    call exit
section .data
n equ 8
end_line db 10, 0
section .bss
numstr resb 10