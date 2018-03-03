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


////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

.global MON_ABT_HDLR
.global ltz_monitor
.align 5
ltz_monitor:
	@ Monitor
	nop @ Reset      - not used by Monitor
	nop @ Undef      - not used by Monitor
	b   smc_handler
	nop @ Prefetch   - can by used by Monitor
	nop @ Data abort - can by used by Monitor
	nop @ RESERVED
	b MON_IRQ_HDLR  @ IRQ        - can by used by Monitor
	b AS_MON_FIQ_HDLR  @ FIQ        - can by used by Monitor

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
/*
 * SMC Handler
 *
 * - Detect which world executed SMC
 * - Saves state to appropriate stack
 * - Restores other worlds state
 * - Switches world
 * - Performs exception return
 */
 .global im_here
 .global smc_handler
 smc_handler:

      push {r0-r3}				            @ R0-r3 contain args to be passed between worlds
    //  bl im_here



    /*  cps   #Mode_MON
      mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
      orr r0, r0, #NS_BIT						  @ Set NS bit
      orr	r0, r0, #SCR_FIQ_BIT        @ Disable FIQ
      mcr p15, 0, r0, c1, c1, 0				@ Write Secure Configuration Register data
*/
    //  cps   #Mode_SVC

    /*  push {r0-r3, lr}
      mov r0, lr
      bl show_regs
      pop {r0-r3, lr}*/

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
     ldmfd   r3!, {r4-r12}

     str r3, [r1]	  					    @ Save updated pointer back, r1 and r3 now free
     @ Clear local monitor
     clrex									        @ Not strictly required in this example, as not using LDR EX/STREX However, architecturally should execute CLREX on a context switch
     @ Now restore args (r0-r3)
     pop {r0-r3}

     cps #Mode_SVC
     push {r1}
     mov r1, lr
     @ -----------------------------------------------------------------------------
     cps   #Mode_MON

     mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
     orr r0, r0, #NS_BIT						  @ Set NS bit
     orr	r0, r0, #SCR_FIQ_BIT        @ Enable FIQ
     mcr p15, 0, r0, c1, c1, 0				@ Write Secure Configuration Register data
     @ Perform exception return
     @ ----------------------------------------------------------------------------------
     mov lr, r1
     pop {r1}
     movs pc, lr


////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

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
	ldr r0, =ltz_monitor					      @ Get address of Monitors vector table
	mcr p15, 0, r0, c12, c0, 1			@ Write Monitor Vector Base Address Register

	@ Save Secure state
	@ ------------------
	ldr    r0, =S_STACK_LIMIT			@ Get address of Secure state stack
	stmfd  r0!, {r4-r12}				@ Save general purpose registers
	@ ADD support for SPs
	mrs    r1, spsr						  @ Also get a copy of the CPSR
	stmfd  r0!, {r1, lr}				@ Save CPSR and LR

  cps #Mode_FIQ
  stmfd r0!, {r8-r13}
  mrs r1, spsr
  stmfd r0!, {r1,lr}

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

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

  .global show_regs
  .global MON_TEST
  MON_TEST:
        sub lr, lr , #4   // 17801cd8
        stmfd sp!, {r4-r12}
        mrs  r1, SPSR_fiq						@ Also get a copy of the CPSR
        stmfd sp!, {r1, lr}         @ Save CPSR and LR
        bl cfiq_interrupt_handler
        ldmfd sp!, {r1, lr}
        msr SPSR_fiq, r1
        ldmfd sp!, {r4-r12}
        //bx lr
        movs pc, lr

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

   .global AS_MON_FIQ_HDLR
    AS_MON_FIQ_HDLR:

      push {r0-r3}				@ R0-r3 contain args to be passed between worlds

      /*Handle Interrupt */
      sub lr, lr , #4   // 17801cd8
      stmfd sp!, {r4-r12}
      mrs  r1, SPSR_fiq						@ Also get a copy of the CPSR
      stmfd sp!, {r1, lr}         @ Save CPSR and LR
      bl cfiq_interrupt_handler
      ldmfd sp!, {r1, lr}
      msr SPSR_fiq, r1
      ldmfd sp!, {r4-r12}

      cps   #Mode_MON
      mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
      bic r0, r0, #NS_BIT						  @ Clear NS bit
      bic	r0, r0, #SCR_FIQ_BIT        @ Disable FIQ
      mcr p15, 0, r0, c1, c1, 0				@ Write Secure Configuration Register data
      cps #Mode_SVC
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

    	@ -----------------------------------------------------------------------------
      ldmfd   r3!, {r2, lr}					@ Get SPSR_fiq and LR_fiq
    	msr     spsr_cxsf, r2					@ Restore SPSR_fiq
    	ldmfd   r3!, {r8-r13}					@ Restore registers r8 to r13


      cps     #Mode_SVC
      ldmfd   r3!, {r2, lr}         @ Get SPSR_svc and LR_svc from
      msr     spsr_cxsf, r2         @ Restore SPSR_svc
      ldmfd   r3!, {r4-r12}


     	str r3, [r1]	  					    @ Save updated pointer back, r1 and r3 now free


    	@ Clear local monitor
    	clrex									        @ Not strictly required in this example, as not using LDR EX/STREX However, architecturally should execute CLREX on a context switch
      @ Now restore args (r0-r3)
      @ -----------------------------------------------------------------------------
      pop {r0-r3}
      push {r0}
      mov r0, lr
    	@ Perform exception return
    	@ -------------------------
      cps   #Mode_MON
      mov lr, r0
      pop {r0}

      /*push {r0-r3, lr}
      mov r0, lr
      bl show_regs
      pop {r0-r3, lr}*/

      movs pc, lr
                              @ Go to S_SVC  - 17801e4c



////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

@.end
@ ------------------------------------------------------------
@ End
@ ------------------------------------------------------------
