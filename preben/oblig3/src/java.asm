; Konstanter
	cr equ 13 ; Vognretur
 	lf equ 10 ; Linjeskift
 	SYS_EXIT equ 1
 	SYS_READ equ 3
 	SYS_WRITE equ 4
 	STDIN equ 0
 	STDOUT equ 1
 	STDERR equ 2

section .bss
    asum resb 4



section .data
    meld db "Kjoerer loop", cr, lf
    meldlen equ $ - meld
    meld2 db "Loop ferdig, resultat av a: ", cr, lf
    meld2len equ $ - meld2
    crlf db cr,lf
    crlflen equ $ - crlf

section .text
global _start
_start:
    mov edx,meldlen
    mov ecx,meld
    mov ebx,STDOUT
    mov eax,SYS_WRITE
    int 80h
    mov ecx, 20
    mov ebx, 0
    mov eax, 0

;loop som går 20 ganger og sjekker ebx om det skal inkrementeres eller dekrementeres
looper:
    cmp ebx, 10     ;hvis ebx er større eller lik enn 10 (jge) dekrementeres det, hvis mindre (jl) inkrementeres det
    jl increment
    jge decrement

    loopcont:    ;fortsetter loop etter å ha inkrementert eller dekrementert
    inc ebx
    loop looper  ; looper fra ecx 20 til 0
    jmp printres ;hopper over decrement og increment etter loop

;inkrementerer eax
increment:
    inc eax
    jmp loopcont

;dekrementerer eax
decrement:
    dec eax
    jmp loopcont

;printer resultat av loopen over og avslutter
printres:
    add eax, '0'
    mov [asum],eax
    mov edx,meld2len
    mov ecx,meld2
    mov ebx,STDOUT
    mov eax,SYS_WRITE
    int 80h

    mov edx,1
    mov ecx,asum
    mov ebx,STDOUT
    mov eax,SYS_WRITE
    int 80h

    ;legger til et linjeskifte for at det skal se litt bedre ut
 	mov ecx,crlf
 	mov edx,crlflen
 	mov ebx,STDOUT
 	mov eax,SYS_WRITE
 	int 80h

 	mov eax,SYS_EXIT
 	mov ebx,0
 	int 80h
    ret
