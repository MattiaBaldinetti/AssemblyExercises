	.text
	.globl main
main:
    la $s0, v 		# INDIRIZZO ASSOLUTO DEL VETTORE (carichi il vettore)
    li $t1, 0 		# INIZIALIZZO IL CONTATORE A 0
    li $t2, 8		# CARICO IL NUMERO DEGLI ELEMENTI PRESENTI NEL VETTORE

    lw $t3, 0($s0)	# CARICO IL PRIMO ELEMENTO DEL VETTORE
    	
    move $a0,$t3	# STAMPA DEL PRIMO ELEMENTO
    li $v0,1
    syscall
    
    li $t1, 1 		# CARICO IN t1 IL VALORE 1
    addi $s0, $s0, 4 	# INCREMENTO ALL'ELEMENTO SUCCESSIVO(incremento dell'indice)
ciclo:

    bge $t1, $t2, end 	# SE t1 E' MAGGIOR UGUALE DI t0 SALTA IN end
    
    lw $t4, ($s0) 	# CARICO L'ELEMENTO ALL'INDICE SUCCESSIV0( +1 rispetto al ciclo precendente)
    
    move $a0,$t4	# STAMPA DELL'ELEMENTO ALL'INDICE INDICATO ALLA RIGA PRECEDENTE
    li $v0,1
    syscall
    
    addi $t1, $t1, 1	# INCREMENTO IL CONTATORE DI 1
    addi $s0, $s0, 4	# INCREMENTO ALL'ELEMENTO SUCCESSIVO(incremento dell'indice)
    j ciclo

end:
    li $v0, 10         # FINE PROGRAMMA
    syscall
    
	.data
	v: .word 7, 2, 4, 6, 7, 1, 4, 6,