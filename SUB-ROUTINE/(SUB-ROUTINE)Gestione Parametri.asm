	.text
	.globl main
main:
	lw $t0,x
	lw $t1,y
	move $a0,$t0
	move $a1,$t1
	jal Superman
	# sw $v0,z
	move $a0,$v0
	li $v0,1
	syscall 
	
	li $v0,10
	syscall
	
Superman:
	sw $ra, MainAF
	add $a0,$a0,1
	add $a1,$a1,2
	mul $a2,$a0,3
	mul $a3,$a1,4
	
	jal Supergirl
	lw $ra, MainAF
	move $v0,$v0
	jr $ra
	
Supergirl:
	sw $ra, SupermanAF
	mul $t0,$a2,2
	mul $t1,$a3,5
	la $s0, LuthorAF
	sw $t0, ($s0)
	sw $t1, 4($s0)
	
	jal Luthor
	lw $ra, SupermanAF
	move $v0,$v1
	jr $ra

Luthor:
	la $s0, LuthorAF
	sw $t0, ($s0)
	sw $t1, 4($s0)
	mul $a0,$a0,$a1
	mul $t9,$a0,$a2
	mul $t0,$a3,$t0
	mul $t8,$t1,$t0
	div $v0,$t9,$t8
	jr $ra
	
	.data
	MainAF: .space 4
	SupermanAF: .space 4
	LuthorAF: .space 8
	x: .word 56
	y: .word 3

