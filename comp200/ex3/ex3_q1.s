.text				#specifies that what follows are instructions
.global main			#specifies that the label "main" is globally accessible

main:
	lw $1,0x73001($0) #push0
	andi $1,$1,0x3

	subi $4,$1,0x3
	beqz $4,both 	#if both are pushed

	subi $4,$1,0x2
	beqz $4,invert 	#if push1 is pressed

	subi $4,$1,0x1 #if push0 is pressed
	beqz $4,write

	j main

invert:
	lw $5,0x73000($0) #for switch values
	andi $6,$5,0xf #right 4 bits
	xori $6,$6,0xf #reverse
	sw $6,0x73003($0) #store in left ssd

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


