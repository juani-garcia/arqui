GLOBAL  main
    extern    atoi
    extern    printf

section .text

main:
    push    rbx            ; 
    push    rsi
    push    rdi
    cmp    rdi, 3            ;
    jne    error1
    mov     rcx,rsi
    mov    rdi, [rcx + 8]
    push    rcx        
    call    atoi
    pop     rcx
    mov    rbx, rax
    mov     rdi, [rcx + 16]
    call    atoi    
    
    cmp    eax, 0
    jle    error2
    mov     rdi, rax    
    dec    rdi    
    mov     rdx ,rax  
    mov     rax, rbx
    mov     rsi, rbx    
check:
    test    rdi, rdi        ;
    jz      gotit            ; 
    imul    rax, rsi        ; 
    dec    rdi
    jmp    check
gotit:                    ; 
    mov     rsi,rax
    mov     rdi,answer

    call    printf
    jmp    done
error1:                    ; 
    mov     rdi,badArgumentCount
    call    printf
    jmp    done
error2:                    ; 
    mov    rdi,negativeExponent
    call    printf

done:                    ; 
    pop    rdi
    pop    rsi
    pop    rbx
    ret

answer:
    db      '%d', 10, 0
badArgumentCount:
    db    'Requires exactly two arguments', 10, 0
negativeExponent:
    db    'The exponent may not be negative', 10, 0