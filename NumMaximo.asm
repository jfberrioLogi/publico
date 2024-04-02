.data
    num1: .word 0
    num2: .word 0
    num3: .word 0
    max:  .word 0
    msg1: .asciiz "Ingrese el primer n�mero: "
    msg2: .asciiz "Ingrese el segundo n�mero: "
    msg3: .asciiz "Ingrese el tercer n�mero: "
    msg_max: .asciiz "El n�mero m�ximo es: "

.text
main:
    # Solicitar al usuario que ingrese el primer n�mero
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    sw $v0, num1
    
    # Solicitar al usuario que ingrese el segundo n�mero
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    sw $v0, num2
    
    # Solicitar al usuario que ingrese el tercer n�mero
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    sw $v0, num3
    
    # Comparar los n�meros para encontrar el m�ximo
    lw $t0, num1
    lw $t1, num2
    bge $t0, $t1, compare_num1_num2
    move $t0, $t1

compare_num1_num2:
    lw $t1, num3
    bge $t0, $t1, done
    move $t0, $t1

done:
    # Guardar el m�ximo en la variable 'max'
    sw $t0, max

    # Mostrar el n�mero m�ximo
    li $v0, 4
    la $a0, msg_max
    syscall
    lw $a0, max
    li $v0, 1
    syscall

    # Salir del programa
    li $v0, 10
    syscall
