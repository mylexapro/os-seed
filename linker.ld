ENTRY(start)

SECTIONS
{
	. = 0x7C00;

	.boot :
	{
		*(.boot*)
	}

	. = 0x8000;

	.text	: { *(.text*)	}
	.rodata	: { *(.rodata*)	}
	.data	: { *(.data*)	}
	.bss	: { *(.bss*) *(COMMON) }
}
