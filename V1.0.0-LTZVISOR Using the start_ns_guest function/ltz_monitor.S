
/** CPU Operation Modes */
#define  USER_MODE		0x10
#define  FIQ_MODE		0x11
#define  IRQ_MODE		0x12
#define  SUPERVISOR_MODE	0x13
#define  MONITOR_MODE		0x16
#define  ABORT_MODE   		0x17
#define  HYPERVISOR_MODE   	0x1A	// Not Used
#define  UNDEFINED_MODE		0x1B
#define  SYSTEM_MODE		0x1F

/**
 * SCR Non-Secure bit set (macro)
 *
 * @param
 *
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

/**
 * SCR Non-Secure bit clear (macro)
 *
 * @param
 *
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

/**
 * Get NS guest context's pointer (macro)
 *
 * @param
 *
 * @retval	NS_guest context pointer
 */
.macro GET_NS_WORLD_CONTEXT
	ldr r0, =NS_STACK_SP
.endm

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
	cps #SUPERVISOR_MODE
	mrs	 r1, spsr
	stmia   r0!, {r1, r13, lr}
	/* Save SYS */
	cps #SYSTEM_MODE
	mrs	 r1, spsr
	stmia   r0!, {r1,r13, lr}
	/* Save ABORT */
	cps #ABORT_MODE
	mrs	 r1, spsr
	stmia   r0!, {r1, r13, lr}
	/* Save UNDEF */
	cps #UNDEFINED_MODE
	mrs	 r1, spsr
	stmia   r0!, {r1, r13, lr}
	/* Save IRQ */
	cps #IRQ_MODE
	mrs	 r1, spsr
	stmia   r0!, {r1, r13, lr}
	cps #MONITOR_MODE
.endm

/**
 * World context restore (macro)
 *
 * @param	r0 = world context pointer
 *
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
	cps 	#SUPERVISOR_MODE
	ldmia   r0!, {r1, r13, lr}
	msr 	spsr_cxsf, r1
	/* Restore SYS */
	cps 	#SYSTEM_MODE
	ldmia   r0!, {r1,r13, lr}
	msr 	spsr_cxsf, r1
	/* Restore ABORT */
	cps 	#ABORT_MODE
	ldmia	r0!, {r1, r13, lr}
	msr	spsr_cxsf, r1
	/* Restore UNDEF */
	cps 	#UNDEFINED_MODE
	ldmia	r0!, {r1, r13, lr}
	msr	spsr_cxsf, r1
	/* Restore IRQ */
	cps 	#IRQ_MODE
	ldmia	r0!, {r1, r13, lr}
	msr	spsr_cxsf, r1
	cps 	#MONITOR_MODE
	pop	{r0, r1}
.endm

/**
 * Exception return emulation (macro)
 *
 * @param
 *
 * @retval
 */
.macro exception_return_arg
	ldmfd	sp!, {r1}
	msr	spsr, r1
	push	{r1}
	mov	r1, #0
	dsb
	pop	{r1}
	ldmfd	sp!, {r1-r12, pc}^
.endm

/**
 * C function call prolog (macro)
 *
 * @param
 *
 * @retval
 */
.macro call_c_function_arg func_name
	stmfd   sp!, {r1-r12, lr}
	mrs	r4, spsr
	stmfd   sp!, {r4}
	bl	\func_name
.endm




/**
 * Monitor SMC handler
 *
 * @param
 *
 * @retval
 */
.globl _mon_smc_handler
	/** Monitor - SMC handler */
_mon_smc_handler:
	cmn	r0, #0
	blt	board_smc
	cmp 	r0, #LTZVISOR_SCHED_SYSCALL
	beq	_mon_scheduler
	bx	lr

/**
 * Monitor FIQ handler
 *
 * @param
 *
 * @retval
 */
.globl _mon_fiq_handler
	/** Monitor - FIQ handler */
_mon_fiq_handler:
	sub	lr, lr, #4			@ Adjust LR
	push	{r4, lr}
	push	{r0 - r3}
	/* ACK FIQ */
	mrc 	p15,4,r0,c15,c0,0		@ Read Periph Base Addr
	add 	r0,r0, #0x0100			@ Add GIC interface offset (A9)
	ldr 	r1,[r0,#_ASM_GIC_INT_ID]	@ Get interrupt ID
	ldr 	r2,=interrupt
	str 	r1,[r2]
	ldr 	r0,[r0,#0x0C]			@ ACK FIQ

	/* Save NS context */
	SCR_NS_CLEAR				@ Disable NS bit and route FIQs in mon
	GET_NS_WORLD_CONTEXT
	WORLD_CONTEXT_SAVE
	/* Handling FIQ */
	ldr 	r2,=interrupt
	ldr 	r0,[r2]
	//bl 	ttc_interrupt_clear		/* FIXME - supposing always ttc_isr */
	//bl 	fiq_handler			/* FIXME - supposing always ttc_isr */
	ldr 	r2,=interrupt
	ldr 	r0,[r2]
	ldr 	r1,=0x00
	//bl 	interrupt_clear
	/* Restore FIQ state */
	pop 	{r1-r2}				@ Pop SPSR_FIQ and LR_FIQ
	mov 	r0, sp				@ Update stack pointer
	cps 	#FIQ_MODE
	msr 	spsr,r1
	mov 	lr,r2
	ldmfd 	r0, {r8-r13}			@ Restore all banked FIQ regs (R8-R14)
	add 	r0,r0,#(6*4)			@ Update stack pointer
	/* Get back to MON */
	cps 	#MONITOR_MODE
	mov 	sp,r0
	/* Go S world */
	pop 	{r0-r1}
	msr 	spsr,r0
	mov 	lr,r1
	ldmfd 	sp, {r0-r14}^
	add 	sp,sp,#(15*4)
	movs	pc,lr				@ Return from exception (MON -> S_SVC)

/**
 *
 *
 * @param
 *
 * @retval
 */
board_smc:
	call_c_function_arg board_handler
	exception_return_arg

/**
 * Monitor scheduler - schedule NS_guest
 *
 * @param
 *
 * @retval
 */
.globl _mon_scheduler
_mon_scheduler:
	stmfd 	sp,{r0-r14}^			@ Push SYS regs to monitor stack
	sub 	sp, sp, #(15*4)      		@ Point stack to the top
	mrs 	r0,spsr				@ Read the SPSR
	stmfd	sp, {r0,lr}			@ Push SPSR_mon & lr_mon
	sub 	sp, sp, #(2*4)      		@ Update stack pointer
	/* Save FIQ state */
	mov	r0, sp				@ Save pointer to monitor stack
	cps #FIQ_MODE
	stmfd 	r0,{r8-r13}			@ Save all banked FIQ regs (R8-R14)
	sub 	r0, r0, #(6*4)      		@ Update stack pointer
	mrs 	r1,spsr				@ Read the SPSR_FIQ
	stmfd	r0, {r1,lr}			@ Push SPSR_FIQ and lr_FIQ
	sub 	r0, r0, #(2*4)      		@ Update stack pointer
	/* Get back to MON */
	cps #MONITOR_MODE
	mov 	sp, r0
	/* Restore NS context */
	GET_NS_WORLD_CONTEXT
	WORLD_CONTEXT_RESTORE
	/* Set NS bit and go NS world */
	SCR_NS_SET
	isb
	dsb
	movs    pc, lr				@ Return from exception (MON -> NS_SVC)
