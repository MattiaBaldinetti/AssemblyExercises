	.text
	.globl main

main:
	li $v0,5		#servizio di lettura intero
	syscall
	move $t1,$v0		#sposta il valore ricevuto nel registro $t1
	
	li $v0,5		#servizio di lettura intero
	syscall
	move $t2,$v0		#sposta il valore ricevuto nel registro $t2
	
	add $t3,$t1,$t2		# $t3 = $t1 + $t2
	
	move $a0,$t3		#sposto $t3 nel registro $a0 (istruzione che mi serve a printare)
 	li $v0,1		#istruzione che mi serve a printare
	syscall
	