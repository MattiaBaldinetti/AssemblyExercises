# Un programma in linguaggio assembly MIPS deve inizializzare quindici valori interi e 
# calcolare la media aritmetica (si deve usare il coprocessore matematico) degli elementi 
# alla posizioni pari, alla posizioni dispari e quella complessiva.


	.text
	.globl main
main:
	li $t0,15		# LUNGHEZZA DEL VETTORE
	la $s0,v		# INIZIALIZZO IL VETTORE
	li $t1,0		# CONTATORE
	li $t4,2		# UTILE PER LA DIVISIONE
	
ciclo:
	beq $t1,$t0,end		# SE $t1 > $t0, ALLORA SALTA
	lw $t2,($s0)		# CARICO ELEMENTO DEL VETTORE
	add $t8,$t8,$t2		# INCREMENTO LA SOMMA TOT
	div $t1,$t4
	mfhi $t5
	j check1
	
check1:
	beqz $t5,pari		# SE RESTO = 0,SALTA
	j dispari		# SALTA

pari:
	add $t6,$t6,$t2
	add $s3,$s3,1
	addi $s0,$s0,4
	addi $t1,$t1,1
	j ciclo

dispari:
	add $t7,$t7,$t2
	add $t9,$t9,1
	add $s0,$s0,4
	addi $t1,$t1,1
	j ciclo
	
end:
	div $t8,$t8,$t0		# media totale
	div $t6,$t6,$s3		# media pari
	div $t7,$t7,$t9		# media dispari
	
	la $a0,PARI		# STAMPA MEDIA PARI
	li $v0,4
	syscall
	move $a0,$t6
	li $v0,1
	syscall	
	
	la $a0,capo
	li $v0,4
	syscall
	
	la $a0,DISPARI		# STAMPA MEDIA DISPARI
	li $v0,4
	syscall
	move $a0,$t7
	li $v0,1
	syscall
	
	la $a0,capo
	li $v0,4
	syscall
		
	la $a0,TOT		# STAMPA MEDIA TOT
	li $v0,4
	syscall
	move $a0,$t8
	li $v0,1
	syscall
	
	.data
	v: 1,34,56,98,3,7,4,6,34,7,8,6,64,33,45
	PARI: .asciiz "Media pari: "
	DISPARI: .asciiz "Media dispari: "
	TOT: .asciiz "Totale: "
	capo: .asciiz "\n"
	


----------------------------------------------------------------
ALTRO MODO, CLACOLA LA MEDIA DEI NUMERI NON IN BASE ALLE POSIZIONI

	.text
	.globl main
main:
	la $s0,v		# indirizzo assoluto del vettore
	li $t0,15
	li $t1,0
	li $t2,15
	li $t5,2
	
ciclo:	
	la $a0,str 
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	sw $v0, ($s0)
	
	add $t3,$t3,$v0		# SOMMA TRA I VALORI IN INPUT
	
	addi $s0, $s0, 4 	# INCREMENTO ALL'ELEMENTO SUCCESSIVO
	addi $t1, $t1, 1	# INCREMENTO DI UNO
	
	div $v0,$t5		# VEDO SE IL NUMERO IN INPUT è PARI
	mfhi $t7		#
	
	beqz $t7,pari		
	j dispari
conf:	
	beq $t1,$t2,comp	# VEDO QUANDO IL VETTORE è PIENO
	j ciclo
	
pari:
	add $t8,$t8,$v0
	add $s1,$s1,1
	j conf
	
dispari:
	add $t9,$t9,$v0
	add $s2,$s2,1
	j conf	
		
comp:	
	beqz $t8,pari0
	beqz $t9,dispari0
	
	div $t4,$t3,$t2		# media complessiva
	div $t6,$t8,$s1		# media pari
	div $t1,$t9,$s2		# media dispari
	
	
	
	################	MEDIA COMPLESSIVA
	la $a0,complessiva 
	li $v0,4
	syscall
	
	move $a0,$t4
	li $v0,1
	syscall
	#################
	la $a0,spazio 		# CREO LO SPAZIO
	li $v0,4
	syscall
	#################	MEDIA PARI
	la $a0,PARI 
	li $v0,4
	syscall
	
	move $a0,$t6
	li $v0,1
	syscall
	#################
	la $a0,spazio		# CREO LO SPAZIO 
	li $v0,4
	syscall
	#################	MEDIA DISPARI
	la $a0,DISPARI 
	li $v0,4
	syscall
	
	move $a0,$t1
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
 pari0:
 	div $t4,$t3,$t2		# media complessiva
	div $t1,$t9,$s2		# media dispari
 
 
 	la $a0,complessiva 
	li $v0,4
	syscall
	move $a0,$t4
	li $v0,1
	syscall
	
	la $a0,spazio		# CREO LO SPAZIO 
	li $v0,4
	syscall
	
	la $a0,DISPARI 
	li $v0,4
	syscall
	move $a0,$t1
	li $v0,1
	syscall
	
	la $a0,spazio		# CREO LO SPAZIO 
	li $v0,4
	syscall
	
 	la $a0,PARI0 
	li $v0,4
	syscall
	
	li $v0,10
	syscall
	
 dispari0:
 	div $t4,$t3,$t2		# media complessiva
	div $t6,$t8,$s1		# media pari
 
	la $a0,complessiva 
	li $v0,4
	syscall
	move $a0,$t4
	li $v0,1
	syscall 
 
 	la $a0,spazio		# CREO LO SPAZIO 
	li $v0,4
	syscall
 
 	la $a0,PARI 
	li $v0,4
	syscall
	move $a0,$t6
	li $v0,1
	syscall
	
	la $a0,spazio		# CREO LO SPAZIO 
	li $v0,4
	syscall
	
 	la $a0,DISPARI0 
	li $v0,4
	syscall
	
	li $v0,10
	syscall
	
	
	
	.data
	v: 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	str: .asciiz "Inserire 15 numeri: "
	complessiva: "La media complessiva è: "
	PARI: .asciiz "La media dei numeri pari è: "
	DISPARI: .asciiz "La media dei dispari  è: "
	spazio: .asciiz "\n"
	PARI0: .asciiz "La media dei numeri pari è 0 "
	DISPARI0: .asciiz "La media dei dispari pari è 0 "
	