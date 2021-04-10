section .text
GLOBAL _start
EXTERN numtostr
EXTERN exit
EXTERN print

_start:
    mov eax, 0    ; en eax guardo el resultado
    mov ebx, num
.loop:
    cmp ebx, 0
    je .end
    add eax, ebx
    dec ebx
    jmp .loop
.end:
    mov ecx, numstr
    push ecx
    push eax
    call numtostr
    mov ebx, end_line
    call print
    mov ebx, 0
    call exit
section .data
num equ 14
end_line db 10, 0
section .bss
numstr resb 10