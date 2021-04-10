section .text
GLOBAL _start
EXTERN print
EXTERN to_upper
EXTERN exit
_start:
    mov ebx, cadena
    call to_upper
    mov ebx, cadena
    call print
    mov ebx, 0
    call exit
; Ejecucion de la llamada


section .data
cadena db "h4ppy c0d1ng", 10, 0
