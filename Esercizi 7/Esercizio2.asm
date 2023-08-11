# Trasformare il programma nella Traccia 1 in una macro.

.macro calcolo_indice
sub $t6,$t1,1		# r - 1 
mul $t8,$t6,$t3		# C * r-1
sub $t7,$t0,1		# c - 1
add $t8,$t8,$t7		# 
mul $t8,$t8,4
.end_macro 

.macro stampa_tab
la $a0,tab
li $v0,4
syscall
.end_macro

.macro fine_prog
li $v0,10
syscall
.end_macro

.macro incremento_colonna
addi $t0,$t0,1
ble $t0,$t3, analisi_colonna
.end_macro

.macro incremento_riga
addi $t1,$t1,1
ble $t1,$t2,analisi_riga
.end_macro

.macro accapo
la $a0,capo
li $v0,4
syscall
.end_macro

.macro stampa_elemento
move $a0,$t9
li $v0,1
syscall
.end_macro

.macro carica_elem
lh $t9,matrice($t8)
.end_macro

	.text
	.globl main
main:
	li $t0,1	# c
	li $t1,1	# r
	lw $t2,R
	lw $t3,C
	
analisi_riga:
	li $t0,1

analisi_colonna:
	calcolo_indice
	carica_elem
	
	stampa_elemento
	stampa_tab
	incremento_colonna
	accapo
	incremento_riga
	fine_prog
	
	.data
	matrice: .word 1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7
	R: .word 4
	C: .word 4
	tab: .asciiz "\t"
	capo: .asciiz "\n"
