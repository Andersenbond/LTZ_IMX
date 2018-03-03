.text
    .global _start
    .global IRQ_HDLR
    .global FIQ_HDLR
    .global ABT_HDLR
    .global SWI_HDLR
    .global im_here
    .global PREFECH_HDLR
    .global RESERVED_HDLR
    .global UNDEFINED_HDLR

    // chosen because Branch instruction only has a range of 32 MB relative to the pc
    .align 8
    .global vectors
vectors:
    ldr     pc, .reset_exception
    ldr     pc, .undefined_exception
    ldr     pc, .swi_exception
    ldr     pc, .prefetch_abort_exception
    ldr     pc, .data_abort_exception
    ldr     pc, .reserved_exception /* reserved vector */
    ldr     pc, .irq_exception
    ldr     pc, .fiq_exception
    .word 0                     // extra word in the RAM vectors

.reset_exception:
    .word     _start
.undefined_exception:
    .word     UNDEFINED_HDLR
.swi_exception:
    .word     SWI_HDLR
.prefetch_abort_exception:
    .word     PREFECH_HDLR
.data_abort_exception:
    .word     ABT_HDLR
.reserved_exception:
    .word     RESERVED_HDLR
.irq_exception:
    .word     IRQ_HDLR
.fiq_exception:
    .word     FIQ_HDLR



.global FIQ_HDLR2
FIQ_HDLR2:
    sub	lr, lr, #4			          @ Adjust LR
    push	{r4, lr}
    push	{r0 - r3}
    /* ACK FIQ */
    mrc 	p15,4,r0,c15,c0,0		    @ Read Periph Base Addr
    add 	r0,r0, #0x0100			    @ Add GIC interface offset (A9)
    ldr 	r1,[r0,#0x0C]	          @ Get interrupt ID by reading gicc->IAR
    ldr 	r2,=FIQ_interruptID     @ get the varible address
    str 	r1,[r2]                 @ Store r1 to variableIAR
    ldr 	r0,[r0,#0x0C]			      @ ACK FIQ

    /* Save NS context */
    //SCR_NS_CLEAR				        @ Disable NS bit and route FIQs in mon
    //GET_NS_WORLD_CONTEXT
    //WORLD_CONTEXT_SAVE
    /* Handling FIQ */
    //ldr 	r2,=FIQ_interruptID
    //ldr 	r0,[r2]
    //bl 	fiq_handler			        /* FIXME - supposing always ttc_isr */

    ldr 	r2,=FIQ_interruptID
    ldr 	r0,[r2]
    ldr 	r1,=0x00
    bl 	gic_write_end_of_irq
    bl  im_here
    /* Restore FIQ state */
    /*
    pop 	{r1-r2}				           @ Pop SPSR_FIQ and LR_FIQ
    //mov 	r0, sp				         @ Update stack pointer
    mov   lr
    */

    pop	  {r4 , lr}
    pop	  {r0 - r3}
    bx lr
    //movs pc, lr
    //b  smc_handler


  //  .word     FIQ_HDLR


__reserved_exception:
  b __reserved_exception




  .data
  FIQ_interruptID:
  .word 0
  mychar:
  .byte  0x01
