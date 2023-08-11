	.text
	.globl main

main:	
	la $a0,input		# richiesta stampa di una stringa
	li $v0,4		#
	syscall			#


	l.s $f5,zero 		# imposta il valore per il controllo del raggio
	li $v0,6		# impostazione del servizio di lettura di un valore reale singola precisione
	syscall
	
	c.lt.s $f0,$f5		# setta a 1 il flag0 se il raggio è minore di zero
	bc1t raggio_negativo 	# salta se il flag0 è settato ad 1
	l.s $f1,pigreco		# lettura di PI
	
	mul.s $f2,$f0,$f0	# calcolo il raggio^2
	mul.s $f2,$f2,$f1	# calcolo PI*raggio^2
	
	la $a0,area		# richiesta stampa di una stringa
	li $v0,4		#
	syscall			#

	
	mov.s $f12,$f2		# richiesta stampa di un numero reale in singola precisione
	li $v0,2		#
	syscall			#
	j fine

raggio_negativo:
	li $v0,4		# richiesta di stampa di una stringa
	la $a0,MsgErr		# impostazione stringa da stampare
	syscall
	
fine:
	li $v0,10		# terminazionedel porgramma
	syscall
	
	.data
	zero: .float 0.0
	pigreco: .float 3.141592
	MsgErr: .asciiz "Errore: Raggio negativo!"
	area: .asciiz "L'area del cerchio è: "
	input: .asciiz "Inserire la lunghezza del raggio: "
	