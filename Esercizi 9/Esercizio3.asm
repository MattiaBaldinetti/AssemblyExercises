# Si scriva un programma che definisca in memoria due vettori: V1 un vettore di cinque elementi di byte e V2 un vettore di cinque elementi di halfword.
# Si applichi ala programma una funzione:
# SOMMA(V1,V2,V3)
# Che ha come argomenti i due vettori definiti dall'utente V1 e V2 e restituisce il vettore V3 formato dall'elemento più grande alla stessa posizione dei vettori V1 e V2.
# ESEMPIO:
# V1=3,56,12,45,33
# V2=-4,67,89,11,47000
# V3=3,67,89,45,47000

	.text
	.globl main
main:
	la $s0,v1		# INIZIALIZZO IL VETTORE V1
	la $s1,v2		# INIZIALIZZO IL VETTORE V2
	la $s3,v3		# INIZIALIZZO IL VETTORE V3 
	li $t5,5		# LUGNHEZZA VETTORE
	li $t6,0		# CONTATORE
	
	lb $t0,0($s0)		# CARICO IL PRIMO ELEMENTO
	lh $t1,0($s1)		# CARICO IL PRIMO ELEMENTO
	
	add $t6,$t6,1		# INCREMENTO IL CONTATORE
	bgt $t0,$t1,salta	# SE $T0 > $T1, SALTA
	
	sb $t1,($s3)		# SALVA VALORE NEL NUOVO VETTORE
	addi $s0,$s0,1		# INCREMENTA INDICE
	addi $s1,$s1,2		# INCREMENTA INDICE
	addi $s3,$s3,1		# INCREMENTA INDICE
	
ciclo:	
	lb $t0,($s0)		# CARICO L'ELEMENTO
	lb $t1,($s1)		# CARICO L'ELEMENTO
	
	add $t6,$t6,1		# INCREMENTO CONTATORE
	bgt $t0,$t1,salta	# SE $T0 > $T1, SALTA
	bge $t6,$t5,fine	# SE $T6 >= $t5, SALTA
	
	sb $t1,($s3)		# SALVA VALORE NEL NUOVO VETTORE
	addi $s0,$s0,1		# INCREMENTA INDICE
	addi $s1,$s1,2		# INCREMENTA INDICE
	addi $s3,$s3,1		# INCREMENTA INDICE
	j ciclo			# SALTO
	
salta:
	sb $t0,($s3)		# SALVA VALORE NEL NUOVO VETTORE
	bge $t6,$t5,fine	# SE $T6 >= $t5, SALTA
	addi $s0,$s0,1		# INCREMENTA INDICE
	addi $s1,$s1,2		# INCREMENTA INDICE
	addi $s3,$s3,1		# INCREMENTA INDICE
	j ciclo			# SALTA
fine:
	li $t6,1		# INIZIALIZZA REGISTRO
	la $s3,v3		# INIZIALIZZA VETTORE
	lb $t9,0($s3)		# CARICA PRIMO ELEMENTO DEL VETTORE
	
	move $a0,$t9		# STAMPA ELEMENTO
	li $v0,1
	syscall
	
	la $a0,SPAZIO		# STAMPA SPAZIO
	li $v0,4
	syscall
	
	add $t6,$t6,1		# INCREMENTA CONTATORE
	addi $s3,$s3,1		# INCREMENTA INDICE

check:
	lb $t9,($s3)		# CARICA ELEMENTO DEL VETTORE
	
	move $a0,$t9		# STAMPA ELEMENTO
	li $v0,1
	syscall
	
	la $a0,SPAZIO		# STAMPA SPAZIO
	li $v0,4
	syscall
	
	add $t6,$t6,1		# INCREMENTA CONTATORE
	addi $s3,$s3,1		# INCREMENTA INDICE
	ble $t6,$t5,check	# SE $T6 <= $T5, SALTA
	
	li $v0,10		# CHIUSURA PROGRAMMA
	syscall

	.data
	v1: .byte  3, 56, 12, 45, 33
	v2: .half -4, 67, 89, 11, 47000
	v3: .byte 0:5
	SPAZIO: .asciiz "\t"
