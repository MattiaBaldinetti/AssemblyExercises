#Implementare il seguente programma: $t0=1 se il valore della variabile Memole, definita in memoria, ha alla terza posizione meno significativa un 1.
	
	.text
	.globl main
	
main:
	lw $t1,memole		#carico memole
	li $t2,4		#carico 4 in $t2
	and $t3,$t1,$t2		#faccio AND tra memole e 4
	beq $t3,$t1,test		#se $t3 = $t2, vado in test
	
END:	
	move $a0,$t0
	li $v0,1
	syscall
	
	li $v0,10 
	syscall 

test:
	li $t0,1 		#setto $t0 a 1
	j END
	

	
	.data
	memole: .word 37
