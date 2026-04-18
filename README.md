# os-seed

A bare-metal operating system built from scratch — no libraries, no OS underneath,
just assembly code talking directly to hardware. This is my hands-on journey into
how computers actually work at the lowest level.

---

## 🚀 Current Status

**Version:** v0.2.1 — "Print Loop"

The OS currently:

- Boots from a custom 512-byte boot sector written in x86 assembly
- Runs in 16-bit real mode (how every x86 CPU starts up)
- Uses a print loop to print a full string to the screen
- Loops through each character using lodsb and BIOS interrupt int 0x10
- Halts the CPU cleanly after printing

Fully reproducible with:
nasm -f bin boot.asm -o boot.bin
qemu-system-i386 -drive format=raw,file=boot.bin

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

- Write a Print Loop (prints entire string instead of one letter at a time)
- Boot sector that loads and runs
- BIOS interrupt-based character output
- Clean CPU halt
- Git versioning from the start

### 🔜 Next Steps

- Switch from BIOS interrupts to direct VGA memory writes at 0xB8000
- Enter 32-bit protected mode
- Set up a Global Descriptor Table (GDT)
- Load and call a C kernel (kmain)
- Build a Makefile

### 📅 Later

- Keyboard driver
- Interrupt Descriptor Table (IDT)
- Memory paging
- Simple shell

---

## 📝 Versioning

- v0.1.x — previous experiments (scrapped, clean slate taken)
- v0.2.0 — minimal boot sector, prints to screen, clean repo
- v0.2.1 — print loop, prints full string using lodsb and jumps

---

## 📸 Screenshots

### v0.2.1 — Print loop working
![Boot print loop](screenshots/v0.2.0-boot-print-loop.png)

### v0.1.x — Previous experiments (scrapped)
![Minimal Kernel](screenshots/minimalkernelss.png)
![Clear Screen](screenshots/clearscreenss.png)

---

## 💬 About This Project

os-seed is a long-term learning project. I'm autistic and learn best by building
real things, so this repo documents my actual progression — every commit is a
working state I understand, not just code I copied.

The goal isn't to ship a production OS. The goal is to genuinely understand how
computers work from the ground up.
