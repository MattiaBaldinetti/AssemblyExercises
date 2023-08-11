# Si consideri la funzione f definita su interi 
# f(x,y) = 2*f(x-2,y-5) 
# f(0,y) = 1
# f(x,0) = 2
# f(0,0)=3
# Si realizzi un programma in assembler MIPS che,definiti due interi
# positivi x?2 e y ?2, calcola il corrispondente valore di f(x,y) in modo ricorsivo
# ESEMPIO:
# f(4,25)=2*f(2,20) =2*2*f(0,15) =2*2*1 =2*2*1=4
# f(8,10)=2*f(6,5) =2*2*f(4,0) =2*2*2=8
# f(4,10)=2*f(2,5)=2*2*f(0,0)=2*2*3=12

	.text
	.globl main
main:
	li $v0,5 		#lettura primo valore di ingresso
	syscall
	move $a0,$v0 		#spostamento di X in registro preservante
	
	li $v0,5 		#lettura secondo valore di ingresso
	syscall
	move $a1,$v0 		#spostamento di Y in registro preservante
	
	jal Funzione 		#salto a funzione ricorsiva
	
	move $a0,$v0 		#recupero del valore di ritorno della funzione ricorsiva
	li $v0,1 		#stampa del risultato
	syscall
	
	li $v0, 10 		#terminazione programma
	syscall
	
Funzione:
	beqz $a0,caso_base 	#confronto per stabilire il caso base
	beqz $a1,caso_base 	#
	subu $sp, $sp, 8 	#PUSH del valore X e dell'indirizzo di ritorno (nel primo caso al main; 
				#negli altri casi a dopo la chiamata ricorsiva)
	sw $ra, 0($sp) 		#
	sub $a0,$a0,2 		#aggiornamento X (x-2)
	sub $a1,$a1,5 		#aggiornamento Y (y-5)
	jal Funzione 
	lw $ra, 0($sp) 		#POP dei valori di RA precedentemente custoditi nello stack
	addi $sp, $sp, 8 	#
	mul $v0,$v0,2 		#costante da moltiplicare all’elemento selezionato
	jr $ra 			#salto per il POP successivo o per il ritorno del main
	
caso_base: 
	bnez $a0,zero2
	bnez $a1,zero1
	li $v0,3		# chiamata print double
	j finecasi 		#x=0e y=0
	
zero1:
	li $v0,1		# chiamata print int
	j finecasi
	
zero2:
	li $v0,2		# chiamata print float
	j finecasi 		#non serve, ma lo scrivo per uniformità
	
finecasi:
	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
