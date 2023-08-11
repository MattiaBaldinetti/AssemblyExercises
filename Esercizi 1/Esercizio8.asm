# Un utente inserisce da tastiera una serie di numeri interi positivi, ed il termine della serie è indicato dall’inserimento del valore -1. 
# Il programma in linguaggio assembly MIPS, al termine dell’inserimento, stampa quanti numeri in totale sono stati inseriti
# NB:la stampa deve avvenire da consolle output dell'emulatore MARS

	.text
	.globl main
main:
	li $t7,1
	li $t6,0
ciclo:
	li $t5,-1
	
	li $v0,5		# inserimento input da tastiera
	syscall
	move $t1,$v0
	
	beq $t1,$t5,SALTO
	add $t6,$t6,$t7		# incrementa il numero di volte che l'utente ha inserito un valore
	j ciclo			# se la condizione beq  non è verificata ripeti il ciclo
SALTO:
	move $a0,$t6		# sposto $t2 nel registro $a0 (istruzione che mi serve a printare
 	li $v0,1		# istruzione che mi serve a printare 
 	syscall
 	
 	li $v0,10
 	syscall
 	
 	
 	
 	
 	
