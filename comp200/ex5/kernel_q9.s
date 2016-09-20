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
	# Unmask IRQ2,KU=1,OKU=1,IE=0,OIE=1
	addi $5, $0, 0x4d


	# Setup the pcb for task 1
	la $1, serial_pcb
	# Setup the link field
	la $2, parallel_pcb
	sw $2, pcb_link($1)
	# Setup the stack pointer
	la $2, serial_stack
	sw $2, pcb_sp($1)
	# Setup the $ear field
	la $2, serial_main
	sw $2, pcb_ear($1)
	# Setup the $cctrl field
	sw $5, pcb_cctrl($1)
	la $1, serial_pcb
	#set up timeslice
	addi $2,$0,1
	sw $2,pcb_timeslice($1)

	# Setup the pcb for task 1
	la $1, parallel_pcb
	# Setup the link field
	la $2, gameSelect_pcb
	sw $2, pcb_link($1)
	# Setup the stack pointer
	la $2, parallel_stack
	sw $2, pcb_sp($1)
	# Setup the $ear field
	la $2, parallel_main
	sw $2, pcb_ear($1)
	# Setup the $cctrl field
	sw $5, pcb_cctrl($1)
	#set up timeslice
	addi $2,$0,1
	sw $2,pcb_timeslice($1)


	# Setup the pcb for task 1
	la $1, gameSelect_pcb
	# Setup the link field
	la $2, serial_pcb
	sw $2, pcb_link($1)
	# Setup the stack pointer
	la $2, gameSelect_stack
	sw $2, pcb_sp($1)
	# Setup the $ear field
	la $2, gameSelect_main
	sw $2, pcb_ear($1)
	# Setup the $cctrl field
	sw $5, pcb_cctrl($1)
	#set up timeslice
	addi $2,$0,4
	sw $2,pcb_timeslice($1)

	# Setup the pcb for game select
	la $1, idle_pcb
	# Setup the link field
	la $2, idle_pcb
	sw $2, pcb_link($1)
	# Setup the stack pointer
	la $2, idle_stack
	sw $2, pcb_sp($1)
	# Setup the $ear field
	la $2, idle_main
	sw $2, pcb_ear($1)
	# Setup the $cctrl field
	sw $5, pcb_cctrl($1)
	#set up timeslice
	addi $2,$0,4
	sw $2,pcb_timeslice($1)

	la $1, serial_pcb
	sw $1, current_task($0)
	j new_time_slice

idle_main:
	#disable ssd decode
	sw $0, 0x73004($0)
idle_write_loop:
	#no.6 bit is enabled
	addi $1, $0, 0x40
	sw $1, 0x73002($0)
	sw $1, 0x73003($0)
	j idle_write_loop

interrupt_handler:
	#an IRQ2 interrupt timer interrupt handler
	movsg $13, $estat
	andi $13,$13,0xffb0
	beqz $13, timer_interrupt_handler

	lw $13,default_handler($0)
	jr $13
timer_interrupt_handler:
	#acknowledge
	sw $0, 0x72003($0)
	#if the time has not run out, we increment the counter
	lw $13,counter($0)
	addi $13,$13,1
	sw $13,counter($0)
	#subtract the time slice by one, if the time runs out, we jump to dispatcher
	lw $13, current_time_slice($0)
	subi $13,$13,1
	sw $13, current_time_slice($0)
	beqz $13, dispatcher

	rfe
	.equ pcb_link, 0
	.equ pcb_reg1, 1
	.equ pcb_reg2, 2
	.equ pcb_reg3, 3
	.equ pcb_reg4, 4
	.equ pcb_reg5, 5
	.equ pcb_reg6, 6
	.equ pcb_reg7, 7
	.equ pcb_reg8, 8
	.equ pcb_reg9, 9
	.equ pcb_reg10, 10
	.equ pcb_reg11, 11
	.equ pcb_reg12, 12
	.equ pcb_reg13, 13
	#bottom of the task
	.equ pcb_sp, 14
	.equ pcb_ra, 15
	#value of PC when an exception has occured, it is set to the entry point of the task
	.equ pcb_ear, 16
	.equ pcb_cctrl, 17
	.equ pcb_timeslice, 18
