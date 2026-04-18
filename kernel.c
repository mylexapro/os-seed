// kernel.c — tiny 32-bit C "kernel" that writes to VGA text memory

#include <stdint.h>

#define VGA_TEXT_BUFFER ((uint16_t*)0xB8000)
#define VGA_WIDTH 80
#define VGA_HEIGHT 25

static uint16_t make_vga_entry(char c, uint8_t color) {
    return (uint16_t)c | ((uint16_t)color << 8);
}

void kmain(void) {
    uint16_t *buffer = VGA_TEXT_BUFFER;
    uint8_t color = 0x0F; // white on black

    // Clear screen
    for (int y = 0; y < VGA_HEIGHT; y++) {
        for (int x = 0; x < VGA_WIDTH; x++) {
            buffer[y * VGA_WIDTH + x] = make_vga_entry(' ', color);
        }
    }

    const char *msg = "Hello from C kernel!";
    int x = 0;
    int y = 0;

    while (*msg) {
        buffer[y * VGA_WIDTH + x] = make_vga_entry(*msg, color);
        x++;
        msg++;
    }

    // Hang forever
    for (;;) {
        __asm__ __volatile__("hlt");
    }
}
