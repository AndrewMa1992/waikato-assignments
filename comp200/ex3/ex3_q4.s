.global main
.text

main:
	jal parallel_job
	jal serial_job
	j main

	#wait until a character arrives through SP1

parallel_job:
	lw $1, 0x70003($0)
	andi $1, $1, 1
	subi $1,$1,1
	beqz $1, readchar

	jr $ra

readchar:
	#read the character
	lw $2, 0x70001($0)
	addi $3,$0,0x41

check:
	subi $4,$3,0x5b
	beqz $4,changechar

	sub $4,$2,$3
	beqz $4,sendLoop
	#if it is not that character e.g. A	
	addi $3,$3,0x1
	j check

	#wait until SP1 is ready to send a character
sendLoop:
	lw $1, 0x70003($0)
	andi $1, $1, 2
	beqz $1, sendLoop

	#transmit
	sw $2, 0x70000($0)

	#repeat
	j main

changechar:
	addi $2,$0,0x2a
	j sendLoop



serial_job:
	lw $1,0x73001($0) #push0
	andi $1,$1,0x3

	subi $4,$1,0x3
	beqz $4,both 	#if both are pushed

	subi $4,$1,0x2
	beqz $4,invert 	#if push1 is pressed

	subi $4,$1,0x1
	beqz $4,write

	jr $ra

invert:
	lw $5,0x73000($0) #for switch values
	andi $6,$5,0xf #right 4 bits
	xori $6,$6,0xf
	sw $6,0x73003($0)

	andi $7,$5,0xf0 #left 4 bits
	srli $7,$7,0x4
	xori $7,$7,0xf
	sw $7,0x73002($0)
	j main


write:
	lw $5,0x73000($0) #for switch values
	andi $6,$5,0xf
	sw $6,0x73003($0)

	andi $7,$5,0xf0
	srli $7,$7,0x4
	sw $7,0x73002($0)
	j main
both:
	syscall

