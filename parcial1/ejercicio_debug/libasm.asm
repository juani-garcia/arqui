GLOBAL exit
GLOBAL read
GLOBAL write
GLOBAL openf
GLOBAL closef


STDIN equ 0
STDOUT equ 1


SYS_READ equ 3
SYS_WRITE equ 4
SYS_OPEN equ 5
SYS_CLOSE equ 6


section .text

read: ;; recibe por stack el puntero donde quiere que guardes y el largo que quiere que uses. (1ero puntero, 2ndo largo)
    push ebp
    mov ebp,esp
    mov eax,SYS_READ
    lea ecx,[ebp+12] ;buffer
    mov edx,[ebp+16] ;length
    mov ebx,[ebp+8] ;fileDescriptor
    int 80h
    mov esp,ebp
    pop ebp
    ret

write:
;; recibe por stack el puntero donde quiere que guardes y el largo que quiere que uses. (1ero puntero, 2ndo largo)
    push ebp
    mov ebp,esp
    push ebx

    mov eax, SYS_WRITE
    mov ebx, [ebp+8] ;fd
    mov ecx, [ebp+12] ;string
    mov edx, [ebp+16]

    int 80h

    pop ebx
    mov esp,ebp
    pop ebp
    ret

openf:
    push ebp
    mov ebp,esp
    mov eax,SYS_OPEN
    mov ebx,[ebp+8]  ;; recibo por stack el puntero al nombre del archivo
    mov ecx,0102o
    mov edx,666o
    int 80h

    mov esp,ebp
    pop ebp
    ret


closef:
    push ebp
    mov ebp,esp
    mov ebx,[ebp+8]
    mov eax,SYS_CLOSE
    int 80h

    mov esp,ebp
    pop ebp
    ret
