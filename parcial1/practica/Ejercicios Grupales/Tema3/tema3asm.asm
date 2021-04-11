section .text
GLOBAL fork			;NOT TESTED
extern strLength

fork:
    push ebp
    mov ebp,esp
    
    push ebx                    ;preservo

    mov eax,2                   ;sys_fork
    int 80h                     ;fork
    
    cmp eax, 0                  ;si es mayor a 0 es el padre 
    jg father
    je son
    jmp final

    
father:
    call getpid  
    mov ecx,father_message
    mov edx,length_father	    ; Largo de la cadena 
	mov ebx, 1		            ; FileDescriptor (STDOUT)
	mov eax, 4		            ; ID del Syscall WRITE
	int 80h	
    

    jmp final
     
     	
son:
    
    call getpid  
    mov ecx,son_message
    mov edx,length_son	        ; Largo de la cadena 
	mov ebx, 1		            ; FileDescriptor (STDOUT)
	mov eax, 4		            ; ID del Syscall WRITE
	int 80h	
    

final:

    pop ebx 

    mov esp,ebp
    pop ebp

    ret
    
;-----------------------------------------------------

getpid:

    push ebp
    mov ebp,esp
    push ebx
    mov eax,20                  ;sys_getpid
    int 80h 
   
    push eax
    push string
    call toString
    add esp,8
    push string
    call print
   

    pop ebx
    mov esp,ebp
    pop ebp
    
	ret	            


;-----------------------------------------------------

;int toString(char *string, int number);
toString:                      
    push ebp
    mov ebp,esp
    push edi
    push ebx
    push esi
    mov edi,[ebp+8]
    mov eax,[ebp+12]
    mov ebx,0
    cmp eax,0
    je isZero
    .loop:
    cmp eax,0                   ;usa como numero eax, y como direccion de memoria a guardar edi
    jle concat
    inc ebx
    mov ecx,10
    mov edx,0
    div ecx  
    add edx,'0'
    push edx
    jmp .loop

    isZero:
    mov edx,eax
    add edx,'0'
    inc ebx
    push edx

    concat:
    cmp ebx,0
    jle end
    pop ecx
    mov [edi], cl
    inc edi
    inc eax
    dec ebx
    jmp concat

    end:
    mov byte [edi],0
    pop esi
    pop ebx
    pop edi
    
    mov esp, ebp
    pop ebp
    ret
    
;-----------------------------------------------------

;int print(char *string);
print:                             
    push ebp
    mov ebp,esp
    push ebx
    mov ecx,[ebp+8]                 ;lo que quiero imprimir
    push ecx
    call strLength
    mov edx, eax                    ; cant de caracteres
	mov ebx, 1		                ; FileDescriptor (STDOUT)
	mov eax, 4		                ; ID del Syscall WRITE
	int 80h			                ; Ejecucion de la llamada
    mov eax,ecx
    pop ebx
    mov esp,ebp
    pop ebp
    ret

section .data
    father_message db "soy el padre",10,0
    length_father equ $-father_message
    son_message  db "soy el hijo",10, 0	
    length_son equ $-son_message


section .bss
	placeholder resb 10
    string resb 10
