	.text
	.globl main
main:
	li $v0,42 	#Riechiesta di servizio di generare un numero casuale
	li $a0,1	#identificatore del numero casuale
	li $a1,5	#estremo superiore: range[0,5]
	syscall
	move $s0,$a0	#in $s0 è copiato il numero casuale(Magic)
	
DO: 			
	li $v0,5	#richiesta di servizio lettura di un intero da tastiera
	syscall		#attivazione del servizio
	move $t0,$v0	#spostamento operando inserito dall'utente
	bne $t0,$s0,DO	#ripetizione ciclo se il valore immesso dall'utente è diverso dal numero casuale
		
		
	#move $a0,$t0		#sposto $t0 nel registro $a0 (istruzione che mi serve a printare
 	#li $v0,1		#istruzione che mi serve a printare	
	
	li $v0,10
	syscall
	