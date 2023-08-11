	.text
	.globl main

main:
	li $t0,0		#inizializza il registro che ospiterà totale
	li $v0,5		#servizio di lettura intero
	syscall
	move $t1,$v0		#spostamento del valore letto da tastiera
	
WHILE:
	bnez $t1,DO_WHILE	#esegue il ciclo while se $t1 != 0
	j EXIT_WHILE

DO_WHILE:
	add $t0,$t0,$t1		#sommatoria
	li $v0,5		#servizio di lettura intero
	syscall
	move $t1,$v0		#spostamento del valore letto da tastiera
	j WHILE
	
EXIT_WHILE:
	sw $t0,totale		#salva risultato in totale
	
	#move $a0,$t0		#sposto $t0 nel registro $a0 (istruzione che mi serve a printare
 	#li $v0,1		#istruzione che mi serve a printare
	
	li $v0,10
	syscall
	
	.data
	totale: .word 0
	