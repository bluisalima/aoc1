# Luisa Lima
# Escreva um programa que conte com três subrotinas capazes de calcular a área da circunferência,
# área do triângulo e área do retângulo. Inicialmente, pergunte ao usuário qual forma geométrica ele deseja
# (armazenando no registrador $t0) e depois solicite as medidas necessárias para calcular a área de cada forma
# (armazenar para circunferência o valor r em $t0, triângulo e retângulo armazenarvalor de a e b em $t0 e $t1, respectivamente).
# Ao final, imprima a área desejada. Respeite as convenções de uso dos registradores.

.data
	string: .asciiz "1 - Circunferencia\n2 - Triangulo\n3 - Retangulo\n"
	string2: .asciiz "Digite as medidas necessarias\n"
.text
.globl main

main:	ori $t3, 3		# Valor de pi = 3.14
	li $v0, 4		# Mostra o menu 
	la $a0, string			
	syscall
	
	li $v0, 5		# Lê qual forma geometrica deseja calcular
	syscall
	addi $t0, $v0, 0	# Guarda o valor escolhido em $t0
	
	slti $t2, $t0, 2	# Testa se entrada é 1
	bne $t2, $0, circulo	# Se resultado é 1 pula pro circulo
	slti $t2, $t0, 3	# Testa se entrada é 2
	bne $t2, $0, triangulo	# Se resultado é 2 pula para triangulo
	li $v0, 4		# Pede os valores 
	la $a0, string2			
	syscall
	li $v0, 5		# Lê o valor da base
	syscall
	addi $t0, $v0, 0	# Guarda o valor escolhido em $t0
	li $v0, 5		# Lê o valor da altura
	syscall
	addi $t1, $v0, 0	# Guarda o valor escolhido em $t1
	jal ar
	j Exit
	
circulo: 
	li $v0, 4		# Pede os valores 
	la $a0, string2			
	syscall
	li $v0, 5		# Lê o valor de raio
	syscall
	addi $t0, $v0, 0	# Guarda o valor escolhido em $t0
	jal ac
	j Exit
	
triangulo:
	li $v0, 4		# Pede os valores 
	la $a0, string2			
	syscall
	li $v0, 5		# Lê o valor da base
	syscall
	addi $t0, $v0, 0	# Guarda o valor escolhido em $t0
	li $v0, 5		# Lê o valor da altura
	syscall
	addi $t1, $v0, 0	# Guarda o valor escolhido em $t1
	jal at
	j Exit

ac: 	mult $t0, $t0		# Raio ao quadrado
	mflo $t4
	mult $t4, $t3		# Pi x Raio
	mflo $t5		# Armazena resultado em $t5
	jr $ra
	
at: 	mult $t0, $t1		# base x altura
	mflo $t4
	divu $t5, $t4, 2	# (base x altura)/2 e armazeza em $t5
	jr $ra

ar: 	mult $t0, $t1		# base x altura
	mflo $t5		# resultado em $t5
	
Exit:	li $v0, 1		# Imprime na tela o resultado
	la $a0, ($t5)
	syscall
	
	li $v0, 10		# Sai do programa
	syscall
