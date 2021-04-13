section .text
GLOBAL sys_read, sys_write

sys_read: ; int sys_read(char * buffer, int len)
    push ebp
    mov ebp, esp
    push ebx
    mov eax, 3 ; syscall de read
    mov ebx, 0 ; fd -> 0 stdin
    mov ecx, [ebp+8]
    mov edx, [ebp+12]
    int 80h ; llamo al SO
    pop ebx
    mov esp, ebp
    pop ebp
    ret

sys_write: ; int sys_write(const char * buffer, int len)
    push ebp
    mov ebp, esp

    push ebx ; preservar ebx

    mov eax, 4
    mov ebx, 1 ; fd
    mov ecx, [ebp+8] ; buffer
    mov edx, [ebp+12] ; length
    int 0x80 
    pop ebx
    mov esp, ebp
    pop ebp
    ret
