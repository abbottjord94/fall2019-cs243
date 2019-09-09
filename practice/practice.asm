.data

prompt:	.asciiz "Please enter a number: "
slash: .asciiz " / "
equals: .asciiz " = "
remainder: .asciiz " remainder "

.text

.globl main

main:
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t0, $v0
	move $t3, $v0

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	li $t2, 0

loop:
	sub $t0, $t0, $t1
	addi $t2, 1
	bge $t0, $t1, loop
end:
	li $v0, 1
	move $a0, $t3
	syscall

	li $v0, 4
	la $a0, slash
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, equals
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 4
	la $a0, remainder
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 10
	syscall

