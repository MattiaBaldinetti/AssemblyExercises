	.text
	.globl main
main: 
	lh $t0,TempMarzo 	#trasferimento operando in $t0
	lh $t1,TempAprile	#trasferimento operando in $t1
	lh $t2,TempMaggio	#trasferimento operando in $t2
	
	li $t4,3 		#inizializzazione del valore 3
	
	add $t3,$t0,$t1		# $t3 = $t0 + $t1
	add $t3,$t3,$t2 	# $t3 = $t3 + $t2
	div $t9,$t3,$t4 	# $t9 = $t3 / 4
	
	move $a0,$t9
	li $v0,1
	syscall
	
	.data
	TempMarzo: .half 22
	TempAprile: .half 29
	TempMaggio: .half 33