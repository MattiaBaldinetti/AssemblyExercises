	.text			#Direttiva del Segment Text 
	.global main		#Direttiva che indica la subroutine con etichetta main come globale
main:				#Etichetta main inizio del programma

	lw $t0, valore1		#Prelievo del primo operando della locazione di memoria con etichetta valore1 nel registro $t0
	lw $t1,valore2		#Prelievo del primo operando della locazione di memoria con etichetta valore2 nel registro $t1
	
	add $t2,$t0,$t1		#Somma degli operandi e scrittura del risultato nel registro $t0
	sw $t2,risultato	#Salvataggio dell'addizione nella locazione di memoria risultato
	li $v0,10		#Richiesta del servizio di interruzione del programma 
	syscall			#Attivazione del servizio
					
	.data			#Direttiva del Segment Data
	valore1:  .word 23	#Definizione della variabile valore1 (intero a 32bit inizializzato a 23)
	valore2: .word 12	#Definizione della variabile valore2 (intero a 32bit inizializzato a 12)
	risultato: .word 0	#Definizione della variabile risultato (intero a 32bit inizializzato a 0,pulizia)










