.data
v1: .word 0:100
space: .asciiz ", "
prompt1: .asciiz "v1 = "
DIM: .byte 10
prompt2: .asciiz "Inserisci un nuovo valore nel vettore: "
prompt3: .asciiz "Scegli la posizione in cui aggiungere il nuovo valore: "
endl: .asciiz "\n"
question: .asciiz "Vuoi inserire un nuovo elemento? y/n \n"

######################################################################################################################
.macro PRINT_vett
li $t0, 0
lw $t1, v1
lb $t3, DIM
mul $t3, $t3, 4 #limite per la word
subi $t4, $t3, 4 #per far capitare l'ultimo elemento nello stop e fare le cose ordinate

PRINT_str (prompt1)

PRINT_char ('[')
loop:	
	bge $t0, $t4, stop
	lw $t2, v1($t0) 
	
	PRINT_int ($t2)
	space
	
	addi $t0, $t0, 4
	j loop

stop:
lw $t2, v1($t0) 
PRINT_int ($t2)
PRINT_char (']')
endl
.end_macro

######################################################################################################################
.macro INPUT_char
li $v0, 12
syscall
.end_macro

######################################################################################################################
.macro endl
la $a0, endl
li $v0, 4
syscall
.end_macro

######################################################################################################################
.macro PRINT_char (%char)
la $a0, %char
li $v0, 11
syscall
.end_macro

######################################################################################################################
.macro space
la $a0, space
li $v0, 4
syscall
.end_macro

######################################################################################################################
.macro RANDOM_int (%limit)
li $v0, 42
li $a1, %limit
syscall
.end_macro

######################################################################################################################
.macro PRINT_int (%int)
move $a0, %int
li $v0, 1
syscall
.end_macro

######################################################################################################################
.macro PRINT_str (%str)
la $a0, %str
li $v0, 4
syscall
.end_macro

######################################################################################################################
.macro INPUT_int 
li $v0, 5
syscall
.end_macro
######################################################################################################################

.text
.globl main
main:
	li $t0, 0 #contatore / indice v1
	lw $s0, v1
	lb $t9, DIM #limite
	mul $t9, $t9, 4 #limite per un vettore word
create_vett:
	beq $t0, $t9, print_vett
	
	RANDOM_int (100)
	move $t1, $a0
	RANDOM_int (100)
	
	sub $t1, $a0, $t1 #li sottraggo per fare un numero ancora più random anche negativo
	
	sw $t1, v1($t0)
	
	addi $t0, $t0, 4
	
	j create_vett

print_vett:
	PRINT_vett
	
	j wait
	
wait:
	PRINT_str(question)
	INPUT_char
	move $t0, $v0
	
	beq $v0, 'n', fine
	
	j pre_INS

pre_INS:
	# INS (VETT, DIM, ELEM, POS)
	# INS ($a0, $a1, $a2, $a3)
	lb $a1, DIM
	
	PRINT_str(prompt2) #inserisci ELEM
	INPUT_int
	move $a2, $v0
	
	PRINT_str(prompt3) #inserisci POS
	INPUT_int
	move $a3, $v0
	
	move $a0, $s0 #sposto su a0 il VETT
	
	j INS
	
INS:
	#posso partire da POS, spostare gli elementi in avanti 
	addi $a1, $a1, 1
	sb $a1, DIM #aggiorno la variabili DIM in memoria, così tutte le macro possono accedere con i dati aggiornati
	
	lb $t9, DIM
	
	mul $s1, $a3, 4 #creo l'indice per il vettore, partendo da POS
	
	lw $s3, v1($s1) #prendo l'elemento attuale in POS
	sw $a2, v1($s1) #carico in POS il valore ELEM
	
	addi $s1, $s1, 4 #aumento l'indice
	
	mul $s7, $a1, 4 #limite nuovo con DIM aumentato
	jal forward
	
	PRINT_vett
	
	j wait
forward:
	#sposta tutti gli elementi dopo POS di un posto
	#ARGOMENTI
	#in $s3 = vecchio elemento in POS
	#in $s7 = nuovo limite com DIM aumentato
	#in $s1 = indice che parte da POS, ma ora è POS + 1
	
	
	beq $s1, $s7, back
	
	#NON SONO SICURO FUNZIONI
	#alla fine ha funzionato :)
	lw $s0, v1($s1) #prendo l'elemento 
	sw $s3, v1($s1) #scrivo il vecchio elemento al posto di quello che ho appena preso
	
	move $s3, $s0 #sposto quello appena preso nella locazione del vecchio elemento
	
	addi $s1, $s1, 4 #aumento l'indice
	
	j forward

back:
	jr $ra
	
fine:
	li $v0, 10
	syscall
	
	
