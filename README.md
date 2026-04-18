# os-seed
A tiny 32‑bit operating system seed built from scratch — bootloader, protected mode, and a minimal kernel written in C and assembly. This project is my hands‑on journey into systems engineering, OS internals, and low‑level computer architecture.

---

## 🚀 Current Status
**Version:** v0.1.1 — “Clear Screen Fix + Stable Bootloader”

The OS currently:
- Boots from a custom 512‑byte boot sector
- Sets up a Global Descriptor Table (GDT)
- Switches the CPU into 32‑bit protected mode
- Clears the VGA text buffer reliably (**fixed in v0.1.1**)
- Writes `"Hello from protected mode!"` directly to video memory
- Runs entirely as a **single‑stage bootloader** (no external loader or C kernel yet)
- Includes updated screenshots demonstrating the corrected clear‑screen behavior

This version is fully reproducible using:
nasm -f bin boot.asm -o boot.bin
qemu-system-i386 -drive format=raw,file=boot.bin

This patch release corrects the VGA clear routine and finalizes the single‑stage bootloader baseline.


---

## 🧠 What I'm Learning
- How CPUs boot and execute the first instruction
- BIOS vs. protected mode
- Memory segmentation and the GDT
- How to write freestanding C without a standard library
- How to control hardware directly (VGA text mode)
- How to structure a multi‑stage OS

This repo is intentionally public so I can show my progression over time.

---

## 🗂️ Project Structure
/boot/        → bootloader, GDT, protected mode switch  
/kernel/      → 32‑bit C kernel  
linker.ld     → custom linker script  
Makefile      → build + run with QEMU  
os-image.bin  → final bootable image  

---

## 🛠️ Build & Run
### Build:
make

### Run in QEMU:
make run

### Clean:
make clean

---

## 🧭 Roadmap
### ✔️ Completed
- Minimal boot sector
- GDT setup
- Protected mode switch
- VGA text output
- **VGA screen clear (new in v0.1.0)**
- GitHub versioning

### 🔜 Next Steps
- Introduce a minimal C kernel (`kmain`)
- Link assembly + C into a single bootable binary
- Implement disk sector loading
- Add a basic printf
- Keyboard driver
- Interrupt Descriptor Table (IDT)
- PIC remapping
- Paging
- Simple shell

---

## 📚 Long‑Term Goals
- Build a tiny but real OS kernel
- Learn systems engineering fundamentals
- Understand CPU architecture deeply
- Build a portfolio that shows real low‑level skill
- Eventually experiment with Rust kernel modules

---

## 📝 Versioning
This project uses semantic versioning, adapted for OS‑dev:

- v0.0.x → early bootloader + kernel experiments  
- v0.1.x → single‑stage bootloader improvements + transition to multi‑stage loader  
- v0.2.x → interrupts, drivers, memory management  
- v0.3.x → basic shell + userland experiments  

Current tags:
- `v0.0.1` — first protected‑mode boot  
- `v0.1.0` — stable single‑stage bootloader with VGA clear
- `v0.1.1` — clear screen fix + screenshot update


---

## 📸 Screenshots

![Minimal Kernel Screenshot](screenshots/minimalkernelss.png)
![Clear Screen Screenshot](screenshots/clearscreenss.png)

---

## 💬 About This Project
os-seed is a long‑term learning project focused on mastering low‑level systems engineering. I’m building this kernel from scratch to deepen my understanding of CPU architecture, memory models, bootloaders, and OS fundamentals.

This repository will continue to evolve as I add new features, explore deeper concepts, and document my progress as a systems engineer.
