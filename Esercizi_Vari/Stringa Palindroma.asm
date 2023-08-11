# Data una stringa in memoria, dire se è palindroma o no
	.text
	.globl main
main:
	la $a0,stringa		# conserva l'indirizzo iniziale della stringa
	
lung:
	lb $t0,($a0)		# conta il numero di caratteri della stringa
	add $a0,$a0,1
	bnez $t0,lung
	sub $a0,$a0,2		# mi posiziono all'ultimo carattere
	move $a1,$a0		# copio l'indirizzo dell'ultimo carattere[indice J]
	la $a0,stringa 		# conservo l'indirizzo iniziale della stringa [indice I]
	
ciclo:
	lb $t0,($a0)		# indice I
	lb $t1,($a1)		# indice J
	bne $t0,$t1,nonpal	# confronto v[I] e v[J], se diversi salta
	add $a0,$a0,1
	add $a1,$a1,1
	blt $a1,$a0,pal		# se J<I finisco quindi STRINGA PALINDROMA

nonpal:
	la $a0,non_palindroma
	li $v0,4
	syscall
	j fine
	
pal: 
	la $a0,palindroma
	li $v0,4
	syscall
	j fine
	
fine:
	li $v0,10
	syscall
	
	.data
	stringa: .asciiz "ANNA"
	palindroma: .asciiz "STRINGA PALINDROMA"
	non_palindroma: .asciiz "STRINGA NON PALINDROMA"
	
	
	
	
	