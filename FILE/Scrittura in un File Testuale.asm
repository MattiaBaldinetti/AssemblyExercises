# Creazione di un file e scrittura al suo interno , nel percorso specificato in "nome_file"
	.text
	.globl main
	
main:
	la $a0, nome_file	# APERTURA FILE PER SCRIVERE
	li $a1,1		# FILE APERTO PER LA SCRITTURA
	li $a2,0
	
	li $v0,13		# APERTURA DEL FILE
	syscall			#
	move $t0,$v0		# INDIRIZZO DEL FILE IN MEMORIA
	
	move $a0,$t0
	la $a1,messaggio	# LOCAZIONE DOVE RISIEDE IL DATO DA SCRIVERE
	li $a2,30		# NUMERO DI CARATTERI DA SCRIVERE
	li $v0,15		# SCRITTURA NEL FILE
	syscall			#
	move $a0,$t0		#
	
	move $a0,$t0		# CHIUSURA DEL FILE
	li $v0,16		#
	syscall			#
	 
	li $v0,10		# FINE PROGRAMMA
	syscall
	
	
	.data
	nome_file: .asciiz "C:\\Users\\UtentePC\\Desktop\\Pippo.txt"
	messaggio: .asciiz "Ciao come stai"