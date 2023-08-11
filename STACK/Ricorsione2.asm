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
	li $v0,5 		# RICHIESTA NUMERO IN INPUT
	syscall		
	move $a0,$v0
	
	li $v0,5		# RICHIESTA NUMERO IN INPUT
	syscall
	move $a1,$v0
	
	jal FUNZIONE		# SALTO ALLA SUB ROUTINE
	
	move $a0,$v0		# STAMPA DEL RISTULTATO
	li $v0,1
	syscall
	
	li $v0,10		# CHISURA PROGRAMMA
	syscall
	
FUNZIONE:
	beqz $a0,primo		# SE $A0 = 0, SALTA
	beqz $a1,secondo	# SE $A1 = 1, SALTA
	subu $sp,$sp,16		# INSERIMENTO DEGLI ELEMENTI NELLO SATCK
	sw $a0,0($sp)		#
	sw $a1,4($sp)		#
	sw $ra,8($sp)		#
	sub $a0,$a0,2		# x = x - 2
	sub $a1,$a1,5		# y = y - 5
	jal FUNZIONE		# SALTA A SUB ROUTINE
	lw $a0,0($sp)		# ESTRAGGO GLI ELEMENTI DALLO STACK
	lw $a1,4($sp)		#
	lw $ra,8($sp)		#
	addi $sp,$sp,16		#
	mul $v0,$v0,2		# MOLTIPLICO PER LA COSTANTE(data dall'esercizio)
	jr $ra			# RITORNA ALLA SUB ROUTINE
	
primo:
	beqz $a1,salta		# SE $A1 = 0, SALTA
	li $v0,1		# CARICA 1 IN $V0
	jr $ra			# RITORNA ALLA SUB ROUTINE
secondo:
	beqz $a0,salta		# SE $A0 = 0, SALTA
	li $v0,2		# CARICA 2 IN $V0
	jr $ra			# RITORNA ALLA SUB ROUTINE
salta:
	li $v0,3
	jr $ra			# RITORNA ALLA SUB ROUTINE
	
	
	
	
	
	
	
	
	
	
