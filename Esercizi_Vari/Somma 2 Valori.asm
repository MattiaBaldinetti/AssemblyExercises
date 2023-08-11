	.text
	.globl main
main:
	lw $t0,valore1
	lw $t1,valore2
	add $t2,$t0,$t1 
	sw $t2,risultato
	li $v0,10 
	syscall

	.data
	valore1 : .word 23
	valore2 : .word 12
	risultato : .word 0
