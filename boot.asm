; boot.asm — single-stage bootloader
; 16-bit real mode → 32-bit protected mode → write text to screen

BITS 16
ORG 0x7C00

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    ; print a small real-mode message
    mov si, msg_real
.print_real:
    lodsb
    or al, al
    jz .done_real
    mov ah, 0x0E
    int 0x10
    jmp .print_real
.done_real:

    ; set up GDT
    lgdt [gdt_descriptor]

    ; enable protected mode
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; far jump to 32-bit code
    jmp 0x08:pm_start

; ---------------- GDT ----------------

gdt_start:
gdt_null:               ; null descriptor
    dd 0
    dd 0

gdt_code:               ; code segment
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b
    db 11001111b
    db 0x00

gdt_data:               ; data segment
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

; ---------------- 32-bit code ----------------

BITS 32

pm_start:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov gs, ax

    mov esp, 0x90000

    ;clear VGA text mode screen
    mov edi, 0xB8000       ; start of VGA text buffer
    mov ecx, 80*25         ; number of character cells
    mov ax, 0x0F20         ; ' ' with white-on-black
.clear_loop:
    stosw                   ; write AX to [EDI], advance EDI by 2
    loop .clear_loop

    ; write "Hello from the Kernel!" directly to VGA text memory
    mov edi, 0xB8000
    mov esi, msg_pm
    mov ah, 0x0F          ; white on black

.print_pm:
    lodsb
    or al, al
    jz .done_pm
    mov [edi], al
    mov [edi+1], ah
    add edi, 2
    jmp .print_pm
.done_pm:

.hang:
    cli
    hlt
    jmp .hang

; ---------------- data ----------------

BITS 16

msg_real db "Booting and switching to protected mode...", 0
msg_pm   db "Hello from protected mode!", 0

times 510-($-$$) db 0
dw 0xAA55

