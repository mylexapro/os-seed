AS = nasm
CC = gcc
LD = ld
OBJCOPY = objcopy

CFLAGS = -m32 -ffreestanding -O2 -Wall -Wextra

all: os-image.bin

boot.bin: boot.asm
	$(AS) -f bin boot.asm -o boot.bin

kernel.o: kernel.c vga.c vga.h
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o
	$(CC) $(CFLAGS) -c vga.c -o vga.o

kernel.elf: kernel.o
	$(LD) -m  elf_i386 -Ttext 0x8000 -o kernel.elf kernel.o vga.o

kernel.bin: kernel.elf
	$(OBJCOPY) -O binary kernel.elf kernel.bin

os-image.bin: boot.bin kernel.bin
	cat boot.bin kernel.bin > os-image.bin

run: os-image.bin
	qemu-system-i386 -drive format=raw,file=os-image.bin

clean:
	rm -f *.o *.elf *.bin
