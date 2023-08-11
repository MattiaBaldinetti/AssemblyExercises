# Definire il prodotto scalare di due vettori di lunghezza 5
	.text
	.globl main
	
main:	
	xor $t0,$t0,$t0		# inizializzo a zero il registro contenente l'indice del vettore
	li $t5,0		# inizializzo il registro che contiene il numero di elementi
	lw $t9,num_elem		# lunghezza del vettore

ciclo:
	mul $t1,$t0,2		# spiazzamento dell'i-esimo elemento indice*dimensione
	lh $t2,v1($t1)		# v1[i]
	lh $t3,v2($t1)		# v2[i]
	mul $t4,$t2,$t3		# v1[i] * v2[i]
	add $t5,$t5,$t4		# prodotto scalare parziale
	add $t0,$t0,1		# incremento indice
	
	blt $t0,$t9,ciclo	# confronto fine vettore
	
	move $a0,$t5
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
	.data
	num_elem: .word 5
	v1: .half 3,5,8,10,1
	v2: .half 1,2,3,0,13
	
	
	
	
	
	