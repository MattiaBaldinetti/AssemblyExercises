# Creare una funzione che ricevuti tre importi di denaro sposta gli eventuali debiti 
# (si considerino debiti gli importi negativi) sul primo importo STOCK(int a, int b, int c).
# Creare un main per testare la funzione:
# ESEMPIO
# X=5;
# Y=-1;
# Z=-2;
# STOCK (X,Y,Z);
# Print(X); //stampa 2
# Print(Y); //stampa 0
# Print(Z); //stampa 0
	.text
	.globl main
main:
	li $v0,5		# RICHIESTA NUMERO INPUT
	syscall
	move $a3,$v0
	
	li $v0,5		# RICHIESTA NUMERO INPUT
	syscall
	move $a1,$v0
	
	li $v0,5		# RICHIESTA NUMERO IN INPUT
	syscall
	move $a2,$v0
	
	jal Funzione		# SALTO A SUB ROUTINE
	
	move $a0,$a3		# STAMPA PRIMO NUMERO
	li $v0,1
	syscall
	
	la $a0,spazio		# STAMPA SPAZIO
	li $v0,4
	syscall
	
	move $a0,$a1		# STAMPA SECONDO NUMERO
	li $v0,1
	syscall
	
	la $a0,spazio		# STAMPA SPAZIO
	li $v0,4
	syscall
	
	move $a0,$a2		# STAMPA TERZO NUMERO
	li $v0,1
	syscall
	
	li $v0,10		# CHIUSURA PROGRAMMA
	syscall
	
Funzione:
	bltz $a1,aumenta1	# SE $A1 < 0, SALTA
	bltz $a2,aumenta2	# SE $A2 < 0, SALTA
	jr $ra			# RITORNO ALLA SUB ROUTINE
aumenta1:
	add $a3,$a3,$a1		# AGGIUNGI IL DEBITO AL CONTO PRINCIPALE
	li $a1,0		# IMPOSTA $A1 A 0
	bltz $a2,aumenta2	# SE $A2 < 0, SALTA
	jr $ra			# RITORNO ALLA SUB ROUTINE
	
aumenta2:
	add $a3,$a3,$a2		# AGGIUNGI IL DEBITO AL CONTO PRINCIPALE
	li $a2,0		# IMPOSTA $A2 A 0
	jr $ra			# RITORNO ALLA SUB ROUTINE
	
	.data
	spazio: .asciiz "\n"
	
	
	
	
	
	
	
	