	.text
	.globl main
main:
	li $t7,0
	lw $t0,stud+0($t7)
	lh $t1,stud+4($t7)
	lb $t2,stud+6($t7)
	
	#move $a0,$t7
	#li $v0,1
	#syscall
	
	li $v0,10
	syscall
	
	.data
	stud: .word 11098231
	      .half 1974
	      .byte 28