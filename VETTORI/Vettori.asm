	.text
	.globl main
	
main:
	lw $t1,num_elem		# numero elementi del vettore
	la $t3,array	
	
	mul $t9,$t1,4		# posizione relativa dell’ultimo elemento
	add $t9,$t9,$t3		# posizione relativa dell’ultimo elemento indirizzo assoluto
	
loop:
	lw $t4,($t3)	# carico l’i-esimo elemento nel registro $t4 cioè $t4=v[i]
	move $a0,$t4 
	
	li $v0,1
	syscall
	
	la $a0,spazio
	li $v0,4
	syscall
	
	add $t3,$t3,4		# incremento indice
	blt $t3,$t9,loop	# confronto per determinare la fine del vettore
	
	li $v0,10
	syscall
	
	.data
	array: .word 12,43,23,54,77
	num_elem: .word 5
	spazio: .asciiz " "
	