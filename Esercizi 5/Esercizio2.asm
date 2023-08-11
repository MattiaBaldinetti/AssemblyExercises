# Un programma in linguaggio assembly MIPS deve leggere dall’utente due vettori di 5 numeri interi ciascuno. 
# Il programma deve creare un ulteriore vettore, che contenga la copia dei soli elementi pari presenti nei 
# due vettori di partenza, e stampare tale vettore.
	
.text
	.globl main
main:
	la $s0, v		# INDIRIZZO ASSOLUTO DEL VETTORE
	la $s1, v1 		# INDIRIZZO ASSOLUTO DEL VETTORE1
	la $s2, v2		# INDIRIZZO ASSOLUTO DEL VETTORE2
	
	li $t1,0 		# INIZIALIZZO IL CONTATORE A 0
	li $t9,2		# inizializzo il registro per la futura divisione
	li $t0,10		# lunghezza nuovo vettore
	li $t6,0		# inizializzo un nuovo contatore per i pari	
	
fine:	
	la $s0,v		# carico l'indirizzo assoluto del vettore	
	lw $t3,0($s0)		# prelievo del primo elemento(all'indice 0)
	
	la $s1,v1		# carico l'indirizzo assoluto del vettore
	lw $t4,0($s1)		# prelievo del primo elemento(all'indice 0)
	
	div $t3,$t9		# divido il numero in input per 2
	mfhi $t8		# salvo il resto
	
	div $t4,$t9		# divido il numero in input per 2
	mfhi $t7		# salvo il resto
	
	li $t1,0		# inizializzo un contatore a 0
	j check
	
ciclo1:
	bge $t1,$t0,print	# se $t1 >= $t0, allora salta
	addi $s0,$s0,4		# incremento l'indice del primo vettore
	addi $s1,$s1,4		# incremento l'indice del secondo vettore
	lw $t3,($s0)		# preleva l'elemento dal vettore
	lw $t4,($s1)		# preleva l'elemento dal vettore
	
	div $t3,$t9		# divido il numero per 2
	mfhi $t8		# salvo il resto
	
	div $t4,$t9		# divido il numero per 2
	mfhi $t7		# salvo il resto
	j check
	
	
check:
	beqz $t8,pari1		# controllo se il resto è 0
	beqz $t7,pari2		# controllo se il resto è 0
	add $t1,$t1,1		# incremento il contatore
	add $t1,$t1,1		# incremento il contatore
	j ciclo1
	
	
pari1:
	sw $t3,($s2)		# salvo il valore di $t3 nel nuovo vettore
	addi $s2,$s2,4		# passo all'indice successivo del vettore
	addi $t6,$t6,1		# incremento un contatore
	li $t8,1		# setto $t8 a 1 così che tornato nel check mi controlla anche $t7
	j check
	
pari2:
	sw $t4,($s2)		# salvo il valore di $t3 nel nuovo vettore
	addi $s2,$s2,4		# passo all'indice successivo del vettore
	addi $t6,$t6,1		# incremento un contatore
	li $t7,1		# setto $t7 a 1 così che tornato nel check mi controlla anche $t8
	j check
	
print: 
	la $s2,v2		# carico l'indirizzo assoluto del vettore(osia dove inizia il vettore)
	lw $t5,0($s2)		# prelevo l'elemento all'indice 0
	
	move $a0,$t5		# stampa l'elemento all'indice 0
	li $v0,1
	syscall
	
	li $t1,1		# inizializzo di nuovo il contatore a 1
	addi $s2,$s2,4		# passo all'indice successivo del vettore
	
ciclo3:
	la $a0,spazio		# stampo una spazio tra ogni numero da stampare
	li $v0,4		#
	syscall			#
	
	bge $t1,$t6,end		# se $t1 >= $t6, allora salta
	lw $t5,($s2)		# prelievo l'elemento in posizione N
	
	move $a0,$t5		# stampa dell'elemento
	li $v0,1		#
	syscall			#
	
	addi $s2,$s2,4		# incremento l'indice del vettore
	addi $t1,$t1,1		# incremento il contatore
	j ciclo3

end: 
	li $v0,10		# chiusra del programma
	syscall			#
						
	.data
	spazio: .asciiz "\t"
	v: .word 1,3,4,5,6
	v1: .word 1,3,4,2,8
	v2: .word 0,0,0,0,0,0,0,0,0,0
	
----------------------------------------------------------------
ALTRO MODO CON RICHIESTA IN INPUT

	.text
	.globl main
