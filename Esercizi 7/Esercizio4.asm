# Definita una matrice in memoria di 4 righe e 3 colonne A4x3 con elementi word, 
# stampare in output la matrice trasposta At3x4.
# La matrice trasposta At è costituita dagli elementi alla posizione inversa della matrice originale A: cioè A(ai,j) 
# si trova in At(aj,i)15
	
	.text
	.globl main
main:
	li $t0,1			# riga
	li $t1,1			# colonna
	lw $t2,R			# INIZIALIZZO RIGA
	lw $t3,C			# INIZIALIZZO COLONNA
analisi_riga:
	li $t0,1
analisi_colonna:
	sub $t6,$t0,1			# calcolo elemento r,c ($t6 = r - 1)
	mul $t9,$t3,$t6			# $t9 = C*(r-1)
	sub $t7,$t1,1			# formula r,c ($t7 = c - 1)
	add $t9,$t9,$t7			# $t9 = C*(r-1) + (c - 1)
	mul $t9,$t9,4			# MOLTIPLICO L'INDICE PER LA DIMENSIONE DELL'ELEMENTO (word = 4)
	lw $t8,matrice($t9)		# prelievo elemento

	move $a0,$t8			# STAMPO L'ELEMENTO
	li $v0,1
	syscall
	
	la $a0,tab			# STAMPO LO SPAZIO
	li $v0,4
	syscall
	
	addi $t0,$t0,1			# INCREMENTO LA RIGA
	ble $t0,$t2,analisi_colonna	# SE $T0 <= $T2, SALTA
	
	la $a0,capo			# STAMPA LA RIGA VUOTA
	li $v0,4
	syscall
	
	addi $t1,$t1,1			# INCREMENTO LA COLONNA
	ble $t1,$t3,analisi_riga	# SE $T1 <= $T3, SALTA
	
	li $v0,10 			# CHISURA DEL PROGRAMMA
	syscall

	.data
	R: .word 3
	C: .word 4
	matrice: .word 12,74,06,07,99,10,11,16,00,03,20,21
	capo: .asciiz "\n"
	tab: .asciiz "\t"
