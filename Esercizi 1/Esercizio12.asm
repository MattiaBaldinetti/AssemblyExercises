# Si scriva un programma in linguaggio assembly MIPS per calcolare il minimo comune multiplo (MCM) 
# di due numeri interi positivi immessi da tastiera. Stampare il MCM. 
# Dati due numeri interi N1 e N2, il minimo comune multiplo è il più piccolo numero M 
# che è divisibile (con resto pari a zero) sia per N1 che per N2.
# Suggerimento. Si considerino due numeri interi N1 e N2. Sia N1 più grande di N2. 
# Il MCM è il primo multiplo di N1 che è divisibile (con resto uguale a zero) per N2.
# NB:la stampa deve avvenire da consolle output dell'emulatore MARS
	.text
	.globl main
main:
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $t7,1
	beq $t0,$t1,IF		# uguali allora IF
	bne $t0,$t1,IF2		# diversi allora IF2
	
IF2:
	rem $t2,$t0,$t1		# RESTO DELLA DIVISIONE
	beqz $t2,stampa		# $t2 = 0 allora stampa

FOR:
	mul $t3,$t0,$t7
	rem $t5,$t3,$t1		# RESTO DELLA DIVISIONE
	beqz $t5,stampa2	# $t2 = 0 allora stampa
	add $t7,$t7,1
	j FOR
	
IF:
	la $a0,mcm
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j END
	
stampa:
	la $a0,mcm
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	j END	

stampa2:
	la $a0,mcm
	li $v0,4
	syscall
	
	move $a0,$t3
	li $v0,1
	syscall
	j END
	
END:
	li $v0,10
	syscall
	
	.data
	mcm: .asciiz "Il minimo comune multiplo è: "
