# Si scriva un programma in linguaggio assembly MIPS che legga da tastiera una serie di numeri interi fino a quando la somma di tutti i numeri introdotti 
# ?no a quel momento non supera il valore 1000. A quel punto, il programma stampa il valore del prodotto di tutti i numeri inseriti.
# NB:la stampa deve avvenire da consolle output dell'emulatore MARS

	.text
	.globl main

main:
	li $t0,0
	li $t9,1000
	li $t4,1

ciclo:	
	li $v0,5
	syscall
	move $t1,$v0
	add $t0,$t0,$t1		# incrementa $t0 di $t1	
	mul $t4,$t4,$t1
	bge $t0,$t9,SALTO	# se $t0 > 1000, salta a SALTO 
	j ciclo			# se la condizione sopra non è verificata ripeti il ciclo
	
SALTO:
	move $a0,$t4		# sposto $t2 nel registro $a0 (istruzione che mi serve a printare
 	li $v0,1		# istruzione che mi serve a printare 
 	syscall
 	
 	li $v0,10
 	syscall

--------------------------------------------------------------
ALTRO MODO 
.text
	.globl main
main:
	li $t2,1000
	lw $t4,molt
ciclo:	
	li $v0,5
	syscall
	move $t0,$v0
	 	      
	add $t1,$t1,$t0
	mul $t3,$t0,$t4
	move $t4,$t3
	bgt $t1,$t2,check
	j ciclo
	
check:
	move $a0,$t3
	li $v0,1
	syscall
	
	li $v0,10
	syscall	
	
	.data
	molt: .word 1
	
