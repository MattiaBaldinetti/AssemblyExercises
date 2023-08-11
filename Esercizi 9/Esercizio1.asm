# Scrivere un programma che inizializza un vettore di 10 elementi a 16bit con valori 
# casuali compresi tra 0 e 65000 e che copia in un nuovo vettore il quadrato degli elementi
# del primo (utilizzare una funziona per realizzare il quadrato degli elementi).
# ESEMPIO:
# v1= 5,60000,0,1,45,76,99,456,4321,12876
# v2= 25,3600000000,0,1,2025,5776,9801,207936,18671041,165791376

	.text
	.globl main
main:
	la $s0,v
	li $t0,1
	lw $t1,length
loop:
	
	li $v0,42
	li $a1, 65000
	syscall
	sh $a0,($s0)
	addi $s0,$s0,2
	add $t0,$t0,1
	ble $t0,$t1,loop
	
	jal QUADRATO
	li $t0,1
	la $s2,v1
	lh $t9,0($s2)
	
	move $a0,$t9
	li $v0,1
	syscall
	
	la $a0,spazio
	li $v0,4
	syscall
	
	add $t0,$t0,1
	addi $s2,$s2,2
stampa:
	lh $t9,($s2)
	
	move $a0,$t9
	li $v0,1
	syscall

	la $a0,spazio
	li $v0,4
	syscall

	addi $s2,$s2,2
	add $t0,$t0,1
	ble $t0,$t1,stampa
	
	li $v0,10
	syscall

QUADRATO:
	la $s0,v
	la $s1,v1
	li $t0,1

	lh $t3,0($s0)
	mul $t4,$t3,$t3
	sh $t4,($s1)
	addi $s0,$s0,2
	addi $s1,$s1,2
check:	
	lh $t3,($s0)
	mul $t4,$t3,$t3
	sh $t4,($s1)
	addi $s0,$s0,2
	addi $s1,$s1,2
	add $t0,$t0,1
	ble $t0,$t1,check
	jr $ra
	
	
	.data
	length: .word 5
	v: .half 0:10
	v1: .half 0:10
	spazio: .asciiz "\t"
	
