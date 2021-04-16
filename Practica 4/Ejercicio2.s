.data
 num: .asciiz "Ingrese un numero: "
 output: .asciiz "Los números son: "
 arr: .byte 0:5
.text
main:
 li $t0, 0
 la $t1, arr

 loop:
  bge $t0, 5, exit

  li $v0, 4
  la $a0, num
  syscall

  li $v0, 5
  syscall
  move $t2, $v0
  

  sw $t2, 0($t1)


  add $t1, $t1, 4

  add $t0, $t0, 1
  j loop
 exit:

 la $a0, output #Mensaje ayuda
 li $v0, 4
 syscall 

 li $t0, 0
 la $t1, arr

 loop1:
  bge $t0, 5, exit1

  lw $t2, 16($t1)
  sub $t1, $t1, 4

  li $v0, 1
  move $a0, $t2
  syscall

  li $a0, 32
  li $v0, 11
  syscall

  add $t0, $t0, 1
  j loop1

 exit1:

jr $ra
