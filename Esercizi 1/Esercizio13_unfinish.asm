# Si scriva un programma in linguaggio assembly MIPS per calcolare il massimo comun divisore (MCD) 
# di due numeri interi positivi. Il MCD è de?nito come il massimo tra i divisori comuni ai due numeri. Stampare il MCD.
# Suggerimento. Si considerino due numeri interi N1 e N2. Il MCD di N1 e N2 è il massimo tra i numeri 
# che sono divisori (con resto uguale a zero) sia di N2 che di N1. In particolare, si supponga che sia N1 minore di N2.
# Il MCD è il massimo tra i numeri compresi tra 1 e N1 che sono divisori (con resto uguale a zero) sia di N1 che di N2.
	
	.text
	.globl main
	
main:
	la $a0,primo		# stringa prima dell'input da tastiera
	li $v0,4
	syscall
	
	
	li $v0,5		# numero messo in input da tastiera
	syscall
	move $t0,$v0
	
	la $a0,primo		# stringa prima dell'input da tastiera
	li $v0,4
	syscall
	
	li $v0,5		# numero messo in input da tastiera
	syscall
	move $t1,$v0
	
	mul $t2,$t1,$t0		# moltiplica i due numeri
	
	la $a0,fine		# stringa prima dell'output 
	li $v0,4
	syscall
	
	move $a0,$t2
	li $v0,1
	syscall
	
	
	.data
	primo: .asciiz "Inserire un numero: "
	fine: .asciiz "M.C.D tra i due numeri è: "