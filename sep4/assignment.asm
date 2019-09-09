.data
	prompt: .asciiz "Enter your guess: "
	toohigh: .asciiz "Too big! Guess again...\n"
	toolow: .asciiz "Too small! Guess again...\n"
	right: .asciiz "You are RIGHT!\n"

.text
.globl main

main:
	li $t1, 5

loop:
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	bgt $t0, $t1, high
	blt $t0, $t1, low
	beq $t0, $t1, quit

high:
	li $v0, 4
	la $a0, toohigh
	syscall
	j loop

low:
	li $v0, 4
	la $a0, toolow
	syscall
	j loop

quit:
	li $v0, 4
	la $a0, right
	syscall

	li $v0, 10
	syscall
