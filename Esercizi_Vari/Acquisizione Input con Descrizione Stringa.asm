	.text
	.globl main

main:
	la $a0,str1		# inserimento locazione dell'inizio del messaggio
	li $v0,4		# servizio di stampa di una stringa
	syscall			# chiamata di sistema
	
	li $v0,5		# servizio di lettura di un intero da tastiera
	syscall			# chiamata di sistema
	move $t0,$v0		# spostamento del valore letto da tastiera
	
	mul $t1,$t0,$t0		# elevazione di $t0^2
	
	la $a0,str2		# inserimento locazione dell'inizio del messaggio
	li $v0,4		# servizio di stampa di una stringa
	syscall			# chiamata di sistema
	
	move $a0,$t1		# spostamento del valore intero da stampare
	li $v0,1		# servizio di stampa di un intero
	syscall			# chiamata di sistema
	
	li $v0,10		
	syscall			# chiamata di sistema
	
	.data
	str1: .asciiz "Inserire il numero:"
	str2: .asciiz "\n Il quadrato del numero è:"
	