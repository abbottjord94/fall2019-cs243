.data
message:
	.asciiz "sum = "
	.text

main:
	move $s0, $ra

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 5
	syscall
	move $t1, $v0

	add $t2, $t0, $t1

	li $v0, 4
	la $a0, message
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	move $ra, $s0
	jr $31
