.text				#specifies that what follows are instructions
.global main			#specifies that the label "main" is globally accessible

main:			#entry point into the program
	subui $sp,$sp,5	#store register before using it
	sw $2,2($sp)
	sw $3,3($sp)
	sw $ra,4($sp)

	add $2,$0,$0	#intialise value
	add $3,$0,$0

	jal readswitches	#return value is $1

	andi $2,$1,0xf		#rightmost 4bits
	andi $3,$1,0xf0		#the last 8 bits number (8 bits rightnow)
	srli $3, $3, 4		#shift leftmost right by 4, so it becomes a 4bit binary number, which is the leftmost 4 bits

	#passing parameters to the stack
	sw $2,0($sp)	#rightmost 4bits as first parameter start
	sw $3,1($sp)	#leftmost 4bits as second parameter end

	jal count

	lw $2,2($sp)	#pop register values from stack to registers
	lw $3,3($sp)
	lw $ra,4($sp)
	addui $sp,$sp,5
	
	jr $ra

	

	

	
	

