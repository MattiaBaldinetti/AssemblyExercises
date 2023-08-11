	.text
	.globl main

main:
 	li $t0,5		#inizializzazione di x a 5
 	li $t1,3		#inizializzazione di y a 3
 	move $t2,$t1		#scambio
 	move $t1,$t0		#scambio
 	move $t0,$t2		#scambio
 	xor $t2,$t2,$t2		#pulisco $t2
 	
 	move $a0,$t2
 	li $v0,1		#terminazione del programma
 	syscall