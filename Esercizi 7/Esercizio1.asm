# Implementare un programma in linguaggio assembly MIPS che definiti R (numero di righe) e C (numero di colonne)
# rispettivamente in $t0 e $t1, stampa in maniera leggibile e conforme alla struttura tabellare 
# una matrice MRxC definita in memoria.

	.text
	.globl main
main:
	li $t0,1			# INDICE r
	li $t1,1			# INDICE c
	lw $t2,R			# NUMERO DELLE RIGHE
	lw $t3,C			# NUMERO DELLE COLONNE

analisi_riga:
	li $t1,1
	
analisi_colonna:
	sub $t6,$t0,1			# r - 1
	mul $t9,$t3,$t6			# C(r-1)
	sub $t7,$t1,1			# c - 1
	add $t9,$t9,$t7			# C(r-1) + (c-1)
	mul $t9,$t9,4			# MOLTIPLICO L'INDICE PER LA DIMENSIONE DELL'ELEMENTO (word = 4)
	lh $t8,matrice($t9)		# PRLIEVO DELL'ELEMENTO
	
	move $a0,$t8			# STAMPA L'ELEMENTO
	li $v0,1
	syscall
	
	la $a0,tab			# STAMPA SPAZIO
	li $v0,4
	syscall
	
	addi $t1,$t1,1			# INCREMENTO COLONNA
	ble $t1,$t3,analisi_colonna
	
	la $a0,riga
	li $v0,4
	syscall
	
	addi $t0,$t0,1			# INCREMENTO RIGA	
	ble $t0,$t2,analisi_riga	
	
	li $v0,10			# CHIUSURA PROGRAMMA
	syscall				
	
	
	.data
	matrice: .word 44,234,256,3,  5,3,245,1464,  265,269,569,265,  459,23,355,673,  367,551,663,382
	R: .word 4
	C: .word 5
	tab: .asciiz "\t"
	riga: .asciiz "\n"
