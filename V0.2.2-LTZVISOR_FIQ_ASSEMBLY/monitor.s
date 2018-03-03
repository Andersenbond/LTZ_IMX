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
.global monitor
.align 5
monitor:
	@ Monitor
	nop @ Reset      - not used by Monitor
	nop @ Undef      - not used by Monitor
	b   smc_handler2
	nop @ Prefetch   - can by used by Monitor
	nop @ Data abort - can by used by Monitor
	nop @ RESERVED
	nop @ IRQ        - can by used by Monitor
	b  MON_FIQ2_HDLR2 //MON_FIQ_HDLR   @ monitor_fiq_handler @ FIQ        - can by used by Monitor

/*
 * SMC Handler
 *
 * - Detect which world executed SMC
 * - Saves state to appropriate stack
 * - Restores other worl  ds state
 * - Switches world
 * - Performs exception return
 */
.global smc_handler
smc_handler:
	push {r0-r3}				@ R0-r3 contain args to be passed between worlds
											@ Temporarily stack, so can be used as scratch regs
  bl im_here
  // go to N-Secure
  push 	{r0}
  mrc     p15, 0, r0, c1, c1, 0	@ Read SCR
  orr	    r0, r0, #SCR_NS_BIT	  @ Enable the NS bit
  orr	    r0, r0, #SCR_FIQ_BIT	@ Enable the route of FIQs in Monitor
  mcr     p15, 0, r0, c1, c1, 0	@ Write SCR
  pop 	{r0}
  ldr     r3, =S_STACK_SP   @ save to
  ldr     r2, =NS_STACK_SP  @ restore from
  b     CONTEXT_SWITCH



/*
 * Monitor Initialization
 *
 * This is called the first time the Secure world wishes to
 * transit to the Normal world.
 */

.global init_secure_monitor
init_secure_monitor:
	@ Install Secure Monitor
	@ -----------------------
	ldr r1, =ns_image					@ R1 is used
	str r0, [r1]
	ldr r0, =monitor					      @ Get address of Monitors vector table
	mcr p15, 0, r0, c12, c0, 1			@ Write Monitor Vector Base Address Register

	@ Save Secure state
	@ ------------------
	ldr    r0, =S_STACK_LIMIT			@ Get address of Secure state stack
	stmfd  r0!, {r4-r12}				@ Save general purpose registers
	@ ADD support for SPs
	mrs    r1, cpsr						  @ Also get a copy of the CPSR
	stmfd  r0!, {r1, lr}				@ Save CPSR and LR

	@ Switch to Monitor mode
	@ -----------------------
	cps    #Mode_MON					@ Move to Monitor mode after saving Secure state

	@ Save Secure state stack pointer
	@ --------------------------------
	ldr r1, =S_STACK_SP					@ Get address of global
	str r0, [r1]						@ Save pointer


	@ Set up initial NS state stack pointer
	@ --------------------------------------
	ldr r0, =NS_STACK_SP				@ Get address of global
	ldr r1, =NS_STACK_LIMIT			@ Get top of Normal state stack (assuming FD model)
	str r1, [r0]						    @ Save pointer


	@ Set up exception return information
	@ ------------------------------------
	@IMPORT  ns_image

	ldr lr, ns_image					   @ ns_image
	msr spsr_cxsf, #Mode_SVC			@ Set SPSR to be SVC mode

	@ Switch to Normal world
	@ -----------------------
	mrc p15, 0, r4, c1, c1, 0			@ Read Secure Configuration Register data
	orr r4, #NS_BIT						    @ Set NS bit
	orr	r4, #SCR_FIQ_BIT	        @ set the route of FIQs in Monitor
	mcr p15, 0, r4, c1, c1, 0			@ Write Secure Configuration Register data


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



.global show_regs
.global cfiq_interrupt_handler
.global monitor_fiq_handler
monitor_fiq_handler:
    sub	lr, lr, #4
  //  push	{r4, lr}
	  push	{r0 - r3}
    /*bl  gic_read_irq_ack          @ read fiq id (r0)
    ldr r2, =interrupt_ID
    str r0 , [r2]*/

    // go to Secure
    push 	{r0}
    mrc     p15, 0, r0, c1, c1, 0	@ Read SCR
    bic	    r0, r0, #SCR_NS_BIT	  @ Disable the NS bit
    bic	    r0, r0, #SCR_FIQ_BIT	@ Disable the route of FIQs in Monitor
    mcr     p15, 0, r0, c1, c1, 0	@ Write SCR
    pop 	{r0}

  /*  //SAVE_NS_CONTEXT
    ldr     r2,=interrupt_ID
    ldr     r0,[r2]   */
    //bl      cfiq_interrupt_handler @ handle the fiq and write end


    ldr     r2, =S_STACK_SP   @ restore from
    ldr     r3, =NS_STACK_SP  @ save to

