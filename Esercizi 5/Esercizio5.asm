# Scrivere un programma in linguaggio assembly MIPS che legga una stringa introdotta da tastiera. 
# La stringa contiene sia caratteri maiuscoli che caratteri minuscoli, e complessivamente al più 255 caratteri. 
# Il programma deve svolgere le seguenti operazioni:
# 1) visualizzare la stringa inserita
# 2) stampare a video l'uppercase della stringa
# Ad esempio la frase "Che Bella Giornata" diviene "CHE BELLA GIORNATA".
		
	.text
	.globl main
main:
	la $a0,txt 		# CARICO L'INDIRIZZO DOVE SALVERO' LA STRINGA
	li $a1,255 		# CARICO IL NUMERO MASSIMO DI CARATTERI CHE POSSONO ESSERE PRESENTI NELLA STRINGA
	
	li $v0,8 		# LETTURA STRINGA
	syscall
	
	li $t0,0 		# INIZIALIZZAZIONE DI UN CONTATORE
	lb $t8,A 		# CARICO I VALORI DI ALCUNI CARATTERI DELLA TABELLA ASCII
	lb $t9,a 		#
	sub $t7,$t9,$t8 	# SALVO LA DIFFERENZA FRA UPPER E LOWER
	
CICLO:	
	lb $t1,txt($t0) 	# CARICO L'I-ESIMO CARATTERE DELLA STRINGA
	beq $t1,0,FINE 		# SE HO CARICATO UNO 0, HO CARICATO L'ULTIMO ELEMENTO, E SALTO ALLA FINE
	blt $t1,$t9,SALVATAGGIO # SE IL CARATTERE E' GIA' IN UPPER, SALTA LA CONVERSIONE
	sub $t1,$t1,$t7 	# ALTRIMENTI SOTTRAGGO LA DIFFERENZA FRA UPPER E LOWER
	
SALVATAGGIO:	
	li $v0,11 		# STAMPA CARATTERE
	move $a0,$t1 		# SPOSTO L'ELEMENTO CHE VOGLIO SALVARE
	syscall 
	add $t0,$t0,1 		# INCREMENTO IL CONTATORE
	j CICLO 		# JUMP
	
FINE:	
	li $v0,10 # FINE PROGRAMMA
	syscall
	
	.data
	A: .asciiz "A"
	a: .asciiz "a"
	txt: .asciiz
--------------------------------------------------------------
ALTRO MODO
	.text
	.globl main
main:
	li $v0,8
	la $a0,input
	li $a1,255
	
	syscall
	
	li $t0,0
	li $v0,4
loop:
	lb $t1,input($t0)
	beq $t1,0,exit
	blt $t1,'a',case
	bgt $t1,'z',case
	sub $t1,$t1,32
	sb $t1,input($t0)
	
case:
	addi $t0,$t0,1
	j loop

exit:
	la $a0,input
	li $v0,4
	syscall
	
	li $v0,10
	syscall
			
	.data
	input: .space 255


