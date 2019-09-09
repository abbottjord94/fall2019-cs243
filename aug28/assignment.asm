.data
	prompt: .asciiz "Enter an integer: "
	str1: .asciiz "The answer is: "
	newline: .asciiz "\n"
	bye: .asciiz "Goodbye!\n"

.text
.globl main

main:
	li $v0, 4
	la, $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $s0, $v0

loop:
	li $v0, 4
	la $a0, str1
	syscall

	li $v0, 1
	move $a0, $s0
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	sub $s0, $s0, 1
	bgez $s0, loop

	li $v0, 4
	la $a0, bye
	syscall

	li $v0, 10
	syscall
