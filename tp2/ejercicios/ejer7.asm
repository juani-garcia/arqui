section .text
GLOBAL _start
EXTERN numtostr
EXTERN exit
EXTERN print

_start:
    mov eax, [array]
    mov ecx, 4
.loop:
    mov ebx, [array + ecx]
    cmp eax, ebx
    jg .exchange
    jmp .continue
.exchange:
    mov eax, ebx
.continue:
    add ecx, 4
    cmp ecx, cant
    jge .end
    jmp .loop
.end:
    push numstr
    push eax
    call numtostr
    mov ebx, end_line
    call print
    mov ebx, 0
    call exit
    
section .data
array dd 5, 45, 1432, 1
cant equ $ - array
end_line db 10, 0
section .bss
numstr resb 10