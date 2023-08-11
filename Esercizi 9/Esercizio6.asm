# Creare una funzione SUBFMAX(int val1, int val2) che ricevuti due valori sottrae al maggiore metà del valore 
# del minore e divida per tre il minore.
# Creare una programma che applica tre volte la funzione a valori inseriti dall’utente.
# ESEMPIO:
# x=30;
# y=56;
# SUBFMAN(x,y); #dopo l'esecuzione: x=10 y=41
# SUBFMAN(x,y); #dopo l'esecuzione: x=3 y=36
# SUBFMAN(x,y); #dopo l'esecuzione: x=1 y=35
# PRINT(x); //stampa 1
# PRINT(y); //stampa 35
	.text
	.globl main
main:
	li $t7,3		# LIMITE RIPETIZIONI
	
	li $v0,5		# RICHIESTA INPUT
	syscall
	move $a2,$v0		
		
	li $v0,5		# RICHIESTA INPUT
	syscall
	move $a1,$v0		
	
	jal Funzione		# SALTO A SUB ROUTINE
	
	move $a0,$a2		# STAMPA X
	li $v0,1
	syscall
	
	la $a0,spazio		# STAMPA SPAZIO
	li $v0,4
	syscall
	
	move $a0,$a1		#STAMPA Y
	li $v0,1
	syscall
	
	li $v0,10		# CHIUSURA PROGRAMMA
	syscall
Funzione:
	blt $a2,$a1,minore	# $a2 < $a1, salta
	# allora $a2 più grande
	div $t3,$a1,2		# $T3 = $A1 / 2
	sub $a2,$a2,$t3		# $a2 = $a2 - $t3
	div $a1,$a1,3		# $a1 / 3
	addi $t9,$t9,1		# INCREMENTO IL CONTATORE
	blt $t9,$t7,Funzione	# SE $T9 < $T7, SALTA
	jr $ra			# RITORNA ALLA SUB ROUTINE
	
minore: # allora $a1 più grande
	div $t3,$a2,2		# $T3 = $A2 / 2
	sub $a1,$a1,$t3		# $a2 = $a2 - $t3
	div $a2,$a2,3		# $a2 / 3
	addi $t8,$t8,1		# INCREMENTO IL CONTATORE
	blt $t8,$t7,minore	# SE $T8 < $T7, SALTA
	jr $ra			# RITORNA ALLA SUB ROUTINE
	
	.data
	spazio: .asciiz "\n"
	
	
	
	
	