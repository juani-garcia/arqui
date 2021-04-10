section .text
EXTERN fibonacci
fibonacci: ; int fibonacci(int n)
    push ebp
    mov ebp, esp
    push ebx
    cmp dword [ebp+8], 0
    jne .check1
    mov eax, 0
    mov ebx, dword [ebp-4]
    mov esp, ebp
    pop ebp
    ret

.check1:
    cmp dword [ebp+8], 1
    jne .continue
    mov eax, 1
    mov ebx, dword [ebp-4]
    mov esp, ebp
    pop ebp
    ret

.continue:
    mov ecx, [ebp+8]
    dec ecx
    push ecx ; paso n-1 como parametro
    call fibonacci
    add esp, 4
    mov ebx, eax ; me guardo el resultado
    mov ecx, [ebp+8]
    sub ecx, 2
    push ecx ; paso n-2 como parametro f    
    call fibonacci
    add esp, 4
    add eax, ebx
    mov ebx, dword [ebp-4]
    mov esp, ebp
    pop ebp
    ret