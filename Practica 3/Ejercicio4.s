.data
    Input: .asciiz "Ingrese Num: "
    Multiplos: .asciiz " es multiplo de "
    NoMultiplos: .asciiz " no es multiplo de "
    SaltoLinea: .asciiz "\n"
.text
main:
    li $t1, 1 #Index
    li $t2, 21 #Limite

    li $v0, 4
    la $a0, Input
    syscall
    li $v0, 5
    syscall
    move $t3, $v0 #Data temporal a t3

    LOOP:
        beq $t2, $t1, EXIT
        rem $t4, $t1, $t3

        move $a0, $t1
        li $v0,1 # code 1 == print integer
        syscall
        beqz $t4, IF

        ELSE:
            li $v0, 4
            la $a0, NoMultiplos
            syscall
            b END_IF

        IF:
            li $v0, 4
            la $a0, Multiplos
            syscall

        END_IF:
            move $a0, $t3
            li $v0,1 # code 1 == print integer
            syscall

            li $v0, 4
            la $a0, SaltoLinea
            syscall

        add $t1, $t1, 1
        b LOOP
    EXIT:

    jr $ra
