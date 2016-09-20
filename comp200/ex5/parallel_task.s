.global	parallel_main
.text
parallel_main:
	subui	$sp, $sp, 6
	sw	$3, 0($sp)
	sw	$4, 1($sp)
	sw	$5, 2($sp)
	sw	$6, 3($sp)
	sw	$7, 4($sp)
	sw	$13, 5($sp)
	addu	$7, $0, $0
	addui	$6, $0, 16
	addu	$4, $0, $0
	addu	$3, $0, $0
	addu	$5, $0, $0
	j	L.7
L.6:
	lhi	$13, 0x7
	ori	$13, $13, 0x3001
	lw	$5, 0($13)
	snei	$13, $5, 1
	bnez	$13, L.9
	addui	$6, $0, 16
	j	L.10
L.9:
	snei	$13, $5, 2
	bnez	$13, L.11
	addui	$6, $0, 10
	j	L.12
L.11:
	snei	$13, $5, 3
	bnez	$13, L.13
	j	L.8
L.13:
L.12:
L.10:
	lhi	$13, 0x7
	ori	$13, $13, 0x3000
	lw	$7, 0($13)
	slti	$13, $7, 100
	bnez	$13, L.15
	snei	$13, $6, 10
	bnez	$13, L.15
	remi	$7, $7, 100
L.15:
	snei	$13, $6, 16
	bnez	$13, L.17
	addui	$13, $0, 16
	div	$4, $7, $13
	rem	$3, $7, $13
	j	L.18
L.17:
	snei	$13, $6, 10
	bnez	$13, L.19
	addui	$13, $0, 10
	div	$4, $7, $13
	rem	$3, $7, $13
L.19:
L.18:
	lhi	$13, 0x7
	ori	$13, $13, 0x3002
	sw	$4, 0($13)
	lhi	$13, 0x7
	ori	$13, $13, 0x3003
	sw	$3, 0($13)
L.7:
	j	L.6
L.8:
L.5:
	lw	$3, 0($sp)
	lw	$4, 1($sp)
	lw	$5, 2($sp)
	lw	$6, 3($sp)
	lw	$7, 4($sp)
	lw	$13, 5($sp)
	addui	$sp, $sp, 6
	jr	$ra
