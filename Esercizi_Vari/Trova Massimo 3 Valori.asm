	.text
	.globl main
main: 
	lw $a0,x
	lw $a1,y
	jal Massimo

Massimo: 
	move $v0,$a0
	bgt $a0,$a1,fine
	move $v0,$a1
fine:
	jr $ra
	
	
	move $a0,$v0
	lw $a1,z
	jal Massimo
	move $a0,$v0
	move $t0,$a0

	li $v0,1
	syscall
	
	.data
	x: .word 45
	y: .word 100
	z: .word 77