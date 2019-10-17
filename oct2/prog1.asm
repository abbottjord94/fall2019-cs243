.data
	value: .word 48768
	shifted: .asciiz "Shifted value: "
	unshifted: .asciiz "Unshifted value: "
	newline: .asciiz "\n"
.text

.globl main

main:
	lw $s0, value
	move $s1, $s0
	srl $s1, $s1, 7

	li $v0, 4
	la $a0, unshifted
	syscall

	li $v0, 1
	move $a0, $s1
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	li $v0, 4
	la $a0, shifted
	syscall

	li $v0, 1
	move $a0, $s0
	syscall

	li $v0, 10
	syscall
