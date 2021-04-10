section .text
GLOBAL _start
EXTERN print
EXTERN numtostr
EXTERN exit

_start:
    mov ebp, esp
    mov ebx, start_line
    call print
    push numstr
    mov eax, [ebp]
    dec eax
    push eax
    call numtostr
    mov ebx, end_line
    call print
    mov ecx, 0 ; indice
.print_arguments:
    cmp ecx, eax
    jge .end
    mov ebx, dword [ebp + ecx * 4 + 8]
    call print
    mov ebx, new_line
    call print
    add ecx, 1
    jmp .print_arguments
.end:
    mov ebx, 0
    call exit

section .data
start_line db "El programa tiene ", 0
end_line db " argumento(s).", 10, 0
new_line db 10, 0
section .bss
numstr resb 10
