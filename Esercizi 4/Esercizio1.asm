# Leggere 7 valori inferi da input e calcolarne la media (sfampandola a video).
# INPUT
# 12;82;11;2345;67;123456;675
# OUTPUT
# 18092.57142857
# NB: La media deve essere espressa con un numero reale (floaf). Ufilizzare il coprocessore mafemafico.

	.text
	.globl main
main:
	li $t3,7
	lwc1 $f3,num
loop:	
	li $v0,6
	syscall
		
	add $t1,$t1,1		# CONTATORE
	
	add.s $f1,$f1,$f0
	
	beq $t1,$t3,fine
	j loop
	
fine:
	div.s $f2,$f1,$f3
	
	mov.s $f12,$f2
	li $v0,2
	syscall
	
	li $v0,10
	syscall
	
	.data
	num: .float 7
