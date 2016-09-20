.global main
.text

main:
	#wait until a character arrives through SP1
recvLoop:
	lw $1, 0x70003($0) #check read ready status
	andi $1, $1, 1
	beqz $1, recvLoop

	#read the character
	lw $2, 0x70001($0)
	addi $3,$0,0x41

check:
	subi $4,$3,0x5b #if the char has not reached Z
	beqz $4,changechar #if has, that means we looped from A to Z, but no char matches, thus we change it to star

	sub $4,$2,$3 #if both char receive and loop char match, then sendloop
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

