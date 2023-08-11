	.text
	.globl main

main:
	lw $a0,x
	lw $a1,y
	
	jal DIVISIONE
	
	move $a0,$v0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
	
DIVISIONE:
	move $t0,$a0
	move $t1,$a1
	div $v0,$t0,$t1
	
	jr $ra
	
	
	.data
	x: .word 8
	y: .word 2
