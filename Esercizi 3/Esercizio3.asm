# Dato il seguente programma in linguaggio assembly MIPS, determinare il valore di risb, rish, risw:
	.text
	.globl main
main:
	lb $t0,Valore1
	lb $t1,Valore2
	add $t2,$t0,$t1
	sb $t2,risb
	sh $t2,rish
	sw $t2,risw
	
	move $a0,$t2
	li $v0,1
	syscall

	.data
	Valore1: .byte 100
	Valore2: .byte 250
	risb: .byte 0		
	rish: .half 0
	risw: .word 0
	
	# il risultato della somma è 350 = 1 0101 1110
	# risb è in byte(8 bit) = 0101 1110
	# rish è in half(16 bit) = 1 0101 1110
	# risbw è in byte(32 bit) = 1 0101 1110
	
	 
	   