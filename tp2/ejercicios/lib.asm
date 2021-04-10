GLOBAL print
GLOBAL exit
GLOBAL numtostr
GLOBAL factorial
GLOBAL to_upper
section .text

;-----------------------------------------------------------
; print - imprimer una cadena en la salida estandar
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	
	
;-----------------------------------------------------------
; exit - termina el programa
;-----------------------------------------------------------
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;-----------------------------------------------------------
exit:
	mov eax, 1		; ID del Syscall EXIT
	int 80h			; Ejecucion de la llamada


;-----------------------------------------------------------
; strlen - calcula la longitud de una cadena terminada con 0
;-----------------------------------------------------------
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
strlen:
	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	; preservo los flags
	mov ecx, 0	; inicializo el contador en 0
    
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx		; Incremento el contador
	inc ebx
	jmp .loop

.fin:				; etiqueta local a strlen
	mov eax, ecx	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret
	
;-----------------------------------------------------------
; numtostr - convierte un entero en un string guardandolo en 
; el stack
;-----------------------------------------------------------
; Argumentos:
;	el numero entero de 32 bit que se recibe en el stack
; ESP +4 a convertir
; Retorno:
;	los caracteres ASCII en el stack se devuelven  
;-----------------------------------------------------------
numtostr:
	push ebp
	mov ebp,esp ; guardo el puntero del stack
	pushad
	pushf
	mov ecx, 10
	mov edx, 0   ; Pongo en cero la parte mas significativa
	mov eax, dword[ebp + 8]  ;Cargo el numero a convertir
	mov ebx, dword[ebp + 12]
	add ebx, 9              ; me posiciono al final del string para empezar a colocar
	mov byte [ebx], 0       ; los caracteres ASCII de derecha a izquierda comenzando con cero
	dec ebx                 ; binario

.sigo:	
	div ecx
	or dl, 0x30  ; convierto el resto  menor a 10 a ASCII
	mov byte [ebx], dl  
	dec ebx      ; si el cociente es mayor a 0 sigo dividiendo
	cmp al,0
	jz .termino
	mov edx,0
	jmp .sigo

.termino: 
	inc ebx
	call print
	popf
    popad
	mov esp, ebp
	pop ebp
	ret

;-----------------------------------------------------------
; factorial - calcula el factorial de un numero
;-----------------------------------------------------------
; Argumentos:
;	el numero entero de 32 bit que se recibe en ebx.
; Retorno:
;	deja en ebx el factorial.
;-----------------------------------------------------------
factorial:
	push eax
	push ecx
	push edx
	pushf
	mov ecx, ebx
	mov eax, 1
.loop:
	cmp ecx, 1
	je .end
	mul ecx
	dec ecx
	jmp .loop
.end:
	mov ebx, eax
	popf
	pop edx
	pop ecx
	pop eax
	ret

;-----------------------------------------------------------
; toupper - pasa un string a mayuscula
;-----------------------------------------------------------
; Argumentos:
;	ebx: direccion del string a modificar.
;   Nota: modifica el string, no devuelve uno modificado
;-----------------------------------------------------------
to_upper:
	pushad
	pushf
.loop:
    cmp byte [ebx], 0
    je .fin 
    cmp byte [ebx], lower_bound
    jl .end_loop
    cmp byte [ebx], upper_bound
    jg .end_loop
    sub byte [ebx], delta
.end_loop:
    inc  ebx
    jmp .loop
.fin:
	popad
	popf
    ret

section .data
delta equ 'a' - 'A'
lower_bound equ 'a'
upper_bound equ 'z'