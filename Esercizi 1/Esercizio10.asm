# Un utente introduce da tastiera due numeri interi (INIT e LUNG). Il programma in linguagguo assembly MIPS 
# deve stampare una serie di numeri interi consecutivi. La serie inizia al valore INIT ed è lunga LUN elementi.
# Esempio:
#	INPUT:
#		7
#		4
#	OUTPUT: 7 8 9 10

	.text
	.globl main
	
main: 	
	la $a0,input		
	
	li $v0,4		 # primo numero
	syscall
	
	li $v0,5		
	syscall
	move $t0,$v0
			
	li $v0,4		# secondo numero
	syscall
	
	li $v0,5		
	syscall
	move $t1,$v0
	
	li $t6,0		# per incrementare
ciclo: 	
	move $a0,$t0		# stampa il numero
	li $v0,1
	syscall 
	
	la $a0,spazio		# mi crea lo spazio tra ogni numero
	li $v0,4
	syscall
	
	add $t0,$t0,1		# somma 1 al numero in input 
	
	add $t6,$t6,1		# incrementa il contatore
	
	beq $t6,$t1,FINE
	j ciclo
	
FINE:
	li $v0,10
	syscall
	
	.data
	input: .asciiz "Inserire un numero: "
	spazio: .asciiz " "

--------------------------------------------------------------ALTRO METODO
	.text
	.globl main
main:
	li $v0,5
	syscall
	move $t0,$v0	# valore minimo
	
	li $v0,5
	syscall
	move $t1,$v0	# num valori 
		
	add $t9,$t0,$t1
	
ciclo:	
	beq  $t0,$t9,check
	
	move $a0,$t0
	li $v0,1
	syscall
	
	la $a0,str
	li $v0,4
	syscall
	
	add $t0,$t0,1
	j ciclo

check:
	li $v0,10
	syscall
	
	.data
	str: .asciiz "\t"
