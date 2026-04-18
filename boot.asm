BITS 16
ORG 0x7C00

start:
	mov ax, 0xB800
	mov es, ax
	mov di, 0

	mov cx, 2000
.clear:
	mov byte [es:di], ' '
	inc di
	mov byte [es:di], 0x00
	inc di
	loop .clear
	mov di, 0

	mov si, msg
.loop:
	lodsb
	or al, al
	jz .done
	mov byte [es:di], al
	inc di
	mov byte [es:di], 0x0D
	inc di
	jmp .loop
.done:
	cli
	hlt

msg db "Hello from Boot!", 0

times 510-($-$$) db 0
dw 0xAA55
