# Creazione di un file nel percorso specificato in "nome_file"
		.text 
	.globl main
	
main:
	la $a0,nome_file	# CREAZIONE FILE
	li $a1,1		# FILE APERTO PER LA SCRITTURA
	li $a2,0		# MODE (non va inizializzato)
	
	li $v0,13		# APERTURA FILE
	syscall			#
	move $t0,$v0		# INDIRIZZO DEL FILE IN MEMORIA
	
	move $a0,$t0		# CHIUSURA DEL FILE
	li $v0,16		#
	syscall			#
	
	li $v0,10		# CHIUSURA PROGRAMMA
	syscall			#
	
	.data
	nome_file: .asciiz "C:\\Users\\UtentePC\\Desktop\\Pippa.txt"
	