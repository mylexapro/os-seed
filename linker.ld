ENTRY(loader_start)

SECTIONS
{
    /* The bootloader will be loaded at 0x7E00 */
    . = 0x00007E00;

    .text :
    {
        *(.text*)
    }

    .rodata :
    {
        *(.rodata*)
    }

    .data :
    {
        *(.data*)
    }

    .bss :
    {
        *(.bss*)
        *(COMMON)
    }

    /* Kernel will be placed at 1MB */
    . = 0x00100000;

    .kernel :
    {
        *(.kernel*)
    }
}

