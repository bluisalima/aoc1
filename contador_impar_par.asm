# Luísa Lima

	# Faça um programa em assembly que conte de 1 até 10 e verifique a quantidade de 
	# números ímparese pares. Calcule também a soma dos números pares armazenando o 
	# resultado no registrador ($t6) e a média dosnúmeros ímpares armazenando o resultado no registrador ($t7).

	## REGISTRADORES USADOS: 
	## $t0 - Quantidade de números pares 
	## $t1 - Quantidade de números ímpares
	## $t2 - Auxiliar [i]
	## $t3 - Condição de parada (valor = 10)
	## $t4 - valor 2
	## $t6 - Soma dos números pares
	## $t7 - Média dos números ímpares 

.text
	ori $t2, $zero, 0 	# Inicia i = 0
	ori $t3, $zero, 11	# Valor = 10 
	ori $t4, $zero, 2	# Valor = 2
	
loop:	beq $t2, $t3, Exit	# Se i = 10 pula para saída
	divu $t2, $t4		# Divide i por 2 | i / 2
	mfhi $t5		# Resto da divisão armazenado em $t5
	bne $t5, $zero, impar	# Desvia se for ímpar
	addi $t0, $t0, 1	# Adiciona +1 na quantidade de números pares
	add $t6, $t6, $t2	# Somador para números pares
	addi $t2, $t2, 1	# i = i+1 
	j loop
	
impar: 
	addi $t1, $t1, 1	# Adiciona +1 na quantidade de números ímpares
	add $t8, $t8, $t2	# Soma valores dos números ímpares
	addi $t2, $t2, 1	# i = i+1
	divu $t8, $t1		# Calcula a média dos valores ímpares
	mflo $t7		# Armazena média no registrador $t7
	j loop
Exit: 
