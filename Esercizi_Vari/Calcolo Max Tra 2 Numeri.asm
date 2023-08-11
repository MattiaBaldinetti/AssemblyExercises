	.text
	.globl main
	
main:
 	lw $t0,valA		#lettura valore a
 	lw $t1,valB		#lettura valore b
 	move $t2,$t0		#Max = A
 	bgt $t1,$t0,DO_IF	#se b>a salta e aggiorna Max = B
 	j OUT_IF		#salta a fine
 	
 DO_IF:
 	move $t2,$t1
 
 OUT_IF:
 	sw $t2,massimo
 	#move $a0,$t2		sposto $t2 nel registro $a0 (istruzione che mi serve a printare
 	#li $v0,10		istruzione che mi serve a printare 
 	li $v0,1
 	syscall
 	
 	.data
 	valA: .word 55
 	valB: .word 40
 	massimo: .word 0
