BITS 16
ORG 0x7C00

start:
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

	mov edi, 0xB8000
	mov esi, msg
.print:
	lodsb
	or al, al
	jz .done
	mov byte [edi], al
	mov byte [edi+1], 0x0D
	add edi, 2
	jmp .print
.done:
	cli
	hlt

msg db "Hello from protected mode!", 0

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
