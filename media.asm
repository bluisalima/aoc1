# Luisa Lima

	# Escreva uma subrotina que retorne a média entre três valores.  
	# A subrotina deve receber comoargumentos três inteiros e retornar a média entre eles. 
	# Escreva um programa principal responsável por ler três valores informados pelo usuário e imprima o resultado.
	# Importante: Utilize os registradores convencionadospara a passagem de argumentos e valor de retorno!
	# Armazene o retorno da subrotina (média entre os três valores)no registrador $t5.
	
	# Registradores usados: 
	# $t1 - Primeiro número
	# $t2 - Segundo número
	# $t3 - Terceiro número 
	# $t4 - Soma dos números
	# $t5 - Resultado da média
	
.data	
		
.text
	.globl main

main:	li $v0, 5		# Lê primeiro número da entrada
	syscall
	jal media		# Copia valor da entrada para registrador $t1
	
	li $v0, 5		# Lê segundo número da entrada
	syscall
	jal media		# Copia valor da entrada para registrador $t2
	
	li $v0, 5		# Lê segundo número da entrada
	syscall
	jal media		# Copia valor da entrada para registrador $t3
	
	li $v0, 1		# Imprime na tela a média dos numeros ($t5)
	la $a0, ($t5)
	syscall
	
	li $v0, 10		# Sai do programa
	syscall
	
media:	add $t4, $t4, $v0	# Armazena valor da soma dos números
	divu $t5,$t4, 3		# Calcula a média
	jr $ra			# Volta para onde parou no programa principal
	
	