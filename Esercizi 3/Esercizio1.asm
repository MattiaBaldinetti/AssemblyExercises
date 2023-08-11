# Implementare un programma in linguaggio assembly MIPS che dati cinque interi 
# positivi definiti in memoria calcola la media aritmetica
# Esempio
# INPUT: a=0,b=11;c=7;d=1982;e=10051980
# OUTPUT:2010796

	.text
	.globl main
	
main:
	lw $t0,A
	lw $t1,B
	lw $t2,C
	lw $t3,D
	lw $t4,E
	
	add $t6,$t0,$t1   
	add $t6,$t6,$t2	
	add $t6,$t6,$t3	
	add $t6,$t6,$t4	
	
	div $t7,$t6,5
	
	move $a0,$t7
	li $v0,1
	syscall
		
	li $v0,10
	syscall

	.data
	A: .word 0
	B: .word 11
	C: .word 7
	D: .word 1982
	E: .word 10051980
	