CONTEXT_SWITCH:
    @ Save general purpose registers, SPSR, LR and SP
    stmfd   r2!,  {r4-r12}         @ Save r4 to r12
    mrs     r4,   spsr             @ Also get a copy of the SPSR_mon
    stmfd   r2!,  {r4, lr}         @ Save original SPSR_mon and LR_mon

    cps     #Mode_SVC              @ Switch into Supervisor mode temporarily
    MOV     r4, sp                 @ Temp for SP_svc
    stmfd   r2!, {r4, lr}          @ Save SP_svc and LR_svc
    str     r2, [r0]               @ Save updated pointer back, r0 and r2 now free


    @ Restore other world's registers, SPSR and LR
    @ ---------------------------------------------
    ldmfd   r3!, {r4, lr}               @ Restore SP_svc and LR_svc
    mov     sp, r4                      @ Temp for SP_svc
    cps     #Mode_MON                   @ Switch back into Monitor mode

    ldmfd   r3!, {r0, lr}               @ Get SPSR_mon and LR_mon (return address)
    msr     spsr_cxsf, r0               @ Restore SPSR_mon
    ldmfd   r3!, {r4-r12}               @ Restore registers r4 to r12

    str     r3, [r1]                    @ Save updated pointer back, r1 and r3 now free

    @ Clear local monitor
    @ --------------------
    CLREX

    @ Now restore args (r0-r3)
    @ -------------------------
    pop     {r0-r3}

    @ Perform exception return
    @ -------------------------
    movs    pc, lr


.global MON_FIQ2_HDLR2
MON_FIQ2_HDLR2:
      sub lr, lr , #4   // 17801c54

      stmfd sp!, {r4-r12}
      mrs  r1, SPSR_fiq						@ Also get a copy of the CPSR
      stmfd sp!, {r1, lr}         @ Save CPSR and LR

      cps #Mode_SVC

      mrs r1, SPSR_svc
      stmfd sp!, {r1, lr}

      bl cfiq_interrupt_handler

      ldmfd sp!, {r1,lr}
      msr SPSR_svc, r1

      cps #Mode_FIQ
      ldmfd sp!, {r1, lr}
      msr SPSR_fiq, r1
      ldmfd sp!, {r4-r12}

      movs pc, lr



////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

.global smc_handler2
smc_handler2:
	push {r0-r3}							@ R0-r3 contain args to be passed between worlds
											@ Temporarily stack, so can be used as scratch regs

	@ Which world have we come from
	@ ------------------------------
	mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
	tst r0, #NS_BIT							@ Is the NS bit set?
	eor r0, r0, #NS_BIT						@ Toggle NS bit
	eor	r0, r0, #SCR_FIQ_BIT
	mcr p15, 0, r0, c1, c1, 0				@ Write Secure Configuration Register data

	@ Load save to pointer
	@ ---------------------
	ldreq  r0, =S_STACK_SP					@ If NS bit set, was in Normal world.  So restore Secure state
	ldrne  r0, =NS_STACK_SP
	ldr    r2, [r0]

	@ Load restore from pointer
	@ --------------------------
	ldreq  r1, =NS_STACK_SP
	ldrne  r1, =S_STACK_SP
	ldr    r3, [r1]

	@ r2  <-- save to
	@ r3  <-- restore from

	@ Save general purpose registers, SPSR and LR
	@ --------------------------------------------
	stmfd   r2!, {r4-r12}					@ Save r4 to r12
	@ ADD SUPPORT FOR SPs
	mrs     r4, spsr						@ Also get a copy of the SPSR
	stmfd   r2!, {r4, lr}					@ Save original SPSR and LR

	str     r2, [r0]						@ Save updated pointer back, r0 and r2 now free

	@ Restore other world registers, SPSR and LR
	@ ---------------------------------------------
	ldmfd   r3!, {r0, lr}					@ Get SPSR and LR from
	@ ADD SUPPORT FOR SPs
	msr     spsr_cxsf, r0					@ Restore SPSR
	ldmfd   r3!, {r4-r12}					@ Restore registers r4 to r12

	str r3, [r1]							@ Save updated pointer back, r1 and r3 now free

	@ Clear local monitor
	@ --------------------
	clrex									@ Not strictly required in this example, as not using LDR EX/STREX
											@ However, architecturally should execute CLREX on a context switch

	@ Now restore args (r0-r3)
	@ -------------------------
	pop {r0-r3}

	@ Perform exception return
	@ -------------------------
	movs pc, lr








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

interrupt_ID:
  .word     0
FIQ_STACK__ :
.word 0x100
@.end
@ ------------------------------------------------------------
@ End
@ ------------------------------------------------------------
