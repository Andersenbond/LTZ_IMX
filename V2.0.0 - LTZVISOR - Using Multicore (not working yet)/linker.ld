/*OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")*/
/*OUTPUT_ARCH(arm)*/
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
	__bss_start = .;
	.bss : { *(.bss*) }
	__bss_end = .;

	. = 0x17900000;

	. = ALIGN(4);
	myvector_start = .;
	.myvector : { *(.myvector) }
	myvector_end = .;

	. = ALIGN(4);
	nsguest1_bin_start = .;
	.ns_guest1 : { *(.ns_guest1) }
	nsguest1_bin_end = .;
	nsguest_execution_address =.;

	. = ALIGN(4);
	nsguest2_bin_start = .;
	.ns_guest2 : { *(.ns_guest2) }
	nsguest2_bin_end = .;
	nsguest2_execution_address =.;
}
