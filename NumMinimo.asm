.data
    num1: .word 0
    num2: .word 0
    num3: .word 0
    min:  .word 0
    msg1: .asciiz "Ingrese el primer número: "
    msg2: .asciiz "Ingrese el segundo número: "
    msg3: .asciiz "Ingrese el tercer número: "
    msg_min: .asciiz "El número mínimo es: "

.text
main:
    # Solicitar al usuario que ingrese el primer número
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    sw $v0, num1
    
    # Solicitar al usuario que ingrese el segundo número
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    sw $v0, num2
    
    # Solicitar al usuario que ingrese el tercer número
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    sw $v0, num3
    
    # Comparar los números para encontrar el mínimo
    lw $t0, num1
    lw $t1, num2
    ble $t0, $t1, compare_num1_num2
    move $t0, $t1

compare_num1_num2:
    lw $t1, num3
    ble $t0, $t1, done
    move $t0, $t1

done:
    # Guardar el mínimo en la variable 'min'
    sw $t0, min

    # Mostrar el número mínimo
    li $v0, 4
    la $a0, msg_min
    syscall
    lw $a0, min
    li $v0, 1
    syscall

    # Salir del programa
    li $v0, 10
    syscall
