;main.asm
GLOBAL main
EXTERN printf
section .rodata
fmt_cant db `Cantidad de argumentos: %d \n`, 0
fmt_arg db `argv[%d] = %s \n`, 0
section .text
main:
    push ebp ; Armado de stack frame
    mov ebp, esp 
    push dword [ebp+8]
    push fmt_cant
    call printf
    add esp, 2 * 4
    mov ecx, 0 ; ecx sera el iterador
    mov edx, [ebp + 12] ; edx = argv
.loop:
    cmp ecx, [ebp+8]
    jge .end ; si ecx >= argc, termine
    push ecx
    push edx
    push dword [edx + 4 * ecx] 
    push ecx
    push dword fmt_arg
    call printf
    add esp, 3 * 4
    pop edx
    pop ecx
    inc ecx
    jmp .loop
.end:
    mov esp, ebp ; Desarmado de stack frame
    pop ebp
    ret 