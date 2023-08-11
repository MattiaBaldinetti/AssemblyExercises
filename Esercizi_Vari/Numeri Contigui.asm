	.text
	.globl main
	
main: 
	lb $t1,pippo 		#trasferimento operando in $t1
	subi $t0,$t1,1		#$t0 = $t1 - 1
	addi $t2,$t0,1		#$t2 = $t0 + 1
	
	move $a0,$t2		#sposto $t2 in $a0
	li $v0,1		#terminazione del programma
	syscall
	
	.data
	pippo: .word 5