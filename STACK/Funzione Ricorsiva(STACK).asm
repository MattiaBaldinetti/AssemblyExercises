# Si consideri la funzione f definita su interi 
# f(x,y) = (x-y)*f(x-5,y+3) 
# f(x,y) =4 se x <= 0
# Si realizzi un programma in assembler MIPS che,definiti due interi 
# positivi e positivi e x?5, calcola il corrispondente valore di calcola il corrispondente valore di f(x,y) in modo in modo ricorsivo ricorsivo
# ESEMPIO:
# f(15,4)=11*f(10,7) =11*3*f(5,10) =11*3*-5*f(0,13) =11*3*-5*4= -660

	.text
	.globl main
main:
	li $v0,5 		#lettura vprimo alore di ingresso
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
	blez $a0,casobase
	subi $sp,$sp,16
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sub $a0,$a0,5 		#x = x-5
	add $a1,$a1,3 		#y = y+3

	jal Funzione

	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	add $sp,$sp,16
	sub $v1,$t0,$t1 	#(x-y)
	mul $v0,$v0,$v1 	#(x-y)*prodotti_precedenti
	jr $ra
	
casobase:
	li $v0,4
	jr $r
	
	
	
	
	