# Si consideri la funzione f definita su interi 
# f(x) = f(x-2) – 2 
# f(1) = 14
# f(0) = 10
# Si realizzi un programma in assembler MIPS che,definito un intero 
# positivo x?2, calcola il corrispondente valore di f(x) in modo ricorsivo
# STUDIO:
# f(6)=f(4)-2=f(2)-2-2=f(0)-2-2-2=10-2-2-2=4
# f(5)=f(3)-2=f(1)-2-2=14-2-2=10

	.text
	.globl main
main:
	li $v0,5 			#lettura valore di ingresso
	syscall
	move $a0,$v0 			#spostamento di X in registro preservante
	
	jal Funzione 			#salto a funzione ricorsiva
	
	move $a0,$v0 			#recupero del valore di ritorno della funzione ricorsiva
	li $v0,1 			#stampa del risultato
	syscall
	
	li $v0, 10 			#terminazione programma
	syscall
	
Funzione:
	li $t1,2 			#confronto per stabilire se il valore analizzato fa riferimento al caso base
	blt $a0, $t1, caso_base 	#salto al caso base
	subu $sp, $sp, 8	 	#PUSH del valore X e dell'indirizzo di ritorno (nel primo caso al main; negli altri casi
					#a dopo la chiamata ricorsiva)
	sw $a0, 0($sp) 			#
	sw $ra, 4($sp) 			#
	sub $a0, $a0, 2	#aggiornamento del valore di X (x-2)
	
	jal Funzione 
	
	lw $a0, 0($sp) 			#POP dei valori precedentemente custoditi nello stack
	lw $ra, 4($sp) 			#
	addi $sp, $sp, 8 		#
	sub $v0,$v0,2 			#costante da sottrarre in base all'elemento selezionato
	jr $ra 	
				#salto per il POP successivo o per il ritorno del main
caso_base: 
	li $v0, 10 			#caso base X=0
	beqz $a0,salta
	li $v0,14 			#caso base X=1
	
salta:
	jr $ra				#salto per il POP o per il ritorno del main
	
	
	
	
	
	