#include "vga.h"

static uint16_t *vga_buffer = (uint16_t*)VGA_MEMORY;
static int cursor_x = 0;
static int cursor_y = 0;

void vga_clear(void) {
	for (int y = 0; y < VGA_HEIGHT; y++) {
		for (int x = 0; x < VGA_WIDTH; x++) {
			int index = y * VGA_WIDTH + x;
			vga_buffer[index] = ((uint16_t)VGA_COLOR_BLACK << 8) | ' ';
		}
	}
	cursor_x = 0;
	cursor_y = 0;
}

void vga_putchar(char c, int x, int y, uint8_t color) {
	int index = y * VGA_WIDTH + x;
	vga_buffer[index] = ((uint16_t)color << 8) | c;
}

void vga_print(const char *str, uint8_t color) {
	while (*str) {
		if (*str == '\n') {
			cursor_x = 0;
			cursor_y++;
		} else {
			vga_putchar(*str, cursor_x, cursor_y, color);
			cursor_x++;
			if (cursor_x >= VGA_WIDTH) {
				cursor_x = 0;
				cursor_y++;
			}
		}
		if (cursor_y >= VGA_HEIGHT) {
			cursor_y = 0;
		}
		str++;
	}
}
