; Auteurs : Nermine KILANI - Félix MIELCAREK 
; Date de creation : 08/10/2024
; Objectif : ---

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Section de donnees ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
ask: db "Enter int (-1 to end): ", 0
answer: db "Result: ", 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;; Section de reservation ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; Section de code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text

global main
main:
	mov ebp, esp	; End condition for print loop
	mov ebx, -1	; End condition for input loop
	
	; [START] Print rules
	mov eax, ask		
	call print_string
	; [END]

	while1:
		; [START] Read input and check condition
		call read_int
		cmp eax, ebx
		je endWhile1	; Exit loop
		; [END]

		push eax	; Push value to stack
		jmp while1	; Restart loop
	endWhile1:

	; [START] Print result
	call print_nl
	mov eax, answer
	call print_string
	; [END]

	while2:	; Print inputs reversed
		; [START] Check if base head stack is equal to actual head stack
		cmp esp, ebp
		je endWhile2
		; [END]
		
		; [START] Print head stack
		pop eax
		call print_int	
		call print_espace	
		; [END]
		
		jmp while2	; Restart loop
	endWhile2:

	; Fin de l'execution.
	mov ebx, 0
	mov eax, 1
	int 0x80
