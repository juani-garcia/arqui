#!/bin/bash

nasm -felf32 -g libasm.asm
gcc -c -g -S -m32 main.c
gcc -m32 -g -fno-builtin main.o libasm.o -o main
./main ./archivoA.txt ./archivoB.txt ./archivoC.txt
