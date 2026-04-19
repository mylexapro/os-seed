# os-seed

A bare-metal operating system built from scratch — no libraries, no OS underneath,
just assembly code talking directly to hardware. This is my hands-on journey into
how computers actually work at the lowest level.

---

**Version:** v1.2.0 — "Formatted Printing (kprintf)"

The OS currently:

- kprintf() for formatted output (%d, %x, %s)
- Boots from a custom 512-byte boot sector written in x86 assembly
- Uses BIOS interrupt int 0x13 to load the kernel from disk into memory
- Sets up a Global Descriptor Table (GDT)
- Switches the CPU from 16-bit real mode into 32-bit protected mode
- Jumps to a C kernel at 0x8000
- VGA text driver with cursor tracking and newline support
- kmain() uses the driver to print multiple lines in hot pink
- Built with a Makefile — single `make run` command to build and launch

---

## 🧠 What I'm Learning

- What actually happens between pressing power and seeing an OS
- How the BIOS loads the first 512 bytes of a drive into RAM at address 0x7C00
- What real mode is and why every x86 CPU starts there
- How BIOS interrupts work (ringing a bell to ask the BIOS to do something)
- How memory addresses and hexadecimal relate to physical RAM
- How to write and assemble x86 assembly with NASM
- How to test bare-metal code with QEMU without real hardware

---

## 🗂️ Project Structure
```
boot.asm     → 512-byte bootloader, loads kernel, switches to protected mode
kernel.c     → C kernel, kmain() entry point
vga.h        → VGA driver header, function declarations
vga.c        → VGA driver implementation, cursor tracking
linker.ld    → tells linker where to place code in memory
Makefile     → builds and runs everything with a single command
kprintf.h    → kprintf() header, variadic function declaration
kprintf.c    → kprintf() implementation, number-to-string conversion
```
---

## 🧭 Roadmap

### ✔️ Completed

- Implement a printf function for formatted output
- Add a proper VGA text driver with cursor support
- Load and Call a C kernel (kmain)

### 🔜 Next Steps

- Set up the Interrupt Descriptor Table (IDT)
- Handle keyboard interrupts
- Remap the Programmable Interrupt Controller (PIC)
- Implement memory detection
- Add basic memory management
- Build a simple shell

### 📅 Later

- Memory paging
- Userland processes
- Filesystem support
- Rust kernel modules

---

## 📝 Versioning

- v0.1.x — old experiments (scrapped, clean slate taken)
- v0.2.0 — minimal boot sector, prints "Hi" using BIOS interrupt
- v0.2.1 — print loop, prints full string using BIOS interrupt
- v0.3.0 — direct VGA write, no BIOS, hot pink text, screen clear
- v0.4.0 — protected mode, GDT, 32-bit, full string in hot pink
- v1.0.0 — C kernel boots, kmain() called from bootloader
- v1.1.0 — VGA text driver, multiple files, cursor tracking, newlines
- v1.2.0 — kprintf() with %d, %x, %s format specifiers

---

## 📸 Screenshots

### v1.2.0 — kprintf() formatted printing
![kprintf](screenshots/v1.2.0-kprintf.png)

> Full screenshot history available in the [screenshots folder](screenshots/)

---

## 💬 About This Project

os-seed is a long-term learning project. I'm autistic and learn best by building
real things, so this repo documents my actual progression — every commit is a
working state I understand, not just code I copied.

The goal isn't to ship a production OS. The goal is to genuinely understand how
computers work from the ground up.
