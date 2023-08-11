# Si consideri la funzione f definita su interi
# f(x,y) = f(x-1,y-1) – 1 se x+y>0
# f(x,y) = 5 se x+y<=0
# ESEMPIO f(10,5)=f(9,4)-1=(f(8,3)-1)-1=((f(7,2)-1)-1)-1=(f(6,1)-1)-3=(f(5,0)-1)-4=
# (f(4,-1)-1)-5=(f(3,-2)-1)-6)=f(2,-3)-1)-7=5-8=-3
# Realizzare un programma in assembler MIPS che, acquisiti due interi
# positivi x e y da tastiera (mediante sycall), calcola il corrispondente valore
# di f(x,y) in modo ricorsivo utilizzando lo stack e lo stampa su videoterminale
	.text
	.globl main
main:
	li $v0,5		# RICHIESTA NUMERO IN INPUT
	syscall
	move $a1,$v0
	
	li $v0,5		# RICHIESTA NUMERO IN INPUT
	syscall
	move $a2,$v0
		
	jal Funzione		# SALTO A SUB ROUTINE
	
	move $a0,$v0		# STAMPA RISULTATO
	li $v0,1
	syscall
	
	li $v0,10		# CHIUSURA PROGRAMMA
	syscall
Funzione:
	add $t0,$a1,$a2		# SOMMO $A1 E $A2
	blez $t0,caso_base	# SE $T0 <= 0, SALTA
	subu $sp,$sp,16		# INSERISCO L'ELEMENTO NELLO STACK
	sw $a1,0($sp)		#
	sw $a2,4($sp)		#
	sw $ra, 8 ($sp)		#
	sub $a1,$a1,1		# x = x - 1
	sub $a2,$a2,1		# y = y - 1
	jal Funzione		# SALTO A SUB ROUTINE
	lw $a1,0($sp)		# ESTRAGGO L'ELEMENTO DALLO STACK
	lw $a2,4($sp)		#
	lw $ra, 8 ($sp)		#
	addu $sp,$sp,16		#
	sub $v0,$v0,1		# SOTTRAGGO LA COSTANTE 1 ALLA FUNZIONE
	jr $ra			# RITORNO ALLA SUB ROUTINE
	
caso_base:
	li $v0,5		# CARICA 5 IN %V0
	jr $ra			# RITORNO ALLA SUB ROUTINE
	
	
	
	
	
	
	
	
	
	
	