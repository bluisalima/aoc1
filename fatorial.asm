#Luisa Lima

	## n = número de entrada
	## $t0 - número a ser calculado
	## $s0 - resultado
	## $t1 - auxiliar (i do loop)
		
.text
	ori $t0, $zero, 7	# Atribui valor de entrada no registrador $t0
	ori $t1, $zero, 1 	# Atribui i = 1 
	ori $s0, $zero, 1	# Atribui 1 para auxiliar
	
fatorial: 
	beq $t1, $t0, Exit	# Testa se o N = i e pula pra fora do loop
	addi $t1, $t1, 1 	# Adiciona 1 | i = i + 1
	mult $s0, $t1 		# Calcula o fatorial i * (i+1)
	mflo $s0		# Move resultado da multiplicação para $t3
	j fatorial		# Retorna pro inicio do loop
	
Exit:
