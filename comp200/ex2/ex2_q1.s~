.text				#specifies that what follows are instructions
.global decryptAndPrint			#specifies that the label "main" is globally accessible

decryptAndPrint:
	subui $sp, $sp, 4	#push stack
	# 0($sp) for parameter for putc 
	sw $ra,1($sp)
	sw $2,2($sp)	#saving before using it, for char
	sw $3,3($sp)	#for key

	add $2,$0,$0 	#initialise values
	add $3,$0,$0

	lw $2,4($sp)	#save parameters into registers
	lw $3,5($sp)

	xor $2, $2, $3 	#decypt
	
	sw $2,0($sp)
	jal putc

	lw $ra,1($sp)   #pop
	lw $2,2($sp)	
	lw $3,3($sp)	
	addui $sp,$sp,4

	jr $ra