dispatcher:
save_context:
	# Get the base address of the current PCB
	lw $13, current_task($0)

	# Save the registers
	sw $1, pcb_reg1($13)
	sw $2, pcb_reg2($13)
	sw $3, pcb_reg3($13)
	sw $4, pcb_reg4($13)
	sw $5, pcb_reg5($13)
	sw $6, pcb_reg6($13)
	sw $7, pcb_reg7($13)
	sw $8, pcb_reg8($13)
	sw $9, pcb_reg9($13)
	sw $10, pcb_reg10($13)
	sw $11, pcb_reg11($13)
	sw $12, pcb_reg12($13)
	sw $sp, pcb_sp($13)
	sw $ra, pcb_ra($13)
	# $1 is saved now so we can use it
	# Get the old value of $13
	movsg $1, $ers
	# and save it to the pcb
	sw $1, pcb_reg13($13)
	# Save $ear

	movsg $1, $ear
	#if $ear is out of the memory space, then the program has exited
	slei $2,$1,0xffff
	bnez $2,remove_current_task

	#if the $ear is not out of the memory space
	sw $1, pcb_ear($13)
	# Save $cctrl
	movsg $1, $cctrl
	sw $1, pcb_cctrl($13)
schedule:
	lw $13, current_task($0)
	lw $13, pcb_link($13)
	sw $13, current_task($0)
new_time_slice:
	#set the new time slice
	lw $1, current_task($0)
	lw $13, pcb_timeslice($1)
	sw $13, current_time_slice($0)
load_context:
	#Get PCB of current task
	lw $13, current_task($0)
	# Get the PCB value for $13 back into $ers
	lw $1, pcb_reg13($13)
	movgs $ers, $1
	# Restore $ear
	lw $1, pcb_ear($13)
	movgs $ear, $1
	# Restore $cctrl
	lw $1, pcb_cctrl($13)
	movgs $cctrl, $1
	# Restore the other registers
	lw $1, pcb_reg1($13)
	lw $2, pcb_reg2($13)
	lw $3, pcb_reg3($13)
	lw $4, pcb_reg4($13)
	lw $5, pcb_reg5($13)
	lw $6, pcb_reg6($13)
	lw $7, pcb_reg7($13)
	lw $8, pcb_reg8($13)
	lw $9, pcb_reg9($13)
	lw $10, pcb_reg10($13)
	lw $11, pcb_reg11($13)
	lw $12, pcb_reg12($13)
	lw $sp, pcb_sp($13)
	lw $ra, pcb_ra($13)
	# Return to the new task
	rfe
remove_current_task:
	lw $13, current_task($0)
	#temp $6 for the next task
	lw $6, pcb_link($13)

	#in the context of removing the current task
	#compare the pcb_link(next task) and current_task, if they are the same, then we exit the current task and enter into idle task
	xor $2, $6, $13
	beqz $2, load_idle

	#if not
	#intialise temp_task
	sw $6, temp_task($0)
find_prev_task:
	lw $2, temp_task($0)
	#next pcb of temp_task
	lw $3, pcb_link($2)
	#compare the $3 next task of temp_task to the current_task
	xor $4,$3,$13
	# if equal
	beqz $4,connect_task
	#set the next temp task
	sw $3, temp_task($0)
	j find_prev_task
connect_task:
	# set the pcb_link of previous task to the pcb_link of current_task, so that current_taskis completed deleted from the linked list of pcb_link
	lw $2, temp_task($0)
	sw $6, pcb_link($2)
	add $3, $6,$0
	lw $4, pcb_link($3)
	lw $5, current_time_slice($0)
	sw $2, current_task($0)
	j new_time_slice

load_idle:
	la $1, idle_pcb
	sw $1, current_task($0)
	j new_time_slice
.data
	current_time_slice:
									.word 1
.bss
	serial_pcb:
						.space 19
						.space 200
  serial_stack:
  	parallel_pcb:
  						.space 19
  						.space 200
    parallel_stack:

	gameSelect_pcb:
  						.space 19
  						.space 200
    gameSelect_stack:

	idle_pcb:
  						.space 19
  						.space 200
    idle_stack:


	default_handler:
	.word
	current_task:
	temp_task:
	.word
