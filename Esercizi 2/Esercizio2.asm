# Implementare un programma in linguaggio assembly MIPS che legga da input un intero positivo dividendo 
# (word) ed un intero positivo (word) divisore e restituisca in output il quoziente e resto della divisione a/b.
# Esempio
# INPUT (dividendo): 56
# INPUT (divisore): 23
# OUTPUT: Quoziente: 2 Resto:10

	.text
	.globl main
	
main:
	li $v0,5		# PRIMO NUMERO IN INPUT
	syscall
	move $t0,$v0
	
	li $v0,5		# SECONDO NUMERO IN INPUT
	syscall
	move $t1,$v0
	
	div $t3,$t0,$t1		# SVOLGO LA DIVISIONE
	
	mfhi $t4		# RESTO
	mflo $t5		# QUOZIENTE	
	########################
	la $a0,Quoziente
	li $v0,4
	syscall
	
	move $a0,$t5
	li $v0,1
	syscall	
	########################
	la $a0,str
	li $v0,4
	syscall
	########################
	la $a0,Resto
	li $v0,4
	syscall
	
	move $a0,$t4
	li $v0,1
	syscall 
	########################
	li $v0,10
	syscall
	
	.data
	Quoziente: .asciiz "Quoziente: "
	Resto: .asciiz "Resto: "
	str: .asciiz "\t"