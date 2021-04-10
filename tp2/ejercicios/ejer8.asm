section .text
GLOBAL _start
EXTERN numtostr
EXTERN exit
EXTERN print

_start:
    push numstr
    sub esp, 4
    mov ecx, 0
.outer_loop:
    mov eax, ecx
    mov edx, ecx
.inner_loop:
    mov ebx, [array + edx]
    cmp ebx, [array + eax]
    jge .continue_inner
    mov eax, edx
.continue_inner:
    add edx, 4
    cmp edx, cant
    jge .continue_outer
    jmp .inner_loop
.continue_outer:
    mov ebx, [array + ecx]
    mov edx, [array + eax]
    mov [array + eax], ebx
    mov [array + ecx], edx
    add ecx, 4
    cmp ecx, cant
    jge .continue
    jmp .outer_loop
.continue:
    mov ecx, 0
.print_array:
    mov ebx, [array + ecx]
    mov [esp], ebx
    call numtostr
    mov ebx, end_line
    call print
    add ecx, 4
    cmp ecx, cant
    jge .end
    jmp .print_array
.end:
    mov ebx, 0
    call exit
section .data
array dd 5, 3, 4, 1, 2, 6, 7, 21
cant equ $ - array
end_line db 10, 0
section .bss
numstr resb 10