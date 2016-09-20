.equ sp1_tx, 0x70000
.equ sp1_rx, 0x70001
.equ sp1_ctrl, 0x70002
.equ sp1_stat, 0x70003
.equ sp1_iack, 0x70004

.equ sp2_tx, 0x71000
.equ sp2_rx, 0x71001
.equ sp2_ctrl, 0x71002
.equ sp2_stat, 0x71003
.equ sp2_iack, 0x71004

.equ rextimer_ctrl, 0x72000
.equ rextimer_load, 0x72001
.equ rextimer_count, 0x72002
.equ rextimer_iack, 0x72003

.equ RexParallel_switches, 0x73000
.equ RexParallel_buttons, 0x73001
.equ RexParallel_leftssd, 0x73002
.equ RexParallel_rightssd, 0x73003
.equ RexParallel_ctrl, 0x73004
.equ RexParallel_iack, 0x73005

.equ userint_iack, 0x7f000

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
.equ pcb_sp, 14 #bottom of the task
.equ pcb_ra, 15
.equ pcb_ear, 16 #value of PC when an exception has occured, it is set to the entry point of the task
.equ pcb_cctrl, 17

#.bss task1_pcb .space 18
# task1_stack .space 100
# stack is set immediately after the pac
