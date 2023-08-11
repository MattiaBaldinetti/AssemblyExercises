# Implementare in linguaggio asembly MIPS un programma che calcola il massimo tra n elementi 
# immessi in input (la lettura termina quando si introduce un numero negativo. 
# Utilizzare la sub-routine (funzione) MASSIMO che presi due elementi restituisce il massimo.
# Esempio
# INPUT: 45; 66; 34; 156; 233; 234; 56; 0 ; -11
# ANALISI
# MASSIMONUM(45, 66, 34, 156,233,234,56,0,-11)=234
# MASSIMO(MASSIMO(MASSIMO(MASSIMO(MASSIMO(MASSIMO(MASSIMO(45,66),34),156),233),234),56),0)=234
# OUTPUT: 234

.macro finale		# MACRO PER IL PRINT FINALE
la $a0,max		# STAMPA DELLA STRINGA
li $v0,4		#
syscall			#
move $a0,$v1		# STAMPA DEL NUMERO PIU' GRANDE
li $v0,1		#
syscall			#
li $v0,10		# CHIUSURA PROGRAMMA
syscall			#
.end_macro 		#
	
	.text
    	.globl main

main:		
	li $v0,5		# RICHIESTA IN INPUT DI UN INTERO
	syscall			#
	move $t0,$v0		#
	bltz $t0,FINALE		# SE IL NUMERE è NEGATIVO SALTA A FINALE
	
ciclo:	
	li $v0,5		# RICHIESAT IN INPUT DI UN INTERO 
	syscall			#
	move $t1,$v0		#
	
   	bltz $t1,FINALE		# SE IL NUMERE è NEGATIVO SALTA A FINE
   	jal MAX			# SALTO A MAX
   	finale			# RICHIAMO DELLA MACRO 
   	
MAX:
 	move $a0,$t0		
 	move $a1,$t1	
   	blt $t0,$t1,salta	# SE $T0 < $T1 SALTA
   	
pass:
   	move $a3,$t0		# SPOSTA $T0 IN $T3
   	j ciclo1	
   	
ciclo1:
	li $v0,5		# RICHIESTA IN INPUT DI UN INTERO
	syscall			#
	move $t1,$v0		#
	
	bltz $t1,fine		# SE IL NUMERE è NEGATIVO SALTA A FINE
	blt $t3,$t1,salta 	# SE $T3 < $T1 SALTA
	move $t3,$a3		# AGGIORNA $T3
	j ciclo1	
	
salta:
	move $a3,$t1		# SPOSTA $T1 IN $a3
	j ciclo1
	
fine:
	move $v1,$a3		# SPOSTA $T3 IN $V1
	jr $ra			# TORNA ALLA RIGA DOPO AL SALTO MAX
	
FINALE:	
	la $a0,notValid
	li $v0,4
	syscall

	
	.data
	max: .asciiz "Il numero più grande è : "
	notValid: .asciiz "Inserimento non valido"
	
