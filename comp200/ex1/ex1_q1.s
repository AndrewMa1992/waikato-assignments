.text				#specifies that what follows are instructions
.global main			#specifies that the label "main" is globally accessible

main:			#entry point into the program
	jal readswitches
	add $2, $1, $0
	jal writessd
	j main


