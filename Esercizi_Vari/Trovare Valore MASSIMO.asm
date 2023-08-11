	.text
	.globl main
main : 
	lb $t0,Spiderman 
	lb $t1,Hulk
	move $t2,$t1
	
	blt $t0,$t1,salto
	
	move $t2,$t0
	
salto: 
	sb $t2,Massimo
	move $a0,$t2
	li $v0,1
	syscall
	
	
	
	.data
	Spiderman: .byte 78
	Hulk: .byte 76
	Massimo: .byte 0
