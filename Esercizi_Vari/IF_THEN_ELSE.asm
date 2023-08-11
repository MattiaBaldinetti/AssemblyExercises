	.text
	.globl main
main:
	lw $t0,valA		#lettura A
	rem $t1,$t0,2		#calcola il resto di $t1 = $t0 / 2
	beqz $t1,THEN		#se il resto è pari salto a THEN
	j ELSE			#se il resto è dispari salto a ELSE
	
THEN:
	mul $t2,$t0,$t0		#calcolo del quadrato
	j END_IF

ELSE:
	mul $t2,$t0,$t0		#calcolo del cubo
	mul $t2,$t2,$t0

END_IF:
	sw $t2,risultato	#archiviazione del massimo
	
	#move $a0,$t2		sposto $t2 nel registro $a0 (istruzione che mi serve a printare
 	#li $v0,1		istruzione che mi serve a printare 
	
	li $v0,10		#terminazione del programma
	syscall
	
	.data
	valA: .word 45
	risultato: .word 0
	
