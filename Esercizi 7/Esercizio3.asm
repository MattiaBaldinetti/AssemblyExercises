# Definita in memoria una matrice di 4 righe e 4 colonne con elementi byte, stampare in output 
# la somma degli elementi presenti lungo una colonna 
# MEMORIA
# 3 6 7 8
# 1 5 2 0
# 6 8 10 5
# 4 1 -9 2
# OUTPUT
# COLONNA 1: 14
# COLONNA 2: 20
# COLONNA 3: 10
# COLONNA 4: 15

	.text
	.globl main
main:
	li $t0,1			# riga
	li $t1,1			# colonna
	lw $t2,R			# RIGHE
	lw $t3,C			# COLONNE
analisi_riga:
	li $t0,1			# INIZIALIZZO LA RIGA
analisi_colonna:
	sub $t4,$t0,1			# r - 1
	mul $t9,$t3,$t4			# C(r-1)
	sub $t7,$t1,1			# c - 1
	add $t9,$t9,$t7			# C(r-1) + (c-1)
	mul $t9,$t9,4			# MOLTIPLICO L'INDICE PER LA DIMENSIONE DELL'ELEMENTO (half = 2)
	lw $t5,matrice($t9)		# PRELEVO L'ELEMENTO 
	
	add $s0,$s0,$t5			# INCREMENTO LA SOMMA
	addi $t0,$t0,1			# INCREMENTO LA RIGA
	ble $t0,$t3,analisi_colonna	# SE $T0 <= $T3, ALLORA SALTA
	
	move $a0,$s0			# STAMPA LA SOMMA
	li $v0,1
	syscall
		
	la $a0,capo			# STAMPA LO SPAZIO
	li $v0,4
	syscall
	
	li $s0,0			# INIZIALIZZA LA SOMMA A 0
	
	addi $t1,$t1,1			# INCREMENTA LA COLONNA
	ble $t1,$t2,analisi_riga	# SE $T1 <= $T2, SALTA
	
	li $v0,10			# CHIUSURA DEL PROGRAMMA
	syscall

	.data
	R: .word 4
	C: .word 4
	matrice: .word 3,6,7,8,  1,5,2,0,  6,8,10,5,  4,1,-9,2
	capo: .asciiz "\n"
	tab: .asciiz "\t"	
	