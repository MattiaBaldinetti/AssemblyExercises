# Si scriva un programma in linguaggio assembly MIPS che legge due stringhe da tastiera e 
# al suo interno usa una subroutine, denominata SIMILITUDINE, che valuta quanti caratteri 
# alle stesse posizioni delle due stringhe sono uguali.
# La sub-routine riceve due parametri, "le stringhe" (cioè gli indirizzi delle stringhe), 
# e restituisce un numero intero e lo stampa a video.
# Ad esempio:
# SIMILITUDINE ("ciao", "cielo") restituisce 2 in quanto i primi due caratteri sono identici.
# SIMILITUDINE("ciao", "salve") restituisce 0 in quanto nessun carattere alle stesse 
# posizioni sono uguali
	
	.text
	.globl main
main:
	li $v0,8
	la $a0,input
	li $a1,255
	syscall
	
	li $v0,8
	la $a0,stringa
	li $a1,255
	syscall
	
	li $t0,0
	li $t8,10
loop:	
	lb $t2,input($t0)
	lb $t3,stringa($t0)
	beq $t2,$t8,fine
	beq $t2,$t3,count
	addi $t0,$t0,1
	j loop
count:
	add $t9,$t9,1
	addi $t0,$t0,1
	j loop
fine:
	move $a0,$t9
	li $v0,1
	syscall 
	
	li $v0,10
	syscall	
	
	.data
	input: .space 255
	stringa: .space 255
