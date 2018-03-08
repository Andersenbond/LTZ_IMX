@ ------------------------------------------------------------------------------
@ ----------------------------------------------------------------------------

@--------------- last 5 bit of Program Status Register (PSR) -------------------
.equ Mode_USR, 0x10 @ User Mode
.equ Mode_FIQ, 0x11 @ Fast Interrupt Mode
.equ Mode_IRQ, 0x12 @ Interrupt Mode
.equ Mode_SVC, 0x13 @ Supervisor Mode
.equ Mode_ABT, 0x17 @ Abort Mode
.equ Mode_UND, 0x1B @ Undefined Mode
.equ Mode_SYS, 0x1F @ System Mode
.equ Mode_MON, 0x16 @ Monitor Mode

 @ ------------- 6th and 7th bit of Program Status Register (PSR) --------------
.equ I_Bit,    0x80 @ IRQ interrupts disabled
.equ F_Bit,    0x40 @ FIQ interrupts disabled

 @------------------------------ SCR Bits --------------------------------------
.equ NS_BIT,   0x1
.equ SCR_NS_BIT, 0x1
.equ SCR_FIQ_BIT,	0x4
.equ SCR_IRQ_BIT,	0x2
.equ SCR_HCR_BIT,	0x100

@ --------- memory reserved (in bytes) for stacks of different mode ------------
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


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@ ------------------------------------------------------------------------------
@ -------------------------- SET Non-Secure Bit Macro --------------------------
@ ------------------------------------------------------------------------------
  /**
   * SCR Non-Secure bit set (macro)
   *
   * @param
   * @retval
   */
  .macro SCR_NS_SET
  	push 	{r0}
  	mrc     p15, 0, r0, c1, c1, 0	@ Read SCR
  	orr	r0, r0, #SCR_NS_BIT	@ Enable NS bit
  	orr	r0, r0, #SCR_FIQ_BIT	@ Enable the route of FIQ in Monitor
  	mcr     p15, 0, r0, c1, c1, 0	@ Write SCR
  	pop 	{r0}
  .endm

@ ------------------------------------------------------------------------------
@ ------------------------ CLEAR Non-Secure Bit Macro --------------------------
@ ------------------------------------------------------------------------------

  /**
   * SCR Non-Secure bit clear (macro)
   *
   * @param
   * @retval
   */
  .macro SCR_NS_CLEAR
  	push 	{r0}
  	mrc     p15, 0, r0, c1, c1, 0	@ Read SCR
  	bic	r0, r0, #SCR_NS_BIT	@ Disable the NS bit
  	bic	r0, r0, #SCR_FIQ_BIT	@ Disable the route of FIQs in Monitor
  	mcr     p15, 0, r0, c1, c1, 0	@ Write SCR
  	pop 	{r0}
  .endm

@ ------------------------------------------------------------------------------
@ ----------------------- GET Non-Secure Stack Pointer -------------------------
@ ------------------------------------------------------------------------------
  /**
   * Get NS guest context's pointer (macro)
   *
   * @param
   * @retval	NS_guest context pointer
   */
  .macro GET_NS_WORLD_CONTEXT
    mrc p15, 0, r0, c13, c0, 4		@ Read PL1 only thread ID reg
    add r0, r0, #0               	@ Add offset
  .endm

@ ------------------------------------------------------------------------------
@ ------------------------ World Context Restore Macro -------------------------
@ ------------------------------------------------------------------------------
  /**
   * World context save (macro)
   *
   * @param	r0 = world context pointer
   *
   * @retval
   */
  .macro WORLD_CONTEXT_SAVE
  	mov	r4, r0
  	pop	{r0 - r3}
  	stmia	r4, {r0 - r3}
  	mov	r3, r4
  	add	r4, r4, #16
  	mov	r0, r4
  	pop	{r4, lr}
  	stmia	r0!, {r4-r12}
  	mrs	r1, spsr
  	stmia	r0!, {r1, lr}
  	/* Save SVC */
  	cps #Mode_SVC
  	mrs	 r1, spsr
  	stmia   r0!, {r1, r13, lr}
  	/* Save SYS */
  	cps #Mode_SYS
  	mrs	 r1, spsr
  	stmia   r0!, {r1,r13, lr}
  	/* Save ABORT */
  	cps #Mode_ABT
  	mrs	 r1, spsr
  	stmia   r0!, {r1, r13, lr}
  	/* Save UNDEF */
  	cps #Mode_UND
  	mrs	 r1, spsr
  	stmia   r0!, {r1, r13, lr}
  	/* Save IRQ */
  	cps #Mode_IRQ
  	mrs	 r1, spsr
  	stmia   r0!, {r1, r13, lr}
  	cps #Mode_MON
  .endm


