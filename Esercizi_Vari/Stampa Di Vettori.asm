	.text
	.globl main
	
main:	
	lw $t1,numelem		# carico il numero degli elementi
	li $t2,0		# $t2 è l'indice
	
loop:	
	mul $t3,$t2,2		# moltiplico l'indice per la dimensione
	lh $t4,array($t3)	# carico l'i-esimo elemento nel registro $t4 cioè $t4 = v[i]
	
	move $a0,$t4
	li $v0,1
	syscall
	
	la $a0,spazio
	li $v0,4
	syscall
	
	add $t2,$t2,1		# incremento l'indice
	blt $t2,$t1,loop	# Confronto per eventuale salto
	
	li $v0,10
	syscall
	
	
	.data
	array: .half 12,43,23,54,77
	numelem: .word 5
	spazio: .asciiz " "
	