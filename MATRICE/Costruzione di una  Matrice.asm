# Costruzione di una matrice
	.text
	.globl main
main:
	li $t0,1 		# indice r
	li $t1,1		# indice c
	lw $t2,R		# numero di righe R
	lw $t3,C		# numero di colonne C
analisi_riga:
	li $t1,1
analisi_colonna:
	sub $t6,$t0,1		# calcolo elemento r,c ($t6 = r - 1)
	mul $t9,$t3,$t6		# $t9 = C*(r-1)
	sub $t7,$t1,1		# formula r,c ($t7 = c - 1)
	add $t9,$t9,$t7		# $t9 = C*(r-1) + (c - 1)
	mul $t9,$t9,2		# MOLTIPLICO L'INDICE PER LA DIMENSIONE DELL'ELEMENTO (half = 2)
	lh $t8,matrice($t9)	# prelievo elemento
	
	move $a0,$t8
	li $v0,1
	syscall
	
	la $a0,tabulato
	li $v0,4
	syscall
	
	addi $t1,$t1,1		# incremento colonna
	ble $t1,$t3,analisi_colonna
	
	la $a0,riga
	li $v0,4
	syscall
	
	addi $t0,$t0,1		# incremento riga
	ble $t0,$t2,analisi_riga
	
	li $v0,10
	syscall
	
	.data
	matrice: .half 2:20
	R: .word 4
	C: .word 5
	tabulato: .asciiz "\t"
	riga: "\n"
