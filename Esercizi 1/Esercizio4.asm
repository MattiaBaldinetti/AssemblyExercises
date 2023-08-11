# Descrivere l'algoritmo che dato un numero intero maggiore di 2 (definito in memoria) 
# stabilisca se il numero � primo (valore 1 in $t2) o no (valore 2 in $t2). 
# Provare ad implementare il programma utilizzando l'emulatore MARS.
# Esempio numeri primi 1,3,5,7,11,13,...
# PS: un numero � primo solo se � divisibile per se stesso e per 1.

	.text
	.globl main
	
main:
    lw $t1, numero 		# CARICO IL NUMERO DA ANALIZZARE
    li $t2,2		 	# INIZIALIZZO UN INDICE
    div $t3,$t1,2 		# STABLISCO DOVE SI DEVE FERMARE IL CICLO
    li $t5,1 			# INZIALIZZO t5 (CONTROLLA SE IL NUMERO E' PRIMO O NO)

CICLO:
    bgt $t2,$t3,FINE_CICLO 	# CICLO CHE SI FERMA QUANDO L'INDICE E' MAGGIORE DEL NUMERO
    rem $t4,$t1,$t2 		# DO A t4 IL VALORE DEL RESTO DELLA DIVISIONE FRA INDICE E NUMERO
    beq $t4,0,NON_PRIMO 	# SE IL NUMERO E' DIVISIBILE ALLORA NON E' RIMO
    add $t2,$t2,1 		# INCREMENTO DEL INDICE
    j CICLO 			# JUMP
NON_PRIMO:
    li $t5,2 			# IMPOSTO t5 A 2 (NUMERO NON PRIMO)
    
    move $a0,$t5
    li $v0,1
    syscall
    j fine
FINE_CICLO: 
    move $t2,$t5
     
    move $a0,$t2
    li $v0,1
    syscall 
    j fine
fine:  
    li $v0,10 			# FINE PROGRAMMA
    syscall

	.data
	numero: .word 11


-------------------------------------------------
ALTRO METODO

	.text
	.globl main
main:
	lw $t0,val
	li $t1,2
	li $t2,3
	
	rem $t3,$t0,$t1
	beqz $t3,no_primo
	rem $t4,$t0,$t2
	beqz $t4,non_primo
	
	li $t0,1
	j end
no_primo:
	li $t0,2
	j end
	
non_primo:
	li $t0,2
	j end
	
end:
	li $v0,10
	syscall
	
	.data
	val: .word 11
