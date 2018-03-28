;konstanter
n equ 5 ;setter hvor mange fibonacci tall man ønsker her
cr equ 13
lf equ 10

section .data
nl db cr,lf
nll equ $ - nl

section .bss
a resb 4

section .text
global _start
_start:
mov eax, 1
mov ebx, 2
mov ecx, n

for:
    push ecx
    call skrivTall
    mov edx, eax
    mov eax, ebx
    add ebx, edx
    pop ecx
    loop for

exit:
    mov eax, 1
    mov ebx, 0
    int 80h


skrivTall:
    push eax
    push ebx
    add eax,'0'
    mov [a], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, a
    mov edx, 1
    int 80h
    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, nll
    int 80h
    pop ebx
    pop eax
    ret
