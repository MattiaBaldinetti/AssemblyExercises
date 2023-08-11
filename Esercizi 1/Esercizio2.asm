#Implementare il seguente programma: $t0=1 se il valore della variabile Batman (definita in memoria) 
# è maggiore del valore della variabile Robin (definita in memoria)
	
	.text
	.globl main
	
main:
	
	lw $t2,batman
	lw $t3,robin
	
	bgt $t2,$t3,SALTO	#$t2 > $t3 allora vai a SALTO
	j END_PROG
	
SALTO:
	li $t0,1
	j END_PROG
	
END_PROG:

	move $a0,$t0
	li $v0,1
	syscall
	
	
	
	
	
	.data
	batman: .word 4
	robin: .word 5
