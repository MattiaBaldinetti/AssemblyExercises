# Implementare un programma in linguaggio assembly MIPS che legga da input un intero e 
# calcoli il numero di 1 della sua rappresentazione binaria.
# Esempio
# INPUT: 521 (in binario 1000001001)
# OUTPUT:3

	.text
	.globl main
	
main: 
	lw $t0,num
	li $t7,0
WHILE:	
	bnez $t0,LOOP
	j Fine
	
LOOP:
	rem $t3,$t0,2		# mi da il resto della divisione ($t3 = $t0 % 2)
	div $t0,$t0,2		# divide per 2 il numero	 ($t0 = $t0 / 2)
	
	beq $t3,1,incr
	
	j WHILE
	
incr:
	add $t7,$t7,1
	j WHILE
	
Fine:	

	move $a0,$t7
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
	.data
	num: .word 26
--------------------------------------------------------------ALTRO METODO
	.text
	.globl main
	
main:
	li $t9,1
	
	li $v0,5
	syscall
	move $t0,$v0
ciclo:
	blt $t0,$t9,fine
		
	div $t0,$t0,2
	mflo $t0		# QUOZIENTE
	
	mfhi $t5		# RESTO
	beq $t5,$t9,check
	
	j ciclo
check:
	add $t1,$t1,1
	j ciclo
	
fine:
	move $a0,$t1
	li $v0,1
	syscall
	
	li $v0,10
	syscall	
