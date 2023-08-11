# Si scriva un programma in linguaggio assembly MIPS che legga da tastiera i valori delle lunghezze dei tre lati di un triangolo e determina:
# se il triangolo è scaleno (porre $t0=0)
# se il triangolo è rettangolo (porre $t0=1)
# se il triangolo è isoscele (porre $t0=2)
# se il triangolo è equilatero (porre $t0=3)
# NB: non è necessario usare la radice quadra né i numeri in virgola mobile
	
	.text
	.globl main

main:

	la $a0, base    #take base in input
	li $v0, 4
	syscall
	
	li $v0, 5	#reads one integer in input and saves it in $t0
	syscall
	
	move $t0, $v0	#moves from v0 to t0 the number 
	
	
	##lato1
	la $a0, l1    #take base in input
	li $v0, 4
	syscall
	
	li $v0, 5	#reads one integer in input and saves it in $t0
	syscall
	
	move $t1, $v0	#moves from v0 to t0 the number 
	
	##lato 2
	la $a0, base    #take base in input
	li $v0, 4
	syscall
	
	li $v0, 5	#reads one integer in input and saves it in $t0
	syscall
	
	move $t2, $v0	#moves from v0 to t0 the number 
	
		
#if base and l1 different
	bne $t0, $t1, check
#else
	j check2
check:
#if l1 and l2 different
	beq $t0, $t2, isosceles
	bne $t1, $t2, scalene
#else 
	j isosceles

check2:
#base = l1
#if l1 == l2
	beq $t1, $t2, equilater
#else
	j isosceles
#else
					
scalene:
	la $a0, pSca
	
	li $v0, 4
	syscall
	
	li $v0, 4
	la $a0, enter	#prints newline
	syscall
	
	j ipotenusa

isosceles:
	la $a0, pIso
	
	li $v0, 4
	syscall 
	j ipotenusa
	
equilater:
	la $a0, pEqu
	
	li $v0, 4
	syscall
	j finish
			
	
	
#find ipotenusa
ipotenusa:
	bgt $t0, $t1, b
	j al
	b:
		bgt $t0, $t2, do

	do:
		mul $t8, $t0, $t0  #a^2
		mul $t4, $t1, $t1  #b^2
		mul $t5, $t2, $t2  #c^2
		add $t3, $t4, $t5  #b^2+c^2
		beq $t8, $t3, checkRect
		j finish

     al:	
	bgt $t1, $t2, lf
	j bl
	
     	lf:
		bgt $t1, $t0, di
	di:

		mul $t8, $t1, $t1  #b^2
		mul $t4, $t0, $t0  #a^2
		mul $t5, $t2, $t2  #c^2
		add $t3, $t4, $t5  #a^2+c^2
		beq $t8, $t3, checkRect
		j finish
     bl:
	bgt $t2, $t0, lb
	j finish
	lb:
		bgt $t2, $t1, du
	du:

		mul $t8, $t2, $t2  #c^2
		mul $t4, $t0, $t0  #a^2
		mul $t5, $t1, $t1  #b^2
		add $t3, $t4, $t5
		beq $t8, $t3, checkRect
		j finish
	
checkRect:
	la $a0, pRet
	li $v0, 4
	syscall
	j finish
	
	

	

finish:
	li $v0, 10
	syscall
	

	.data
	base: .asciiz "Enter base value: "
	l1: .asciiz "Enter l1 value: "
	l2: .asciiz "Enter l2 value: "
	buffer: .space 4
	enter:.asciiz "\n"
	pSca:.asciiz "The triangle is scalene"
	pIso:.asciiz "The triangle is isosceles"	
	pEqu:.asciiz "The triangle is equilater"
	pRet:.asciiz "The triangle is rectangle"
	
	#cos(alfa) = (a^2-b^2-c^2)/-2bc
	
	
