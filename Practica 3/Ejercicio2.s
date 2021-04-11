.data
 ite: .asciiz "Ingrese la cantidad de numeros: "
 num: .asciiz "Ingrese un numero: "
 suma: .asciiz "La suma es: "
 prom: .asciiz "\nEl promedio es: "
 mayor: .asciiz "\nEl mayor es: "
 menor: .asciiz "\nEl menor es: "

.text
main:

 #MENSAJE
 li $v0, 4
 la $a0, ite
 syscall

 #GUARDAR CANTIDAD-NUMEROS
 li $v0, 5
 syscall
 move $t0, $v0

 #VALORES A USAR
 li $t1, 0 #index
 li $t4, 0
 li $t7, 10000000000000000
 li.s $f1, 1.0



 loop:
  beq $t1, $t0, exit

  #MENSAJE PARA INGRESAR NUMEROS
  li $v0, 4
  la $a0, num
  syscall

  #TOMA DE NUMEROS
  li $v0, 5
  syscall
  move $t2, $v0
  move $t6, $v0
  move $t9, $v0
  
  mtc1 $t9, $f2
  cvt.s.w $f2, $f2

  #SUMA
  add $t3, $t3, $t2

  add.s $f12, $f12, $f2
  add.s $f3, $f3, $f1


  #COMPARAR MAYOR
  bge $t4, $t2, if
  else:
   move $t5, $t2
   move $t4, $t2
  if:
   move $t5, $t4
  end_if:

  #COMPARAR MENOR
  ble $t7, $t6, if2
  else2:
   move $t8, $t6
   move $t7, $t6
  if2:
   move $t8, $t7
  end_if2:

  add $t1, $t1,1 #es como un i++
  j loop #salto

 exit:

 #SUMA
 li $v0, 4
 la $a0, suma
 syscall

 li $v0, 1
 move $a0, $t3
 syscall

 #PROMEDIO
 li $v0, 4
 la $a0, prom
 syscall

 div.s $f12, $f12, $f3
 li $v0, 2
 syscall

 #MAYOR
 li $v0, 4
 la $a0, mayor
 syscall

 li $v0, 1
 move $a0, $t5
 syscall

 #MENOR
 li $v0, 4
 la $a0, menor
 syscall

 li $v0, 1
 move $a0, $t8
 syscall

 jr $ra




























