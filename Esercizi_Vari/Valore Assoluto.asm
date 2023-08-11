	.text
	.globl main
	
main:
 	lw $t5,batman 		#carica il valore di batman in $t5
 	lw $t6,superman 	#carica il valore di superman in $t6
 	srl $t0,$t5,31		#esegue lo shift logico a destra su batman e lo salva in $t0
 	rem $t1,$t6,2 		#trova il resto della divisione di superman per 2 e lo salva in $t1
 	
 	add $t2,$t5,$t6		#esegue la somma fra batman e superman
 	abs $t1,$t1		#aggiusta il valore di $t1
 	abs $t3,$t2		#esegue il |$t3| (valore assoluto) della somma fatta in $t2
 	
	move $a0,$t3
 	li $v0,10
 	syscall
 	
 	.data
 	superman: .word -12
 	batman: .word -15
