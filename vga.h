#ifndef VGA_H
#define VGA_H

#include <stdint.h>

#define VGA_WIDTH	80
#define VGA_HEIGHT	25
#define VGA_MEMORY	0xB8000

#define VGA_COLOR_BLACK	0
#define VGA_COLOR_PINK	0x0D

void vga_clear(void);
void vga_putchar(char c, int x, int y, uint8_t color);
void vga_print(const char *str, uint8_t color);

#endif

