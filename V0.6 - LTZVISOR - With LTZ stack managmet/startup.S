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
	b ltz_reset_handler


@ Reset Handler
.global ltz_reset_handler
.align 4
ltz_reset_handler:
	@ bic sp, sp, #7 /* 8-byte alignment for ABI compliance */
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
	/* Disable L1 Caches */
	//Set monitor vector table (MVBAR)
  ldr	r0, =ltz_monitor
	mcr	p15, 0, r0, c12, c0, 1	@ Write MVBAR

	mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
	orr	r0, r0, #SCR_FIQ_BIT        @ Route FIQ to Monitor
	mcr p15, 0, r0, c1, c1, 0

	pop {r0}

	/* Branch Main */
	bl main
	b .

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/


.global configure_virtual_memory
.func   configure_virtual_memory
configure_virtual_memory:
@------------------------ Disable MMU & L1 Caches ------------------------------
@ ------------------------------------------------------------------------------
	push {r0}
	mrc 	p15, 0, r0, c1, c0, 0		@ Read SCTLR register
	bic   r0, r0, #(0x1<<12) 			@ Instruction caching disabled (I Bit)
	bic   r0, r0, #(0x1<<11) 			@ Program flow prediction disabled (Z Bit)
	bic   r0, r0, #(0x1<<2 ) 			@ Data caching disabled (C Bit)
	bic   r0, r0, #(0x1<<0 ) 			@ MMU disabled (M Bit)
	mcr 	p15, 0, r0, c1, c0, 0		@ Write SCTLR register
@
@--------------------- Invalidate Instruction cache ----------------------------
@
	mov   r0, #0
	mcr   p15, 0, r0, c7, c5, 6   @ Invalidate entire branch predictor array
 	mov 	r0, #0
	mcr 	p15, 0, r0, c7, c5, 0 	@ Instruction Cache Invalidate All
	mov 	r0, #0
	mcr 	p15, 0, r0, c8, c3, 0		@ Invalidate entire unified TLB Inner Shareable
	pop   {r0}
	bx    lr
@ ------------------------------------------------------------------------------
@ ------------------------------- End Function ---------------------------------
  .endfunc
@ ------------------------------------------------------------------------------


/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

.global configure_coprocessor_registers
.func   configure_coprocessor_registers
configure_coprocessor_registers:
@ ------------------------------------------------------------------------------
@ ---------- Sets the Non-secure access permission for coprocessors ------------
	push  {r0}
	MRC   p15, 0, r0, c1, c1, 2  @ Read NSACR data
	bic   r0, r0, #(0x1<<18)     @ Non-secure state can modify the SMP bit
	bic 	r0, r0, #(0x1<<11)		 @ Non-secure state can access the coprocessor 11
	bic 	r0, r0, #(0x1<<10)     @ Non-secure state can access the coprocessor 10
	MCR   p15, 0, r0, c1, c1, 2  @ Write NSACR data

@ ---------------------------- Set Vector Table --------------------------------
	ldr	  r0, =vectors
	mcr	  p15, 0, r0, c12, c0, 0 @ Write to VBAR

@-------------------------- Set Monitor Vector Table ---------------------------
  ldr	  r0, =ltz_monitor
	mcr	  p15, 0, r0, c12, c0, 1   @ Write to MVBAR
	pop   {r0}
	bx    lr
@-------------------------------------------------------------------------------
@ ------------------------------- End Function ---------------------------------
	.endfunc
@ ------------------------------------------------------------------------------

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

.global configure_processor_stack
.func   configure_processor_stack
configure_processor_stack:
@ ------------------------------------------------------------------------------
	push {r0}
	ldr   sp, =STACK_ADDR				@ Get Stack Base Address (Defined in the ld file)
	ldr   r0, =STACK_ADDR
@ ---------------------------- Set MON Mode Stack ------------------------------
	cps   #Mode_MON
	ldr   sp, =STACK_ADDR
@ ------------------------------------------------------------------------------
@ ---------------------------- Set FIQ Mode Stack ------------------------------
	msr   cpsr_c, #(Mode_FIQ | I_Bit | F_Bit)   @ Disable interrupts
	sub   sp, r0, #Offset_FIQ_Stack							@ Update Stack Base Address
@ ------------------------------------------------------------------------------
@ ---------------------------- Set IRQ Mode Stack ------------------------------
	msr   cpsr_c, #(Mode_IRQ | I_Bit | F_Bit)   @ Disable interrupts
	sub   sp, r0, #Offset_IRQ_Stack							@ Update Stack Base Address
@ ------------------------------------------------------------------------------
@ ---------------------------- Set ABT Mode Stack ------------------------------
	msr   cpsr_c, #(Mode_ABT | I_Bit | F_Bit)   @ Disable interrupts
	sub   sp, r0, #Offset_ABT_Stack							@ Update Stack Base Address
@ ------------------------------------------------------------------------------
@ ---------------------------- Set UND Mode Stack ------------------------------
	msr   cpsr_c, #(Mode_UND | I_Bit | F_Bit)
	sub   sp, r0, #Offset_UND_Stack
@ ------------------------------------------------------------------------------
@ ---------------------------- Set SVC Mode Stack ------------------------------
	msr   cpsr_c, #(Mode_SVC | I_Bit | F_Bit)  @ Disable interrupts
	sub   sp, r0, #Offset_SVC_Stack						 @ Update Stack Base Address
 	pop   {r0}
	bx    lr
@-------------------------------------------------------------------------------
@ ------------------------------- End Function ---------------------------------
.endfunc
