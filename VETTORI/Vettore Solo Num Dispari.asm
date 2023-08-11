# Definire due vettori di 5 elementi e memorizzare in un nuovo vettore solo gli elementi dispari
	
	.text
	.globl main
main:
	li $t0,0		# inizializzazione indice vIN
	li $t2,0		# inizializzazione indice vOUT
	lw $t9,num_elem		# lunghezza del vettore
	
ciclo:
	mul $t1,$t0,4		# spiazzemento  all'i-esimo elemento vIN indice*dimensione
	mul $t3,$t2,4		# spiazzemento  all'i-esimo elemento vOUT
	lw $t4,vIN($t1)		# lettura vIN[i]
	rem $t5,$t4,2		# calcolo del modulo per vedere il resto
	beqz $t5,salto		# salto se il resto non è dispari
	sw $t4,vOUT($t3)	# archiviazione del valore nel vettore ausiliario 
	add $t2,$t2,1		# incremento indice vOUT
	
	move $a0,$t4
	li $v0,1
	syscall
	
	la $a0,spazio
	li $v0,4
	syscall
	
	

salto:
	add $t0,$t0,1		# incremento indice vIN
	bne $t0,$t9,ciclo	# confronto fine vettore

	
	
	.data
	vIN: .word 3,5,8,10,1
	vOUT: .space 20		# vettore ausiliare
	num_elem: .word 5
	spazio: .asciiz " "
	
	
	