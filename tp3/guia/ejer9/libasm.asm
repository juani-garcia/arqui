section .text
GLOBAL sys_close, sys_open, sys_read, sys_write
sys_open: ; int sys_open(const char * filename, int mode, int permits);
    push ebp
    mov ebp, esp
    push ebx
    mov eax, 0x05
    mov ebx, [ebp+8]
    mov ecx, [ebp+12]
    mov edx, [ebp+16]
    int 80h
    pop ebx
    mov esp, ebp
    pop ebp
    ret

sys_close:

sys_read:

sys_write: