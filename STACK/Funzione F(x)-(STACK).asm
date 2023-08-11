# Si consideri la funzione f definita su interi 
# f(x) = f(x-1) - 1 se x è multiplo di 3
# f(x) = f(x-1) + 1 se x non è multiplo di 3
# f(1) = 1
# Si realizzi un programma in assembler MIPS che,definito un intero 
# positivo x?2, calcola il corrispondente valore di f(x) in modo ricorsivo
# STUDIO:
# F(6)=F(5)-1=(F(4)+1)-1=((F(3)+1)+1)-1=(((F(2)-1)+1)+1)-1=((((F(1)+1)-1)+1)+1)-1= 1+1-1+1+1-1= 2 
	
	.text
	.globl main
main:
	li $v0,5
	syscall
	move $a0,$v0
	
	jal funzione
	
	move $a0,$v0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
funzione:
	li $t1,1
	beq $a0,$t1,caso_base
	subu $sp,$sp,8
	sw $a0,0($sp)
	sw $ra,4($sp)
	sub $a0,$a0,1
	jal funzione
	lw $a0,0($sp)
	lw $ra,4($sp)
	addi $sp,$sp,8
	li $t0,3
	rem $t1,$a0,$t0
	beqz $t1,multiplo
	add $v0,$v0,1
	j fine

multiplo:
	sub $v0,$v0,1
fine:
	jr $ra
caso_base:
	li $v0,1
	jr $ra

	
	
	
	
	
	
	
	
	
	
	
	
	