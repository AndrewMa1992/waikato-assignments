.global main
.text

main:
	#counter 
	sw $0, counter($0)

	#set up handler address
	movsg $2,$evec
	sw $2,default_handler($0)
	la $2, interrupt_handler
	movgs $evec, $2

	#set interrupt enabled and hex-ssd decode enabled for parallel control 	register
	addi $13, $0, 0x3
	sw $13, 0x73004($0)
	
	#enable irq2, interrupt mode and kernal mode
	addi $2, $0, 0xCA
	movgs $cctrl, $2

	# Acknowledge any outstanding interrupts
	sw $0, 0x72003($0)
	sw $0, 0x73005($0)

	# Put our count value into the timer load reg
	addi $11, $0, 0x18 #decimal 24
	sw $11, 0x72001($0)

	#  set auto-restart mode but do not start the timer yet
	addi $11, $0, 0x2
	sw $11, 0x72000($0)
loop:	
	#loop counter
	lw $2,counter($0)
	divi $2,$2,0x64 #divide by 100

	divi $5,$2,0xA
	remi $6,$2,0xA	

	#$5 for left ssd, $6 for right ssd
	sw $5, 0x73002($0)
	sw $6, 0x73003($0)

	j loop

interrupt_handler:
	

	#an IRQ1 interrupt (user interrupt button)
	movsg $3, $estat
	andi $4,$3,0x20
	bnez $4, user_interrupt_button_handler

	#an IRQ2 interrupt ( timer interrupt)
	movsg $3, $estat
	andi $4,$3,0x40
	bnez $4, timer_interrupt_handler

	#IRQ3, parallel 
	movsg $3, $estat
	andi $4,$3,0x80
	bnez $4, parallel_interrupt_handler

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

parallel_interrupt_handler:
	#acknowledge
	sw $0, 0x73005($0)

	#read push button register
	lw $13,0x73001($0)
	andi $13,$13,0x3
	#push 1 left button
	subi $13,$13,0x2
	beqz $13,reset

	lw $13,0x73001($0)
	andi $13,$13,0x3
	#push 0 right button
	subi $13,$13,0x1
	beqz $13,timer_modify

	rfe

timer_modify:
	lw $13,0x72000($0)
	xori $13,$13,0x1
	sw $13,0x72000($0)
	rfe
reset:
	lw $13,0x72000($0)
	andi $13,$13,0x3
	subi $13, $13, 0x3
	beqz $13, sendcarriage
	#if timer is enabled, jump back to loop

	lw $13,counter($0)
	addi $13,$0,0
	sw $13,counter($0)
	rfe

sendcarriage:
	lw $9, counter($0)

	lw $13, 0x70003($0)
	andi $13, $13, 2
	beqz $13, sendcarriage
	addi $2,$0,'\r'
	sw $2, 0x70000($0)
sendn:
	lw $13, 0x70003($0)
	andi $13, $13, 2
	beqz $13, sendn
	addi $3,$0,'\n'
	sw $3, 0x70000($0)
send1:
	lw $13, 0x70003($0)
	andi $13, $13, 2
	beqz $13, send1
	lw $13, counter($0)
	divi $13, $13, 100
	divi $13, $13, 10
	addi $13, $13, 48
	sw $13, 0x70000($0)
send2:
	lw $13, 0x70003($0)
	andi $13, $13, 2
	beqz $13, send2
	lw $13, counter($0)
	divi $13, $13, 100
	remi $13, $13, 10
	addi $13, $13, 48
	sw $13, 0x70000($0)
senddot:
	lw $13, 0x70003($0)
	andi $13, $13, 2
	beqz $13, senddot
	addi $13,$0,'.'
	sw $13, 0x70000($0)
send3:
	lw $13, 0x70003($0)
	andi $13, $13, 0x2
	beqz $13, send3
	lw $13, counter($0)
	divi $13, $13, 10
	remi $13, $13, 10
	addi $13, $13, 48
	sw $13, 0x70000($0)
send4:
	lw $13, 0x70003($0)
	andi $13, $13, 0x2
	beqz $13, send4
	lw $13, counter($0)
	remi $13, $13, 10
	addi $13, $13, 48
	sw $13, 0x70000($0)
	rfe



.bss
	#A place to store the address of the default exception handler
	default_handler: .word
	counter: .word