@ ------------------------------------------------------------------------------
@ ------------------------ World Context Restore Macro -------------------------
@ ------------------------------------------------------------------------------
  /**
   *
   * World context restore (macro)
   * @param	r0 = world context pointer
   * @retval
   */
  .macro WORLD_CONTEXT_RESTORE
  	mov	r4, r0
  	ldmia 	r4!, {r0 - r3}
  	push 	{r0, r1}
  	mov 	r0, r4
  	ldmia	r0!, {r4 - r12}
  	ldmia	r0!, {r1, lr}
  	msr	spsr_cxsf, r1
  	/* Restore SVC */
  	cps 	#Mode_SVC
  	ldmia   r0!, {r1, r13, lr}
  	msr 	spsr_cxsf, r1
  	/* Restore SYS */
  	cps 	#Mode_SYS
  	ldmia   r0!, {r1,r13, lr}
  	msr 	spsr_cxsf, r1
  	/* Restore ABORT */
  	cps 	#Mode_ABT
  	ldmia	r0!, {r1, r13, lr}
  	msr	spsr_cxsf, r1
  	/* Restore UNDEF */
  	cps 	#Mode_UND
  	ldmia	r0!, {r1, r13, lr}
  	msr	spsr_cxsf, r1
  	/* Restore IRQ */
  	cps 	#Mode_IRQ
  	ldmia	r0!, {r1, r13, lr}
  	msr	spsr_cxsf, r1
  	cps 	#Mode_MON
  	pop	{r0, r1}
  .endm

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/*
* SMC Handler
*
* - Detect which world executed SMC saves state to appropriate stack restores
*   other worlds state switches world performs exception return
*/
.global smc_handler
smc_handler:

 @ --------------------------- Save Secure World -------------------------------
 @ --------------------------- Save MON/SYS state ------------------------------
 stmfd 	sp,{r0-r14}^	         @ Push SYS regs to monitor stack
 sub 	  sp, sp, #(15*4)        @ Point stack to the top
 mrs 	  r0,spsr				         @ Read the SPSR
 stmfd	sp, {r0,lr}		         @ Push SPSR_mon & lr_mon
 sub 	  sp, sp, #(2*4)         @ Update stack pointer
 mov	  r0, sp				         @ Save pointer to monitor stack

 @ --------------------------- Save FIQ state ----------------------------------
 cps    #Mode_FIQ
 stmfd 	r0,{r8-r13}			       @ Save all banked FIQ regs (R8-R14)
 sub 	  r0, r0, #(6*4)   	     @ Update stack pointer
 mrs 	  r1,spsr				         @ Read the SPSR_FIQ
 stmfd	r0, {r1,lr}			       @ Push SPSR_FIQ and lr_FIQ
 sub 	  r0, r0, #(2*4)   	     @ Update stack pointer

 cps    #Mode_MON
 mov 	  sp, r0

 @ --------------------------- Restore NS state --------------------------------
 ldr    r0, =NS_STACK_BASE	   @ Load save to pointer
 //GET_NS_WORLD_CONTEXT
 WORLD_CONTEXT_RESTORE
 SCR_NS_SET

 @ ------------------- Instruction Synchronization Barrier ---------------------
 @ flushes the pipeline in the processor, so that all instructions following the
 @ ISB are fetched from cache or memory, after the instruction has been completed.
 @ -----------------------------------------------------------------------------
 isb

 @ ---------------------- Data Synchronization Barrier -------------------------
 @   acts as a special kind of memory barrier. No instruction in program order
 @      after this instruction executes until this instruction completes.
 @ -----------------------------------------------------------------------------
 dsb

 @ ---------------- Return from exception (MON -> NS-SVC) ----------------------

 movs   pc, lr

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

/*
 * Monitor Initialization
 *
 * This is called the first time the Secure world wishes to transit to the
 * Normal world.
 *
 */
