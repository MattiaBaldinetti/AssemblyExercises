# Definita una matrice in memoria di N righe e N colonne con elementi halfword, ANxN, 
# stampare in output il messaggio con la scritta IDENTITA' se la matrice + la matrice 
# identit� o NON IDENTITA' altrimenti. Una matrice identit� � una matrice costituita 
# da elementi 0 eccetto quelli sulla diagonale principale che hanno valore 1
# ESEMPIO
# A
# 1 0 0
# 0 1 0
# 0 0 1

# OUTPUT
# IDENTITA'

# ESEMPIO
# A
# 1 0 0
# 0 1 0
# 1 0 1
# OUTPUT
# NON IDENTITA'

	.text 
	.globl main
main:
	li $t0, 1			#indice colonna
	li $t1, 1			#indice riga
	
	li $a1, 0			#flag che memorizza se � identita o no
	li $a2, 0			#flag che memorizza se � identita o no

reset_colonna:
	li $t0, 1			#reset indice colonna	
analisi_elemnto:
					#C(r-1)+(c-1)
	subi $t2, $t0, 1		#c-1
	subi $t3, $t1, 1		#r-1	
	mul $t3, $t3, 3			#C(r-1)
	add $t4, $t3, $t2		#C(r-1)+(c-1)
	mul $t4, $t4, 2			#moltiplico per 2 perch� sto lavorando con half word
	
	lh $a1, M($t4)			#preleva elemento matrice

	bne $t0, $t1, controllo_non_diagonale	#se t0!=t1 allora non sono sulla diagonale
	beq $t0, $t1, controllo_diagonale	#se t0==t1 allora sono sulla diagonale
return:
	addi $t0, $t0, 1
	ble $t0, 3, analisi_elemnto	# 3 numero di colonne
	addi $t1, $t1, 1
	ble $t1, 3, reset_colonna	# 3 numero di righe
	j si_id				# se arrivi qui vuol dire che hai analizato
					# tutta la matrice e tutti i controlli sono andati a buon fine
					# quindi la matrice � identita					
controllo_non_diagonale:
	beqz $a1, return		# se � uguale a 0 posso procedere
	j non_id			# altrimenti vuol dire che non sewrve continuare
					# perche la matrice non � identita ed esci, funge da break	
controllo_diagonale:		
	beq $a1, 1, return		# se � uguale ad 1 posso continuare 
	j non_id			# altrimenti vuol dire che non sewrve continuare
					# perche la matrice non � identita ed esci, funge da break					
non_id:
	la $a0, sNot			# stampa la scritta per indicare chr non � id
	li $v0, 4						
	syscall	
	j fine	
si_id:	
	la $a0, sYes			# stampa la scritta per indicare che � id
	li $v0, 4
	syscall								
fine: 	
	li $v0, 10
	syscall					
				
	.data
	M: .half 1, 0, 0,  0, 1, 0,   1,0,1
	sNot: .asciiz "NON IDENTITA'"
	sYes: .asciiz "IDENTITA'"
