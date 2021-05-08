section .text
GLOBAL _start
EXTERN print
EXTERN numtostr
EXTERN exit

_start:
    mov ebp, esp
    
    mov eax, [ebp]  ; eax contiene la cantidad de argumentos
                    ; ebp + eax * 4 + 4 tiene el NULL
                    ; [ebp + 0 * 4] cant args
                    ; [ebp + 1 * 4] nombre prog
                    ; [ebp + 2 * 4] arg 1
                    ; ...
                    ; [ebp + eax * 4 + 4] contiene el NULL de fin de parametros
.loop:
    cmp dword [ebp + eax * 4 + 8], 0
    je .end
    mov ebx, [ebp + eax * 4 + 8]
    call print
    mov ebx, str_new_line
    call print
    inc eax
    jmp .loop
.end:
    mov ebx, 0
    call exit

section .data
str_new_line db 10, 0

section .bss
numstr resb 10