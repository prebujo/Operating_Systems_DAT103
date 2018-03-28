;konstanter
n equ 3
STDOUT equ 1
WRITE equ 4
section .bss
a resb 4

section .data

section .text
global _start

_start:
    mov eax, 0
    mov ebx, 0
    for:
        inc ebx
        add eax, ebx
        cmp ebx, n
        jl for
call skrivTall

exit:
    mov eax, 1
    mov ebx, 0
    int 80h

;-------------------------------------------------
skrivTall: ;antar at skrivtallfunksjonen kommer her
    add eax, '0'
    mov [a], eax
    mov eax, WRITE
    mov ebx, STDOUT
    mov ecx, a
    mov edx, 1
    int 80h
    ret
