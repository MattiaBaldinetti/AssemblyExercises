.text #Direttiva del Segmento Testo
.globl main #Direttiva per indicare l’etichetta main come globale
main: #Etichetta main: inizio del programma
li $t0,0 #Inizializzazione registro con risultato
li $v0,5 #Lettura intero
syscall #
move $t2,$v0 #Recupero dell'intero letto
ciclo:

andi $t1,$t2,1 #Estrazione bit meno significativo
beqz $t1, salta #Analisi bit meno significativo
sll $t0,$t0,1 #Shift a sinistra del contenuto di $t0
add $t0,$t0,1 #Settaggio ad 1 del bit meno significativo
salta:
srl $t2,$t2,1 #Shift dell'operando
bnez $t2,ciclo #Ripetzione del ciclo fino a quando l'operando non è uguale a zero
li $v0,10 #Terminazione del programma
syscall