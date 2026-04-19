BITS 16
ORG 0x7C00

start:
	mov ax, 0x0800
	mov es, ax
	mov bx, 0
	mov ah, 0x02
	mov al, 10
	mov ch, 0
	mov cl, 2
	mov dh, 0
	int 0x13
	cli
	lgdt [gdt_descriptor]
	mov eax, cr0
	or eax, 1
	mov cr0, eax
	jmp 0x08:protected_mode

BITS 32
protected_mode:
	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov esp, 0x90000

	mov ecx, 2000
	mov edi, 0xB8000
.clear:
	mov byte [edi], ' '
	mov byte [edi+1], 0x00
	add edi, 2
	loop .clear

	mov eax, 0x8000
	call eax

.hang:
	cli
	hlt
	jmp .hang

gdt_start:
	dq 0
gdt_code:
	dw 0xFFFF
	dw 0x0000
	db 0x00
	db 10011010b
	db 11001111b
	db 0x00
gdt_data:
	dw 0xFFFF
	dw 0x0000
	db 0x00
	db 10010010b
	db 11001111b
	db 0x00
gdt_end:

gdt_descriptor:
	dw gdt_end - gdt_start - 1
	dd gdt_start

times 510-($-$$) db 0
dw 0xAA55
