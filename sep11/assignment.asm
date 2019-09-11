##CS243 Lab Assignment 3 (9/11/2019)

.data
	prompt: .asciiz "Enter an integer: "
	result: .asciiz "The result is: "
	newline: .asciiz "\n"

.text
.globl main


##Main section
main:
	li $s0, 4
	li $s1, 0
	li $s2, 0

##Addition loop

addition:
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	add $s2, $s2, $v0
	addi $s1, $s1, 1
	blt $s1, $s0, addition

##Final Multiply loop

multiply:

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	mul $s2, $s2, $v0

	li $v0, 4
	la $a0, result
	syscall

	mflo $s3

	li $v0, 1
	move $a0, $s3
	syscall

	li $v0, 10
	syscall
