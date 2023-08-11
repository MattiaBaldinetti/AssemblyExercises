# Implementare un programma in linguaggio assembly MIPS che legga da 
# input un intero positivo  a>2 (word) ed un intero  positivo (word) b>1 e ne 
# restituisca in output il prodotto (axb) senza utilizzare l'istruzione mul.
# Esempio
# INPUT (a): 10
# INPUT (b): 5
# OUTPUT: 50	

	.text
	.globl main
main:
	la $a0,uno
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	la $a0,due
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
ciclo:	
	sub $t1,$t1,1		#sottrazione
	add $t2,$t2,$t0		#addizione
	beqz $t1,fine		# confronto con 0
	j ciclo
fine:
	move $a0,$t2
	li $v0,1
	syscall

	li $v0,10
	syscall
	
	.data
	uno: .asciiz "Inserire un numero maggiore di 2: "
	due: .asciiz "Inserire un numero maggiore di 1: "
	
