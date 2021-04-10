section .text
GLOBAL _start
EXTERN main
_start:
    mov ebp, esp
    mov eax, ebp
    add eax, 4
    push eax
    push DWORD [ebp]
    call main ; int main(int argc, char * argv[])
    mov ebx, eax
    mov eax, 1
    int 80h