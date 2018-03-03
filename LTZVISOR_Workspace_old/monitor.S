#include "inc/interrupt.h"

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

.global MON_ABT_HDLR
.global MON_IRQ_HDLR
.global cfiq_interrupt_handler


.align 8
.global monitor
monitor:
ldr     pc, .mreset_exception
ldr     pc, .mundefined_exception
ldr     pc, .smc_exception
ldr     pc, .mprefetch_abort_exception
ldr     pc, .mdata_abort_exception
ldr     pc, .mreserved_exception /* reserved vector */
ldr     pc, .mirq_exception
ldr     pc, .mfiq_exception
.word 0                     // extra word in the RAM vectors

.mreset_exception:
  .word     0
.mundefined_exception:
  .word     MON_UNDEFINED_HDLR
.smc_exception:
  .word     smc_handler2
.mprefetch_abort_exception:
  .word     MON_PREFECH_HDLR
.mdata_abort_exception:
  .word     MON_ABT_HDLR
.mreserved_exception:
  .word     0
.mirq_exception:
  .word     IRQ_HDLR
.mfiq_exception:
  .word     MON_FIQ2_HDLR2




/*
 * Monitor Initialization
 *
 * This is called the first time the Secure world wishes to
 * transit to the Normal world.
 */

.global init_secure_monitor
init_secure_monitor:
 	@ Install Secure Monitor
	@ ---------------------------------------------------------------------------------
  ldr r1, =ns_image					@ R1 is used
	str r0, [r1]
	ldr r0, =monitor					      @ Get address of Monitors vector table
	mcr p15, 0, r0, c12, c0, 1			@ Write Monitor Vector Base Address Register

  @ Save Secure state
	@ --------------------------------------------------------------------------------
	ldr    r0, =S_STACK_LIMIT		@ Get address of Secure state stack
	stmfd  r0!, {r4-r12}				@ Save general purpose registers
	@ ADD support for SPs
	mrs    r1, cpsr						  @ Also get a copy of the CPSR
	stmfd  r0!, {r1, lr}				@ Save CPSR and LR

  cps    #Mode_FIQ
  stmfd r0!, {r8-r13}
  mrs r1, cpsr
  stmfd r0!, {r1,lr}

	@ Switch to Monitor mode
	@ --------------------------------------------------------------------------------
  cps     #Mode_SVC
  @ Save Secure state stack pointer
	@ --------------------------------------------------------------------------------
	ldr r1, =S_STACK_SP				  @ Get address of global
	str r0, [r1]						    @ Save pointer


	@ Set up initial NS state stack pointer
	@ --------------------------------------------------------------------------------
	ldr r0, =NS_STACK_SP				@ Get address of global
	ldr r1, =NS_STACK_LIMIT			@ Get top of Normal state stack (assuming FD model)
	str r1, [r0]						    @ Save pointer


	@ Set up exception return information
	@ ------------------------------------
	@IMPORT  ns_image

	ldr lr, ns_image					   @ ns_image
	msr spsr_cxsf, #Mode_SVC			@ Set SPSR to be SVC mode

  cps    #Mode_MON					  @ Move to Monitor mode after saving Secure state
  @ Switch to Normal world
	@ -----------------------
	mrc p15, 0, r4, c1, c1, 0			@ Read Secure Configuration Register data
	orr r4, #NS_BIT						    @ Set NS bit
	orr	r4, #SCR_FIQ_BIT	        @ set the route of FIQs in Monitor
	mcr p15, 0, r4, c1, c1, 0			@ Write Secure Configuration Register data

  cps   #Mode_SVC
	@ Clear general purpose registers
	@ --------------------------------
	mov r0,  #0
	mov r1,  #0
	mov r2,  #0
	mov r3,  #0
	mov r4,  #0
	mov r5,  #0
	mov r6,  #0
	mov r7,  #0
	mov r8,  #0
	mov r9,  #0
	mov r10, #0
	mov r11, #0
	mov r12, #0

	movs pc, lr


