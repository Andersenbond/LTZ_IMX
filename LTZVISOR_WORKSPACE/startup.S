#include "inc/handlers"


/* last 5 bit of Program Status Register (PSR) */
.equ Mode_USR, 0x10 @ User Mode
.equ Mode_FIQ, 0x11 @ Fast Interrupt Mode
.equ Mode_IRQ, 0x12 @ Interrupt Mode
.equ Mode_SVC, 0x13 @ Supervisor Mode
.equ Mode_ABT, 0x17 @ Abort Mode
.equ Mode_UND, 0x1B @ Undefined Mode
.equ Mode_SYS, 0x1F @ System Mode
.equ Mode_MON, 0x16 @ Monitor Mode

/* 6th and 7th bit of Program Status Register (PSR) */
.equ I_Bit,    0x80 @ IRQ interrupts disabled
.equ F_Bit,    0x40 @ FIQ interrupts disabled




/** SCR Bits*/
.equ NS_BIT,   0x1
.equ SCR_NS_BIT, 0x1
.equ SCR_FIQ_BIT,	0x4
.equ SCR_IRQ_BIT,	0x2
.equ SCR_HCR_BIT,	0x100

/* memory reserved (in bytes) for stacks of different mode */
.equ Len_FIQ_Stack,  64
.equ Len_IRQ_Stack,  64
.equ Len_ABT_Stack,  64
.equ Len_UND_Stack,  64
.equ Len_SVC_Stack,  512
.equ Len_USR_Stack,  512

.equ Offset_FIQ_Stack, 0
.equ Offset_IRQ_Stack, Offset_FIQ_Stack + Len_FIQ_Stack
.equ Offset_ABT_Stack, Offset_IRQ_Stack + Len_IRQ_Stack
.equ Offset_UND_Stack, Offset_ABT_Stack + Len_ABT_Stack
.equ Offset_SVC_Stack, Offset_UND_Stack + Len_UND_Stack
.equ Offset_USR_Stack, Offset_SVC_Stack + Len_SVC_Stack

.code 32

.global _start
.global vectors
.global m_vectors
.global main

# entry of the bare metal program
_start:
	b reset
	/*
	ldr pc, UndefAddr
	ldr pc, SWIAddr
	ldr pc, PAbortAddr
	ldr pc, DAbortAddr
	ldr pc, ReservedAddr
	ldr pc, IRQAddr
	ldr pc, FIQAddr */

/*
UndefAddr:      .word UndefHandler
SWIAddr:        .word SWIHandler
PAbortAddr:     .word PAbortHandler
DAbortAddr:     .word DAbortHandler
ReservedAddr:   .word 0
IRQAddr:        .word IRQ_HDLR
FIQAddr:        .word FIQ_HDLR*/

# reset handler
.global reset
.align 4
reset:
	@bic sp, sp, #7 /* 8-byte alignment for ABI compliance */
	ldr sp, =STACK_ADDR
	ldr r0, =STACK_ADDR

	cps #Mode_MON
	ldr sp, =STACK_ADDR

	msr cpsr_c, #Mode_FIQ | I_Bit | F_Bit /* Disable interrupts*/
	sub sp, r0, #Offset_FIQ_Stack

	msr cpsr_c, #Mode_IRQ | I_Bit | F_Bit /* Disable interrupts */
	sub     sp, r0, #Offset_IRQ_Stack

	msr cpsr_c, #Mode_ABT | I_Bit | F_Bit /* Disable interrupts */
	sub sp, r0, #Offset_ABT_Stack

	msr cpsr_c, #Mode_UND | I_Bit | F_Bit
	sub sp, r0, #Offset_UND_Stack

	msr cpsr_c, #Mode_SVC | I_Bit | F_Bit /* Disable interrupts */
	sub sp, r0, #Offset_SVC_Stack

	// Set vector table (VBAR)
	push {r0}
	ldr	r0, =vectors
	mcr	p15, 0, r0, c12, c0, 0	@ Write VBA

	//Set monitor vector table (MVBAR)
  ldr	r0, =m_vectors
	mcr	p15, 0, r0, c12, c0, 1	@ Write MVBAR

	mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
	orr	r0, r0, #SCR_FIQ_BIT        @ Enable FIQ
	mcr p15, 0, r0, c1, c1, 0

	pop {r0}

	/* Branch Main */
	bl main
	b .
