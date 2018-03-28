; Inndata Programmet leser inn to sifre skilt med ett eller flere mellomrom
; Utdata Programmet skriver ut summen av de to sifrene,
; forutsatt at summen er mindre enn 10.

; Konstanter
	cr equ 13 ; Vognretur
 	lf equ 10 ; Linjeskift
 	SYS_EXIT equ 1
 	SYS_READ equ 3
 	SYS_WRITE equ 4
 	STDIN equ 0
 	STDOUT equ 1
 	STDERR equ 2

; Datasegment
section .bss
 	tiersiffer resb 4
 	enersiffer resb 4
 	resultat resb 4

; Datasegment
section .data
 	meld db "Skriv to ensifrede tall skilt med mellomrom.",cr,lf
 	meldlen equ $ - meld
 	feilmeld db cr,lf, "Skriv kun sifre!",cr,lf
 	feillen equ $ - feilmeld
 	summeld db "Summen av tallene ble: "
 	summeldlen equ $ - summeld
 	crlf db cr,lf
 	crlflen equ $ - crlf

; Kodesegment med program
section .text

global _start
_start:
 	mov edx,meldlen
 	mov ecx,meld
 	mov ebx,STDOUT
 	mov eax,SYS_WRITE
 	int 80h

 	; Les tall, innlest tall returneres i ecx
 	; Vellykket retur dersom edx=0
 	call lessiffer
 	cmp edx,0 ; Test om vellykket innlesning
 	jne Slutt ; Hopp tilavslutning ved feil i innlesing
 	mov eax,ecx ; Første tall/siffer lagres i reg eax

 	call lessiffer
 	; Les andre tall/siffer
 	; vellykket: edx=0, tall i ecx
 	cmp edx,0 ;Test om vellykket innlesning
 	jne Slutt

 	mov ebx,ecx ; andre tall/siffer lagres i reg ebx
 	call nylinje
 	add eax,ebx
 	mov ecx,eax
 	call skrivsiffer ; Skriv ut verdi i ecx som ensifret tall

Slutt:
 	mov eax,SYS_EXIT
 	mov ebx,0
 	int 80h

; ---------------------------------------------------------
skrivsiffer: 
; Skriver ut sifferet lagret i ecx. Ingen sjekk på verdiområde.
 	push eax
 	push ebx
 	push ecx
 	push edx

 	;deler tallet på 10 for å få tiersiffer
 	mov eax, ecx
 	mov ebx, 10
 	mov edx, 0
 	div ebx ; tiersiffer blir i eax og resten i edx

 	;Converterer tall i ASCII
 	add eax, '0'
 	mov [tiersiffer], eax

 	add edx,'0' ; converter tall til ascii.
 	mov [enersiffer], edx

    ;skriver ut en sum melding
    mov ecx,summeld
    mov edx,summeldlen
    mov ebx,STDOUT
    mov eax,SYS_WRITE
    int 80h

    ;skriver ut tiersiffer først
 	mov ecx,tiersiffer
 	mov edx,1
 	mov ebx,STDOUT
 	mov eax,SYS_WRITE
 	int 80h

    ;skriver ut enersiffer
 	mov ecx, enersiffer
 	mov edx,1
 	mov ebx,STDOUT
 	mov eax,SYS_WRITE
 	int 80h

    ;legger til et linjeskifte for at det skal se litt bedre ut
 	mov ecx,crlf
 	mov edx,crlflen
 	mov ebx,STDOUT
 	mov eax,SYS_WRITE
 	int 80h

 	push edx
 	push ecx
 	push ebx
 	push eax
 	ret

; ---------------------------------------------------------
lessiffer:
 	; Leter forbi alle blanke til neste ikke-blank
 	; Neste ikke-blank returneres i ecx
 	push eax
 	push ebx

Lokke:
 	; Leser et tegn fra tastaturet
 	mov eax,SYS_READ
 	mov ebx,STDIN
 	mov ecx,enersiffer
 	mov edx,1
 	int 80h

 	mov ecx,[enersiffer]
 	cmp ecx,' '
 	je Lokke
 	cmp ecx,'0' ; Sjekk at tast er i område 0-9
 	jb Feil
 	cmp ecx,'9'
 	ja Feil
 	sub ecx,'0' ; Konverter ascii til tall.
 	mov edx,0 ; signaliser vellykket innlesning
 	pop ebx
 	pop eax
 	ret ; Vellykket retur

Feil:
 	mov edx,feillen
 	mov ecx,feilmeld
 	mov ebx,STDERR
 	mov eax,SYS_WRITE
 	int 80h

 	mov edx,1 ; Signaliser mislykket innlesning av tall
 	pop ebx
 	pop eax
 	ret ; Mislykket retur

; ---------------------------------------------------------
; Flytt cursor helt til venstre på neste linje
nylinje:
 	push eax
 	push ebx
 	push ecx
 	push edx
 	mov edx,crlflen
 	mov ecx,crlf
 	mov ebx,STDOUT
 	mov eax,SYS_WRITE
 	int 80h

 	pop edx
 	pop ecx
 	pop ebx
 	pop eax
 	ret

; End _start
