	.text
	.globl main
	
main:
	lw $t0,num_elem		# CARICO LA LUNGHEZZA DEL VETTORE
	li $t1,0		# CONTATORE
	
loop:
	mul $t3,$t1,4		# INDICE DEL VETTORE
	lw $t4,v($t3)		# CARICO L'ELEMENTO DEL VETTORE 
	
	move $a0,$t4		# STAMPA DELL'ELEMENTO
	li $v0,1		#
	syscall			#
	 
	la $a0,spazio		# CREA UNO SPAZIO
	li $v0,4		#
	syscall			#
	
	add $t1,$t1,1		# INCREMENTO DELL'INDICE
	blt $t1,$t0,loop	# CONFRONTO TRA INDICE E LUNGHEZZA
	
	li $v0,10
	syscall
	
	.data
	v: .word 1,3,4,5,6
	num_elem: .word 5
	spazio: .asciiz " "