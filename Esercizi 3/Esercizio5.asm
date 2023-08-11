# Dato a intero positivo (da 0 a 255) inserito da tastiera, scrivere il valore binario di a al contrario 
# Esempio
# INPUT (a): 5 (cioè 00000101)
# OUTPUT: 160 (10100000)
# INPUT (a): 105 (cioè 01101001)
# OUTPUT: 150 (10010110)
	
	.eqv CONT $t5
	.eqv INCR $t6

	.text
	.globl main
	
main:
	
	li INCR,1		# incremento il contatore di una ad ogni ciclo
	li CONT,0		# inizializzo il contatore a 0
	li $t7,8
	li $t1,2
	
	la $a0,string
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
WHILE:	
	bnez $t0,DO_WHILE	# se $t0 != 0 fai il salto
	j OUT_WHILE

DO_WHILE:
	div $t0,$t1
	add CONT,CONT,INCR
	mfhi $t2		# sposto il resto in $t2
	mflo $t3		# sposto il quoziente in $t3
	move $t0,$t3
IF:
	bnez $t2,DO_IF		# se $t2 != 0 vai il salto
	j OUT_IF
DO_IF:
	li $t9,1
	
	move $a0,$t9
	li $v0,1
	syscall
	
	j WHILE
	
OUT_IF:
	li $t8,0
	
	move $a0,$t8
	li $v0,1
	syscall
	
	j WHILE
OUT_WHILE:
CICLO:
	bge $t5,$t7,FINE	# se il valore di $t5 >= $t7 allora salta
	add CONT,CONT,1
	
	li $t6,0
	move $a0,$t6
	li $v0,1
	syscall
	
	j CICLO
FINE:
	li $v0,10
	syscall
	
	#.data
	
	
	
	.data
	string: .asciiz "Inserire un numero minore di 255: "