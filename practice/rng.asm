.data

prompt: .asciiz "Enter the number of random numbers: "
seed: .asciiz "Seed: "
rand: .asciiz " Rand: "
newline: .asciiz "\n"

.globl main
.text

main:
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	move $t2, $t0

rng:
	move $t1, $t0
	srl $t1,$t1,13
	or $t0,$t0,$t1

	move $t1, $t0
	sll $t1,$t1,25
	or $t0,$t0,$t1

	move $t1, $t0
	srl $t1,$t1,27
	or $t0,$t0,$t1

	srl $t0,$t0,24

print_nums:
	li $v0, 4
	la $a0, seed
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, rand
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, newline
	syscall

quit:
	sub $t2, $t2, 1
	bgtz $t2, rng

	li $v0, 10
	syscall