.global init_secure_monitor
init_secure_monitor:
push {r0-r3}

  @------------------------ Install Non-Secure Image ---------------------------
  ldr   r1, =ns_image
	str   r0, [r1]                @ Save NS-Image
	ldr   r0, =ltz_monitor			  @ Get address of Monitors vector table
	mcr   p15, 0, r0, c12, c0, 1  @ Write Monitor Vector Base Address Register

  pop {r0-r3}
  mov   r0, lr

  @--------------------------- Save Secure World -------------------------------
  @--------------------------- Save MON/SYS state ------------------------------
  cps   #Mode_MON
  mov   lr, r0
  stmfd sp, {r0-r14}^			     @ Push SYS regs to monitor stack
  sub 	sp, sp, #(15*4)        @ Point stack to the top
  mrs 	r0, CPSR				       @ Read the SPSR

  stmfd	sp, {r0 , lr}			     @ Push SPSR_mon & lr_mon
  sub 	sp, sp, #(2*4)         @ Update stack pointer
  mov	  r0, sp				         @ Save pointer to monitor stack

  @--------------------------- Save FIQ state ----------------------------------
  cps   #Mode_FIQ
  stmfd r0,{r8-r13}			       @ Save all banked FIQ regs (R8-R14)
  sub 	r0, r0, #(6*4)         @ Update stack pointer
  mrs 	r1,spsr				         @ Read the SPSR_FIQ

  stmfd	r0, {r1,lr}		 	       @ Push SPSR_FIQ and lr_FIQ
  sub 	r0, r0, #(2*4)         @ Update stack pointer

  cps   #Mode_MON
  mov 	sp, r0                 @ Update monitor SP

  @--------------------------- Prepare NS state --------------------------------
	@ Set up initial NS state stack pointer
	@ ----------------------------------------------------------------------------
	ldr r0, =NS_STACK_SP				 @ Get address of global
	ldr r1, =NS_STACK_LIMIT			 @ Get top of Normal state stack (assuming FD model)
	str r1, [r0]						     @ Save pointer

	@ Set up exception return information
	@ ----------------------------------------------------------------------------

	ldr lr, ns_image					   @ ns_image
	msr spsr_cxsf, #Mode_SVC		 @ Set SPSR to be SVC mode

	@ Switch to Normal world
	@ ----------------------------------------------------------------------------
	mrc p15, 0, r4, c1, c1, 0		 @ Read Secure Configuration Register data
	orr r4, #NS_BIT						   @ Set NS bit
	orr	r4, #SCR_FIQ_BIT	       @ set the route of FIQs in Monitor
	mcr p15, 0, r4, c1, c1, 0		 @ Write Secure Configuration Register data

	@ Clear general purpose registers
	@ ----------------------------------------------------------------------------
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

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/*
 * Monitor FIQ exception Handler
 *
 * This exception handler is called when is required a switch to the Secure World.
 * In this implementation of the ltzvisor this exception is made by the Timer.
 * Interruption.
 *
 */
@ ------------------------------------------------------------------------------
@ ------------------------------------------------------------------------------
.global AS_MON_FIQ_HDLR
 AS_MON_FIQ_HDLR:

  sub   lr, lr , #4
  push {r4,lr}
  push {r0-r3}
  @ ----------------------------------------------------------------------------
  @ ----------------------- START Handling Interrupt ---------------------------
  stmfd sp!, {lr}
  stmfd sp!, {r0-r12}
  bl    cfiq_interrupt_handler
  ldmfd sp!, {r0-r12}
  ldmfd sp!, {lr}
  @ ----------------------- END Handling Interrupt -----------------------------
  @ ----------------------------------------------------------------------------
  mrc   p15, 0, r0, c1, c1, 0		  @ Read Secure Configuration Register data
  bic   r0, r0, #NS_BIT						@ Clear NS bit
  bic	  r0, r0, #SCR_FIQ_BIT      @ Disable routing FIQ to Monitor
  mcr   p15, 0, r0, c1, c1, 0			@ Write Secure Configuration Register data
  @ ----------------------------------------------------------------------------
  @ --------------------- Save Non-Secure World Context ------------------------
  ldr   r0, =NS_STACK_BASE		    @ Load Non-Secure Stack Pointer
  //GET_NS_WORLD_CONTEXT
  WORLD_CONTEXT_SAVE              @ Save Non-Secure Context
  @ ----------------------------------------------------------------------------
  @ ---------------------- Restore Secure World Context ------------------------
  pop 	{r1-r2}				            @ Pop SPSR_FIQ and LR_FIQ
  mov 	r0, sp				            @ Update stack pointer
  @ -------------------------- Restore FIQ state -------------------------------
  cps 	#Mode_FIQ
  msr 	spsr,r1
  mov 	lr,r2
  ldmfd r0, {r8-r13}			        @ Restore all banked FIQ regs (R8-R14)
  add 	r0,r0,#(6*4)			        @ Update stack pointer
  @ -------------------------- Restore MON state -------------------------------
  cps 	#Mode_MON
  mov 	sp, r0
  /* Go S world */
  pop 	{r0-r1}
  msr 	spsr,r0
  mov 	lr,r1
  ldmfd sp, {r0-r14}^
  add 	sp,sp,#(15*4)

  @ ---------------- Return from exception (MON -> S_SVC) ----------------------

  movs	pc,lr
@ ------------------------------------------------------------------------------
@ ------------------------------ END HANDLER -----------------------------------
@ ------------------------------------------------------------------------------


@ ------------------------------------------------------------------------------
@ Space reserved for secure and on-secure stacks
@ ------------------------------------------------------------------------------

NS_STACK_BASE:
	.word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  .word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	NS_STACK_LIMIT:

S_STACK_BASE:
	.word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
S_STACK_LIMIT:

NS_STACK_SP:
	.word     0

S_STACK_SP:
	.word     0

FIQ_STACK_BASE:
  .word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
FIQ_STACK_LIMIT:

FIQ_STACK_SP:
  .word     0

ns_image :
	.word     0

@ ------------------------------------------------------------------------------
@ ------------------------------------------------------------------------------
@ ---------------------------------- END FILE-----------------------------------
@ ------------------------------------------------------------------------------
@ ------------------------------------------------------------------------------
