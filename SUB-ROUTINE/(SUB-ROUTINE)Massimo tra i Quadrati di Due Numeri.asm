	.text
	.globl main
	
main:
	lw $t0,valore1
	lw $t1,valore2
	
	move $a0,$t0
	move $a1,$t1
	
	jal MAX_QUAD
	#sw $v0,z
	
	move $a0,$v0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
MAX_QUAD:
	sw $ra,MainActFrame
	mul $t0,$a0,$a0
	mul $t1,$a1,$a1
	
	move $a0,$t0
	move $a1,$t1
	
	jal MAX
	lw $ra,MainActFrame
	move $v0,$v1
	jr $ra
MAX:
	move $t0,$a0
	move $t1,$a1
	move $t2,$t0
	blt $t1,$t0,fine
	move $t2,$t1
	
fine:
	move $v1,$t2
	jr $ra
	
	.data
	valore1: .word 5
	valore2: .word 9
	MainActFrame: .space 4
