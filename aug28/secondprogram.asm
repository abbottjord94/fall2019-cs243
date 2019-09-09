.data
id:
	.ascii "\nQTSpim Sample 2 \n\n"
	.asciiz "CS 243 \n\n"

.text
main:
	la $a0, id
	li $v0, 4
	syscall

	li $t0, 0
	li $t1, 10

loop:
	add $t0, $t0, $t1
	add $t1, -1
	bgtz $t1, loop

	move $a0, $t0
	li $v0, 1
	syscall
