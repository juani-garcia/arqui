# Errores en busqueda_binaria.asm

1 - Error principal. Cuando lee los datos con la syscall read
    se olvida de setear en ebx el file descriptor que retorno 
    la syscall open. El error se soluciona haciendo un
    mov ebx, eax despues del primer int 80h y antes del segundo.

Los otros errores son iguales a los del tema 2 y el tema 5.