; bootsector.asm — 16-bit BIOS boot sector
; Loads the next stage (bootloader) located immediately after this sector

BITS 16
ORG 0x7C00

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax

    mov si, msg
.print:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp .print
.done:

    ; Jump to the next stage at 0x7E00 (just after this 512-byte sector)
    jmp 0x0000:0x7E00

msg db "Boot sector OK, loading protected mode...", 0

times 510-($-$$) db 0
dw 0xAA55
