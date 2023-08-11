# Realizzare un programma in assembly MIPS che immessi in input dei numeri
# interi calcola la media aritmetica (l’acquisizione dei dati termina con l’immissione
# dello zero). Supponendo che i valori immessi siano dei campioni relativi alla
# temperatura rilevata in un luogo e stabilito che la media nazionale è di 22.72°C
# calcolare l’errore quadratico metrico e stamparlo su videoterminale
# ESEMPIO:
# INPUT:
# 22;23;25;27;22;23;21;18;0
# OUTPUT:
# (Media Rilevata: 22.625)
# E=1.037775
	.text
	.globl main
main:
	l.s $f0,naz		#CARICO IL VALORE
	l.s $f13,div		# CARICO IL VALORE
ciclo:	
	li $v0,5		# RICHIESTA INPUT
	syscall 	
	move $t0,$v0
	beqz $t0,zero		# $T0 = 0, ZERO
	add $t1,$t1,$t0		# sommatoria
	add $t2,$t2,1		# divisore
	j ciclo			# SALTA
zero:	
	mtc1 $t1,$f2		# sommatoria
	cvt.s.w $f5,$f2		# CONVERSIONE DA INTERO A FLOAT
	
	mtc1 $t2,$f3		# divisore
	cvt.s.w $f6,$f3		# CONVERSIONE DA INTERO A FLOAT
	div.s $f4,$f5,$f6	# $F4 = $F5 / $F6 (MEDIA RILEVATA)
	mul.s $f9,$f4,$f4	# QUADRATO DELLA MEDAI RILEVATA
	mul.s $f8,$f0,$f0	# QUADRATO DELLA MEDIA NAZIONALE 
	sub.s $f10,$f8,$f9	# SOTTRAGGO LE DUE MEDIE
	abs.s $f10,$f10
	sqrt.s $f11,$f10	# FACCIO LA RADICE QUADRATE
	div.s $f16,$f11,$f13	# CALCOLO IL VALORE FINALE
	
	mov.s $f12,$f16		#STAMPA DEL RISULTATO
	li $v0,2
	syscall
	
	li $v0,10		# CHIUSURA 
	syscall
		
	.data
	naz: .float 22.72
	div: .float 2.0
	





