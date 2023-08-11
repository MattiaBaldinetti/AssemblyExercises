	.text
	.globl main
main:
	li $v0,5
	syscall
	move $s0,$v0
	
	li $v0,5
	syscall 
	move $s1,$v0
	
	sub $s2,$s0,$s1		 #Calcolo A-B
	bltz $s0, errore 	#Valutazione del caso in cui un argomento della radice sia negativa
	bltz $s1, errore 	#Valutazione del caso in cui un argomento della radice sia negativa
	blez $s2, errore 	#Valutazione del caso in cui un argomento della radice sia negativa
	move $a0,$s0 		#Calcolo SQRT_INF(A)
	jal RADICE_QUADRATA
	move $s0,$v0
	move $a0,$s1 		#Calcolo SQRT_INF(B)
	jal RADICE_QUADRATA
	move $s1,$v0
	move $a0,$s2 		#Calcolo SQRT_INF(A-B)
	jal RADICE_QUADRATA
	move $s2,$v0
	add $t0,$s0,$s1 	#Calcolo Z = SQRT_INF(A)+SQRT_INF(B)
	rem $a0,$t0,$s2		#Calcolo Z = SQRT_INF(A-B)
	li $v0,1 		#Stampa del risultato
	syscall
	j fine
errore: 			#Stampa stinga di errore
	la $a0, msgTxt
	li $v0,4
	syscall
fine:
	li $v0,10 		#Terminazione del programma
	syscall
	
RADICE_QUADRATA:
	li $v0,0 		#Registro in cui riportare il risultato
RQ_ciclo:
#Calcolo della parte intera inferiore della radice
#quadrata di un operando intero
	mul $t1,$v0,$v0
	bgt $t1,$a0,RQ_fine
	add $v0,$v0,1
	j RQ_ciclo
RQ_fine:
	sub $v0,$v0,1
	jr $ra
	
	.data
	msgTxt: .asciiz "Operando con valore negativo: la parte intera della radice quadrata non può essere calcolata o secondo termine del modulo nullo"
