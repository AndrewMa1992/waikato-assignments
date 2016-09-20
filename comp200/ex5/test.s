.global main
.text

main:
  addi $1,$0,0xffff
  addi $2, $0, 0xAf
  #0xaf < 0xffff
  sle $3,$2,$1
  addi $4, $0, 0xfff
  #0xfff < 0xffff ?
  sle $5, $4,$1
  #0xaf < 0xfff ?
  sle $6,$2,$4
  j main
