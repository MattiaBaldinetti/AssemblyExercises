# Effettuare la sommatoria di numeri reali poistivi immessi da input. 
# La sommatoria è calcolata quando il valore immesso dall'utente è nullo o negativo.
# INPUT
# 3.5;7.23;5.6;9.17;-1
# OUTPUT
# 25.5
	.text
	.globl main
main:
	lwc1 $f1,num 
loop:	
	li $v0,6
	syscall
	
	c.eq.s $f0,$f1
	bc1t check
	
	add.s $f3,$f3,$f0
	j loop
check:
	mov.s $f12,$f3
	li $v0,2
	syscall
	
	li $v0,10
	syscall	
	
	.data
	num: .float -1	
	
	
	

