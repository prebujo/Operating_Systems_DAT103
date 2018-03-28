#!/bin/bash

nasm -f elf -F dwarf -g $1.asm
ld -m elf_i386 -o $1 $1.o
