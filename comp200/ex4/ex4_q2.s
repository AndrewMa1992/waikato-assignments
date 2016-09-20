.global main
.text

main:
	addi $5,$0,0
	addi $6,$0,0

	#counter 
	sw $0, counter($0)

	#set up handler address
	movsg $2,$evec
	sw $2,default_handler($0)
	la $2, interrupt_handler
	movgs $evec, $2
	
	#enable irq2, interrupt mode and kernal mode
	addi $2, $0, 0x4a
	movgs $cctrl, $2

	# Acknowledge any outstanding interrupts
	sw $0, 0x72003($0)

	# Put our count value into the timer load reg
	addi $11, $0, 0x960 #decimal 2400
	sw $11, 0x72001($0)

	# Enable the timer and set auto-restart mode
	addi $11, $0, 0x3
	sw $11, 0x72000($0)
loop:	
	
	lw $2,counter($0)

	divi $5,$2,0xA
	remi $6,$2,0xA	

	#$5 for left ssd, $6 for right ssd
	sw $5, 0x73002($0)
	sw $6, 0x73003($0)
	j loop
	
#input $2, return $5, and$6 respectively
convert:
	divi $5,$2,0xA
	remi $6,$2,0xA	
	jr $ra
	

interrupt_handler:
	

	#an IRQ1 interrupt (user interrupt button)
	movsg $3, $estat
	andi $4,$3,0x20
	bnez $4, user_interrupt_button_handler

	#an IRQ2 interrupt ( timer interrupt)
	movsg $3, $estat
	andi $4,$3,0x40
	bnez $4, timer_interrupt_handler

	#general handler
	lw $13,default_handler($0)
	jr $13

user_interrupt_button_handler:
	#acknowledge the interrupt
	sw $0, 0x7f000($0)

	lw $13,counter($0)
	addi $13,$13,1
	sw $13,counter($0)
	
	rfe

timer_interrupt_handler:
	#acknowledge
	sw $0, 0x72003($0)

	lw $13,counter($0)
	addi $13,$13,1
	sw $13,counter($0)

	rfe

.bss
	#A place to store the address of the default exception handler
	default_handler: .word
	counter: .word
