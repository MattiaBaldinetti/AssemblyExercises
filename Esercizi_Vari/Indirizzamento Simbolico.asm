	.text
	.globl main
main:
	lw $t0,operW
	lh $t1,operH
	lb $t2,operB
	add $t3,$t0,$t1
	add $t3,$t3,$t2
	sw $t3,risultato
	
	move $a0,$t3
	li $v0,1
	syscall
	
	.data
	operW: .word 11098231
	operH: .half 1974
	operB: .byte 28
	risultato: .word 0