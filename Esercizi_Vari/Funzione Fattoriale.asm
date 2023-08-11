# Si consideri la funzione f fattoriale definita per valori interi n
# FATTORIALE(x) = x*FATTORIALE(x-1)
# FATTORIALE(1) = 1
# FATTORIALE(0) = 1
# Si realizzi un programma in Si realizzi un programma in assembly assembly MIPS che,
# definito un intero positivo che,definito un intero positivo x?2,
# calcola il corrispondente valore di FATTORIALE(x) in modo ricorsivo
# STUDIO
# fattoriale(5)=
# 5*fattoriale(4)=5*4*fattoriale(3)=5*4*3*fattoriale(2)=5*4*3*2*fattoriale(1)=
# 5*4*3*2*1= 120

	.text
	.globl main
	
main:
	li $t1,1
	li $t3,1
	
	li $v0,5
	syscall
	move $t0,$v0
	
	ble $t0,1,caso_base
ciclo:
	mul $t3,$t3,$t0
	sub $t0,$t0,$t1
	beqz $t0,fine
	j ciclo

caso_base:
	move $t3,$t0
	j fine		
						
fine: 
	move $a0,$t3
	li $v0,1
	syscall
	
	
	.data
	x: .word 5