////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////



  .global im_here
  .global show_regs
  .global MON_FIQ2_HDLR2
  MON_FIQ2_HDLR2:
    sub lr, lr , #4   // 17801b5c

    push {r0-r3}				@ R0-r3 contain args to be passed between worlds
    cps   #Mode_MON
                        @ Temporarily stack, so can be used as scratch regs
    mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
    bic r0, r0, #NS_BIT						  @ Clear NS bit
    bic	r0, r0, #SCR_FIQ_BIT        @ Disable FIQ
    mcr p15, 0, r0, c1, c1, 0				@ Write Secure Configuration Register data
    cps   #Mode_SVC

     push  {r1-r12, lr}

  //  bl readIntAck
  //  bl writeEOI
    bl FIQ_clear

    pop {r1-r12, lr}
//    bl show_regs
   	@ -----------------------------------------------------------------------------
  	ldr    r0, =NS_STACK_SP		      @ Load save to pointer
  	ldr    r1, =S_STACK_SP          @ Load restore from pointer
    ldr    r2, [r0]                 @ r2  <-- save to
   	ldr    r3, [r1]                 @ r3  <-- restore from

  	@ Save  World registers, SPSR and LR
  	@ -----------------------------------------------------------------------------
  	stmfd   r2!, {r4-r12}					 @ Save r4 to r12
  	mrs     r4,  spsr						   @ Also get a copy of the SPSR
  	stmfd   r2!, {r4, lr}					 @ Save original SPSR_svc and LR_svc

    cps     #Mode_FIQ
    stmfd   r2!, {r8-r13}          @ Also get a copy of the CPSR
    mrs     r4,  spsr
    stmfd   r2!, {r4,lr}           @ Save CPSR_fiq and LR_fiq

    str     r2, [r0]						   @ Save updated pointer back, r0 and r2 now free
    @ -----------------------------------------------------------------------------

     @ Restore other world registers, SPSR and LR
  	@ -----------------------------------------------------------------------------

    ldmfd   r3!, {r0, lr}					@ Get SPSR_fiq and LR_fiq
  	msr     spsr_cxsf, r0					    @ Restore SPSR_fiq
  	ldmfd   r3!, {r8-r13}					@ Restore registers r8 to r13

    cps     #Mode_SVC
    ldmfd   r3!, {r0, lr}         @ Get SPSR_svc and LR_svc from
    msr     spsr_cxsf, r0              @ Restore SPSR_svc
    ldmfd   r3!, {r4-r12}


   	str r3, [r1]	  					    @ Save updated pointer back, r1 and r3 now free

    //cps     #Mode_MON

  	@ Clear local monitor
  	clrex									        @ Not strictly required in this example, as not using LDR EX/STREX However, architecturally should execute CLREX on a context switch
    @ Now restore args (r0-r3)
    @ -----------------------------------------------------------------------------

    pop {r0-r3}
  	@ Perform exception return
  	@ -------------------------

  	//movs pc, lr                    @ Go to S_SVC
    bx lr






////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

