	.text
	.globl main
main:
	la $a0,nome_file	#apertura file per scrivere
	li $a1,1		#
	li $a2,0		#
	li $v0,13		#
	syscall
	move $t0,$v0		#descrittore del file(indirizzo del file in memoria)
	
	move $a0,$t0		#chiusura file
	la $a1,messaggio	#locazione dove risiede il dato da scrivere
	li $a2,5		#numero di caratteri da scrivere
	li $v0,15
	syscall
	
	move $a0,$t0		#chiusura file
	li $v0,16
	syscall
	
	li $v0,10		#chiusura programma
	syscall
	
	.data
	nome_file: .asciiz "C:\\Pippo.txt"
	messaggio: .asciiz "Nel mezzo del cammin di nostra vita"