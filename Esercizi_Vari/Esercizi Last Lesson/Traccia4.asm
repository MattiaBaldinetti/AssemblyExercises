# Data una matrice RxC realizzare un programma in asembly MIPS che restutisce
# la somma degli elementi aventi il valore uguale alla somma degli indici r e c
# Esempio
#	2 5 7
#	3 0 8
#	7 9 6
#	1 6 5
# a11+a21+a33+a42 output=2+3+6+6=17
# NB: La matrice è definita in memoria. Gli elementi della matrice sono interi a 16bit.
# Il programma deve valere per ogni matrice RxC, lo studente può inizializzare una
# generica matrice di dimensione fissa con R e C prefissati.
	.text
	.globl main
main:
	li $t0,1			# righe
	li $t1,1			# colonne
	lw $t2,R			# RIGHE
	lw $t3,C			# COLONNE
analisi_riga:
	li $t1,1
analisi_colonna:
	sub $t5,$t0,1			# r - 1	
	mul $t6,$t3,$t5			# C ( r - 1 )
	sub $t5,$t1,1			# c - 1 
	add $t7,$t6,$t5			# C(r - 1) + (c - 1)
	mul $t7,$t7,2			# MOLTIPLICO PER HALF
	lh $t9,matrice($t7)		# CARICO L'ELEMENTO
	
	add $t8,$t1,$t0			# SOMMO I DUE INDICI
	beq $t9,$t8,uguali		# $T9 = $T8, SALTA
	addi $t1,$t1,1			# INCREMENTA INDICE COLONNA
	ble $t1,$t3,analisi_colonna	# $T1 <= $T3, SALTA
riga:	
	addi $t0,$t0,1			# INCREMENTA INDICE RIGA
	ble $t0,$t2,analisi_riga	# $T0 <= $T2, SALTA
	j fine
uguali:
	add $t4,$t4,$t9			# INCREMENTA LA SOMMA FINALE
	addi $t1,$t1,1			# incrementa indice
	ble $t1,$t3,analisi_colonna	# $T1 <= $T3, SALTA
	j riga

fine:
	move $a0,$t4			# STAMPA RISULTATO
	li $v0,1
	syscall
	
	li $v0,10			# CHIUSURA PROGRAMMA
	syscall
			
	.data
	matrice: .half 2,5,7,  3,0,8,  7,9,6,  1,6,5   
	R: .word 4
	C: .word 3