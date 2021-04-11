
section .text

GLOBAL write
GLOBAL read
GLOBAL print
GLOBAL numtostr

ALIGN 4
						
;-----------------------------------------------------------------------------------------------	WRITE
;	
;	int write(int fd, void *buffer, int size);
;
;-----------------------------------------------------------------------------------------------	WRITE

write:
	push ebp
	mov ebp, esp
	
	push ebx	; preservar ebx
	
	mov eax, 0x4		; write
	mov ebx, [ebp+8]	; fd
	mov ecx, [ebp+12]	; buffer
	mov edx, [ebp+16]	; length
	int 80h		; write file descriptor
	
	pop ebx
	
	mov esp, ebp
	pop ebp
	ret
	
	
;-----------------------------------------------------------------------------------------------	READ
;	
;	int read(int fd, char *buff, int size);
;
;-----------------------------------------------------------------------------------------------	READ


read:

    push ebp
    mov ebp,esp;

    push ebx
    push ecx
    push edx
    mov eax,3

    mov ebx,[ebp+8]
    mov ecx,[ebp+12]
    mov edx,[ebp+16]
    int 80h

    pop edx
    pop ecx
    pop ebx

    leave
    ret
    
    
;------------------------------------------------------------------------------------------------------ PRINT
; print - imprimer una cadena en la salida estandar
;------------------------------------------------------------------------------------------------------ PRINT
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;------------------------------------------------------------------------------------------------------ PRINT
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
	
;------------------------------------------------------------------------------------------------------- EXIT
; exit - termina el programa
;------------------------------------------------------------------------------------------------------- EXIT
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;------------------------------------------------------------------------------------------------------- EXIT
exit:
	mov eax, 1		; ID del Syscall EXIT
	int 80h			; Ejecucion de la llamada


;------------------------------------------------------------------------------------------------------ STRLEN
; strlen - calcula la longitud de una cadena terminada con 0
;------------------------------------------------------------------------------------------------------ STRLEN
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;------------------------------------------------------------------------------------------------------ STRLEN
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
	

;------------------------------------------------------------------------------------------------------ NUM_TO_STRING
; num_to_string - convierte un integer a string
;
; char * num_to_string(int buffer);
;
;------------------------------------------------------------------------------------------------------ NUM_TO_STRING

;-----------------------------------------------------------
; numtostr - convierte un entero en un string guardandolo en 
; el luar donde apunte EBX
;-----------------------------------------------------------
; Argumentos:
;	1 numero a convertir
;   2 lugar de memoria
;   3 largo de memoria
; Retorno:
;	Se devuelve el string en la direccion de mmeoria dada 
;-----------------------------------------------------------
numtostr:
	push ebp
    mov ebp,esp ; guardo el puntero del stack ahora esp se encuentra apuntando al numero a convertir a ASCII
    pushad
    mov ecx,10
    mov edx,0   ; Pongo en cero la parte mas significativa ya que la division se hace haciendo la union entre edx y eax
    mov eax, dword[ebp +8]  ;Cargo el numero a convertir
    mov ebx,dword[ebp +12]   ;
    add ebx, dword [ebp+16]             ; me posiciono al final del string para empezar a colocar
    mov byte [ebx], 0       ; los caracteres ASCII de derecha a izquierda comenzando con cero
    dec ebx                 ; binario
	mov byte [ebx],10
	dec ebx
.sigo:
    div ecx
    or dl, 0x30  ; convierto el resto  menor a 10 a ASCII sumandole 30 en hexa = 48 en decimal
    mov byte [ebx], dl
    dec ebx      ; si el cociente es mayor a 0 sigo dividiendo
    cmp al,0
    jz .termino
    mov edx,0
    jmp .sigo
.termino:
    inc ebx
    push ebx
    call print
    pop ebx
    popad

    mov esp,ebp
    pop ebp
    ret
