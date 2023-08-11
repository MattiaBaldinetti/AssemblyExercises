	.text 		#Direttiva del Segmento Testo
	.globl main 	#Direttiva che indica la subroutine con etichetta main come globale
main: 			#Etichetta main: inizio del programma
	li $v0, 5	#Richiesta del servizio per la lettura di un intero da tastiera
	syscall 	#Attivazione del servizio (l’operando acquisito è in $v0)
			
			#Il programma rimane in attesa fino a quando l'utente non inserisce un valore intero nella finestra di dialogo proposta dal sistema e preme Enter
			
	move $t0,$v0 	#Copia del primo operando nel registro temporaneo $t0
	
	li $v0,5	#Richiesta del servizio per la lettura di un intero da tastiera
	syscall		##Attivazione del servizio (l’operando è in $v0)
	move $t1,$v0	#Copia del secondo operando nel registro temporaneo $t1
	
	add $t2,$t0,$t1	#Somma degli operandi
	move $a0,$t2	#Copia del risultato nel registro adibito al passaggio di parametri per la routine di servizio di stampa a videoterminale
	
	li $v0,1	#Richiesta del servizio di stampa a videoterminale
	syscall		#Attivazione del servizio
	
	li $v0,10	#Richiesta del servizio di terminazione del programma
	syscall		#Attivazione del servizio
