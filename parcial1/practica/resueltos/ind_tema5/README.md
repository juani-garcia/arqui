# Errores encontrados en busqueda_binaria.asm, en orden de gravedad:

1 - Al salir del main, no se desarma correctamente el stack frame.
    Esto provoca que el ret de la linea 89 (dentro de exit) intente
    volver a la posicion donde se gurado el ebp del cntexto anterior,
    generando un Segmentation Fault. Para remediar el error basta con 
    desarmar el stack frame antes del ret (es decir, mov esp, ebp
    seguido de un pop ebp).

2 - Al pasarle como clave de busqueda el valor 0, el programa entra en
    un ciclo infinito. Esto se debe a que cuando deberia cortar la busqueda
    binaria (left >= right), en realidad se pregunta si no hubo carry
    en la operacion anterior. Para arreglarlo, basta con reemplazar el jae
    por un jge.

3 - Al pasarle como clave de busqueda el valor 59, el programa no lo encuentra 
    si bien el mismo aparece como valor en datos.txt. Estos debe a que el atoi 
    pasa de string a numeros mientras los mimos esten seguidos por un espacio.
    Dado que datos.txt termina con un salto de linea, el atoi falla devolviendo
    en eax -1. Se podria arreglar bien haciendo que el atoi lea hasta que
    el valor leido no sea un digito, o bien arreglando el datos.txt para que
    el mismo termine con un espacio en lugar de un salto de linea.
    
4 - Falta el ret de la funcion cargo_datos. Tbh no tengo ni idea
    por que funciona sin ese ret.
#   ¯\\_(ツ)_/¯.
