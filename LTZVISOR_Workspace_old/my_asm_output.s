	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"interrupt.c"
	.comm	g_interrupt_handlers,640,4
	.comm	g_vectNum,16,4
	.text
	.align	2
	.global	disable_interrupt
	.syntax unified
	.arm
	.fpu softvfp
	.type	disable_interrupt, %function
disable_interrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r1, #0
	ldr	r0, [fp, #-8]
	bl	gic_enable_irq
	mov	r2, #0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	gic_set_cpu_target
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	disable_interrupt, .-disable_interrupt
	.align	2
	.global	enable_interrupt
	.syntax unified
	.arm
	.fpu softvfp
	.type	enable_interrupt, %function
enable_interrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-8]
	bl	gic_set_irq_priority
	mov	r1, #1
	ldr	r0, [fp, #-8]
	bl	gic_set_irq_security
	mov	r2, #1
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	gic_set_cpu_target
	mov	r1, #1
	ldr	r0, [fp, #-8]
	bl	gic_enable_irq
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	enable_interrupt, .-enable_interrupt
	.align	2
	.global	register_interrupt_routine
	.syntax unified
	.arm
	.fpu softvfp
	.type	register_interrupt_routine, %function
register_interrupt_routine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r1, .L4
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r1, r3, lsl #2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	g_interrupt_handlers
	.size	register_interrupt_routine, .-register_interrupt_routine
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Interrupt %d has been asserted\012\000"
	.text
	.align	2
	.global	default_interrupt_routine
	.syntax unified
	.arm
	.fpu softvfp
	.type	default_interrupt_routine, %function
default_interrupt_routine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L7
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L7+4
	bl	printk
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	g_vectNum
	.word	.LC0
	.size	default_interrupt_routine, .-default_interrupt_routine
	.align	2
	.global	enable_secure_interrupt
	.syntax unified
	.arm
	.fpu softvfp
	.type	enable_secure_interrupt, %function
enable_secure_interrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-8]
	bl	gic_set_irq_priority
	mov	r1, #0
	ldr	r0, [fp, #-8]
	bl	gic_set_irq_security
	mov	r2, #1
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	gic_set_cpu_target
	mov	r1, #1
	ldr	r0, [fp, #-8]
	bl	gic_enable_irq
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	enable_secure_interrupt, .-enable_secure_interrupt
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Fiq handler: ID: %d\012\000"
	.align	2
.LC2:
	.ascii	"SPURIOUS: %d\012\000"
	.text
	.align	2
	.global	FIQ_HDLR
	.syntax unified
	.arm
	.fpu softvfp
	.type	FIQ_HDLR, %function
FIQ_HDLR:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	bl	gic_read_irq_ack
	str	r0, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r0, .L14
	bl	printk
	ldr	r3, [fp, #-8]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L11
	ldr	r1, [fp, #-8]
	ldr	r0, .L14+4
	bl	printk
	ldr	r0, [fp, #-8]
	bl	gic_write_end_of_irq
	b	.L13
.L11:
	ldr	r0, [fp, #-8]
	bl	gic_write_end_of_irq
.L13:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LC1
	.word	.LC2
	.size	FIQ_HDLR, .-FIQ_HDLR
	.section	.rodata
	.align	2
.LC3:
	.ascii	"IRQ handler: ID: %d\012\000"
	.text
	.align	2
	.global	IRQ_HDLR
	.syntax unified
	.arm
	.fpu softvfp
	.type	IRQ_HDLR, %function
IRQ_HDLR:
	@ Interrupt Service Routine.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	sub	lr, lr, #4
	push	{r0, r1, r2, r3, fp, ip, lr}
	add	fp, sp, #24
	sub	sp, sp, #20
	bl	gic_read_irq_ack
	str	r0, [fp, #-32]
	ldr	r1, [fp, #-32]
	ldr	r0, .L22
	bl	printk
	ldr	r3, [fp, #-32]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L17
	ldr	r0, [fp, #-32]
	bl	gic_write_end_of_irq
	b	.L21
.L17:
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #10
	and	r3, r3, #7
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	str	r3, [fp, #-40]
	ldr	r1, .L22+4
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-40]
	str	r2, [r1, r3, lsl #2]
	ldr	r2, .L22+8
	ldr	r3, [fp, #-40]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L19
	ldr	r3, [fp, #-44]
	mov	lr, pc
	bx	r3
	b	.L20
.L19:
	bl	default_interrupt_routine
.L20:
	ldr	r2, .L22+4
	ldr	r3, [fp, #-36]
	mov	r1, #0
	str	r1, [r2, r3, lsl #2]
	ldr	r0, [fp, #-32]
	bl	gic_write_end_of_irq
.L21:
	nop
	sub	sp, fp, #24
	@ sp needed
	ldmfd	sp!, {r0, r1, r2, r3, fp, ip, pc}^
.L23:
	.align	2
.L22:
	.word	.LC3
	.word	g_vectNum
	.word	g_interrupt_handlers
	.size	IRQ_HDLR, .-IRQ_HDLR
	.section	.rodata
	.align	2
.LC4:
	.ascii	"In fiq default\012\000"
	.text
	.align	2
	.global	fiq_default_interrupt_routine
	.syntax unified
	.arm
	.fpu softvfp
	.type	fiq_default_interrupt_routine, %function
fiq_default_interrupt_routine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L25
	bl	printk
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LC4
	.size	fiq_default_interrupt_routine, .-fiq_default_interrupt_routine
	.section	.rodata
	.align	2
.LC5:
	.ascii	"UNDEFINED_HDLR\012\000"
	.text
	.align	2
	.global	UNDEFINED_HDLR
	.syntax unified
	.arm
	.fpu softvfp
	.type	UNDEFINED_HDLR, %function
UNDEFINED_HDLR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L28
	bl	printk
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L29:
	.align	2
.L28:
	.word	.LC5
	.size	UNDEFINED_HDLR, .-UNDEFINED_HDLR
	.section	.rodata
	.align	2
.LC6:
	.ascii	"ABT handler\012\000"
	.text
	.align	2
	.global	ABT_HDLR
	.syntax unified
	.arm
	.fpu softvfp
	.type	ABT_HDLR, %function
ABT_HDLR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L31
	bl	printk
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L32:
	.align	2
.L31:
	.word	.LC6
	.size	ABT_HDLR, .-ABT_HDLR
	.section	.rodata
	.align	2
.LC7:
	.ascii	"PREFETCH handler\012\000"
	.text
	.align	2
	.global	PREFECH_HDLR
	.syntax unified
	.arm
	.fpu softvfp
	.type	PREFECH_HDLR, %function
PREFECH_HDLR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L34
	bl	printk
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L35:
	.align	2
.L34:
	.word	.LC7
	.size	PREFECH_HDLR, .-PREFECH_HDLR
	.section	.rodata
	.align	2
.LC8:
	.ascii	"SWI handler\012\000"
	.text
	.align	2
	.global	SWI_HDLR
	.syntax unified
	.arm
	.fpu softvfp
	.type	SWI_HDLR, %function
SWI_HDLR:
	@ ARM Exception Handler.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, fp, ip, lr}
	add	fp, sp, #28
	ldr	r0, .L37
	bl	printk
	nop
	sub	sp, fp, #28
	@ sp needed
	ldmfd	sp!, {r0, r1, r2, r3, r4, fp, ip, pc}^
.L38:
	.align	2
.L37:
	.word	.LC8
	.size	SWI_HDLR, .-SWI_HDLR
	.section	.rodata
	.align	2
.LC9:
	.ascii	"RESERVED handler\012\000"
	.text
	.align	2
	.global	RESERVED_HDLR
	.syntax unified
	.arm
	.fpu softvfp
	.type	RESERVED_HDLR, %function
RESERVED_HDLR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L41
	bl	printk
.L40:
	b	.L40
.L42:
	.align	2
.L41:
	.word	.LC9
	.size	RESERVED_HDLR, .-RESERVED_HDLR
	.section	.rodata
	.align	2
.LC10:
	.ascii	"SUPURIO\012\000"
	.text
	.align	2
	.global	cfiq_interrupt_handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	cfiq_interrupt_handler, %function
cfiq_interrupt_handler:
	@ Fast Interrupt Service Routine.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	sub	lr, lr, #4
	push	{r0, r1, r2, r3, lr}
	add	fp, sp, #16
	sub	sp, sp, #20
	bl	gic_read_irq_ack
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L44
	ldr	r0, .L49
	bl	printk
	ldr	r0, [fp, #-24]
	bl	gic_write_end_of_irq
	b	.L48
.L44:
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #10
	and	r3, r3, #7
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	str	r3, [fp, #-32]
	ldr	r1, .L49+4
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	str	r2, [r1, r3, lsl #2]
	ldr	r2, .L49+8
	ldr	r3, [fp, #-32]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L46
	ldr	r3, [fp, #-36]
	mov	lr, pc
	bx	r3
	b	.L47
.L46:
	bl	default_interrupt_routine
.L47:
	ldr	r2, .L49+4
	ldr	r3, [fp, #-28]
	mov	r1, #0
	str	r1, [r2, r3, lsl #2]
	ldr	r0, [fp, #-24]
	bl	gic_write_end_of_irq
.L48:
	nop
	sub	sp, fp, #16
	@ sp needed
	ldmfd	sp!, {r0, r1, r2, r3, pc}^
.L50:
	.align	2
.L49:
	.word	.LC10
	.word	g_vectNum
	.word	g_interrupt_handlers
	.size	cfiq_interrupt_handler, .-cfiq_interrupt_handler
	.align	2
	.global	cfiq_interrupt_handler2
	.syntax unified
	.arm
	.fpu softvfp
	.type	cfiq_interrupt_handler2, %function
cfiq_interrupt_handler2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	bl	gic_read_irq_ack
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L52
	ldr	r0, .L57
	bl	printk
	ldr	r0, [fp, #-8]
	bl	gic_write_end_of_irq
	b	.L56
.L52:
	ldr	r3, [fp, #-8]
	lsr	r3, r3, #10
	and	r3, r3, #7
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	str	r3, [fp, #-16]
	ldr	r1, .L57+4
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r1, r3, lsl #2]
	ldr	r2, .L57+8
	ldr	r3, [fp, #-16]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L54
	ldr	r3, [fp, #-20]
	mov	lr, pc
	bx	r3
	b	.L55
.L54:
	bl	default_interrupt_routine
.L55:
	ldr	r2, .L57+4
	ldr	r3, [fp, #-12]
	mov	r1, #0
	str	r1, [r2, r3, lsl #2]
	ldr	r0, [fp, #-8]
	bl	gic_write_end_of_irq
.L56:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LC10
	.word	g_vectNum
	.word	g_interrupt_handlers
	.size	cfiq_interrupt_handler2, .-cfiq_interrupt_handler2
	.section	.rodata
	.align	2
.LC11:
	.ascii	"FIQ Handler Started\012\000"
	.text
	.align	2
	.global	ccfiq_interrupt_handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	ccfiq_interrupt_handler, %function
ccfiq_interrupt_handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r0, .L65
	bl	printk
	bl	gic_read_irq_ack
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L60
	ldr	r0, .L65+4
	bl	printk
	ldr	r0, [fp, #-8]
	bl	gic_write_end_of_irq
	b	.L64
.L60:
	ldr	r3, [fp, #-8]
	lsr	r3, r3, #10
	and	r3, r3, #7
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	str	r3, [fp, #-16]
	ldr	r1, .L65+8
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r1, r3, lsl #2]
	ldr	r2, .L65+12
	ldr	r3, [fp, #-16]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L62
	ldr	r3, [fp, #-20]
	mov	lr, pc
	bx	r3
	b	.L63
.L62:
	bl	default_interrupt_routine
.L63:
	ldr	r2, .L65+8
	ldr	r3, [fp, #-12]
	mov	r1, #0
	str	r1, [r2, r3, lsl #2]
	ldr	r0, [fp, #-8]
	bl	gic_write_end_of_irq
.L64:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	.LC11
	.word	.LC10
	.word	g_vectNum
	.word	g_interrupt_handlers
	.size	ccfiq_interrupt_handler, .-ccfiq_interrupt_handler
	.section	.rodata
	.align	2
.LC12:
	.ascii	"Cleaning FIQ: %d\012\000"
	.align	2
.LC13:
	.ascii	"DONE\012\000"
	.text
	.align	2
	.global	FIQ_clear
	.syntax unified
	.arm
	.fpu softvfp
	.type	FIQ_clear, %function
FIQ_clear:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r0, .L73
	bl	printk
	bl	gic_read_irq_ack
	str	r0, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r0, .L73+4
	bl	printk
	ldr	r3, [fp, #-8]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L68
	ldr	r0, .L73+8
	bl	printk
	ldr	r0, [fp, #-8]
	bl	gic_write_end_of_irq
	b	.L72
.L68:
	ldr	r3, [fp, #-8]
	lsr	r3, r3, #10
	and	r3, r3, #7
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	str	r3, [fp, #-16]
	ldr	r1, .L73+12
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r1, r3, lsl #2]
	ldr	r2, .L73+16
	ldr	r3, [fp, #-16]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L70
	ldr	r3, [fp, #-20]
	mov	lr, pc
	bx	r3
	b	.L71
.L70:
	bl	default_interrupt_routine
.L71:
	ldr	r2, .L73+12
	ldr	r3, [fp, #-12]
	mov	r1, #0
	str	r1, [r2, r3, lsl #2]
	ldr	r0, [fp, #-8]
	bl	gic_write_end_of_irq
	ldr	r0, .L73+20
	bl	printk
.L72:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	.LC11
	.word	.LC12
	.word	.LC10
	.word	g_vectNum
	.word	g_interrupt_handlers
	.word	.LC13
	.size	FIQ_clear, .-FIQ_clear
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
