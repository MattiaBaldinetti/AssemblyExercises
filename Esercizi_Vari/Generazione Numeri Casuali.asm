	.text
	.globl main
	
main:
	li $a1,10		# limite superiore dell'intervallo dei numeri casuali
	li $v0,42		# genera un intero casuale tra 0 e il numero messo in $a1(10)
	syscall
	move $t0,$a1
	
	li $a1,10		# limite superiore dell'intervallo dei numeri casuali
	li $v0,42		# genera un intero casuale tra 0 e il numero messo in $a1(10)
	syscall
	move $t1,$a1
	
	beq $t0,$t1,UGUALI
	
	la $a0,nocoppia
	li $v0,4
	syscall
	j FINE
	
UGUALI: 
	la $a0,coppia
	li $v0,4
	syscall
	j FINE
	
FINE:
	li $v0,10
	syscall
	
	.data
	coppia: .asciiz "COPPIA"
	nocoppia: .asciiz "NON COPPIA"