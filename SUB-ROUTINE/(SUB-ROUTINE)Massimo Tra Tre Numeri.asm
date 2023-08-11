# Realizzazione di una funzione che calcola il massimo tra 3 numeri
	.text
	.globl main

main:
	lw $a0,x
	lw $a1,y
	jal MAXDUE
	lw $a0,z
	move $a1,$v0
	
	jal MAXDUE
	move $a0,$v0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
MAXDUE:
	move $t0,$a0
	move $t1,$a1
	move $t2,$t0		# poni $t0 nel registro del valore più grande
	blt $t1,$t0,fine	# salta se $t1 < $t0
	move $t2,$t1		# sposta $t1 nel registro del valore più grande
fine:	
	move $v0,$t2
	jr $ra
	
	.data 
	x: .word 25
	y: .word 15
	z: .word 36