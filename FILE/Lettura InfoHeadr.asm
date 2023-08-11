# Descrizione immagine (INFO HEADER) in cui sono specificate le principali informazioni 
# sull’immagine (larghezza, altezza, numero di bit per specificare un punto di colore, dimensione file,…

	.text
	.globl main
	
main:	
	la $a0,FILEBMP		# APERTURA FILE (creazione)
	li $a1,0		# FILE APERTO PER LA LETTURA
	li $a2,0
	
	li $v0,13
	syscall
	move $s1,$v0		# DESCRITTORE DEL FILE(indirizzo del file in memoria)
	
	move $a0,$s1		# ACQUISIZIONE HEADERFULL
	la $a1,headerfull
	li $a2,54
	li $v0,14
	syscall
	
	move $a0,$s1		# CHIUSURA FILEIN
	li $v0,16		# CHISUURA FILE
	syscall
	
	lbu $a0,headerfull+2	# LETTURA DIMENSIONE FILE
	lbu $a1,headerfull+3
	lbu $a2,headerfull+4
	lbu $a3,headerfull+5
	jal ordina		# ORDINAMENTO IN BIG ENDIAN
	move $s0,$v1		# DIMENSIONE FILE
	
	lbu $a0,headerfull+18	# LETTURA LARGHEZZA
	lbu $a1,headerfull+19
	lbu $a2,headerfull+20
	lbu $a3,headerfull+21
	jal ordina		# ORDINAMENTO IN BIG ENDIAN
	move $s1,$v1		# LARGHEZZA
	
	lbu $a0,headerfull+22	# LETTURA ALTEZZA
	lbu $a1,headerfull+23
	lbu $a2,headerfull+24
	lbu $a3,headerfull+25
	jal ordina		# ORDINAMENTO IN BIG ENDIAN
	move $s2,$v1		# ALTEZZA
	j fine
ordina:
	li $v1,0
	move $v1,$a3
	sll $v1,$v1,8
	add $v1,$v1,$a2
	sll $v1,$v1,8
	add $v1,$v1,$a1
	sll $v1,$v1,8
	add $v1,$v1,$a0
	jr $ra
	
fine:	
	la $a0,s_filedim	# STAMPA DIMENSIONE FILE
	li $v0,4
	syscall
	move $a0,$s0
	li $v0,1
	syscall
	
	la $a0,s_lar		# STAMPA LARGHEZZA
	li $v0,4
	syscall
	move $a0,$s1
	li $v0,1
	syscall
	
	la $a0,s_alt		# STAMPA ALTEZZA
	li $v0,4
	syscall
	move $a0,$s2
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
	.data
	FILEBMP: .asciiz "C:\\Users\\UtentePC\\Desktop\\monnalisa.bmp"
	s_filedim: .asciiz "\nDIMENSIONE FILE: "
	s_lar: .asciiz "\nLARGHEZZA IMMAGINE: "
	s_alt: .asciiz "\nALTEZZA IMMAGINE: "
	headerfull: .space 54
