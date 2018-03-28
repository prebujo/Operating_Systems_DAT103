;program som skriver ut hello world
;konstanter
cr equ 13; Vognretur
lf equ 10; Linjeskift
WRITE equ 4
STD_OUT equ 1

section .data ;Datasegment
    melding db 'Hello World',cr,lf
    lengde equ $ - melding

section .text ;Kodesegment
    global _start

_start:
mov edx, lengde
mov ecx, melding
mov ebx, STD_OUT
mov eax, WRITE
int 80h
mov ebx, 0
mov eax, 1 ;sys_exit
int 80h
