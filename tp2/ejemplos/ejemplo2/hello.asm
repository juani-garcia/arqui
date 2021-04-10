section .text
GLOBAL _start

_start:
	mov ecx, cadena1 	; Puntero a la cadena
	mov edx, longitud1	; Largo de la cadena 
	call print
	

	mov ecx, cadena2
	mov edx, longitud2
	call print

	mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h			; Ejecucion de la llamada

;-------------------------
; Funcion print
; Recibe en ecx la cadena a imprimir y en edx el largo de la misma.
;-------------------------
print:
	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h			; Ejecucion de la llamada
	ret			; retorno de la funcion

section .data
cadena1 db "Hola Mundo!!", 10	;"Hola Mundo!!\n"
longitud1 equ $-cadena1
cadena2 db "Arquitectura de las Computadoras", 10
longitud2 equ $-cadena2