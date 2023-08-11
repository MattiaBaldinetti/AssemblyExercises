	.text
	.globl main

main:
	lh $t0,anno
	rem $t1,$t0,400
	beqz $t1, THEN1
	j ELSE1
	
THEN1:
	li $t3,1
	j END_IF
ELSE1:
	rem $t1,$t0,100
	beqz $t1,THEN2
	j ELSE2

THEN2:
	li $t3,0
	j END_IF

ELSE2:
	rem $t1,$t0,4
	beqz $1,THEN3
	j ELSE3
	
THEN3:
	li $t3,1
	j END_IF

ELSE3:
 	li $t3,0
 
END_IF:
	sb $t3,bisestile
	
	#move $a0,$t3		#sposto $t3 nel registro $a0 (istruzione che mi serve a printare
 	#li $v0,1		#istruzione che mi serve a printare 
	
	li $v0,10
	syscall
	
	.data
	anno: .half 1986
	bisestile: .byte -1
	
