ENTRY(_start)

SECTIONS
{
	. = 0x17800000;
	/*. = 0x00000000;*/
	/*. = ALIGN(4);*/
	.text : { *(.text) }

	. = ALIGN(4);
	.data : { *(.data) }

	. = ALIGN(4);
	__bss_start__ = .;
	.bss : { *(.bss*) }
	__bss_end__ = .;

	. = 0x17900000;
	.stack :
	{
		STACK_ADDR = . ;
	}
}
