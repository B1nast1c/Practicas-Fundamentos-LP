#a.b  producto escalar = (ax *bx) + (ay*by) +(az*bz)


.data
	array_1: .word 1:3
	array_2: .word 1:3
	st1: .asciiz "Ingrese un elemento del vector 1: \n"
	st2: .asciiz "Ingrese un elemento del vector 2: \n"
	st3: .asciiz "\n El producto escalar es: \n"
	st5: .asciiz " \n"
	
.text

main:

	li $t0, 0
	la $t1, array_1

loop1: # set values
	bge $t0, 3, end_loop1

	la $a0, st1   #Load and Print st1
	li $v0, 4
	syscall 

	li $v0, 5
	syscall
	move $t2, $v0
	sw $t2, 0($t1) # set value
	add $t1, $t1, 4 # increment pointer
	add $t0, $t0, 1 # i++
	j loop1

end_loop1:




la $a0, st5   #Load and Print st5
	li $v0, 5
	syscall 

	li $t0, 0
	la $t1, array_2

loop2: # set values
	bge $t0, 3, end_loop2

	la $a0, st2   #Load and Print st2
	li $v0, 4
	syscall 

	li $v0, 5
	syscall
	move $t2, $v0
	sw $t2, 0($t1) # set value
	add $t1, $t1, 4 # increment pointer
	add $t0, $t0, 1 # i++
	j loop2

end_loop2:


la $t0, array_1

#Ubicaciones 1,2,3 del array_1

lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)


la $t0, array_2

#Ubicaciones 1,2,3 del array_2

lw $t4, 0($t0)
lw $t5, 4($t0)
lw $t6, 8($t0)

#todas las multiplicaciones correspondientes

mul $t7, $t1, $t4 
mul $t8, $t2, $t5
mul $t9, $t3, $t6

add $a0, $t7, $t8
add $a0, $a0, $t9


move $t0, $a0


la $a0, st3 	#Load and Print st3
li $v0, 4
syscall 


move $a0, $t0

li $v0, 1
syscall



jr $ra
