	.eqv NUM_LATI 4			#Definizione di una costante indicante il numero dei lati
	.eqv PERIMETRO $t0		#Rinomina di un registro in cui riportare il perimetro 
	.eqv SYS_CLOSE_PROGRAM 10	#Definizione di una costante per il servizio di temrinazione del programma

	.text				#Direttiva del Segmento Testo
	.global main			#Direttiva per definire il main globale
main:					#Etichetta main: inizio del programma
	lw $t1,dim_lato			#Prelievo della dimensione del lato
	mul PERIMETRO,$t1,NUM_LATI	#Calcolo del perimetro di un quadrato(in $t0 c'è il risultato)
	move $a0,PERIMETRO
	li $v0, 1			#Richiesta del servizio di terminazione del programma
	syscall				#Attivazione del servizio
	
	.data				#Direttiva del Segmento Dati
	dim_lato: .word 0xbe		#Definizione di una variabile che specifica la dimensione di un lato(intero a 32bit inizializzato a 190)
	
	
