	.text
	.globl main
	
main:
	la $a0,x
	la $a1,y
	
	jal SCAMBIO
	
	move $a0,$v0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
SCAMBIO:
	lw $t0,($a0)
	lw $t1,($a1)
	
	move $t2,$t0
	move $t0,$t1
	move $t1,$t2
	
	sw $t0,($a0)
	sw $t1,($a1)
	div $v0,$t1,$t0
	
	jr $ra
	
	.data
	x: .word 8
	y: .word 2
	
