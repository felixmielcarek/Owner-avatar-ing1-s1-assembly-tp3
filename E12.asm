%include "asm_io.inc"
%define taille_mot 4 ; 4 en 32 bits, 8 en 64 bits

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Section de donnees ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
prompt1 : db "example", 0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; Section de code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:
    push prompt1
	call print_string2
	add esp, 4

	; Fin de l'execution.
    mov ebx, 0
    mov eax, 1
    int 0x80

print_string2:
	push ebp
	mov ebp, esp

	mov eax, [ebp+4*(1+1)]
	push eax		; Ajout de l'argument dans la pile
    call longueur	; Appel de la fonction
    add esp, 4		; Depile d'un coup l'argument

	mov ecx, [ebp+4*(1+1)]	; address of the message to be printed
	mov edx, eax			; length of the message
	mov eax, 4				; sys_write system call number
	mov ebx, 1				; file descriptor for stdout
	int 0x80

	pop ebp
	ret		

longueur:
	;argument : adresse de la chaine
	push ebp
    mov ebp,esp
    mov eax,[ebp+taille_mot*2]
    dec eax
    loop_tc:
    	inc eax
        cmp byte [eax],0
        jne loop_tc
        sub eax,[ebp+taille_mot*2]
        pop ebp
        ret

