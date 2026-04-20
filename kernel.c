#include "vga.h"
#include "kprintf.h"
#include "idt.h"

void kmain(void) {
	vga_clear();
	idt_init();

	kprintf("Hello from kmain!\n");
	kprintf("IDT initialized\n");
	kprintf("Decimal: %d\n", 42);
	kprintf("Hex: 0x%x\n", 255);

	for (;;) {
		__asm__ __volatile__("hlt");
	}
}
