# Dato un intero positivo a definito in memoria, stampare a video "Terzo bit 1" nel 
# caso in cui il terzo bit del numero a sia 1 o  "Terzo bit 0" altrimenti

	
	.text
	.globl main
main:
	lw $t2, a
	
	andi $t0, $t2, 4	# AND tra $t0 e 4
	beqz $t0, stampa_zero	# se $t0 = 0 allora salta
	
	la $a0, z		
	li $v0, 4
	syscall
	
	j end
stampa_zero:
	la $a0, u
	li $v0, 4
	syscall	
end:
	li $v0,10
	syscall

	.data
	a:.word 37
	u: .asciiz "Terzo bit 0"
	z: .asciiz "Terzo bit 1"

--------------------------------------------------------------

	.text
	.globl main
	
main:
	lw $t0,val
	li $t8,3
	li $t9,1
	
ciclo:
	div $t1,$t0,2
	mflo $t0		# QUOZIENTE
	
	add $t5,$t5,1		# CONTATORE
	beq $t5,$t8,check
	j ciclo
	
check:
	mfhi $t2		# RESTO
	beq $t2,$t9,fine
	
	la $a0,no
	li $v0,4
	syscall 
	j end
	
fine:
	la $a0,si
	li $v0,4
	syscall 
	j end
	
end:
	li $v0,10
	syscall
	
	.data
	val: .word 20
	si: .asciiz "Terzo bit a 1"
	no: .asciiz "Terzo bit a 0"
	
	
	
