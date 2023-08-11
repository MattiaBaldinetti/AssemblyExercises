	.text
	.globl main
main:
	lw $t0,x
	lw $t1,y
	move $a0,$t0
	move $a1,$t1
	
	jal BATMAN
	
	move $a0,$v0
	li $v0,1
	syscall 
	
	li $v0,10
	syscall

BATMAN:
	sw $ra MainAF
	add $a0,$a0,1
	add $a1,$a1,1
	
	jal ROBIN
	lw $ra,MainAF
	jr $ra
	
ROBIN:
	sw $ra BATMANAF
	mul $a0,$a0,2
	mul $a1,$a1,5
	
	jal JOKER
	lw $ra,BATMANAF
	move $v0,$v1
	jr $ra
	
JOKER:
	mul $v1,$a0,$a1
	jr $ra
	
	.data
	x: .word 5
	y: .word 6
	BATMANAF: .space 4
	MainAF: .space 4
	