main:
	la $s0, v		# INDIRIZZO ASSOLUTO DEL VETTORE
	la $s1, v1 		# INDIRIZZO ASSOLUTO DEL VETTORE1
	la $s2, v2		# INDIRIZZO ASSOLUTO DEL VETTORE2
	
	li $t1,0 		# INIZIALIZZO IL CONTATORE A 0
	li $t9,2		# inizializzo il registro per la futura divisione
	li $t0,10		
	li $t6,0		# inizializzo un nuovo contatore per i pari	
	
ciclo:	
	beq $t1,$t0,fine	# controllo se il contatore è arrivato a 10, in caso salto 

	li $v0, 5 		# RICHIESTA DI INPUT (NUMERO)
	syscall
	sw $v0, ($s0)		# CARICO IL VALORE RICEVUTO IN INPUT NEL VETTORE
	addi $s0, $s0, 4 	# INCREMENTO ALL'ELEMENTO SUCCESSIVO
	addi $t1, $t1, 1	# INCREMENTO DI UNO
	
	li $v0, 5 		# RICHIESTA DI INPUT (NUMERO)
	syscall
	sw $v0, ($s1)		# CARICO IL VALORE RICEVUTO IN INPUT NEL VETTORE
	addi $s1, $s1, 4 	# INCREMENTO ALL'ELEMENTO SUCCESSIVO
	addi $t1, $t1, 1	# INCREMENTO DI UNO
	j ciclo
fine:	
	la $s0,v		# carico l'indirizzo assoluto del vettore	
	lw $t3,0($s0)		# prelievo del primo elemento(all'indice 0)
	
	la $s1,v1		# carico l'indirizzo assoluto del vettore
	lw $t4,0($s1)		# prelievo del primo elemento(all'indice 0)
	
	div $t3,$t9		# divido il numero in input per 2
	mfhi $t8		# salvo il resto
	
	div $t4,$t9		# divido il numero in input per 2
	mfhi $t7		# salvo il resto
	
	li $t1,0		# inizializzo un contatore a 0
	j check
	
ciclo1:
	bge $t1,$t0,print	# se $t1 >= $t0, allora salta
	addi $s0,$s0,4		# incremento l'indice del primo vettore
	addi $s1,$s1,4		# incremento l'indice del secondo vettore
	lw $t3,($s0)		# preleva l'elemento dal vettore
	lw $t4,($s1)		# preleva l'elemento dal vettore
	
	div $t3,$t9		# divido il numero per 2
	mfhi $t8		# salvo il resto
	
	div $t4,$t9		# divido il numero per 2
	mfhi $t7		# salvo il resto
	j check
	
	
check:
	beqz $t8,pari1		# controllo se il resto è 0
	beqz $t7,pari2		# controllo se il resto è 0
	add $t1,$t1,1		# incremento il contatore
	add $t1,$t1,1		# incremento il contatore
	j ciclo1
	
	
pari1:
	sw $t3,($s2)		# salvo il valore di $t3 nel nuovo vettore
	addi $s2,$s2,4		# passo all'indice successivo del vettore
	addi $t6,$t6,1		# incremento un contatore
	li $t8,1		# setto $t8 a 1 così che tornato nel check mi controlla anche $t7
	j check
	
pari2:
	sw $t4,($s2)		# salvo il valore di $t3 nel nuovo vettore
	addi $s2,$s2,4		# passo all'indice successivo del vettore
	addi $t6,$t6,1		# incremento un contatore
	li $t7,1		# setto $t7 a 1 così che tornato nel check mi controlla anche $t8
	j check
	
print: 
	la $s2,v2		# carico l'indirizzo assoluto del vettore(osia dove inizia il vettore)
	lw $t5,0($s2)		# prelevo l'elemento all'indice 0
	
	move $a0,$t5		# stampa l'elemento all'indice 0
	li $v0,1
	syscall
	
	li $t1,1		# inizializzo di nuovo il contatore a 1
	addi $s2,$s2,4		# passo all'indice successivo del vettore
	
ciclo3:
	la $a0,spazio		# stampo una spazio tra ogni numero da stampare
	li $v0,4		#
	syscall			#
	
	bge $t1,$t6,end		# se $t1 >= $t6, allora salta
	lw $t5,($s2)		# prelievo l'elemento in posizione N
	
	move $a0,$t5		# stampa dell'elemento
	li $v0,1		#
	syscall			#
	
	addi $s2,$s2,4		# incremento l'indice del vettore
	addi $t1,$t1,1		# incremento il contatore
	j ciclo3

end: 
	li $v0,10		# chiusra del programma
	syscall			#
						
	.data
	spazio: .asciiz "\t"
	v: .word 0,0,0,0,0
	v1: .word 0,0,0,0,0
	v2: .word 0,0,0,0,0,0,0,0,0,0
	
