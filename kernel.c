#include <stdint.h>

#define VGA ((uint16_t*)0xB8000)
#define WIDTH 80

void kmain(void) {
	const char *msg = "Hello from kmain!";
	int i = 0;
	while (msg[i]) {
		VGA[i] = (uint16_t)msg[i] | (0x0D << 8);
		i++;
	}
	for (;;) {}
}
