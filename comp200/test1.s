.text
.global main

.equ buttons, 0x73001
.equ leftSSD, 0x73002
.equ rightSSD, 0x73003

main:
  addi $1,$0,0
loop:
  lw $2, buttons($0)
  andi $2,$2,1
  beqz $2,loop

  addi $1,$1,1

  remi $2,$1,10
  sw $2,rightSSD($0)
  divi $2,$1,10
  remi $2, $2, 10
  sw $2, leftSSD($0)

loop2:
  lw $2, buttons($0)
  andi $2,$2,1
  bnez $2, loop2
  j loop
