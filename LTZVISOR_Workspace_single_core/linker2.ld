OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)
/*
OCRAM_LEN	= 256K;
OCRAM_ORG = 0x900000;
DDR_S_ORG		=	0x10000000;
DDR_NS_ORG =  0x14A00000 ;
DDR_LEN =	1024M;
DDR_S_LEN =		74M;
DDR_NS_LEN =	950M;
STACK_SIZE  =	48K;
L1_PAGE_TABLE_SIZE = 	16K;
RAM_VECTORS_SIZE =	72;
*/


MEMORY
{
    OCRAM 	 (rwx) : ORIGIN = 0x900000,   LENGTH = 256K
    DDR_NS   (rwx) : ORIGIN = 0x14A00000,   LENGTH = 950M
		DDR_S		 (rwx) : ORIGIN = 0x10000000,   LENGTH = 74M
}



SECTIONS
{
		. = 0x17800000;
	  _code_begin = .;

		.startup :
		{
			__startup_start = .;
					*(.startup)
			__startup_end   = .;
			}

	.text : ALIGN(8)
	{
			*(.text)
  }

	. = ALIGN(4);
	.data :
	{
	 *(.data)
	 }

	. = ALIGN(4);
	__bss_start = .;
	.bss :
	{
			*(.bss*)
			*(COMMON)
	}

	__bss_end = .;

	.heap (NOLOAD) : {
 			. = ALIGN(16);
 			_heap = .;
 			HeapBase = .;
 			PROVIDE(_heap_start = .);
 		. += 0x2000;
 			PROVIDE(_heap_end = .);
 			HeapLimit = .;
 	}
	
 	_SW_CODE_END = .;

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

	. = ALIGN(4);
	nsguest_vector_start = .;
	.ns_guest_vector : { *(.ns_guest_vector) }

}
