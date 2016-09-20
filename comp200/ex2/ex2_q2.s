.global	count
.text
count:
	subui	$sp, $sp, 8
	sw	$11, 1($sp)
	sw	$12, 2($sp)
	sw	$13, 3($sp)
	sw	$ra, 4($sp)
	addu	$13, $0, $0
	sw	$13, 7($sp)
	lw	$12, 8($sp)
	sgt	$13, $13, $12
	bnez	$13, L.2
	lw	$13, 9($sp)
	sw	$13, 6($sp)
	lw	$11, 7($sp)
	sgt	$13, $11, $13
	bnez	$13, L.2
	addui	$13, $0, 100
	sw	$13, 5($sp)
	sge	$13, $12, $13
	bnez	$13, L.2
	lw	$13, 6($sp)
	lw	$11, 5($sp)
	sge	$13, $13, $11
	bnez	$13, L.2
	lw	$13, 6($sp)
	seq	$13, $12, $13
	bnez	$13, L.2
	lw	$13, 8($sp)
	lw	$12, 9($sp)
	sge	$13, $13, $12
	bnez	$13, L.13
	j	L.9
L.6:
	lw	$13, 8($sp)
	sw	$13, 0($sp)
	jal	writessd
	jal	delay
L.7:
	lw	$13, 8($sp)
	addi	$13, $13, 1
	sw	$13, 8($sp)
L.9:
	lw	$13, 8($sp)
	lw	$12, 9($sp)
	sle	$13, $13, $12
	bnez	$13, L.6
	j	L.3
L.10:
	lw	$13, 8($sp)
	sw	$13, 0($sp)
	jal	writessd
	jal	delay
L.11:
	lw	$13, 8($sp)
	subi	$13, $13, 1
	sw	$13, 8($sp)
L.13:
	lw	$13, 8($sp)
	lw	$12, 9($sp)
	sge	$13, $13, $12
	bnez	$13, L.10
	j	L.3
L.2:
	sw	$0, 0($sp)
	jal	writessd
L.3:
L.1:
	lw	$11, 1($sp)
	lw	$12, 2($sp)
	lw	$13, 3($sp)
	lw	$ra, 4($sp)
	addui	$sp, $sp, 8
	jr	$ra
