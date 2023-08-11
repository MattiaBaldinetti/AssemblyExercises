# Data una matrice 4x4 riportare la somma degli elementi presenti lungo la sua diagonale
	.text
	.globl main
main:
	xor $s0,$s0,$s0		#contatore
	
	li $t0,1		# indice r
	li $t1,1		# indice c
	lw $t2,R		# numero righe R
	lw $t3,C		# numero colonne C

ciclo1:		##analisi diagonale principale 

	sub $t6,$t0,1		# calcolo elemento r,c
	mul $t9,$t6,$t3
	sub $t7,$t1,1		# r,c formula
	add $t9,$t9,$t7
	mul $t9,$t9,4		# MOLTIPLICO L'INDICE PER LA DIMENSIONE DELL'ELEMENTO (word = 4)
	
	lw $t8,matrice($t9)	# preleva elemento
	add $s0,$s0,$t8		# somma al contatore
	add $t0,$t0,1		# incremento riga
	add $t1,$t1,1		# incremento colonna
	ble $t1,$t3,ciclo1
	
	li $t0,1		# indice r
	li $t1,4		# indice c
	lw $t2,R		# numero righe R
	lw $t3,C		# numero colonne C
	
ciclo2:		##analisi diagonale secondaria

	sub $t6,$t0,1		# calcolo elemento r,c
	mul $t9,$t6,$t3
	sub $t7,$t1,1		# r,c formula
	add $t9,$t9,$t7
	mul $t9,$t9,4		# dimensione
	
	lw $t8,matrice($t9)	# preleva elemento
	add $s0,$s0,$t8		# somma al contatore
	add $t0,$t0,1		# incremento riga
	add $t1,$t1,1		# incremento colonna
	ble $t0,$t2,ciclo2 
	
	move $a0,$s0
	li $v0,1
	syscall

	li $v0,10
	syscall
	
	.data
	matrice: .word 45,2534643,256,3,5,3,245,1464,2695,269,5659,265,4569,23,3455,673
	R: .word 4
	C: .word 4
	
	
