.text				#specifies that what follows are instructions
.global main			#specifies that the label "main" is globally accessible
main:
	addi $1,$0,0x61
	sw $1,0x71000($0)

wait:

	lw $2, 0x71003($0) #check sent ready status
	andi $2, $2, 2
	beqz $2, wait
	
	#if the data is sent

	subi $3,$1,0x7a #7a is z
	beqz $3,end #check is number reaches "z"

	#if ascii number is not yet 7a

	addi $1,$1,0x1
	sw $1,0x71000($0) #send through sp1
	j wait

end: 
	syscall	
