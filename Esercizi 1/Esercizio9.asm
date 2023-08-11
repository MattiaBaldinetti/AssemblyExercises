# Si scriva un programma in linguaggio assembly MIPS per il calcolo dei quadrati perfetti per una sequenza di numeri. 
# Il programma deve prima leggere un numero inserito da tastiera, e quindi stampare i primi quadrati perfetti sino al quadrato del numero.
# ES:	INPUT=5
#	OUTPUT=1,4,9,16,25

	.text
	.globl main
main:
	li $t8,1
	
	li $v0,5
	syscall
	move $t0,$v0

ciclo:
	add $t9,$t0,1		# faccio questo add almeno mi stampa anche l'ultimo numero
	sub $t5,$t0,$t0
	bge $t8,$t9,check	
	
	add $t6,$t5,$t8
	add $t8,$t8,1 
	mul $t7,$t6,$t6
	
	move $a0,$t7
	li $v0,1
	syscall
	
	la $a0,str
	li $v0,4
	syscall
	j ciclo
	
check:
	li $v0,10
	syscall	
			
	.data
	str: .asciiz "\t"