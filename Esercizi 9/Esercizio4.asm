# Creare una funzione int DIVISORE (int n) che calcola quanti divisori ha un numero naturale n.
# Creare poi un programma che ricevuto dall’utente un numero naturale n stampi 
# il numero d che indica quanti divisori ha n.
# ESEMPIO:
# READ(x) //immessione di x=33
# Y=DIVISORE(X)
# PRINT(Y) //risultato 2 (cioè 3 e 11)
	.text
	.globl main
main:
	li $t0,1		# INIZIALIZZO A 1
	
	li $v0,5		# RICHIESTA IN INPUT
	syscall
	move $a1,$v0
	
	move $t2,$a1		# CARICO IL VALORE $T1 IN $T2
	sub $t2,$t2,1		# SOTTRAGGO 1 A $T2
	jal Funzione		# SALTO A SUB ROUTINE
	
	move $a0,$t4		# PRINTO IL RISULTATO
	li $v0,1
	syscall
	li $v0,10		# CHIUSURA DEL PROGRAMMA
	syscall
Funzione:
	div $a1,$t2		# $T1 / $T2
	mfhi $t3		# SALVO IL RESTO
	beqz $t3,salto		# SE $T3 = 0, SALTA
	sub $t2,$t2,1		# DECREMENTO $T2
	bgt $t2,$t0,Funzione	# SE $T2 > $T0, SALTA
	jr $ra			# RITORNO ALLA SUB ROUTINE
	
	
salto:
	add $t4,$t4,1		# INCREMENTO IL CONTATORE
	sub $t2,$t2,1		# DECREMENTO $T2
	bgt $t2,$t0,Funzione	# SE $T2 > $T0, SALTA
	jr $ra			# RITORNA ALLA SUB ROUTINE


































	
