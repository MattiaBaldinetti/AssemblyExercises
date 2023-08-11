
# Definita una matrice in memoria di 8 righe e 8 colonne con elementi halfword, A8x8,
# stampare in output una nuova matrice B8x4 in cui le colonne sono date dal prodotto degli 
# elementi delle colonne della matrice originaria:
#  cioè B(4x8) b1,1=a1,1*a1,2;  b1,2=a1,3*a1,4;  b1,3=a1,5*a1,6;  b1,4=a1,7*a1,8.

# ESEMPIO
# A
# 02 04 06 07 00 12 03 08
# 01 10 05 16 00 01 01 10
# 00 03 20 21 01 01 02 04
# 02 22 06 00 00 12 37 00
# 30 50 01 34 00 05 04 13
# 10 63 08 08 01 06 05 03
# 05 04 00 01 00 09 06 02
# 41 00 14 02 00 14 00 01

# B
# 0008 0042 0000 0024
# 0010 0080 0000 0010
# 0000 0421 0001 0008
# 0044 0000 0000 0000
# 1500 0340 0000 0052
# 0630 0064 0006 0015
# 0020 0000 0000 0012
# 0000 0028 0000 0000

	.text
	.globl main
main:
	li $t0,1			# indice r
	li $t1,1			# indice c
	lw $t2,R			# RIGA
	lw $t3,C			# COLONNA
	li $t5,4			# inizializzo il nuovo numero di colonne
	li $s1,1			# inizializzo il moltiplicatore
	li $s0,0			# inizializzo un contatore
	li $s3,1			# inizializzo un contatore
analisi_riga:
	li $t1,1			# inizializzo la colonna a 1 
	li $s3,1			# inizializzo il contatore a 1
analisi_colonna:
	sub $t6,$t0,1			# r - 1
	mul $t9,$t3,$t6			# C(r-1)
	sub $t7,$t1,1			# c - 1
	add $t9,$t9,$t7			# C(r-1) + (c-1)
	mul $t9,$t9,2			# MOLTIPLICO L'INDICE PER LA DIMENSIONE DELL'ELEMENTO (half = 2)
	lh $t8,matrice($t9)		# PRELIEVO DELL'ELEMENTO
	
	mul $s1,$s1,$t8			# moltiplico il numero 
	add $s0,$s0,1			# incremento un contatore
	addi $t1,$t1,1			# incremento la colonna
	blt  $s0,2,analisi_colonna	# se $s0 < 2, allora salta
ciclo2:
	move $a0,$s1			# stampa la moltplicazione
	li $v0,1
	syscall 
	
	la $a0,tab			# stampa lo spazio
	li $v0,4
	syscall
		
	li $s1,1			# inizializzo la moltiplicazione a 1
	li $s0,0			# inizializzo il contatore a 0
	addi $s3,$s3,1			# incremento un contatore
	ble $s3,$t5,analisi_colonna	# se $s3 < $t5, allora salta
	
	la $a0,capo			# stampa la riga vuota
	li $v0,4
	syscall
	
	addi $t0,$t0,1			# incrementa la riga
	ble $t0,$t2,analisi_riga	# se $t0 < $t2, allora salta
	
	li $v0,10			# chisura del programma
	syscall	
	
	.data
	matrice: .half  02,04,06,07,00,12,03,08,  
			01,10,05,16,00,01,01,10, 
			00,03,20,21,01,01,02,04, 
	 		02,22,06,00,00,12,37,00,  
	 		30,50,01,34,00,05,04,13,  
	 		10,63,08,08,01,06,05,03,  
	 		05,04,00,01,00,09,06,02,  
	 		41,00,14,02,00,14,00,01       
	R: .word 8
	C: .word 8
	tab: .asciiz "\t"
	capo: .asciiz "\n"
