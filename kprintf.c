#include "vga.h"
#include <stdarg.h>

static void print_decimal(int num) {
	if (num == 0) {
		vga_print("0", VGA_COLOR_PINK);
		return;
	}

	if (num < 0) {
		vga_print("-", VGA_COLOR_PINK);
		num = -num;
	}

	char buffer[12];
	int i = 0;

	while (num > 0) {
		buffer[i++] = '0' + (num % 10);
		num /= 10;
	}

	for (int j = i - 1; j >= 0; j--) {
		char c[2] = {buffer[j], '\0'};
		vga_print(c, VGA_COLOR_PINK);
	}
}

static void print_hex(unsigned int num) {
	char buffer[9];
	const char *digits = "0123456789ABCDEF";
	int i = 0;

	if (num == 0) {
		vga_print("0", VGA_COLOR_PINK);
		return;
	}

	while (num > 0) {
		buffer[i++] = digits[num % 16];
		num /= 16;
	}

	for (int j = i - 1; j >= 0; j--) {
		char c[2] = {buffer[j], '\0'};
		vga_print(c, VGA_COLOR_PINK);
	}
}

void kprintf(const char *fmt, ...) {
	va_list args;
	va_start(args, fmt);

	while (*fmt) {
		if (*fmt == '%') {
			fmt++;
			switch (*fmt) {
				case 'd':
					print_decimal(va_arg(args, int));
					break;
				case 'x':
					print_hex(va_arg(args, unsigned int));
					break;
				case 's':
					vga_print(va_arg(args, const char*), VGA_COLOR_PINK);
					break;
				case '%':
					vga_print("%", VGA_COLOR_PINK);
					break;
			}
		} else {
			char c[2] = {*fmt, '\0'};
			vga_print(c, VGA_COLOR_PINK);
		}
		fmt++;
	}

	va_end(args);
}
