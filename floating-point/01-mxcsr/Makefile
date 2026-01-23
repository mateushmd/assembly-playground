all:
	nasm -f elf64 mxcsr.asm -o mxcsr.o
	gcc -nostartfiles -no-pie mxcsr.o -o mxcsr

clean:
	rm -f mxcsr.o mxcsr
