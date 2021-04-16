.data
    arr_1: .word 0:5
    input: .asciiz "Ingrese un número: "
    output: .asciiz "Los elementos en orden inverso son: \n"
.text
main:
    la $t0, arr_1
    li $t1,0

    FOR:
    bge $t1, 5, END_FOR

    la $a0, input #Mensaje ayuda
    li $v0, 4
    syscall 

    li $v0, 5 	#enter integer
    syscall

    sw $v0, 0($t0) #Seteo valores

    add $t1, $t1, 1
    add $t0, $t0, 4 #Pointer
    j FOR
    END_FOR:
    
    la $a0, output #Mensaje ayuda
    li $v0, 4
    syscall 

    li $t1, 0

    FOR_2:
    bge $t1, 5, END_FOR_2
    sub $t0, $t0, 4 #Pointer --
    lw $t2, 0($t0) #Get valores

    li $v0, 1 # print value
    move $a0, $t2
    syscall

    li $a0, 32 # print space
    li $v0, 11
    syscall

    add $t1, $t1, 1
    j FOR_2
    END_FOR_2:

    jr $ra
