BITS 32

global isr0
global isr1

isr0:
	cli
	push byte 0
	push byte 0
	jmp isr_common

isr1:
	cli
	push byte 0
	push byte 1
	jmp isr_common

isr_common:
	pusha
	push ds
	push es
	push fs
	push gs

	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	popa
	pop gs
	pop fs
	pop es
	pop ds
	add esp, 8
	iret
