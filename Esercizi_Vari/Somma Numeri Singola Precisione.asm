	.text
	.globl main

main: 	
	lwc1 $f1,val_x		# prelievo primo operando singola precisione 
	lwc1 $f2,val_y		# prelievo secondo operando singola precisione 
	
	add.s $f0,$f1,$f2	# somma tra i due operandi in singola precisione
	
	# printa il risultato
	mov.s $f12,$f0		# pone il risultato in $f12
	li $v0,2		# richiesta di stampa di un float
	syscall			# attivazione del servizio
	
	li $v0,10		# chiusura programma
	syscall
	
	.data
	val_x: .float 3.5
	val_y: .float -23.7