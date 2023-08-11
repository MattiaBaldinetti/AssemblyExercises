	.text
	.globl main
	
main: 
	lb $t0,pippo		#trasferimento operando in $t0
	li $t1,2		#impostazione del valore 2
	rem $t2,$t0,$t1		#calcolo del resto della divisione
	sw $t2,parità		#archiviazione del risultato
	
	move $a0,$t2
	li $v0,1		#terminazione del programma
	syscall
	
	.data
	pippo: .byte 5
	parità: .word 0