all:
	wasm kernel_q9.s
	wcc -S serial_task.c
	wasm serial_task.s
	wlink -o kernel_q9.srec serial_task.o parallel_task.o kernel_q9.o breakout.o rocks.o gameSelect.o
q3:
	wasm kernel_q3.s
q4:
	wasm kernel_q4.s
q5:
	wasm kernel_q5.s
q6:
	wasm kernel_q6.s
q7:
	wasm kernel_q7.s
q8:
	wasm kernel_q8.s
q9:
	wasm kernel_q9.s
parallel:
	wcc -S parallel_task.c
	wasm parallel_task.s
test:
	wasm test.s
	wlink -o test.srec test.o
equ:
	wasm equ.s
	wlink -o equ.srec equ.o
clean:
	rm ex5_q3.s ex5_q3.o ex5_q3.srec
