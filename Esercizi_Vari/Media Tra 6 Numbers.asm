	.eqv CONT $t0 			#associazione della variabile contatore al registro $t0
	.eqv LIMITE $t1			#associazione della variabile limite al registro $t1
	.eqv INCR $t2 			#associazione della variabile incremento al registro $t2
	
	.text
	.globl main
	
main:
	li CONT,0			#inizializzazione del contatore
	li LIMITE,6			#estremo superiore del numero di iterazione da fare
	li INCR,1			#assegnazione del passo di incremento
	li $t4,0			#inizializzazione della variabile tot
	
FOR:
	bge CONT,LIMITE,END_FOR		#analisi del contatore: rimani nel FOR fino a che CONT<LIMITE, senno passa a END_FOR
	li $v0,5			#richiesta del servizio di lettura di un intero da tastiera
	syscall				#attivazione del servizio
	
	move $t3,$v0			#copia dell'operanodo immesso dall'utente
	add $t4,$t4,$t3			#calcola $t4 = $t4 + $t3
	add CONT,CONT,INCR		#incremento del contatore
	j FOR				#ripetizione del ciclo
	
END_FOR:
	div $t6,$t4,6 			#calcolo della media(arrotondamento all'intero superiore)
	sw $t6,media
	
	#move $a0,$t6		#sposto $t6 nel registro $a0 (istruzione che mi serve a printare)
 	#li $v0,1		#istruzione che mi serve a printare
					
	li $v0,10
	syscall
	
	.data
	media: .word 0