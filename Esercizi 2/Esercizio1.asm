# Implementare un programma in linguaggio assembly MIPS che:
# stampa a video “Primo numero: ” e prenda in input un numero a
# stampa a video “Secondo numero: ” e prenda in input un numero b
# stampa a video “Prodotto dei due numeri: ” e stampi a video axb

# Esempio
# OUTPUT: Primo Numero:
# INPUT:5
# OUTPUT:Secondo Numero:
# INPUT:6
# OUTPUT: Prodotto dei due numeri:30
	
	.text
	.globl main
	
main:
	# input del primo numero con relativo messaggio stringa
	la $a0,primo		
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	##########################
	
	# input del secondo numero con relativo messaggio stringa
	la $a0,secondo
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	mul $t2,$t1,$t0		# moltiplicazione tra i due numeri
	
	la $a0,fine
	li $v0,4
	syscall
	
	move $a0,$t2
	li $v0,1
	syscall
		
	.data
	primo: .asciiz "Primo numero: "
	secondo: .asciiz "Secondo numero: "
	fine: .asciiz "Prodotto dei due numeri: "
--------------------------------------------------------------
ALTRO MODO
	.text
	.globl main

main:
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,5
	syscall
	move $t1,$v0
	
	mul $t2,$t0,$t1
	####################### 	PRIMO NUMERO
	la $a0,primo
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	######################  	SECONDO NUMERO
	la $a0,ACCAPO
	li $v0,4
	syscall
	
	la $a0,secondo
	li $v0,4
	syscall
	
	move $a0,$t1
	li $v0,1
	syscall
	######################		PRODOTTO
	la $a0,ACCAPO
	li $v0,4
	syscall
	
	la $a0,prodotto
	li $v0,4
	syscall
	
	move $a0,$t2
	li $v0,1
	syscall
	
	li $v0,10			# CHIUSURA PROGRAMMA
	syscall
	
	.data
	primo: .asciiz "Primo numero: "
	secondo: .asciiz "Secondo numero: "
	prodotto: .asciiz "Prodotto tra i due numeri: "
	ACCAPO: .asciiz "\n"
