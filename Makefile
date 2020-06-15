all: finalexam_tomark.asm
	nasm -f elf64 -F dwarf -g -o fibfunc.o fibfunc.asm
	gcc -m64 -o fibfunc fibfunc.o
