;konstanter
WRITE equ 4
STD_OUT equ 1
cr equ 13
lf equ 10


section .data
    nl db cr,lf
    nll equ $ - nl
section .bss
    x resb 4 

section .text
    global _start

_start:
    mov eax, 0
    mov ebx, 0
    mov ecx, 20 
    push eax
    push ebx
for:
    cmp ebx,10
    jge else
    if:
        inc eax
        jmp fi
    else:
        dec eax
    fi:
        add ebx, 1
        cmp ebx, 20
        jl for

printres:
    add eax, '0'
    mov [x], eax
    mov ecx, x 
    mov edx, 1
    mov eax, WRITE
    mov ebx, STD_OUT
exit:
    int 80h
    mov eax, 1
    mov ebx, 0
    int 80h
