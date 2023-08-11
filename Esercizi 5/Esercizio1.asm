# Scrivere un programma in linguaggio assembly MIPS che riceve in ingresso 
# una sequenza di N numeri interi. I numeri sono memorizzati in un vettore. 
# Il valore N è inserito dall’utente, ma il vettore può contenere al massimo 30 numeri. 
# Terminato l’inserimento della sequenza di numeri, il programma deve verificare se gli elementi 
# del vettore sono tutti uguali tra loro.

	.text
	.globl main
main:
	la $s0, v # INDIRIZZO ASSOLUTO DEL VETTORE
	
	la $a0,dimensione
	li $v0,4
	syscall
	
	li $v0, 5 		# RICHIESTA DI INPUT (NUMERO)
	syscall
	move $t0, $v0 		# N NUMERI DA INSERIRE
	
	li $t1, 0 		# INIZIALIZZO IL CONTATORE A 0
	
while:
	bge $t1, $t0, fine 	# SE t1 E' MAGGIOR UGUALE DI t0 VAI IN fine
	
	li $v0, 5 		# RICHIESTA DI INPUT (NUMERO)
	syscall
	sw $v0, ($s0)		# CARICO IL VALORE RICEVUTO IN INPUT NEL VETTORE
	addi $s0, $s0, 4 	# INCREMENTO ALL'ELEMENTO SUCCESSIVO
	addi $t1, $t1, 1 	# INCREMENTO DI UNO
	j while 		# JUMP
fine:
	la $s1, v 		# INDIRIZZO ASSOLUTO DEL VETTORE
	lw $t2, 0($s1) 		# PRELIEVO DEL ELEMENTO
	li $t1, 1 		# CARICO IN t1 IL VALORE 1
	li $t4, 1 		# CARICO IN t4 IL VALORE 1 (CHECK)
	addi $s1, $s1, 4 	# INCREMENTO ALL'ELEMENTO SUCCESSIVO
while1:
	bge $t1, $t0, end	# SE t1 E' MAGGIOR UGUALE DI t0 VAI IN end
	lw $t3, ($s1) 		# PRELIEVO DEL ELEMENTO
	bne $t2, $t3, skip	# SE IL VALORE IN t2 NON E' UGUALE AL VALORE IN t3 VAI IN skip
	addi $t4, $t4, 1 	# INCREMENTO DI UNO
skip:
	lw $t2, ($s1) 		# PRELIEVO DEL ELEMENTO
	addi $s1, $s1, 4 	# INCREMENTO ALL'ELEMENTO SUCCESSIVO
	addi $t1, $t1, 1 	# INCREMENTO DI UNO
	j while1 		# JUMP
end:
	beq $t4, $t0, true 	# SE IL VALORE IN t4 E' UGUALE AL VALORE IN t0 VAI IN true
	la $a0, f 		# STAMPO SU CONSOLE IL TESTO SALVATO IN f
	li $v0, 4
	syscall
	li $v0, 10  		# FINE PROGRAMMA
	syscall
true:
	la $a0, vero 		# STAMPO SU CONSOLE IL TESTO SALVATO IN vero
	li $v0, 4
	syscall
	li $v0, 10 		# FINE PROGRAMMA
	syscall

	.data
	v: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	f: .asciiz "Non sono tutti uguali"
	vero: .asciiz "Sono tutti uguali"
	dimensione: "Inserire la dimensione dell'array: "
--------------------------------------------------------------ALTRO MODO
	.text
	.globl main
main:
	la $s0,v		# INIZIALIZZO IL VETTORE
	li $t9,0		# CONTATORE AUSILIARIO
	
	li $v0,5		# RICHIESTA LUNGHEZZA VETTORE
	syscall 
	move $t0,$v0
	
	li $t1,0		# CONTATORE
loop:
	bge $t1,$t0,check	# SE CONTATORE >= LUNGH, ALLORA SALTA
	
	li $v0,5		# RICHIESTA DELL'ELEMENTO
	syscall
	sw $v0,($s0)		# SALVO L'ELEMENTO NEL VETTORE
	
	addi $s0,$s0,4		# INCREMENTO L'INDICE DEL VETTORE
	addi $t1,$t1,1		# INCREMENTO IL CONTATORE
	j loop

check:
	la $s1,v		# INIZIALIZZO IL VETTORE
	lw $t2,0($s1)		# CARICO IL PRIMO ELEMENTO 
	li $t8,0		# CONTATORE AUSILIARIO
	addi $s1,$s1,4		# INCREMENTO L'INDICE 
	bge $t8,$t0,end		# SE $T8 >= $T0, ALLORA SALTA
	lw $t3,($s1)		# CARICA L'ELEMENTO SUCCESSIVO A $T2
	bne $t2,$t3,skip	# SE $T2 != $T3, ALLORA SALTA
	j simili
	
simili:
	beq $t9,$t0,out		# SE $T9 == $T0, SALTA
	add $t9,$t9,1		# INCREMENTA IL CONTATORE
	addi $s1,$s1,4		# INCREMENTO INDICE 
	add $t8,$t8,1		# INCREMENTA
	j check
skip:
	la $a0,diversi		# STAMPA CHE SONO DIVERSI
	li $v0,4
	syscall
	j end
out:
	la $a0,uguali		# STAMPA CHE SONO UGUALI
	li $v0,4
	syscall
	j end	
end:
	li $v0,10		# CHIUSURA DEL PROGRAMMA
	syscall
	
	.data
	v: .word 0:30
	uguali: .asciiz "Sono tutti uguali."
	diversi: "Non sono tutti uguali."


