.data 

	 
	st1: .asciiz "Ingrese el primer lado del triangulo:\n"
	st2: .asciiz "Ingrese el segundo lado del triangulo:\n"
	st3: .asciiz "Ingrese el tercer lado del triangulo:\n"
	st4: .asciiz "El triangulo es valido\n"
	st5: .asciiz "El triangulo no es valido\n"
.text 

main: 
	

la $a0, st1   #Load and Print st1
li $v0, 4
syscall 

li $v0, 5 	#enter integer
syscall
move $t1, $v0


la $a0, st2 	#Load and Print st2
li $v0, 4
syscall 

li $v0, 5 	#enter integer
syscall
move $t2, $v0



la $a0, st3 	#Load and Print st3
li $v0, 4
syscall 

li $v0, 5 	#enter integer
syscall
move $t3, $v0



add $a0 , $t1, $t2  #suma del primer lado con el segundo 
move $t4, $a0
#li $v0, 1 
#syscall



add $a0 , $t1, $t3  #suma del primer lado con el tercero
move $t5, $a0
#li $v0, 1
#syscall



add $a0 , $t2, $t3  #suma del segundo lado con el tercero
move $t6, $a0
#li $v0, 1
#syscall



bge $t3, $t4 LABEL_IF   # si el tercer lado es mayor a la suma t4
LABEL_ELSE: 
	
	bge $t2, $t5 bLABEL_IF #ifs anidados, se revisa si las otras comparaciones también cumplen

	bLABEL_ELSE:
	
		bge $t1, $t6 cLABEL_IF 
		
		cLABEL_ELSE: # finalmente cumple y manda al ultimo label end
		
			la $a0, st4
			b END_LABEL_IF
		cLABEL_IF: 		# todo indica que es invalido
			la $a0, st5

	bLABEL_IF: 

		la $a0, st5

	

LABEL_IF: #quiere decir q es invalido e imprime que no es valido
	#al menos uno no cumple , así que es invalido
	la $a0, st5

END_LABEL_IF:  #imprime que es valido 
	li $v0, 4
	syscall



jr  $ra