section .text
GLOBAL sys_close, sys_open, sys_read, sys_write
sys_open: ; int sys_open(const char * filename, int mode);
    push ebp
    mov ebp, esp
    push ebx
    mov eax, 5
    mov ebx, [ebp+8]
    mov ecx, [ebp+12]
    mov edx, 0777
    int 80h
    pop ebx
    mov esp, ebp
    pop ebp
    ret

sys_close: ; int sys_close(int fd);
    push ebp
    mov ebp, esp
    push ebx
    mov eax, 6 ; syscall close
    mov ebx, [ebp+8] ; le paso el fd
    int 80h
    pop ebx
    mov esp, ebp
    pop ebp
    ret

sys_read: ; int sys_read(int fd, char * buffer, int len)
    push ebp
    mov ebp, esp
    push ebx
    mov eax, 3 ; syscall de read
    mov ebx, [ebp+8]
    mov ecx, [ebp+12]
    mov edx, [ebp+16]
    int 80h ; llamo al SO
    pop ebx
    mov esp, ebp
    pop ebp
    ret

sys_write: ; int sys_write(int fd, const char * string, int len)
    push ebp
    mov ebp, esp

    push ebx ;preservar ebx

    mov eax, 4
    mov ebx, [ebp+8] ; fd
    mov ecx, [ebp+12] ; buffer
    mov edx, [ebp+16] ; length
    int 0x80 
    pop ebx
    mov esp, ebp
    pop ebp
    ret
