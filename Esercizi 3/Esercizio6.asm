# Confrontare due interi positivi A e B, definiti in memoria, e mettere in $t0 il valore 0 se A e' 
# maggiore di B, 1 altrimenti. Non è possibile utilizzare l'istruzione di comparazione tra valori: 
# operare sui singoli bit dei valori.
	.text
	.globl main
main:   
	lw $t1,valA
	lw $t2,valB
	sub $t3,$t1,$t2
IF:
	bgtz $t3,MAGGIORE
	J MINORE
MAGGIORE:
	li $t0,1
	move $a0,$t0
	li $v0,1
	syscall
	
	j FINE
MINORE:
	li $t0,0
	move $a0,$t0
	li $v0,1
	syscall
	
	j FINE
FINE: 
	li $v0,10
	syscall
	
	
	.data
	valA: .word 17
	valB: .word 18
