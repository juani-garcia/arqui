nasm -f elf ./libasm.asm
gcc -c -m32 main.c
gcc -m32 main.o libasm.o
rm *.o