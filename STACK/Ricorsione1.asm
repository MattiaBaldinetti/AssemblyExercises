# Si consideri la funzione f definita su interi 
# f(x) = f(x-2) – 2 
# f(1) = 14
# f(0) = 10
# Si realizzi un programma in assembler MIPS che,definito un intero 
# positivo x?2, calcola il corrispondente valore di f(x) in modo ricorsivo
# ESEMPIO:
# f(6)=f(4)-2=(f(2)-2)-2=((f(0)-2)-2)-2=10-2-2-2=4
# f(5)=f(3)-2=f(1)-2-2=14-2-2=10

	.text
	.globl main
main:
	li $v0,5			# RICHIESTA NUMERO IN INPUT
	syscall
	move $a0,$v0
	
	jal FUNZIONE			# SALTO ALLA SUB ROUTINE
	
	move $a0,$v0			# STAMPA NUMERO
	li $v0,1
	syscall
	
	li $v0,10			# CHIUSURA PROGRAMMA
	syscall
	
FUNZIONE:	
	li $t1,1			# INIZIALIZZO $T1
	ble $a0,$t1,caso_base		# SE $A0 <= $T1, SALTA
	subu $sp,$sp,8			# INSERIMENTO DEL PRIMO VALORE 
	sw $a0,0($sp)			#
	sw $ra,4($sp)			# 
	sub $a0,$a0,2			# F(x-2)
	jal FUNZIONE			# SALTO ALLA SUB ROUTINE
	lw $a0,0($sp)			# ESTRAGGO GLI ELEMENTI DALLO STACK
	lw $ra,4($sp)			#
	addi $sp,$sp,8			#
	sub $v0,$v0,2			# COSTANTE DA SOTTRARRE(data dall'esercizio)
	jr $ra				# RITORNA ALLA SUB ROUTINE
	
caso_base:
	beqz $a0,zero			# SE $A0 = 0, SALTA
	li $v0,14			# CARICA 14 IN $V0
	jr $ra				# RITORNA ALLA SUB ROUTINE
	
zero:
	li $v0,10			# CARICA 10 IN $V0
	jr $ra				# RITORNA ALLA SUB ROUTINE
	
	
	