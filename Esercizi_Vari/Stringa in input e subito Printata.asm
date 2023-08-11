	.text
	.globl main
main:
	li $v0,8		# RICHIESTA STRINGA IN INPUT
	
	la $a0,lungh		# SPAZIO ALLOCATO IN MEMORIA DALLA STRINGA
	li $a1,255		# COSTANTE DELLA LUNGHEZZA
	
	syscall 		#
	move $t0,$a0		#
	
	
	li $v0,4		# STAMPA STRINGA
	syscall			#
	
	.data
	lungh: .space 255