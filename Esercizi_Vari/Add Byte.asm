	.text
	.globl main
main: 
	lb $t1,operandoA
	lb $t2,operandoB
	add $t0,$t1,$t2
	sb $t0,risultato
	
	move $a0,$t0
	li $v0,1
	syscall
	
	.data
	operandoA: .byte 5 
	operandoB: .byte 7
	risultato: .byte 0
