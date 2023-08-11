# Si consideri la funzione f definita su interi 
# f(x,y) = (x-y)*f(x-5,y+3) 
# f(x,y) =4 se x <= 0
# Si realizzi un programma in assembler MIPS che,definiti due interi 
# positivi e positivi e x?5, calcola il corrispondente valore di calcola il corrispondente valore di f(x,y) in modo in modo ricorsivo ricorsivo
# ESEMPIO:
# f(15,4)=11*f(10,7) =11*3*f(5,10) =11*3*-5*f(0,13) =11*3*-5*4=-660

	.text
	.globl main
main:
	li $v0,5		# NUMERO IN INPUT
	syscall
	move $a0,$v0
	
	li $v0,5		# NUMERO IN INPUT
	syscall
	move $a1,$v0
	
	jal FUNZIONE		#SALTO A SUB ROUTINE
	
	move $a0,$v0		# STAMPA VALORE
	li $v0,1
	syscall
	
	li $v0,10		# CHIUSURA PROGRAMMA
	syscall
	
FUNZIONE:
	blez $a0,caso_base	# SE $A0 <= 0, SALTA
	subu $sp,$sp,16		# INSERIMENTO DEGLI ELEMENTI NELLO STACK
	sw $a0,0($sp)		#
	sw $a1,4($sp)		#	
	sw $ra,8($sp)		#
	sub $a0,$a0,5		# x = x - 5 
	add $a1,$a1,3		# y = y + 3
	jal FUNZIONE		# SALTO A SUB ROUTINE
	lw $a0,0($sp)		# ESTRAGGO GLI ELEMENTI DALLO STACK
	lw $a1,4($sp)		#
	lw $ra,8($sp)		#	
	addi $sp,$sp,16		#
	sub $v1,$a0,$a1		# $V1 = x - y
	mul $v0,$v0,$v1		# $V0 = $V0 * $V1
	jr $ra			# RITORNA ALLA SUB ROUTINE
	
caso_base:
	li $v0,4		# CARICA 4 IN $V0
	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	