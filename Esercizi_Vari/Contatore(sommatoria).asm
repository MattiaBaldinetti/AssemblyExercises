	.text
	.globl main
	
main: 
 	li $t0,0		#impostazione di i
 	li $t1,1		#impostazione di 1
 	
 	lb $t2,limite_n 	#lettura limite superiore i
 
 ciclo:
 	bgt $t0,$t2,fine 	#salto a fine ciclo iterativo se i>10(limite di i)
 	add $t1,$t1,$t0		#incremento sommatoria
 	addi $t0,$t0,1		#incremento i
 	j ciclo			#salto incondizionato a ciclo(ripeto il ciclo iterativo)
 fine:
 	sw $t1,sommatoria	#salvo in $t1 la variabile sommatoria
 	
 	move $a0,$t1
 	li $v0,1
 	syscall
 	
 	.data
 	sommatoria: .word 0
 	limite_n: .byte 10