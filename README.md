# os-seed  
A tiny 32‑bit operating system seed built from scratch — bootloader, protected mode, and a minimal kernel written in C and assembly.  
This project is my hands‑on journey into systems engineering, OS internals, and low‑level computer architecture.

---

## 🚀 Current Status
**Version:** v0.0.1 — “Protected Mode Online”

The OS currently:
- Boots from a custom 512‑byte boot sector
- Sets up a Global Descriptor Table (GDT)
- Switches the CPU into 32‑bit protected mode
- Jumps into a freestanding C kernel
- Writes directly to VGA text memory

This is the minimal foundation every real OS starts from.

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
