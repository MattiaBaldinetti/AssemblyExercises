	.text
	.globl main
main:
	la $a0,nome_file	#apertura file per scrivere
	li $a1,0		#
	li $a2,0		#
	li $v0,13		#
	syscall			#
	move $a0,$v0		
	
	la $a1,messaggio_letto	
	li $a2,100		#numero di caratteri da scrivere
	li $v0,14
	syscall			#lettura messaggi su file
	
	la $a0,messaggio_letto	#stampa a video quanto letto nel file
	li $v0,4		#
	syscall			#
	
	li $v0,16		#chiusura file
	syscall
	
	li $v0,10		#chiusura programma
	syscall
	
	.data
	nome_file: .asciiz "C:\\Users\\Desktop\\ciao.txt"
	messaggio_letto: .space 255