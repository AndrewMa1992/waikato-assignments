.global main
.text

main:
	#set up handler address
	movsg $2,$evec
	sw $2,default_handler($0)
	la $2, interrupt_handler
	movgs $evec, $2

	#enable irq2, interrupt mode and kernal mode
	addi $2, $0, 0x4A
	movgs $cctrl, $2

	# Acknowledge any outstanding interrupts
	sw $0, 0x72003($0)

	# Put our count value into the timer load reg
	addi $11, $0, 24
	sw $11, 0x72001($0)

	# Enable the timer and set auto-restart mode
	addi $11, $0, 0x3
	sw $11, 0x72000($0)

  jal serial_main

interrupt_handler:

	#an IRQ3 interrupt (user interrupt button)
	movsg $3, $estat
	andi $4,$3,0x40
	bnez $4, timer_interrupt_handler

	lw $13,default_handler($0)
	jr $13

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
