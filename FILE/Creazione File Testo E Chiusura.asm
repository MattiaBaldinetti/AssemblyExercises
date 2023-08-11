	.text
	.globl main
	
main:
	la $a0,nome_file	# apertura file(creazione)
	li $a1,1		# file aperto per la scrittura
	li $a2,0		#
	li $v0,13		#
	syscall
	
	move $t0,$v0		# descrittore del file(indirizzo del file in memoria)
	
	move $a0,$t0		# chiusura file
	li $v0,16		#
	syscall
	
	li $v0,10
	syscall
	
	.data
	nome_file: .asciiz "C:\\cia.txt"
	