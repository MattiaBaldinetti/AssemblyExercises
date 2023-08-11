# L'ISTAT ha rivisto le stime dell'aspettativa di vita (life expentancy, LE) della popolazione
# italiana in 84.8 per le donne e 80.5 per gli uomini.
# Realizzare un programma in assembly MIPS che acquisca da input un carattere F o M per discriminare 
# il genere di un campione e un valore intero che rappresenta l'età e determinare se il campione immesso ha superato la media oppure no. 
# Il programma termina quando l'utente inserisce il carattere X
# ESEMPIO
# F;85;M;80;M;82;F;45;X
# OUTPUT
# OLTRE LA MEDIA LE; SOTTO LA MEDIA LE; OLTRE LA MEDIA LE; SOTTO LA MEDIA LE

	.text
	.globl main 
main:
	lw $t2,M
	# lw $t3,F
	lwc1 $f5,uomo 
	lwc1 $f6,donna
	
	la $a0,genere
	li $v0,4
	syscall
	# stringa
	li $v0,8
	syscall
	move $t0,$v0
	##########
	la $a0,spazio
	li $v0,4
	syscall
	##########
	la $a0,età
	li $v0,4
	syscall
	#intero
	li $v0,6
	syscall
	#move $f1,$v0
	
	beq $t0,$t2,MAN
	j WOMEN
	
MAN:
	c.lt.s $f0,$f5 # <
	bc1t Minore
	
	la $a0,sopra
	li $v0,4
	syscall
	j fine
Minore:
	la $a0,sotto
	li $v0,4
	syscall
	j fine

WOMEN:	
	c.lt.s $f0,$f6 # <
	bc1t Minore
	
	la $a0,sopra
	li $v0,4
	syscall
	j fine
fine:
	li $v0,10
	syscall
	
	
	.data
	uomo: .float 80.5
	donna: .float 84.5
	M: .asciiz "M"
	F: .asciiz "F"
	spazio: .asciiz "\n"
	genere: .asciiz "Genere(M o F): "
	età: .asciiz "Età: "
	sotto: .asciiz "Sotto la media "
	sopra: .asciiz "Sopra la media "

----------------------------------------------------------------ALTRO MODO PIU' COMPLETO
.text
	.globl main
main:
	la $t1,M			# CARICO M
	la $t2,F			# CARICO F
	la $t3,END			# CARICO X
	
loop:	
	li $v0,8			# RICHIESTA STRINGA IN INPUT
	syscall
	move $t0,$v0
	
	beq $t0,$t3,fine	# CONFRONTO STRINGA CON X, SE UGUALI SALTA
	beq $t0,$t1,maschio	# CONFRONTO STRINGA CON M, SE UGUALI SALTA
	beq $t0,$t2,femmina	# CONFRONTO STRINGA CON F, SE UGUALI SALTA

femmina:
	lwc1 $f2,etaF		# CARICO L'ETA MEDIA DELLA DONNA
	li $v0,6			# RICHIESTA FLOAT IN INPUT
	syscall
	
	c.lt.s $f0,$f2		# SE FLOAT INPUT < ETA' MEDIA
	bc1t MINOREf		# ALLORA SALTA
	la $a0,sopra		# STAMPO LA STRINGA
	li $v0,4
	syscall
	
	la $a0,spazio		# STAMPA DELLA RIGA VUOTA
	li $v0,4
	syscall
	
	j loop
	
MINOREf:
	la $a0,sotto		# STAMPO LA STRINGA
	li $v0,4
	syscall
	
	la $a0,spazio		# STAMPA DELLA RIGA VUOTA
	li $v0,4
	syscall
	
	j loop

maschio:
	lwc1 $f1,etaM		# CARICO L'ETA MEDIA DELLA DONNA
	li $v0,6			# RICHIESTA FLOAT IN INPUT
	syscall
	
	c.lt.s $f0,$f1		# SE FLOAT INPUT < ETA' MEDIA
	bc1t MINOREm		# ALLORA SALTA
	la $a0,sopra		# STAMPA DELLA STRINGA
	li $v0,4
	syscall
	
	la $a0,spazio		# STAMPA DELLA RIGA VUOTA
	li $v0,4
	syscall
	
	j loop
	
MINOREm:
	la $a0,sotto		# STAMPA DELLA RSTRINGA
	li $v0,4
	syscall
	
	la $a0,spazio		# STAMPA DELLA RIGA VUOTA
	li $v0,4
	syscall
	
	j loop

fine:
	li $v0,10			# CHIUSURA PROGRAMMA
	syscall
	
	.data
	M: .asciiz "M"
	F: .asciiz "F"
	END: .asciiz "X"
	etaM: .float 80.5
	etaF: .float 84.8
	sotto: .asciiz "SOTTO LA MEDIA"
	sopra: .asciiz "SOPRA LA MEDIA"
	spazio: .asciiz "\n"


