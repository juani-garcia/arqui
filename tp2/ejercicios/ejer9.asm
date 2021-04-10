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
    push eax
    call numtostr
    mov ebx, end_line
    call print
    mov esp, ebp
    mov ebx, 0
    call exit
section .data
start_line db "El programa tiene ", 0
end_line db " argumentos.", 10, 0
section .bss
numstr resb 10