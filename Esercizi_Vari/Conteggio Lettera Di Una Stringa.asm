# Definita una stringa in memoria calcolare il numero di A
	.text
	.globl main
main: 
	la $t0,stringa 		# conservo l'indirizzo iniziale della stringa
	li $t1,65 		# valore del carattere "A" in ASCII
	li $t7,0		# azzeramento registro dei risultati
	
ciclo: 	
	lb $t2,($t0)		# prelevo il carattere
	beqz $t2,fine		# se è finita la stringa esce dal ciclo
	beq $t2,$t1,trovato	# salta se carattere trovato è A
	add $t0,$t0,1		# incremento l'indice
	j ciclo
	
trovato:	
	add $t7,$t7,1 		# incrementa il numero delle A trovate
	add $t0,$t0,1		# incrementa l'elemento della stringa
	j ciclo

fine:
	move $a0,$t7
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
	.data
	stringa: .asciiz "BUONA GIORNATA A TUTTI GLI STUDENTI"