# Makefile — builds the bootloader + kernel into a bootable image

AS = nasm
CC = gcc
LD = ld
OBJCOPY = objcopy

CFLAGS = -m32 -ffreestanding -O2 -Wall -Wextra

all: os-image.bin

bootsector.bin: bootsector.asm
	$(AS) -f bin bootsector.asm -o bootsector.bin

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

boot.o: boot.asm
	$(AS) -f elf32 boot.asm -o boot.o

kernel.elf: linker.ld boot.o kernel.o
	$(LD) -m elf_i386 -T linker.ld -o kernel.elf boot.o kernel.o

kernel.bin: kernel.elf
	$(OBJCOPY) -O binary kernel.elf kernel.bin

loader.bin: kernel.elf
	$(OBJCOPY) -O binary kernel.elf loader.bin

os-image.bin: bootsector.bin kernel.bin loader.bin
	cat bootsector.bin loader.bin kernel.bin > os-image.bin

run: os-image.bin
	qemu-system-i386 -drive format=raw,file=os-image.bin

clean:
	rm -f *.o *.elf *.bin
