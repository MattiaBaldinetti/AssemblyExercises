# Si scriva un programma in linguaggio assembly MIPS che acquisisca tre numeri interi da tastiera e metta in $t0 del valore maggiore.
	
	.text
	.globl main

main:
	li $v0,5		#input di un intero da tastiera
	syscall
	move $t0,$v0
	
	li $v0,5		#input di un intero da tastiera
	syscall
	move $t1,$v0
	
	li $v0,5		#input di un intero da tastiera	
	syscall
	move $t2,$v0
	
	bge $t0,$t1,Primo	# se $t0 > $t1, salta in Primo
	j,Secondo		# salta in Secondo se non è rispettata la condizione sopra
	
Primo:	
	bge $t0,$t2,PRIMO	# se $t0 > $t2, salta in PRIMO
	j ,TERZO		# salta in TERZO se non è rispettata la condizione sopra	
	
Secondo:
	bge $t1,$t2,SECONDO	# se $t1 > $t2, salta in SECONDO
	j, TERZO		# salta in TERZO se non è rispettata la condizione sopra

PRIMO:
	move $t7,$t0		# sposta il valore di $t0 in $t7
	sw $t7,maggiore		# salva il valore di $t7 in massimo
	la $a0, PIso
	li $v0, 4
	syscall 
	j finish 

SECONDO: 
	move $t7,$t1		# sposta il valore di $t1 in $t7
	sw $t7,maggiore		# salva il valore di $t7 in massimo
	la $a0,CIso
	li $v0, 4
	syscall 
	j finish

TERZO: 
	move $t7,$t2		# sposta il valore di $t2 in $t7
	sw $t7,maggiore 	# salva il valore di $t7 in massimo
	la $a0, DIso
	li $v0, 4
	syscall
	j finish
		
finish: 
	li $v0, 10
	syscall	
	
	.data
	maggiore: .word 0
	PIso: .asciiz "$T0 è IL NUMERO PIU GRANDE"
	CIso: .asciiz "$T1 è IL NUMERO PIU GRANDE"
	DIso: .asciiz "$T2 è IL NUMERO PIU GRANDE"




--------------------------------------------------------------
ALGO PIU' SEMPLICE
	.text
	.globl main
main:
	li $v0,5
	syscall
	move $t3,$v0
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,5
	syscall
	move $t2,$v0
	
	bgt $t3,$t1,salto
	bgt $t1,$t2,check
	j ultimo
	
check:
	move $t0,$t1
	move $a0,$t0
	li $v0,1
	syscall 
	j end
salto:
	bgt $t3,$t2,primo
	j ultimo
	
ultimo:
	move $t0,$t2
	move $a0,$t0
	li $v0,1
	syscall
	j end
	
primo:
	move $t0,$t3
	move $a0,$t0
 	li $v0,1
 	syscall
 	j end
	
end:
	li $v0,10
	syscall