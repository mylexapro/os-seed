# os-seed

A bare-metal operating system built from scratch — no libraries, no OS underneath,
just assembly code talking directly to hardware. This is my hands-on journey into
how computers actually work at the lowest level.

---

## 🚀 Current Status

**Version:** v0.4.0 — "Protected Mode"

The OS currently:

- Boots from a custom 512-byte boot sector written in x86 assembly
- Sets up a Global Descriptor Table (GDT)
- Switches the CPU from 16-bit real mode into 32-bit protected mode
- Clears the screen by writing directly to VGA memory at 0xB8000
- Prints "Hello from protected mode!" in hot pink directly to VGA memory
- No BIOS interrupts used at all — pure direct hardware access
- Halts the CPU cleanly after printing

Fully reproducible with:

```
nasm -f bin boot.asm -o boot.bin
qemu-system-i386 -drive format=raw,file=boot.bin
```

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
boot.asm      → 512-byte boot sector, the only file right now

---

## 🧭 Roadmap

### ✔️ Completed

- Enter 32-bit Protected Mode
- Set up a Global Descriptor Table (GDT)
- Switch from BIOS interrupts to direct VGA memory writes at 0xB8000
- Write a Print Loop (prints entire string instead of one letter at a time)
- Boot sector that loads and runs
- BIOS interrupt-based character output
- Clean CPU halt
- Git versioning from the start

### 🔜 Next Steps

- Load and call a C kernel (kmain)
- Build a Makefile

### 📅 Later

- Keyboard driver
- Interrupt Descriptor Table (IDT)
- Memory paging
- Simple shell

---

## 📝 Versioning

- v0.1.x — old experiments (scrapped, clean slate taken)
- v0.2.0 — minimal boot sector, prints "Hi" using BIOS interrupt
- v0.2.1 — print loop, prints full string using BIOS interrupt
- v0.3.0 — direct VGA write, no BIOS, hot pink text, screen clear
- v0.4.0 — protected mode, GDT, 32-bit, full string in hot pink

---

## 📸 Screenshots

### v0.4.0 — Protected mode, full string, hot pink
![Protected mode](screenshots/v0.4.0-protected-mode-full-string.png)

### v0.3.0 — Direct VGA write, full string, hot pink
![VGA direct write](screenshots/v0.3.0-vga-direct-write.png)

### v0.2.3 — Direct VGA write, clear screen, single char
![VGA clear screen](screenshots/v0.2.3-vga-clear-screen.png)

### v0.2.2 — Direct VGA write, single char, no clear
![VGA single char](screenshots/v0.2.2-vga-single-char.png)

### v0.2.1 — BIOS print loop, full string
![BIOS print loop](screenshots/v0.2.1-boot-print-loop.png)

### v0.1.x — Old experiments (pre clean slate)
![Old protected mode print](screenshots/v0.1.0-old-protected-mode-print.png)
![Old protected mode clear](screenshots/v0.1.1-old-protected-mode-clear.png)

---

## 💬 About This Project

os-seed is a long-term learning project. I'm autistic and learn best by building
real things, so this repo documents my actual progression — every commit is a
working state I understand, not just code I copied.

The goal isn't to ship a production OS. The goal is to genuinely understand how
computers work from the ground up.
