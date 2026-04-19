#include "vga.h"

void kmain(void) {
	vga_clear();
	vga_print("Hello from kmain!\n", VGA_COLOR_PINK);
	vga_print("VGA driver working!", VGA_COLOR_PINK);

	for (;;) {
		__asm__ __volatile__("hlt");
	}
}