.global smc_handler2
smc_handler2:
     push {r0-r3}				            @ R0-r3 contain args to be passed between worlds
     cps   #Mode_MON
     mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
     bic r0, r0, #NS_BIT						  @ Set NS bit
     orr	r0, r0, #SCR_FIQ_BIT        @ Disable FIQ
     mcr p15, 0, r0, c1, c1, 0				@ Write Secure Configuration Register data

     cps   #Mode_SVC
     @ Which world have we come from
    @ -----------------------------------------------------------------------------
    ldr  r0, =S_STACK_SP		        @ Load save to pointer
    ldr  r1, =NS_STACK_SP           @ Load restore from pointer
    ldr    r2, [r0]                 @ r2  <-- save to
    ldr    r3, [r1]                 @ r3  <-- restore from

    @ Save  World registers, SPSR and LR
    @ -----------------------------------------------------------------------------
    stmfd   r2!, {r4-r12}					 @ Save r4 to r12
    mrs     r4,  SPSR					     @ Also get a copy of the SPSR
    stmfd   r2!, {r4, lr}					 @ Save original SPSR_svc and LR_svc

    cps     #Mode_FIQ
    stmfd   r2!, {r8-r13}          @ Also get a copy of the CPSR
    mrs     r4,  SPSR
    stmfd   r2!, {r4,lr}           @ Save CPSR_fiq and LR_fiq

    str     r2, [r0]						   @ Save updated pointer back, r0 and r2 now free
    @ -----------------------------------------------------------------------------

    @ Restore other world registers, SPSR and LR
    @ -----------------------------------------------------------------------------

    ldmfd   r3!, {r0, lr}					 @ Get SPSR_fiq and LR_fiq from
    msr     spsr_cxsf, r0					     @ Restore SPSR_fiq
    ldmfd   r3!, {r8-r13}					 @ Restore registers r8 to r13

    cps #Mode_SVC
    ldmfd   r3!, {r0, lr}          @ Get SPSR_svc and LR_svc from
    msr     spsr_cxsf, r0              @ Restore SPSR_svc
    mov r2, r0
    ldmfd   r3!, {r4-r12}
    str r3, [r1]	  					    @ Save updated pointer back, r1 and r3 now free
    @ Clear local monitor
    clrex									        @ Not strictly required in this example, as not using LDR EX/STREX However, architecturally should execute CLREX on a context switch
    @ Now restore args (r0-r3)

    @ -----------------------------------------------------------------------------

    cps   #Mode_MON
    mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
    orr r0, r0, #NS_BIT						  @ Set NS bit
    orr	r0, r0, #SCR_FIQ_BIT        @ Enable FIQ
    mcr p15, 0, r0, c1, c1, 0				@ Write Secure Configuration Register data
    @ Perform exception return
    @ ----------------------------------------------------------------------------------
    cps   #Mode_SVC
    msr   spsr_cxsf, r2             @ Restore SPSR_svc
    pop {r0-r3}

    bx lr

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

.global asmIRQ_Handler
asmIRQ_Handler:
SUB     lr, lr, #4          @ Pre-adjust lr
SRSFD   sp!, #Mode_IRQ      @ Save lr and SPRS to IRQ mode stack
PUSH    {r0-r4, r12}        @ Save APCS corruptible registers to IRQ mode stack (and maintain 8 byte alignment)

@ Acknowledge the interrupt
BL      readIntAck
MOV     r4, r0

BL im_here
@
@ This example only uses (and enables) one.  At this point
@ you would normally check the ID, and clear the source.
@

@ Write end of interrupt reg
MOV     r0, r4
BL      writeEOI

POP     {r0-r4, r12}        @ Restore stacked APCS registers
MOV     r10, #1             @ Set exit flag so this CPU will leave holding pen after returning from interrupt
RFEFD   sp!                 @ Return from exception



@ ------------------------------------------------------------

.global  readIntAck
@ unsigned int readIntAck(void)
@ Returns the value of the Interrupt Acknowledge Register
readIntAck:
       MRC     p15, 4, r0, c15, c0, 0      @ Read periph base address
       LDR     r0, [r0, #0x010C]           @ Read the Interrupt Acknowledge Register  (ICCIAR)
       BX      lr


@ ------------------------------------------------------------

.global  writeEOI
@ void writeEOI(unsigned int ID)
@ Writes ID to the End Of Interrupt register
writeEOI:

       @ Get base address of private peripheral space
       MRC     p15, 4, r1, c15, c0, 0      @ Read periph base address
       STR     r0, [r1, #0x0110]           @ Write ID to the End of Interrupt register (ICCEOIR)
       BX      lr






@ ------------------------------------------------------------
@ Space reserved for secure and non-secure stacks
@ ------------------------------------------------------------
NS_STACK_BASE:
	.word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	NS_STACK_LIMIT:

S_STACK_BASE:
	.word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
S_STACK_LIMIT:

NS_STACK_SP:
	.word     0

S_STACK_SP:
	.word     0

ns_image :
	.word     0

FIQ_STACK:
  .word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
FIQ_STACK_LIMIT:
@.end
@ ------------------------------------------------------------
@ End
@ ------------------------------------------------------------
