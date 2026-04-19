#include "vga.h"
#include "kprintf.h"

void kmain(void) {
	vga_clear();

	kprintf("Hello from kmain!\n");
	kprintf("Testing kprintf:\n");
	kprintf("Decimal: %d\n", 42);
	kprintf("Hex: 0x%x\n", 255);
	kprintf("String: %s\n", "Working!");

	for (;;) {
		__asm__ __volatile__("hlt");
	}
}
