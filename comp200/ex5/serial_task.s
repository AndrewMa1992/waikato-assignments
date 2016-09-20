.global	printChar
.text
printChar:
	subui	$sp, $sp, 2
	sw	$12, 0($sp)
	sw	$13, 1($sp)
L.6:
L.7:
	lhi	$13, 0x7
	ori	$13, $13, 0x1003
	lw	$13, 0($13)
	andi	$13, $13, 2
	seq	$13, $13, $0
	bnez	$13, L.6
	lhi	$13, 0x7
	ori	$13, $13, 0x1000
	lw	$12, 2($sp)
	sw	$12, 0($13)
L.5:
	lw	$12, 0($sp)
	lw	$13, 1($sp)
	addui	$sp, $sp, 2
	jr	$ra
.global	serial_main
serial_main:
	subui	$sp, $sp, 7
	sw	$5, 1($sp)
	sw	$6, 2($sp)
	sw	$7, 3($sp)
	sw	$12, 4($sp)
	sw	$13, 5($sp)
	sw	$ra, 6($sp)
	addu	$6, $0, $0
	addu	$5, $0, $0
	addu	$7, $0, $0
	addu	$13, $0, $0
	sw	$13, serial_state($0)
	sw	$13, counter($0)
	j	L.11
L.10:
	lhi	$13, 0x7
	ori	$13, $13, 0x1003
	lw	$13, 0($13)
	andi	$13, $13, 1
	seq	$13, $13, $0
	bnez	$13, L.13
	lhi	$13, 0x7
	ori	$13, $13, 0x1001
	lw	$13, 0($13)
	snei	$13, $13, 49
	bnez	$13, L.15
	addui	$13, $0, 1
	sw	$13, serial_state($0)
	j	L.16
L.15:
	lhi	$13, 0x7
	ori	$13, $13, 0x1001
	lw	$13, 0($13)
	snei	$13, $13, 50
	bnez	$13, L.17
	addui	$13, $0, 2
	sw	$13, serial_state($0)
	j	L.18
L.17:
	lhi	$13, 0x7
	ori	$13, $13, 0x1001
	lw	$13, 0($13)
	snei	$13, $13, 51
	bnez	$13, L.19
	addui	$13, $0, 3
	sw	$13, serial_state($0)
	j	L.20
L.19:
	lhi	$13, 0x7
	ori	$13, $13, 0x1001
	lw	$13, 0($13)
	snei	$13, $13, 113
	bnez	$13, L.21
	j	L.12
L.21:
L.20:
L.18:
L.16:
L.13:
	lw	$13, serial_state($0)
	snei	$13, $13, 1
	bnez	$13, L.23
	addui	$13, $0, 13
	sw	$13, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	divi	$7, $13, 100
	addui	$13, $0, 60
	div	$6, $7, $13
	rem	$5, $7, $13
	divi	$13, $6, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	remi	$13, $6, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	addui	$13, $0, 58
	sw	$13, 0($sp)
	jal	printChar
	divi	$13, $5, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	remi	$13, $5, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	addui	$13, $0, 32
	sw	$13, 0($sp)
	jal	printChar
	addui	$13, $0, 32
	sw	$13, 0($sp)
	jal	printChar
	j	L.24
L.23:
	lw	$13, serial_state($0)
	snei	$13, $13, 2
	bnez	$13, L.25
	addui	$13, $0, 13
	sw	$13, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	lhi	$12, 0x1
	ori	$12, $12, 0x86a0
	div	$13, $13, $12
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	divi	$7, $13, 10000
	remi	$13, $7, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	divi	$7, $13, 1000
	remi	$13, $7, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	divi	$7, $13, 100
	remi	$13, $7, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	addui	$13, $0, 46
	sw	$13, 0($sp)
	jal	printChar
	addui	$13, $0, 10
	lw	$12, counter($0)
	div	$7, $12, $13
	rem	$13, $7, $13
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	remi	$13, $13, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	j	L.26
L.25:
	lw	$13, serial_state($0)
	snei	$13, $13, 3
	bnez	$13, L.27
	addui	$13, $0, 13
	sw	$13, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	lhi	$12, 0x1
	ori	$12, $12, 0x86a0
	div	$13, $13, $12
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	divi	$7, $13, 10000
	remi	$13, $7, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	divi	$7, $13, 1000
	remi	$13, $7, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	divi	$7, $13, 100
	remi	$13, $7, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	addui	$13, $0, 10
	lw	$12, counter($0)
	div	$7, $12, $13
	rem	$13, $7, $13
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
	lw	$13, counter($0)
	remi	$13, $13, 10
	addi	$7, $13, 48
	sw	$7, 0($sp)
	jal	printChar
L.27:
L.26:
L.24:
L.11:
	j	L.10
L.12:
L.9:
	lw	$5, 1($sp)
	lw	$6, 2($sp)
	lw	$7, 3($sp)
	lw	$12, 4($sp)
	lw	$13, 5($sp)
	lw	$ra, 6($sp)
	addui	$sp, $sp, 7
	jr	$ra
.bss
.global	serial_state
serial_state:
	.space	1
.global	counter
counter:
	.space	1
