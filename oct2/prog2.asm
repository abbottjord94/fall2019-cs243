.data

mask: .word 10752
prompt: .asciiz "Enter an integer: "
current: .asciiz "\nInitial value: "
masked: .asciiz "\nMasked value: "
shifted: .asciiz "\nShifted value: "

.text

.globl main

main:
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	move $s0, $v0

	li $v0, 4
	la $a0, current
	syscall

	li $v0, 1
	move $a0, $s0
	syscall

	lw $s1, mask
	and $s2, $s0, $s1

	li $v0, 4
	la $a0, masked
	syscall

	li $v0, 1
	move $a0, $s2
	syscall

	sll $s2, $s2, 10

	li $v0, 4
	la $a0, shifted
	syscall

	li $v0, 1
	move $a0, $s2
	syscall

	li $v0, 10
	syscall

