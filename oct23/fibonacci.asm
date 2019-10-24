.data
	newline: .asciiz "\n"

.globl main
.text

	main:
		addi $sp, $sp, -4
		sw $ra, 0($sp)

		addi $a0, $zero, 5
		jal fibo

	L0:
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra

	fibo:
		addi $sp, $sp, -12
		sw $s0, 0($sp)
		sw $t1, 4($sp)
		sw $ra, 8($sp)

		slti $t0, $a0, 3
		beq $t0, $zero, else

		addi $v0, $zero, 1
		j exit

	else:
		addi $s0, $a0, 0
		addi $a0, $a0, -1
		jal fibo

	ret1:
		addi $t1, $v0, 0
		addi $a0, $a0, -1
		jal fibo

	ret2:
		add $v0, $t1, $v0
		j exit

	exit:
		lw $s0, 0($sp)
		lw $t1, 4($sp)
		lw $ra, 8($sp)
		addi $sp, $sp, 12

		jr $ra
