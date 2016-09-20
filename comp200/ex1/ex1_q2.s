.text				#specifies that what follows are instructions
.global main			#specifies that the label "main" is globally accessible

main:		#entry point into the program
	addi $2, $0, 0 #$2 ssd result
	addi $1, $0, 0 #$1 switches value
	addi $3, $0, 0 #$3 loop counter
	 # $4 and $8 are testing values
	jal readswitches
	
loop:
	seqi $8, $3, 8		#has the loop finished?
	bnez $8, display	#if so, go to "main"

	jal check

	addi $3, $3, 1 		#increment the loop counter
	j loop

check:
	andi $4, $1, 1		 #see if the last digit of the switches is 1
	srli $1, $1, 1		#shift the number to right by 1 logically
	bnez $4, increment	#if the last digit is 1, increment
	jr $ra
increment:
	addi $2, $2, 1 		#add $2 by 1
	jr $ra

display:
	jal writessd
	j main


