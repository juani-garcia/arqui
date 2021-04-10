section .text
GLOBAL _start
EXTERN numtostr
EXTERN exit
EXTERN print

_start:
    mov ebx, 1
    mov ecx, k
    push numstr
    sub esp, 4
.loop:
    cmp ebx, n + 1
    jge .end ; salto si eax <= n 
    mov edx, 0
    mov eax, ebx
    inc ebx
    div ecx
    cmp edx, 0
    jne .loop
.print:
    dec ebx
    mov [esp], ebx
    inc ebx
    call numtostr
    mov edx, ebx
    mov ebx, end_line
    call print
    mov ebx, edx
    jmp .loop
.end:
    mov ebx, 0
    call exit
section .data
n equ 14
k equ 2
end_line db 10, 0
section .bss
numstr resb 10