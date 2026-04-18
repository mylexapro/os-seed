BITS 16
ORG 0x7C00

start:
	mov si, msg
.loop:
	lodsb
	or al, al
	jz .done
	mov ah, 0x0E
	int 0x10
	jmp .loop
.done:
	cli
	hlt

msg db "Hello from boot!", 0

times 510-($-$$) db 0
dw 0xAA55
