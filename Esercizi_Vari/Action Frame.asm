	.text
	.globl main
main:
	lw $t0,x
	move $a0,$t0
	
	jal fact
	
	li $v0,10
	syscall
fact:
	la $t9, factAF
	sw $ra,($t9)
	
	move $a0,$a0
	li $v0,1
	syscall
	
	ble $a0,1,end 
	sw $a0,4($t9)
	subu $a0,$a0,1
				
	j fact
	
	la $t9, factAF
	lw $t0, 4($t9)
	mul $v0,$v0,$t0
	j end
	
end:
	la $t9, factAF
	lw $ra,($t9)
	move $v0,$v0
	jr $ra

	.data
	factAF: .space 8
	x: .word 5