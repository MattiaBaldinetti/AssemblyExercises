	.text
	.globl main
	
main:
	lw $t0,intvar		# lettura dell'operando
	mtc1 $t0,$f0		# copia del registro $t0 in $f0
	
	cvt.s.w $f0,$f0		# conversione da intero a numero in signola precisione
	
	# printa il risultato
	mov.s $f12,$f0		# pone il risultato in $f12
	li $v0,2		# richiesta di stampa di un float
	syscall			# attivazione del servizio
	
	li $v0,10
	syscall
	
	.data
	intvar: .word 5