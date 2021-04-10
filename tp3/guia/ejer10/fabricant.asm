section .text
GLOBAL _start
_start:
    mov eax, 0
    cpuid
    mov [fabricant], ebx
    mov [fabricant + 4], edx
    mov [fabricant + 8], ecx
    mov [fabricant + 12], byte 10

    mov eax, 4
    mov ebx, 1 
    mov ecx, fabricant
    mov edx, 13
    int 80h
    
    mov ebx, 0
    mov eax, 1
    int 80h

section .bss
fabricant resb 13
section .data