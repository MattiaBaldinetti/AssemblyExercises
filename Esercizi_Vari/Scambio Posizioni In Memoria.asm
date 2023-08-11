	.text
	.globl main
main:
	lw $t0,valx		#trasferimento di x in $t0	
	lw $t1,valy		#trasferimento di y in $t1
	
	move $t2,$t1		#scambio 
	move $t1,$t0		#scambio
	move $t0,$t2		#scambio
	xor $t2,$t2,$t2 	#pulisco $t2
	
	sw $t0,valx		#archiviazione del valore x in $t0
	sw $t1,valy		#archiviazione del valore y in $t1
	
	move $a0,$t2
	li $v0,1		#terminazione del programma
	syscall
	
	.data
	valx: .word 5
	valy: .word 10