# Si consideri la funzione f fattoriale definita per valori interi n
# FATTORIALE(x) = x*FATTORIALE(x-1)
# FATTORIALE(1) = 1
# FATTORIALE(0) = 1
# Si realizzi un programma in Si realizzi un programma in assembly assembly MIPS che,
# definito un intero positivo che,definito un intero positivo x?2,
# calcola il corrispondente valore di FATTORIALE(x) in modo ricorsivo
# STUDIO
# fattoriale(5)=
# 5*fattoriale(4)=5*4*fattoriale(3)=5*4*3*fattoriale(2)=5*4*3*2*fattoriale(1)=
# 5*4*3*2*1= 120

	.text
	.globl main

main:
	li $v0,5
	syscall
	move $a0,$v0
	
	jal fattoriale
	
	move $a0,$v0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
fattoriale:
	ble $a0,1,caso_base
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $a0,4($sp)
	sub $a0,$a0,1
	
	jal fattoriale
	
	lw $ra,0($sp)
	lw $a0,4($sp)
	addi $sp,$sp,8
	mul $v0,$v0,$a0
	jr $ra
	
caso_base:
	li $v0,1
	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	