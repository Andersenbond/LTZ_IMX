
ltzvisor.elf:     file format elf32-littlearm


Disassembly of section .text:

17800000 <_start>:
17800000:	ea000002 	b	17800010 <reset>
17800004:	e1a00000 	nop			; (mov r0, r0)
17800008:	e1a00000 	nop			; (mov r0, r0)
1780000c:	e1a00000 	nop			; (mov r0, r0)

17800010 <reset>:
17800010:	e59fd05c 	ldr	sp, [pc, #92]	; 17800074 <reset+0x64>
17800014:	e59f0058 	ldr	r0, [pc, #88]	; 17800074 <reset+0x64>
17800018:	f1020016 	cps	#22
1780001c:	e59fd050 	ldr	sp, [pc, #80]	; 17800074 <reset+0x64>
17800020:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
17800024:	e240d000 	sub	sp, r0, #0
17800028:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
1780002c:	e240d040 	sub	sp, r0, #64	; 0x40
17800030:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
17800034:	e240d080 	sub	sp, r0, #128	; 0x80
17800038:	e321f0db 	msr	CPSR_c, #219	; 0xdb
1780003c:	e240d0c0 	sub	sp, r0, #192	; 0xc0
17800040:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
17800044:	e240dc01 	sub	sp, r0, #256	; 0x100
17800048:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
1780004c:	e59f0024 	ldr	r0, [pc, #36]	; 17800078 <reset+0x68>
17800050:	ee0c0f10 	mcr	15, 0, r0, cr12, cr0, {0}
17800054:	e59f0020 	ldr	r0, [pc, #32]	; 1780007c <reset+0x6c>
17800058:	ee0c0f30 	mcr	15, 0, r0, cr12, cr0, {1}
1780005c:	ee110f11 	mrc	15, 0, r0, cr1, cr1, {0}
17800060:	e3800004 	orr	r0, r0, #4
17800064:	ee010f11 	mcr	15, 0, r0, cr1, cr1, {0}
17800068:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
1780006c:	eb00075d 	bl	17801de8 <main>
17800070:	eafffffe 	b	17800070 <reset+0x60>
17800074:	17900000 	ldrne	r0, [r0, r0]
17800078:	17802d00 	strne	r2, [r0, r0, lsl #26]
1780007c:	17802e00 	strne	r2, [r0, r0, lsl #28]

17800080 <vsprintk>:
17800080:	e92d4800 	push	{fp, lr}
17800084:	e28db004 	add	fp, sp, #4
17800088:	e24dd088 	sub	sp, sp, #136	; 0x88
1780008c:	e50b0080 	str	r0, [fp, #-128]	; 0xffffff80
17800090:	e50b1084 	str	r1, [fp, #-132]	; 0xffffff7c
17800094:	e50b2088 	str	r2, [fp, #-136]	; 0xffffff78
17800098:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
1780009c:	e50b3008 	str	r3, [fp, #-8]
178000a0:	e3a01c01 	mov	r1, #256	; 0x100
178000a4:	e51b0080 	ldr	r0, [fp, #-128]	; 0xffffff80
178000a8:	eb000650 	bl	178019f0 <strnlen>
178000ac:	e50b000c 	str	r0, [fp, #-12]
178000b0:	ea0001f5 	b	1780088c <vsprintk+0x80c>
178000b4:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
178000b8:	e5d33000 	ldrb	r3, [r3]
178000bc:	e3530025 	cmp	r3, #37	; 0x25
178000c0:	0a00000e 	beq	17800100 <vsprintk+0x80>
178000c4:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
178000c8:	e5d33000 	ldrb	r3, [r3]
178000cc:	e353000a 	cmp	r3, #10
178000d0:	0a00000a 	beq	17800100 <vsprintk+0x80>
178000d4:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
178000d8:	e5d33000 	ldrb	r3, [r3]
178000dc:	e3530009 	cmp	r3, #9
178000e0:	0a000006 	beq	17800100 <vsprintk+0x80>
178000e4:	e51b3008 	ldr	r3, [fp, #-8]
178000e8:	e2832001 	add	r2, r3, #1
178000ec:	e50b2008 	str	r2, [fp, #-8]
178000f0:	e51b2084 	ldr	r2, [fp, #-132]	; 0xffffff7c
178000f4:	e5d22000 	ldrb	r2, [r2]
178000f8:	e5c32000 	strb	r2, [r3]
178000fc:	ea0001df 	b	17800880 <vsprintk+0x800>
17800100:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
17800104:	e5d33000 	ldrb	r3, [r3]
17800108:	e3530025 	cmp	r3, #37	; 0x25
1780010c:	1a0001c0 	bne	17800814 <vsprintk+0x794>
17800110:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
17800114:	e2833001 	add	r3, r3, #1
17800118:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
1780011c:	e3a03000 	mov	r3, #0
17800120:	e50b3010 	str	r3, [fp, #-16]
17800124:	e3a03001 	mov	r3, #1
17800128:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
1780012c:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
17800130:	e5d33000 	ldrb	r3, [r3]
17800134:	e3530030 	cmp	r3, #48	; 0x30
17800138:	1a00000a 	bne	17800168 <vsprintk+0xe8>
1780013c:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
17800140:	e2833001 	add	r3, r3, #1
17800144:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
17800148:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
1780014c:	e2832001 	add	r2, r3, #1
17800150:	e50b2084 	str	r2, [fp, #-132]	; 0xffffff7c
17800154:	e5d33000 	ldrb	r3, [r3]
17800158:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
1780015c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17800160:	e2433030 	sub	r3, r3, #48	; 0x30
17800164:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
17800168:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
1780016c:	e5d33000 	ldrb	r3, [r3]
17800170:	e353006c 	cmp	r3, #108	; 0x6c
17800174:	1a000003 	bne	17800188 <vsprintk+0x108>
17800178:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
1780017c:	e2833001 	add	r3, r3, #1
17800180:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
17800184:	e320f000 	nop	{0}
17800188:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
1780018c:	e5d33000 	ldrb	r3, [r3]
17800190:	e3530064 	cmp	r3, #100	; 0x64
17800194:	0a00007d 	beq	17800390 <vsprintk+0x310>
17800198:	e3530064 	cmp	r3, #100	; 0x64
1780019c:	ca00000b 	bgt	178001d0 <vsprintk+0x150>
178001a0:	e353000a 	cmp	r3, #10
178001a4:	0a00018a 	beq	178007d4 <vsprintk+0x754>
178001a8:	e353000a 	cmp	r3, #10
178001ac:	ca000002 	bgt	178001bc <vsprintk+0x13c>
178001b0:	e3530009 	cmp	r3, #9
178001b4:	0a00017a 	beq	178007a4 <vsprintk+0x724>
178001b8:	ea000198 	b	17800820 <vsprintk+0x7a0>
178001bc:	e3530025 	cmp	r3, #37	; 0x25
178001c0:	0a000170 	beq	17800788 <vsprintk+0x708>
178001c4:	e3530063 	cmp	r3, #99	; 0x63
178001c8:	0a000162 	beq	17800758 <vsprintk+0x6d8>
178001cc:	ea000193 	b	17800820 <vsprintk+0x7a0>
178001d0:	e3530073 	cmp	r3, #115	; 0x73
178001d4:	0a000144 	beq	178006ec <vsprintk+0x66c>
178001d8:	e3530073 	cmp	r3, #115	; 0x73
178001dc:	ca000004 	bgt	178001f4 <vsprintk+0x174>
178001e0:	e3530069 	cmp	r3, #105	; 0x69
178001e4:	0a000069 	beq	17800390 <vsprintk+0x310>
178001e8:	e353006f 	cmp	r3, #111	; 0x6f
178001ec:	0a0000e1 	beq	17800578 <vsprintk+0x4f8>
178001f0:	ea00018a 	b	17800820 <vsprintk+0x7a0>
178001f4:	e3530075 	cmp	r3, #117	; 0x75
178001f8:	0a000062 	beq	17800388 <vsprintk+0x308>
178001fc:	e3530078 	cmp	r3, #120	; 0x78
17800200:	1a000186 	bne	17800820 <vsprintk+0x7a0>
17800204:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
17800208:	e2833004 	add	r3, r3, #4
1780020c:	e50b3088 	str	r3, [fp, #-136]	; 0xffffff78
17800210:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
17800214:	e2433004 	sub	r3, r3, #4
17800218:	e5933000 	ldr	r3, [r3]
1780021c:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
17800220:	e3a03008 	mov	r3, #8
17800224:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
17800228:	e3a03020 	mov	r3, #32
1780022c:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
17800230:	e3a03000 	mov	r3, #0
17800234:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
17800238:	e3a03000 	mov	r3, #0
1780023c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
17800240:	e3a03000 	mov	r3, #0
17800244:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
17800248:	e3a03000 	mov	r3, #0
1780024c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
17800250:	ea000047 	b	17800374 <vsprintk+0x2f4>
17800254:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
17800258:	e2833001 	add	r3, r3, #1
1780025c:	e1a03103 	lsl	r3, r3, #2
17800260:	e51b2058 	ldr	r2, [fp, #-88]	; 0xffffffa8
17800264:	e0423003 	sub	r3, r2, r3
17800268:	e51b2050 	ldr	r2, [fp, #-80]	; 0xffffffb0
1780026c:	e1a03332 	lsr	r3, r2, r3
17800270:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
17800274:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
17800278:	e203300f 	and	r3, r3, #15
1780027c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
17800280:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
17800284:	e3530000 	cmp	r3, #0
17800288:	0a000001 	beq	17800294 <vsprintk+0x214>
1780028c:	e3a03001 	mov	r3, #1
17800290:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
17800294:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
17800298:	e3530000 	cmp	r3, #0
1780029c:	1a000004 	bne	178002b4 <vsprintk+0x234>
178002a0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
178002a4:	e2632008 	rsb	r2, r3, #8
178002a8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
178002ac:	e1520003 	cmp	r2, r3
178002b0:	8a00002c 	bhi	17800368 <vsprintk+0x2e8>
178002b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
178002b8:	e3530000 	cmp	r3, #0
178002bc:	ba000006 	blt	178002dc <vsprintk+0x25c>
178002c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
178002c4:	e3530009 	cmp	r3, #9
178002c8:	ca000003 	bgt	178002dc <vsprintk+0x25c>
178002cc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
178002d0:	e2833030 	add	r3, r3, #48	; 0x30
178002d4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
178002d8:	ea00001c 	b	17800350 <vsprintk+0x2d0>
178002dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
178002e0:	e243300a 	sub	r3, r3, #10
178002e4:	e3530005 	cmp	r3, #5
178002e8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
178002ec:	ea000017 	b	17800350 <vsprintk+0x2d0>
178002f0:	17800308 	strne	r0, [r0, r8, lsl #6]
178002f4:	17800314 	usada8ne	r0, r4, r3, r0
178002f8:	17800320 	strne	r0, [r0, r0, lsr #6]
178002fc:	1780032c 	strne	r0, [r0, ip, lsr #6]
17800300:	17800338 			; <UNDEFINED> instruction: 0x17800338
17800304:	17800344 	strne	r0, [r0, r4, asr #6]
17800308:	e3a03061 	mov	r3, #97	; 0x61
1780030c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
17800310:	ea00000e 	b	17800350 <vsprintk+0x2d0>
17800314:	e3a03062 	mov	r3, #98	; 0x62
17800318:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
1780031c:	ea00000b 	b	17800350 <vsprintk+0x2d0>
17800320:	e3a03063 	mov	r3, #99	; 0x63
17800324:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
17800328:	ea000008 	b	17800350 <vsprintk+0x2d0>
1780032c:	e3a03064 	mov	r3, #100	; 0x64
17800330:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
17800334:	ea000005 	b	17800350 <vsprintk+0x2d0>
17800338:	e3a03065 	mov	r3, #101	; 0x65
1780033c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
17800340:	ea000002 	b	17800350 <vsprintk+0x2d0>
17800344:	e3a03066 	mov	r3, #102	; 0x66
17800348:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
1780034c:	e320f000 	nop	{0}
17800350:	e51b3008 	ldr	r3, [fp, #-8]
17800354:	e2832001 	add	r2, r3, #1
17800358:	e50b2008 	str	r2, [fp, #-8]
1780035c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
17800360:	e6ef2072 	uxtb	r2, r2
17800364:	e5c32000 	strb	r2, [r3]
17800368:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
1780036c:	e2833001 	add	r3, r3, #1
17800370:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
17800374:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
17800378:	e51b3054 	ldr	r3, [fp, #-84]	; 0xffffffac
1780037c:	e1520003 	cmp	r2, r3
17800380:	baffffb3 	blt	17800254 <vsprintk+0x1d4>
17800384:	ea000125 	b	17800820 <vsprintk+0x7a0>
17800388:	e3a03001 	mov	r3, #1
1780038c:	e50b3010 	str	r3, [fp, #-16]
17800390:	e3a03001 	mov	r3, #1
17800394:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
17800398:	e3a03000 	mov	r3, #0
1780039c:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
178003a0:	e3a03000 	mov	r3, #0
178003a4:	e54b3039 	strb	r3, [fp, #-57]	; 0xffffffc7
178003a8:	e51b3010 	ldr	r3, [fp, #-16]
178003ac:	e3530000 	cmp	r3, #0
178003b0:	1a000013 	bne	17800404 <vsprintk+0x384>
178003b4:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
178003b8:	e2833004 	add	r3, r3, #4
178003bc:	e50b3088 	str	r3, [fp, #-136]	; 0xffffff78
178003c0:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
178003c4:	e5133004 	ldr	r3, [r3, #-4]
178003c8:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
178003cc:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
178003d0:	e3530000 	cmp	r3, #0
178003d4:	aa000007 	bge	178003f8 <vsprintk+0x378>
178003d8:	e51b3008 	ldr	r3, [fp, #-8]
178003dc:	e2832001 	add	r2, r3, #1
178003e0:	e50b2008 	str	r2, [fp, #-8]
178003e4:	e3a0202d 	mov	r2, #45	; 0x2d
178003e8:	e5c32000 	strb	r2, [r3]
178003ec:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
178003f0:	e2633000 	rsb	r3, r3, #0
178003f4:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
178003f8:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
178003fc:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
17800400:	ea000008 	b	17800428 <vsprintk+0x3a8>
17800404:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
17800408:	e2833004 	add	r3, r3, #4
1780040c:	e50b3088 	str	r3, [fp, #-136]	; 0xffffff78
17800410:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
17800414:	e2433004 	sub	r3, r3, #4
17800418:	e5933000 	ldr	r3, [r3]
1780041c:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
17800420:	e51b306c 	ldr	r3, [fp, #-108]	; 0xffffff94
17800424:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
17800428:	e3a03cca 	mov	r3, #51712	; 0xca00
1780042c:	e3433b9a 	movt	r3, #15258	; 0x3b9a
17800430:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
17800434:	e3a0300a 	mov	r3, #10
17800438:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
1780043c:	e51b3070 	ldr	r3, [fp, #-112]	; 0xffffff90
17800440:	e2433001 	sub	r3, r3, #1
17800444:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
17800448:	e3a03000 	mov	r3, #0
1780044c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
17800450:	ea00003b 	b	17800544 <vsprintk+0x4c4>
17800454:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
17800458:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
1780045c:	e0423003 	sub	r3, r2, r3
17800460:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
17800464:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
17800468:	e2833001 	add	r3, r3, #1
1780046c:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
17800470:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
17800474:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
17800478:	e1520003 	cmp	r2, r3
1780047c:	2afffff4 	bcs	17800454 <vsprintk+0x3d4>
17800480:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
17800484:	e3530000 	cmp	r3, #0
17800488:	0a000001 	beq	17800494 <vsprintk+0x414>
1780048c:	e3a03001 	mov	r3, #1
17800490:	e54b3039 	strb	r3, [fp, #-57]	; 0xffffffc7
17800494:	e55b3039 	ldrb	r3, [fp, #-57]	; 0xffffffc7
17800498:	e3530000 	cmp	r3, #0
1780049c:	1a000005 	bne	178004b8 <vsprintk+0x438>
178004a0:	e51b2074 	ldr	r2, [fp, #-116]	; 0xffffff8c
178004a4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
178004a8:	e0423003 	sub	r3, r2, r3
178004ac:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
178004b0:	e1520003 	cmp	r2, r3
178004b4:	9a000008 	bls	178004dc <vsprintk+0x45c>
178004b8:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
178004bc:	e2833030 	add	r3, r3, #48	; 0x30
178004c0:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
178004c4:	e51b3008 	ldr	r3, [fp, #-8]
178004c8:	e2832001 	add	r2, r3, #1
178004cc:	e50b2008 	str	r2, [fp, #-8]
178004d0:	e51b2038 	ldr	r2, [fp, #-56]	; 0xffffffc8
178004d4:	e6ef2072 	uxtb	r2, r2
178004d8:	e5c32000 	strb	r2, [r3]
178004dc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
178004e0:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
178004e4:	ea000008 	b	1780050c <vsprintk+0x48c>
178004e8:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
178004ec:	e1a03002 	mov	r3, r2
178004f0:	e1a03103 	lsl	r3, r3, #2
178004f4:	e0833002 	add	r3, r3, r2
178004f8:	e1a03083 	lsl	r3, r3, #1
178004fc:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
17800500:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
17800504:	e2833001 	add	r3, r3, #1
17800508:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
1780050c:	e51b3074 	ldr	r3, [fp, #-116]	; 0xffffff8c
17800510:	e2433001 	sub	r3, r3, #1
17800514:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
17800518:	e1520003 	cmp	r2, r3
1780051c:	3afffff1 	bcc	178004e8 <vsprintk+0x468>
17800520:	e3a03000 	mov	r3, #0
17800524:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
17800528:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
1780052c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
17800530:	e3a03001 	mov	r3, #1
17800534:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
17800538:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
1780053c:	e2833001 	add	r3, r3, #1
17800540:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
17800544:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
17800548:	e51b3074 	ldr	r3, [fp, #-116]	; 0xffffff8c
1780054c:	e1520003 	cmp	r2, r3
17800550:	3affffc6 	bcc	17800470 <vsprintk+0x3f0>
17800554:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
17800558:	e6ef2073 	uxtb	r2, r3
1780055c:	e51b3008 	ldr	r3, [fp, #-8]
17800560:	e2831001 	add	r1, r3, #1
17800564:	e50b1008 	str	r1, [fp, #-8]
17800568:	e2822030 	add	r2, r2, #48	; 0x30
1780056c:	e6ef2072 	uxtb	r2, r2
17800570:	e5c32000 	strb	r2, [r3]
17800574:	ea0000a9 	b	17800820 <vsprintk+0x7a0>
17800578:	e3a0300a 	mov	r3, #10
1780057c:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
17800580:	e3a03020 	mov	r3, #32
17800584:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
17800588:	e3a03000 	mov	r3, #0
1780058c:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
17800590:	e3a03000 	mov	r3, #0
17800594:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
17800598:	e3a03000 	mov	r3, #0
1780059c:	e54b3045 	strb	r3, [fp, #-69]	; 0xffffffbb
178005a0:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
178005a4:	e2833004 	add	r3, r3, #4
178005a8:	e50b3088 	str	r3, [fp, #-136]	; 0xffffff78
178005ac:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
178005b0:	e2433004 	sub	r3, r3, #4
178005b4:	e5933000 	ldr	r3, [r3]
178005b8:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
178005bc:	e51b3068 	ldr	r3, [fp, #-104]	; 0xffffff98
178005c0:	e1a03f23 	lsr	r3, r3, #30
178005c4:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
178005c8:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
178005cc:	e2033003 	and	r3, r3, #3
178005d0:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
178005d4:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
178005d8:	e3530000 	cmp	r3, #0
178005dc:	0a000001 	beq	178005e8 <vsprintk+0x568>
178005e0:	e3a03001 	mov	r3, #1
178005e4:	e54b3045 	strb	r3, [fp, #-69]	; 0xffffffbb
178005e8:	e55b3045 	ldrb	r3, [fp, #-69]	; 0xffffffbb
178005ec:	e3530000 	cmp	r3, #0
178005f0:	1a000003 	bne	17800604 <vsprintk+0x584>
178005f4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
178005f8:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
178005fc:	e1520003 	cmp	r2, r3
17800600:	9a000008 	bls	17800628 <vsprintk+0x5a8>
17800604:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
17800608:	e2833030 	add	r3, r3, #48	; 0x30
1780060c:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
17800610:	e51b3008 	ldr	r3, [fp, #-8]
17800614:	e2832001 	add	r2, r3, #1
17800618:	e50b2008 	str	r2, [fp, #-8]
1780061c:	e51b2064 	ldr	r2, [fp, #-100]	; 0xffffff9c
17800620:	e6ef2072 	uxtb	r2, r2
17800624:	e5c32000 	strb	r2, [r3]
17800628:	e51b3068 	ldr	r3, [fp, #-104]	; 0xffffff98
1780062c:	e1a03103 	lsl	r3, r3, #2
17800630:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
17800634:	e3a03000 	mov	r3, #0
17800638:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
1780063c:	ea000025 	b	178006d8 <vsprintk+0x658>
17800640:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
17800644:	e2832001 	add	r2, r3, #1
17800648:	e1a03002 	mov	r3, r2
1780064c:	e1a03083 	lsl	r3, r3, #1
17800650:	e0833002 	add	r3, r3, r2
17800654:	e51b2060 	ldr	r2, [fp, #-96]	; 0xffffffa0
17800658:	e0423003 	sub	r3, r2, r3
1780065c:	e51b2068 	ldr	r2, [fp, #-104]	; 0xffffff98
17800660:	e1a03332 	lsr	r3, r2, r3
17800664:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
17800668:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
1780066c:	e2033007 	and	r3, r3, #7
17800670:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
17800674:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
17800678:	e3530000 	cmp	r3, #0
1780067c:	0a000001 	beq	17800688 <vsprintk+0x608>
17800680:	e3a03001 	mov	r3, #1
17800684:	e54b3045 	strb	r3, [fp, #-69]	; 0xffffffbb
17800688:	e55b3045 	ldrb	r3, [fp, #-69]	; 0xffffffbb
1780068c:	e3530000 	cmp	r3, #0
17800690:	1a000004 	bne	178006a8 <vsprintk+0x628>
17800694:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17800698:	e263300a 	rsb	r3, r3, #10
1780069c:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
178006a0:	e1520003 	cmp	r2, r3
178006a4:	3a000008 	bcc	178006cc <vsprintk+0x64c>
178006a8:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
178006ac:	e2833030 	add	r3, r3, #48	; 0x30
178006b0:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
178006b4:	e51b3008 	ldr	r3, [fp, #-8]
178006b8:	e2832001 	add	r2, r3, #1
178006bc:	e50b2008 	str	r2, [fp, #-8]
178006c0:	e51b2064 	ldr	r2, [fp, #-100]	; 0xffffff9c
178006c4:	e6ef2072 	uxtb	r2, r2
178006c8:	e5c32000 	strb	r2, [r3]
178006cc:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
178006d0:	e2833001 	add	r3, r3, #1
178006d4:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
178006d8:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
178006dc:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
178006e0:	e1520003 	cmp	r2, r3
178006e4:	3affffd5 	bcc	17800640 <vsprintk+0x5c0>
178006e8:	ea00004c 	b	17800820 <vsprintk+0x7a0>
178006ec:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
178006f0:	e2833004 	add	r3, r3, #4
178006f4:	e50b3088 	str	r3, [fp, #-136]	; 0xffffff78
178006f8:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
178006fc:	e5133004 	ldr	r3, [r3, #-4]
17800700:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
17800704:	ea000005 	b	17800720 <vsprintk+0x6a0>
17800708:	e51b3008 	ldr	r3, [fp, #-8]
1780070c:	e2833001 	add	r3, r3, #1
17800710:	e50b3008 	str	r3, [fp, #-8]
17800714:	e51b300c 	ldr	r3, [fp, #-12]
17800718:	e2833001 	add	r3, r3, #1
1780071c:	e50b300c 	str	r3, [fp, #-12]
17800720:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
17800724:	e2832001 	add	r2, r3, #1
17800728:	e50b204c 	str	r2, [fp, #-76]	; 0xffffffb4
1780072c:	e5d32000 	ldrb	r2, [r3]
17800730:	e51b3008 	ldr	r3, [fp, #-8]
17800734:	e5c32000 	strb	r2, [r3]
17800738:	e51b3008 	ldr	r3, [fp, #-8]
1780073c:	e5d33000 	ldrb	r3, [r3]
17800740:	e3530000 	cmp	r3, #0
17800744:	0a000034 	beq	1780081c <vsprintk+0x79c>
17800748:	e51b300c 	ldr	r3, [fp, #-12]
1780074c:	e35300ff 	cmp	r3, #255	; 0xff
17800750:	9affffec 	bls	17800708 <vsprintk+0x688>
17800754:	ea000030 	b	1780081c <vsprintk+0x79c>
17800758:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
1780075c:	e2833004 	add	r3, r3, #4
17800760:	e50b3088 	str	r3, [fp, #-136]	; 0xffffff78
17800764:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
17800768:	e5533004 	ldrb	r3, [r3, #-4]
1780076c:	e54b3075 	strb	r3, [fp, #-117]	; 0xffffff8b
17800770:	e51b3008 	ldr	r3, [fp, #-8]
17800774:	e2832001 	add	r2, r3, #1
17800778:	e50b2008 	str	r2, [fp, #-8]
1780077c:	e55b2075 	ldrb	r2, [fp, #-117]	; 0xffffff8b
17800780:	e5c32000 	strb	r2, [r3]
17800784:	ea000025 	b	17800820 <vsprintk+0x7a0>
17800788:	e51b3008 	ldr	r3, [fp, #-8]
1780078c:	e2832001 	add	r2, r3, #1
17800790:	e50b2008 	str	r2, [fp, #-8]
17800794:	e51b2084 	ldr	r2, [fp, #-132]	; 0xffffff7c
17800798:	e5d22000 	ldrb	r2, [r2]
1780079c:	e5c32000 	strb	r2, [r3]
178007a0:	ea00001e 	b	17800820 <vsprintk+0x7a0>
178007a4:	e51b3008 	ldr	r3, [fp, #-8]
178007a8:	e2832001 	add	r2, r3, #1
178007ac:	e50b2008 	str	r2, [fp, #-8]
178007b0:	e3a02025 	mov	r2, #37	; 0x25
178007b4:	e5c32000 	strb	r2, [r3]
178007b8:	e51b3008 	ldr	r3, [fp, #-8]
178007bc:	e2832001 	add	r2, r3, #1
178007c0:	e50b2008 	str	r2, [fp, #-8]
178007c4:	e51b2084 	ldr	r2, [fp, #-132]	; 0xffffff7c
178007c8:	e5d22000 	ldrb	r2, [r2]
178007cc:	e5c32000 	strb	r2, [r3]
178007d0:	ea000012 	b	17800820 <vsprintk+0x7a0>
178007d4:	e51b3008 	ldr	r3, [fp, #-8]
178007d8:	e2832001 	add	r2, r3, #1
178007dc:	e50b2008 	str	r2, [fp, #-8]
178007e0:	e3a02025 	mov	r2, #37	; 0x25
178007e4:	e5c32000 	strb	r2, [r3]
178007e8:	e51b3008 	ldr	r3, [fp, #-8]
178007ec:	e2832001 	add	r2, r3, #1
178007f0:	e50b2008 	str	r2, [fp, #-8]
178007f4:	e3a0200d 	mov	r2, #13
178007f8:	e5c32000 	strb	r2, [r3]
178007fc:	e51b3008 	ldr	r3, [fp, #-8]
17800800:	e2832001 	add	r2, r3, #1
17800804:	e50b2008 	str	r2, [fp, #-8]
17800808:	e3a0200a 	mov	r2, #10
1780080c:	e5c32000 	strb	r2, [r3]
17800810:	ea000002 	b	17800820 <vsprintk+0x7a0>
17800814:	e320f000 	nop	{0}
17800818:	ea000000 	b	17800820 <vsprintk+0x7a0>
1780081c:	e320f000 	nop	{0}
17800820:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
17800824:	e5d33000 	ldrb	r3, [r3]
17800828:	e353000a 	cmp	r3, #10
1780082c:	1a000009 	bne	17800858 <vsprintk+0x7d8>
17800830:	e51b3008 	ldr	r3, [fp, #-8]
17800834:	e2832001 	add	r2, r3, #1
17800838:	e50b2008 	str	r2, [fp, #-8]
1780083c:	e3a0200d 	mov	r2, #13
17800840:	e5c32000 	strb	r2, [r3]
17800844:	e51b3008 	ldr	r3, [fp, #-8]
17800848:	e2832001 	add	r2, r3, #1
1780084c:	e50b2008 	str	r2, [fp, #-8]
17800850:	e3a0200a 	mov	r2, #10
17800854:	e5c32000 	strb	r2, [r3]
17800858:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
1780085c:	e5d33000 	ldrb	r3, [r3]
17800860:	e3530009 	cmp	r3, #9
17800864:	1a000005 	bne	17800880 <vsprintk+0x800>
17800868:	e51b3008 	ldr	r3, [fp, #-8]
1780086c:	e2832001 	add	r2, r3, #1
17800870:	e50b2008 	str	r2, [fp, #-8]
17800874:	e51b2084 	ldr	r2, [fp, #-132]	; 0xffffff7c
17800878:	e5d22000 	ldrb	r2, [r2]
1780087c:	e5c32000 	strb	r2, [r3]
17800880:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
17800884:	e2833001 	add	r3, r3, #1
17800888:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
1780088c:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
17800890:	e5d33000 	ldrb	r3, [r3]
17800894:	e3530000 	cmp	r3, #0
17800898:	1afffe05 	bne	178000b4 <vsprintk+0x34>
1780089c:	e51b3008 	ldr	r3, [fp, #-8]
178008a0:	e3a02000 	mov	r2, #0
178008a4:	e5c32000 	strb	r2, [r3]
178008a8:	e3a01c01 	mov	r1, #256	; 0x100
178008ac:	e51b0080 	ldr	r0, [fp, #-128]	; 0xffffff80
178008b0:	eb00044e 	bl	178019f0 <strnlen>
178008b4:	e1a03000 	mov	r3, r0
178008b8:	e1a00003 	mov	r0, r3
178008bc:	e24bd004 	sub	sp, fp, #4
178008c0:	e8bd8800 	pop	{fp, pc}

178008c4 <printk>:
178008c4:	e92d000f 	push	{r0, r1, r2, r3}
178008c8:	e92d4800 	push	{fp, lr}
178008cc:	e28db004 	add	fp, sp, #4
178008d0:	e24ddf42 	sub	sp, sp, #264	; 0x108
178008d4:	e28b3008 	add	r3, fp, #8
178008d8:	e50b3008 	str	r3, [fp, #-8]
178008dc:	e59b1004 	ldr	r1, [fp, #4]
178008e0:	e24b3f43 	sub	r3, fp, #268	; 0x10c
178008e4:	e51b2008 	ldr	r2, [fp, #-8]
178008e8:	e1a00003 	mov	r0, r3
178008ec:	ebfffde3 	bl	17800080 <vsprintk>
178008f0:	e50b000c 	str	r0, [fp, #-12]
178008f4:	e24b3f43 	sub	r3, fp, #268	; 0x10c
178008f8:	e1a00003 	mov	r0, r3
178008fc:	eb0000ff 	bl	17800d00 <ltz_uart_puts>
17800900:	e51b300c 	ldr	r3, [fp, #-12]
17800904:	e1a00003 	mov	r0, r3
17800908:	e24bd004 	sub	sp, fp, #4
1780090c:	e8bd4800 	pop	{fp, lr}
17800910:	e28dd010 	add	sp, sp, #16
17800914:	e12fff1e 	bx	lr

17800918 <ltz_uart_init>:
17800918:	e92d4800 	push	{fp, lr}
1780091c:	e28db004 	add	fp, sp, #4
17800920:	e24dd010 	sub	sp, sp, #16
17800924:	e50b0010 	str	r0, [fp, #-16]
17800928:	eb000114 	bl	17800d80 <ltz_uart1_iomux_config>
1780092c:	e304307c 	movw	r3, #16508	; 0x407c
17800930:	e340320c 	movt	r3, #524	; 0x20c
17800934:	e5932000 	ldr	r2, [r3]
17800938:	e304307c 	movw	r3, #16508	; 0x407c
1780093c:	e340320c 	movt	r3, #524	; 0x20c
17800940:	e382240f 	orr	r2, r2, #251658240	; 0xf000000
17800944:	e5832000 	str	r2, [r3]
17800948:	e320f000 	nop	{0}
1780094c:	e3a030b4 	mov	r3, #180	; 0xb4
17800950:	e3403202 	movt	r3, #514	; 0x202
17800954:	e5933000 	ldr	r3, [r3]
17800958:	e2033040 	and	r3, r3, #64	; 0x40
1780095c:	e3530000 	cmp	r3, #0
17800960:	0afffff9 	beq	1780094c <ltz_uart_init+0x34>
17800964:	e3a03080 	mov	r3, #128	; 0x80
17800968:	e3403202 	movt	r3, #514	; 0x202
1780096c:	e5932000 	ldr	r2, [r3]
17800970:	e3a03080 	mov	r3, #128	; 0x80
17800974:	e3403202 	movt	r3, #514	; 0x202
17800978:	e3c22001 	bic	r2, r2, #1
1780097c:	e5832000 	str	r2, [r3]
17800980:	e3a03090 	mov	r3, #144	; 0x90
17800984:	e3403202 	movt	r3, #514	; 0x202
17800988:	e5932000 	ldr	r2, [r3]
1780098c:	e3a03090 	mov	r3, #144	; 0x90
17800990:	e3403202 	movt	r3, #514	; 0x202
17800994:	e3822020 	orr	r2, r2, #32
17800998:	e5832000 	str	r2, [r3]
1780099c:	e3a03090 	mov	r3, #144	; 0x90
178009a0:	e3403202 	movt	r3, #514	; 0x202
178009a4:	e5932000 	ldr	r2, [r3]
178009a8:	e3a03090 	mov	r3, #144	; 0x90
178009ac:	e3403202 	movt	r3, #514	; 0x202
178009b0:	e3822902 	orr	r2, r2, #32768	; 0x8000
178009b4:	e5832000 	str	r2, [r3]
178009b8:	e3a03090 	mov	r3, #144	; 0x90
178009bc:	e3403202 	movt	r3, #514	; 0x202
178009c0:	e5932000 	ldr	r2, [r3]
178009c4:	e3a03090 	mov	r3, #144	; 0x90
178009c8:	e3403202 	movt	r3, #514	; 0x202
178009cc:	e3822c02 	orr	r2, r2, #512	; 0x200
178009d0:	e5832000 	str	r2, [r3]
178009d4:	e3043024 	movw	r3, #16420	; 0x4024
178009d8:	e340320c 	movt	r3, #524	; 0x20c
178009dc:	e5933000 	ldr	r3, [r3]
178009e0:	e203303f 	and	r3, r3, #63	; 0x3f
178009e4:	e2833001 	add	r3, r3, #1
178009e8:	e1a01003 	mov	r1, r3
178009ec:	e3a00b2d 	mov	r0, #46080	; 0xb400
178009f0:	e34004c4 	movt	r0, #1220	; 0x4c4
178009f4:	eb0009ce 	bl	17803134 <__udivsi3>
178009f8:	e1a03000 	mov	r3, r0
178009fc:	e50b3008 	str	r3, [fp, #-8]
17800a00:	e3a03090 	mov	r3, #144	; 0x90
17800a04:	e3403202 	movt	r3, #514	; 0x202
17800a08:	e5933000 	ldr	r3, [r3]
17800a0c:	e2033d0e 	and	r3, r3, #896	; 0x380
17800a10:	e50b300c 	str	r3, [fp, #-12]
17800a14:	e51b300c 	ldr	r3, [fp, #-12]
17800a18:	e1a033a3 	lsr	r3, r3, #7
17800a1c:	e50b300c 	str	r3, [fp, #-12]
17800a20:	e51b300c 	ldr	r3, [fp, #-12]
17800a24:	e3530006 	cmp	r3, #6
17800a28:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
17800a2c:	ea00002d 	b	17800ae8 <ltz_uart_init+0x1d0>
17800a30:	17800a4c 	strne	r0, [r0, ip, asr #20]
17800a34:	17800a68 	strne	r0, [r0, r8, ror #20]
17800a38:	17800a84 	strne	r0, [r0, r4, lsl #21]
17800a3c:	17800a94 			; <UNDEFINED> instruction: 0x17800a94
17800a40:	17800ab0 			; <UNDEFINED> instruction: 0x17800ab0
17800a44:	17800ae8 	strne	r0, [r0, r8, ror #21]
17800a48:	17800ac0 	strne	r0, [r0, r0, asr #21]
17800a4c:	e51b2008 	ldr	r2, [fp, #-8]
17800a50:	e30a3aab 	movw	r3, #43691	; 0xaaab
17800a54:	e34a3aaa 	movt	r3, #43690	; 0xaaaa
17800a58:	e0832392 	umull	r2, r3, r2, r3
17800a5c:	e1a03123 	lsr	r3, r3, #2
17800a60:	e50b3008 	str	r3, [fp, #-8]
17800a64:	ea000020 	b	17800aec <ltz_uart_init+0x1d4>
17800a68:	e51b2008 	ldr	r2, [fp, #-8]
17800a6c:	e30c3ccd 	movw	r3, #52429	; 0xcccd
17800a70:	e34c3ccc 	movt	r3, #52428	; 0xcccc
17800a74:	e0832392 	umull	r2, r3, r2, r3
17800a78:	e1a03123 	lsr	r3, r3, #2
17800a7c:	e50b3008 	str	r3, [fp, #-8]
17800a80:	ea000019 	b	17800aec <ltz_uart_init+0x1d4>
17800a84:	e51b3008 	ldr	r3, [fp, #-8]
17800a88:	e1a03123 	lsr	r3, r3, #2
17800a8c:	e50b3008 	str	r3, [fp, #-8]
17800a90:	ea000015 	b	17800aec <ltz_uart_init+0x1d4>
17800a94:	e51b2008 	ldr	r2, [fp, #-8]
17800a98:	e30a3aab 	movw	r3, #43691	; 0xaaab
17800a9c:	e34a3aaa 	movt	r3, #43690	; 0xaaaa
17800aa0:	e0832392 	umull	r2, r3, r2, r3
17800aa4:	e1a030a3 	lsr	r3, r3, #1
17800aa8:	e50b3008 	str	r3, [fp, #-8]
17800aac:	ea00000e 	b	17800aec <ltz_uart_init+0x1d4>
17800ab0:	e51b3008 	ldr	r3, [fp, #-8]
17800ab4:	e1a030a3 	lsr	r3, r3, #1
17800ab8:	e50b3008 	str	r3, [fp, #-8]
17800abc:	ea00000a 	b	17800aec <ltz_uart_init+0x1d4>
17800ac0:	e51b1008 	ldr	r1, [fp, #-8]
17800ac4:	e3043925 	movw	r3, #18725	; 0x4925
17800ac8:	e3423492 	movt	r3, #9362	; 0x2492
17800acc:	e0832391 	umull	r2, r3, r1, r3
17800ad0:	e0411003 	sub	r1, r1, r3
17800ad4:	e1a010a1 	lsr	r1, r1, #1
17800ad8:	e0813003 	add	r3, r1, r3
17800adc:	e1a03123 	lsr	r3, r3, #2
17800ae0:	e50b3008 	str	r3, [fp, #-8]
17800ae4:	ea000000 	b	17800aec <ltz_uart_init+0x1d4>
17800ae8:	e320f000 	nop	{0}
17800aec:	e3a030b0 	mov	r3, #176	; 0xb0
17800af0:	e3403202 	movt	r3, #514	; 0x202
17800af4:	e51b1008 	ldr	r1, [fp, #-8]
17800af8:	e3042dd3 	movw	r2, #19923	; 0x4dd3
17800afc:	e3412062 	movt	r2, #4194	; 0x1062
17800b00:	e0810291 	umull	r0, r1, r1, r2
17800b04:	e1a02321 	lsr	r2, r1, #6
17800b08:	e5832000 	str	r2, [r3]
17800b0c:	e3a03084 	mov	r3, #132	; 0x84
17800b10:	e3403202 	movt	r3, #514	; 0x202
17800b14:	e5932000 	ldr	r2, [r3]
17800b18:	e3a03084 	mov	r3, #132	; 0x84
17800b1c:	e3403202 	movt	r3, #514	; 0x202
17800b20:	e3c22c03 	bic	r2, r2, #768	; 0x300
17800b24:	e5832000 	str	r2, [r3]
17800b28:	e3a03084 	mov	r3, #132	; 0x84
17800b2c:	e3403202 	movt	r3, #514	; 0x202
17800b30:	e5932000 	ldr	r2, [r3]
17800b34:	e3a03084 	mov	r3, #132	; 0x84
17800b38:	e3403202 	movt	r3, #514	; 0x202
17800b3c:	e3c22040 	bic	r2, r2, #64	; 0x40
17800b40:	e5832000 	str	r2, [r3]
17800b44:	e3a03084 	mov	r3, #132	; 0x84
17800b48:	e3403202 	movt	r3, #514	; 0x202
17800b4c:	e5932000 	ldr	r2, [r3]
17800b50:	e3a03084 	mov	r3, #132	; 0x84
17800b54:	e3403202 	movt	r3, #514	; 0x202
17800b58:	e3822020 	orr	r2, r2, #32
17800b5c:	e5832000 	str	r2, [r3]
17800b60:	e3a03084 	mov	r3, #132	; 0x84
17800b64:	e3403202 	movt	r3, #514	; 0x202
17800b68:	e5932000 	ldr	r2, [r3]
17800b6c:	e3a03084 	mov	r3, #132	; 0x84
17800b70:	e3403202 	movt	r3, #514	; 0x202
17800b74:	e3822901 	orr	r2, r2, #16384	; 0x4000
17800b78:	e5832000 	str	r2, [r3]
17800b7c:	e3a03084 	mov	r3, #132	; 0x84
17800b80:	e3403202 	movt	r3, #514	; 0x202
17800b84:	e5932000 	ldr	r2, [r3]
17800b88:	e3a03084 	mov	r3, #132	; 0x84
17800b8c:	e3403202 	movt	r3, #514	; 0x202
17800b90:	e3c22a02 	bic	r2, r2, #8192	; 0x2000
17800b94:	e5832000 	str	r2, [r3]
17800b98:	e3a03088 	mov	r3, #136	; 0x88
17800b9c:	e3403202 	movt	r3, #514	; 0x202
17800ba0:	e5932000 	ldr	r2, [r3]
17800ba4:	e3a03088 	mov	r3, #136	; 0x88
17800ba8:	e3403202 	movt	r3, #514	; 0x202
17800bac:	e3822004 	orr	r2, r2, #4
17800bb0:	e5832000 	str	r2, [r3]
17800bb4:	e3a03080 	mov	r3, #128	; 0x80
17800bb8:	e3403202 	movt	r3, #514	; 0x202
17800bbc:	e5932000 	ldr	r2, [r3]
17800bc0:	e3a03080 	mov	r3, #128	; 0x80
17800bc4:	e3403202 	movt	r3, #514	; 0x202
17800bc8:	e3822001 	orr	r2, r2, #1
17800bcc:	e5832000 	str	r2, [r3]
17800bd0:	e3a03084 	mov	r3, #132	; 0x84
17800bd4:	e3403202 	movt	r3, #514	; 0x202
17800bd8:	e5932000 	ldr	r2, [r3]
17800bdc:	e3a03084 	mov	r3, #132	; 0x84
17800be0:	e3403202 	movt	r3, #514	; 0x202
17800be4:	e3822007 	orr	r2, r2, #7
17800be8:	e5832000 	str	r2, [r3]
17800bec:	e51b2010 	ldr	r2, [fp, #-16]
17800bf0:	e308351f 	movw	r3, #34079	; 0x851f
17800bf4:	e34531eb 	movt	r3, #20971	; 0x51eb
17800bf8:	e0832392 	umull	r2, r3, r2, r3
17800bfc:	e1a022a3 	lsr	r2, r3, #5
17800c00:	e3a030a4 	mov	r3, #164	; 0xa4
17800c04:	e3403202 	movt	r3, #514	; 0x202
17800c08:	e2422001 	sub	r2, r2, #1
17800c0c:	e5832000 	str	r2, [r3]
17800c10:	e51b2008 	ldr	r2, [fp, #-8]
17800c14:	e308351f 	movw	r3, #34079	; 0x851f
17800c18:	e34531eb 	movt	r3, #20971	; 0x51eb
17800c1c:	e0832392 	umull	r2, r3, r2, r3
17800c20:	e1a024a3 	lsr	r2, r3, #9
17800c24:	e3a030a8 	mov	r3, #168	; 0xa8
17800c28:	e3403202 	movt	r3, #514	; 0x202
17800c2c:	e2422001 	sub	r2, r2, #1
17800c30:	e5832000 	str	r2, [r3]
17800c34:	e320f000 	nop	{0}
17800c38:	e24bd004 	sub	sp, fp, #4
17800c3c:	e8bd8800 	pop	{fp, pc}

17800c40 <ltz_uart_getchar>:
17800c40:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17800c44:	e28db000 	add	fp, sp, #0
17800c48:	e24dd00c 	sub	sp, sp, #12
17800c4c:	e3a03084 	mov	r3, #132	; 0x84
17800c50:	e3403202 	movt	r3, #514	; 0x202
17800c54:	e5933000 	ldr	r3, [r3]
17800c58:	e2033001 	and	r3, r3, #1
17800c5c:	e3530000 	cmp	r3, #0
17800c60:	1a000001 	bne	17800c6c <ltz_uart_getchar+0x2c>
17800c64:	e3a030ff 	mov	r3, #255	; 0xff
17800c68:	ea00000b 	b	17800c9c <ltz_uart_getchar+0x5c>
17800c6c:	e3a03000 	mov	r3, #0
17800c70:	e3403202 	movt	r3, #514	; 0x202
17800c74:	e5933000 	ldr	r3, [r3]
17800c78:	e50b3008 	str	r3, [fp, #-8]
17800c7c:	e51b3008 	ldr	r3, [fp, #-8]
17800c80:	e2033b1f 	and	r3, r3, #31744	; 0x7c00
17800c84:	e3530000 	cmp	r3, #0
17800c88:	0a000001 	beq	17800c94 <ltz_uart_getchar+0x54>
17800c8c:	e3a030ff 	mov	r3, #255	; 0xff
17800c90:	ea000001 	b	17800c9c <ltz_uart_getchar+0x5c>
17800c94:	e51b3008 	ldr	r3, [fp, #-8]
17800c98:	e6ef3073 	uxtb	r3, r3
17800c9c:	e1a00003 	mov	r0, r3
17800ca0:	e28bd000 	add	sp, fp, #0
17800ca4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17800ca8:	e12fff1e 	bx	lr

17800cac <ltz_uart_putchar>:
17800cac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17800cb0:	e28db000 	add	fp, sp, #0
17800cb4:	e24dd00c 	sub	sp, sp, #12
17800cb8:	e1a03000 	mov	r3, r0
17800cbc:	e54b3005 	strb	r3, [fp, #-5]
17800cc0:	e320f000 	nop	{0}
17800cc4:	e3a030b4 	mov	r3, #180	; 0xb4
17800cc8:	e3403202 	movt	r3, #514	; 0x202
17800ccc:	e5933000 	ldr	r3, [r3]
17800cd0:	e2033010 	and	r3, r3, #16
17800cd4:	e3530000 	cmp	r3, #0
17800cd8:	1afffff9 	bne	17800cc4 <ltz_uart_putchar+0x18>
17800cdc:	e3a03040 	mov	r3, #64	; 0x40
17800ce0:	e3403202 	movt	r3, #514	; 0x202
17800ce4:	e55b2005 	ldrb	r2, [fp, #-5]
17800ce8:	e5832000 	str	r2, [r3]
17800cec:	e55b3005 	ldrb	r3, [fp, #-5]
17800cf0:	e1a00003 	mov	r0, r3
17800cf4:	e28bd000 	add	sp, fp, #0
17800cf8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17800cfc:	e12fff1e 	bx	lr

17800d00 <ltz_uart_puts>:
17800d00:	e92d4800 	push	{fp, lr}
17800d04:	e28db004 	add	fp, sp, #4
17800d08:	e24dd010 	sub	sp, sp, #16
17800d0c:	e50b0010 	str	r0, [fp, #-16]
17800d10:	e3a03000 	mov	r3, #0
17800d14:	e50b3008 	str	r3, [fp, #-8]
17800d18:	ea00000f 	b	17800d5c <ltz_uart_puts+0x5c>
17800d1c:	e51b3010 	ldr	r3, [fp, #-16]
17800d20:	e5d33000 	ldrb	r3, [r3]
17800d24:	e1a00003 	mov	r0, r3
17800d28:	ebffffdf 	bl	17800cac <ltz_uart_putchar>
17800d2c:	e51b3010 	ldr	r3, [fp, #-16]
17800d30:	e5d33000 	ldrb	r3, [r3]
17800d34:	e353000a 	cmp	r3, #10
17800d38:	1a000001 	bne	17800d44 <ltz_uart_puts+0x44>
17800d3c:	e3a0000d 	mov	r0, #13
17800d40:	ebffffd9 	bl	17800cac <ltz_uart_putchar>
17800d44:	e51b3010 	ldr	r3, [fp, #-16]
17800d48:	e2833001 	add	r3, r3, #1
17800d4c:	e50b3010 	str	r3, [fp, #-16]
17800d50:	e51b3008 	ldr	r3, [fp, #-8]
17800d54:	e2833001 	add	r3, r3, #1
17800d58:	e50b3008 	str	r3, [fp, #-8]
17800d5c:	e51b3010 	ldr	r3, [fp, #-16]
17800d60:	e5d33000 	ldrb	r3, [r3]
17800d64:	e3530000 	cmp	r3, #0
17800d68:	1affffeb 	bne	17800d1c <ltz_uart_puts+0x1c>
17800d6c:	e51b3008 	ldr	r3, [fp, #-8]
17800d70:	e6ef3073 	uxtb	r3, r3
17800d74:	e1a00003 	mov	r0, r3
17800d78:	e24bd004 	sub	sp, fp, #4
17800d7c:	e8bd8800 	pop	{fp, pc}

17800d80 <ltz_uart1_iomux_config>:
17800d80:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17800d84:	e28db000 	add	fp, sp, #0
17800d88:	e3a03fa1 	mov	r3, #644	; 0x284
17800d8c:	e340320e 	movt	r3, #526	; 0x20e
17800d90:	e3a02003 	mov	r2, #3
17800d94:	e5832000 	str	r2, [r3]
17800d98:	e3003654 	movw	r3, #1620	; 0x654
17800d9c:	e340320e 	movt	r3, #526	; 0x20e
17800da0:	e30b20b0 	movw	r2, #45232	; 0xb0b0
17800da4:	e3402001 	movt	r2, #1
17800da8:	e5832000 	str	r2, [r3]
17800dac:	e3a03e92 	mov	r3, #2336	; 0x920
17800db0:	e340320e 	movt	r3, #526	; 0x20e
17800db4:	e3a02001 	mov	r2, #1
17800db8:	e5832000 	str	r2, [r3]
17800dbc:	e3a03d0a 	mov	r3, #640	; 0x280
17800dc0:	e340320e 	movt	r3, #526	; 0x20e
17800dc4:	e3a02003 	mov	r2, #3
17800dc8:	e5832000 	str	r2, [r3]
17800dcc:	e3a03e65 	mov	r3, #1616	; 0x650
17800dd0:	e340320e 	movt	r3, #526	; 0x20e
17800dd4:	e30b20b0 	movw	r2, #45232	; 0xb0b0
17800dd8:	e3402001 	movt	r2, #1
17800ddc:	e5832000 	str	r2, [r3]
17800de0:	e3a03e92 	mov	r3, #2336	; 0x920
17800de4:	e340320e 	movt	r3, #526	; 0x20e
17800de8:	e3a02001 	mov	r2, #1
17800dec:	e5832000 	str	r2, [r3]
17800df0:	e320f000 	nop	{0}
17800df4:	e28bd000 	add	sp, fp, #0
17800df8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17800dfc:	e12fff1e 	bx	lr

17800e00 <ltz_epit_enable>:
17800e00:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17800e04:	e28db000 	add	fp, sp, #0
17800e08:	e24dd00c 	sub	sp, sp, #12
17800e0c:	e50b0008 	str	r0, [fp, #-8]
17800e10:	e51b3008 	ldr	r3, [fp, #-8]
17800e14:	e3530001 	cmp	r3, #1
17800e18:	0a000008 	beq	17800e40 <ltz_epit_enable+0x40>
17800e1c:	e51b3008 	ldr	r3, [fp, #-8]
17800e20:	e3530002 	cmp	r3, #2
17800e24:	1a000002 	bne	17800e34 <ltz_epit_enable+0x34>
17800e28:	e3043004 	movw	r3, #16388	; 0x4004
17800e2c:	e340320d 	movt	r3, #525	; 0x20d
17800e30:	ea000004 	b	17800e48 <ltz_epit_enable+0x48>
17800e34:	e3a03004 	mov	r3, #4
17800e38:	e34030d0 	movt	r3, #208	; 0xd0
17800e3c:	ea000001 	b	17800e48 <ltz_epit_enable+0x48>
17800e40:	e3a03004 	mov	r3, #4
17800e44:	e340320d 	movt	r3, #525	; 0x20d
17800e48:	e5932000 	ldr	r2, [r3]
17800e4c:	e51b3008 	ldr	r3, [fp, #-8]
17800e50:	e3530001 	cmp	r3, #1
17800e54:	0a000008 	beq	17800e7c <ltz_epit_enable+0x7c>
17800e58:	e51b3008 	ldr	r3, [fp, #-8]
17800e5c:	e3530002 	cmp	r3, #2
17800e60:	1a000002 	bne	17800e70 <ltz_epit_enable+0x70>
17800e64:	e3043004 	movw	r3, #16388	; 0x4004
17800e68:	e340320d 	movt	r3, #525	; 0x20d
17800e6c:	ea000004 	b	17800e84 <ltz_epit_enable+0x84>
17800e70:	e3a03004 	mov	r3, #4
17800e74:	e34030d0 	movt	r3, #208	; 0xd0
17800e78:	ea000001 	b	17800e84 <ltz_epit_enable+0x84>
17800e7c:	e3a03004 	mov	r3, #4
17800e80:	e340320d 	movt	r3, #525	; 0x20d
17800e84:	e3822001 	orr	r2, r2, #1
17800e88:	e5832000 	str	r2, [r3]
17800e8c:	e51b3008 	ldr	r3, [fp, #-8]
17800e90:	e3530001 	cmp	r3, #1
17800e94:	0a000007 	beq	17800eb8 <ltz_epit_enable+0xb8>
17800e98:	e51b3008 	ldr	r3, [fp, #-8]
17800e9c:	e3530002 	cmp	r3, #2
17800ea0:	1a000002 	bne	17800eb0 <ltz_epit_enable+0xb0>
17800ea4:	e3a03901 	mov	r3, #16384	; 0x4000
17800ea8:	e340320d 	movt	r3, #525	; 0x20d
17800eac:	ea000003 	b	17800ec0 <ltz_epit_enable+0xc0>
17800eb0:	e3a0360d 	mov	r3, #13631488	; 0xd00000
17800eb4:	ea000001 	b	17800ec0 <ltz_epit_enable+0xc0>
17800eb8:	e3a03000 	mov	r3, #0
17800ebc:	e340320d 	movt	r3, #525	; 0x20d
17800ec0:	e5932000 	ldr	r2, [r3]
17800ec4:	e51b3008 	ldr	r3, [fp, #-8]
17800ec8:	e3530001 	cmp	r3, #1
17800ecc:	0a000007 	beq	17800ef0 <ltz_epit_enable+0xf0>
17800ed0:	e51b3008 	ldr	r3, [fp, #-8]
17800ed4:	e3530002 	cmp	r3, #2
17800ed8:	1a000002 	bne	17800ee8 <ltz_epit_enable+0xe8>
17800edc:	e3a03901 	mov	r3, #16384	; 0x4000
17800ee0:	e340320d 	movt	r3, #525	; 0x20d
17800ee4:	ea000003 	b	17800ef8 <ltz_epit_enable+0xf8>
17800ee8:	e3a0360d 	mov	r3, #13631488	; 0xd00000
17800eec:	ea000001 	b	17800ef8 <ltz_epit_enable+0xf8>
17800ef0:	e3a03000 	mov	r3, #0
17800ef4:	e340320d 	movt	r3, #525	; 0x20d
17800ef8:	e3822004 	orr	r2, r2, #4
17800efc:	e5832000 	str	r2, [r3]
17800f00:	e51b3008 	ldr	r3, [fp, #-8]
17800f04:	e3530001 	cmp	r3, #1
17800f08:	0a000007 	beq	17800f2c <ltz_epit_enable+0x12c>
17800f0c:	e51b3008 	ldr	r3, [fp, #-8]
17800f10:	e3530002 	cmp	r3, #2
17800f14:	1a000002 	bne	17800f24 <ltz_epit_enable+0x124>
17800f18:	e3a03901 	mov	r3, #16384	; 0x4000
17800f1c:	e340320d 	movt	r3, #525	; 0x20d
17800f20:	ea000003 	b	17800f34 <ltz_epit_enable+0x134>
17800f24:	e3a0360d 	mov	r3, #13631488	; 0xd00000
17800f28:	ea000001 	b	17800f34 <ltz_epit_enable+0x134>
17800f2c:	e3a03000 	mov	r3, #0
17800f30:	e340320d 	movt	r3, #525	; 0x20d
17800f34:	e5932000 	ldr	r2, [r3]
17800f38:	e51b3008 	ldr	r3, [fp, #-8]
17800f3c:	e3530001 	cmp	r3, #1
17800f40:	0a000007 	beq	17800f64 <ltz_epit_enable+0x164>
17800f44:	e51b3008 	ldr	r3, [fp, #-8]
17800f48:	e3530002 	cmp	r3, #2
17800f4c:	1a000002 	bne	17800f5c <ltz_epit_enable+0x15c>
17800f50:	e3a03901 	mov	r3, #16384	; 0x4000
17800f54:	e340320d 	movt	r3, #525	; 0x20d
17800f58:	ea000003 	b	17800f6c <ltz_epit_enable+0x16c>
17800f5c:	e3a0360d 	mov	r3, #13631488	; 0xd00000
17800f60:	ea000001 	b	17800f6c <ltz_epit_enable+0x16c>
17800f64:	e3a03000 	mov	r3, #0
17800f68:	e340320d 	movt	r3, #525	; 0x20d
17800f6c:	e3822001 	orr	r2, r2, #1
17800f70:	e5832000 	str	r2, [r3]
17800f74:	e320f000 	nop	{0}
17800f78:	e28bd000 	add	sp, fp, #0
17800f7c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17800f80:	e12fff1e 	bx	lr

17800f84 <ltz_epit_disable>:
17800f84:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17800f88:	e28db000 	add	fp, sp, #0
17800f8c:	e24dd00c 	sub	sp, sp, #12
17800f90:	e50b0008 	str	r0, [fp, #-8]
17800f94:	e51b3008 	ldr	r3, [fp, #-8]
17800f98:	e3530001 	cmp	r3, #1
17800f9c:	0a000008 	beq	17800fc4 <ltz_epit_disable+0x40>
17800fa0:	e51b3008 	ldr	r3, [fp, #-8]
17800fa4:	e3530002 	cmp	r3, #2
17800fa8:	1a000002 	bne	17800fb8 <ltz_epit_disable+0x34>
17800fac:	e3043008 	movw	r3, #16392	; 0x4008
17800fb0:	e340320d 	movt	r3, #525	; 0x20d
17800fb4:	ea000004 	b	17800fcc <ltz_epit_disable+0x48>
17800fb8:	e3a03008 	mov	r3, #8
17800fbc:	e34030d0 	movt	r3, #208	; 0xd0
17800fc0:	ea000001 	b	17800fcc <ltz_epit_disable+0x48>
17800fc4:	e3a03008 	mov	r3, #8
17800fc8:	e340320d 	movt	r3, #525	; 0x20d
17800fcc:	e3e02000 	mvn	r2, #0
17800fd0:	e5832000 	str	r2, [r3]
17800fd4:	e51b3008 	ldr	r3, [fp, #-8]
17800fd8:	e3530001 	cmp	r3, #1
17800fdc:	0a000007 	beq	17801000 <ltz_epit_disable+0x7c>
17800fe0:	e51b3008 	ldr	r3, [fp, #-8]
17800fe4:	e3530002 	cmp	r3, #2
17800fe8:	1a000002 	bne	17800ff8 <ltz_epit_disable+0x74>
17800fec:	e3a03901 	mov	r3, #16384	; 0x4000
17800ff0:	e340320d 	movt	r3, #525	; 0x20d
17800ff4:	ea000003 	b	17801008 <ltz_epit_disable+0x84>
17800ff8:	e3a0360d 	mov	r3, #13631488	; 0xd00000
17800ffc:	ea000001 	b	17801008 <ltz_epit_disable+0x84>
17801000:	e3a03000 	mov	r3, #0
17801004:	e340320d 	movt	r3, #525	; 0x20d
17801008:	e5932000 	ldr	r2, [r3]
1780100c:	e51b3008 	ldr	r3, [fp, #-8]
17801010:	e3530001 	cmp	r3, #1
17801014:	0a000007 	beq	17801038 <ltz_epit_disable+0xb4>
17801018:	e51b3008 	ldr	r3, [fp, #-8]
1780101c:	e3530002 	cmp	r3, #2
17801020:	1a000002 	bne	17801030 <ltz_epit_disable+0xac>
17801024:	e3a03901 	mov	r3, #16384	; 0x4000
17801028:	e340320d 	movt	r3, #525	; 0x20d
1780102c:	ea000003 	b	17801040 <ltz_epit_disable+0xbc>
17801030:	e3a0360d 	mov	r3, #13631488	; 0xd00000
17801034:	ea000001 	b	17801040 <ltz_epit_disable+0xbc>
17801038:	e3a03000 	mov	r3, #0
1780103c:	e340320d 	movt	r3, #525	; 0x20d
17801040:	e3c22001 	bic	r2, r2, #1
17801044:	e5832000 	str	r2, [r3]
17801048:	e51b3008 	ldr	r3, [fp, #-8]
1780104c:	e3530001 	cmp	r3, #1
17801050:	0a000007 	beq	17801074 <ltz_epit_disable+0xf0>
17801054:	e51b3008 	ldr	r3, [fp, #-8]
17801058:	e3530002 	cmp	r3, #2
1780105c:	1a000002 	bne	1780106c <ltz_epit_disable+0xe8>
17801060:	e3a03901 	mov	r3, #16384	; 0x4000
17801064:	e340320d 	movt	r3, #525	; 0x20d
17801068:	ea000003 	b	1780107c <ltz_epit_disable+0xf8>
1780106c:	e3a0360d 	mov	r3, #13631488	; 0xd00000
17801070:	ea000001 	b	1780107c <ltz_epit_disable+0xf8>
17801074:	e3a03000 	mov	r3, #0
17801078:	e340320d 	movt	r3, #525	; 0x20d
1780107c:	e5932000 	ldr	r2, [r3]
17801080:	e51b3008 	ldr	r3, [fp, #-8]
17801084:	e3530001 	cmp	r3, #1
17801088:	0a000007 	beq	178010ac <ltz_epit_disable+0x128>
1780108c:	e51b3008 	ldr	r3, [fp, #-8]
17801090:	e3530002 	cmp	r3, #2
17801094:	1a000002 	bne	178010a4 <ltz_epit_disable+0x120>
17801098:	e3a03901 	mov	r3, #16384	; 0x4000
1780109c:	e340320d 	movt	r3, #525	; 0x20d
178010a0:	ea000003 	b	178010b4 <ltz_epit_disable+0x130>
178010a4:	e3a0360d 	mov	r3, #13631488	; 0xd00000
178010a8:	ea000001 	b	178010b4 <ltz_epit_disable+0x130>
178010ac:	e3a03000 	mov	r3, #0
178010b0:	e340320d 	movt	r3, #525	; 0x20d
178010b4:	e3c22004 	bic	r2, r2, #4
178010b8:	e5832000 	str	r2, [r3]
178010bc:	e51b3008 	ldr	r3, [fp, #-8]
178010c0:	e3530001 	cmp	r3, #1
178010c4:	0a000008 	beq	178010ec <ltz_epit_disable+0x168>
178010c8:	e51b3008 	ldr	r3, [fp, #-8]
178010cc:	e3530002 	cmp	r3, #2
178010d0:	1a000002 	bne	178010e0 <ltz_epit_disable+0x15c>
178010d4:	e3043004 	movw	r3, #16388	; 0x4004
178010d8:	e340320d 	movt	r3, #525	; 0x20d
178010dc:	ea000004 	b	178010f4 <ltz_epit_disable+0x170>
178010e0:	e3a03004 	mov	r3, #4
178010e4:	e34030d0 	movt	r3, #208	; 0xd0
178010e8:	ea000001 	b	178010f4 <ltz_epit_disable+0x170>
178010ec:	e3a03004 	mov	r3, #4
178010f0:	e340320d 	movt	r3, #525	; 0x20d
178010f4:	e5932000 	ldr	r2, [r3]
178010f8:	e51b3008 	ldr	r3, [fp, #-8]
178010fc:	e3530001 	cmp	r3, #1
17801100:	0a000008 	beq	17801128 <ltz_epit_disable+0x1a4>
17801104:	e51b3008 	ldr	r3, [fp, #-8]
17801108:	e3530002 	cmp	r3, #2
1780110c:	1a000002 	bne	1780111c <ltz_epit_disable+0x198>
17801110:	e3043004 	movw	r3, #16388	; 0x4004
17801114:	e340320d 	movt	r3, #525	; 0x20d
17801118:	ea000004 	b	17801130 <ltz_epit_disable+0x1ac>
1780111c:	e3a03004 	mov	r3, #4
17801120:	e34030d0 	movt	r3, #208	; 0xd0
17801124:	ea000001 	b	17801130 <ltz_epit_disable+0x1ac>
17801128:	e3a03004 	mov	r3, #4
1780112c:	e340320d 	movt	r3, #525	; 0x20d
17801130:	e3822001 	orr	r2, r2, #1
17801134:	e5832000 	str	r2, [r3]
17801138:	e320f000 	nop	{0}
1780113c:	e28bd000 	add	sp, fp, #0
17801140:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17801144:	e12fff1e 	bx	lr

17801148 <ltz_epit_reload>:
17801148:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
1780114c:	e28db000 	add	fp, sp, #0
17801150:	e24dd00c 	sub	sp, sp, #12
17801154:	e50b0008 	str	r0, [fp, #-8]
17801158:	e50b100c 	str	r1, [fp, #-12]
1780115c:	e51b3008 	ldr	r3, [fp, #-8]
17801160:	e3530001 	cmp	r3, #1
17801164:	0a000008 	beq	1780118c <ltz_epit_reload+0x44>
17801168:	e51b3008 	ldr	r3, [fp, #-8]
1780116c:	e3530002 	cmp	r3, #2
17801170:	1a000002 	bne	17801180 <ltz_epit_reload+0x38>
17801174:	e3043008 	movw	r3, #16392	; 0x4008
17801178:	e340320d 	movt	r3, #525	; 0x20d
1780117c:	ea000004 	b	17801194 <ltz_epit_reload+0x4c>
17801180:	e3a03008 	mov	r3, #8
17801184:	e34030d0 	movt	r3, #208	; 0xd0
17801188:	ea000001 	b	17801194 <ltz_epit_reload+0x4c>
1780118c:	e3a03008 	mov	r3, #8
17801190:	e340320d 	movt	r3, #525	; 0x20d
17801194:	e51b200c 	ldr	r2, [fp, #-12]
17801198:	e5832000 	str	r2, [r3]
1780119c:	e320f000 	nop	{0}
178011a0:	e28bd000 	add	sp, fp, #0
178011a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
178011a8:	e12fff1e 	bx	lr

178011ac <ltz_epit_init>:
178011ac:	e92d4800 	push	{fp, lr}
178011b0:	e28db004 	add	fp, sp, #4
178011b4:	e24dd010 	sub	sp, sp, #16
178011b8:	e50b0010 	str	r0, [fp, #-16]
178011bc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
178011c0:	e3a03000 	mov	r3, #0
178011c4:	e50b3008 	str	r3, [fp, #-8]
178011c8:	e304306c 	movw	r3, #16492	; 0x406c
178011cc:	e340320c 	movt	r3, #524	; 0x20c
178011d0:	e5932000 	ldr	r2, [r3]
178011d4:	e304306c 	movw	r3, #16492	; 0x406c
178011d8:	e340320c 	movt	r3, #524	; 0x20c
178011dc:	e3822a03 	orr	r2, r2, #12288	; 0x3000
178011e0:	e5832000 	str	r2, [r3]
178011e4:	e51b3010 	ldr	r3, [fp, #-16]
178011e8:	e3530001 	cmp	r3, #1
178011ec:	0a000007 	beq	17801210 <ltz_epit_init+0x64>
178011f0:	e51b3010 	ldr	r3, [fp, #-16]
178011f4:	e3530002 	cmp	r3, #2
178011f8:	1a000002 	bne	17801208 <ltz_epit_init+0x5c>
178011fc:	e3a03901 	mov	r3, #16384	; 0x4000
17801200:	e340320d 	movt	r3, #525	; 0x20d
17801204:	ea000003 	b	17801218 <ltz_epit_init+0x6c>
17801208:	e3a0360d 	mov	r3, #13631488	; 0xd00000
1780120c:	ea000001 	b	17801218 <ltz_epit_init+0x6c>
17801210:	e3a03000 	mov	r3, #0
17801214:	e340320d 	movt	r3, #525	; 0x20d
17801218:	e5932000 	ldr	r2, [r3]
1780121c:	e51b3010 	ldr	r3, [fp, #-16]
17801220:	e3530001 	cmp	r3, #1
17801224:	0a000007 	beq	17801248 <ltz_epit_init+0x9c>
17801228:	e51b3010 	ldr	r3, [fp, #-16]
1780122c:	e3530002 	cmp	r3, #2
17801230:	1a000002 	bne	17801240 <ltz_epit_init+0x94>
17801234:	e3a03901 	mov	r3, #16384	; 0x4000
17801238:	e340320d 	movt	r3, #525	; 0x20d
1780123c:	ea000003 	b	17801250 <ltz_epit_init+0xa4>
17801240:	e3a0360d 	mov	r3, #13631488	; 0xd00000
17801244:	ea000001 	b	17801250 <ltz_epit_init+0xa4>
17801248:	e3a03000 	mov	r3, #0
1780124c:	e340320d 	movt	r3, #525	; 0x20d
17801250:	e3822801 	orr	r2, r2, #65536	; 0x10000
17801254:	e5832000 	str	r2, [r3]
17801258:	e320f000 	nop	{0}
1780125c:	e51b3010 	ldr	r3, [fp, #-16]
17801260:	e3530001 	cmp	r3, #1
17801264:	0a000007 	beq	17801288 <ltz_epit_init+0xdc>
17801268:	e51b3010 	ldr	r3, [fp, #-16]
1780126c:	e3530002 	cmp	r3, #2
17801270:	1a000002 	bne	17801280 <ltz_epit_init+0xd4>
17801274:	e3a03901 	mov	r3, #16384	; 0x4000
17801278:	e340320d 	movt	r3, #525	; 0x20d
1780127c:	ea000003 	b	17801290 <ltz_epit_init+0xe4>
17801280:	e3a0360d 	mov	r3, #13631488	; 0xd00000
17801284:	ea000001 	b	17801290 <ltz_epit_init+0xe4>
17801288:	e3a03000 	mov	r3, #0
1780128c:	e340320d 	movt	r3, #525	; 0x20d
17801290:	e5933000 	ldr	r3, [r3]
17801294:	e2033801 	and	r3, r3, #65536	; 0x10000
17801298:	e3530000 	cmp	r3, #0
1780129c:	1affffee 	bne	1780125c <ltz_epit_init+0xb0>
178012a0:	e51b3008 	ldr	r3, [fp, #-8]
178012a4:	e3833401 	orr	r3, r3, #16777216	; 0x1000000
178012a8:	e50b3008 	str	r3, [fp, #-8]
178012ac:	e3043018 	movw	r3, #16408	; 0x4018
178012b0:	e340320c 	movt	r3, #524	; 0x20c
178012b4:	e5933000 	ldr	r3, [r3]
178012b8:	e1a03aa3 	lsr	r3, r3, #21
178012bc:	e2032003 	and	r2, r3, #3
178012c0:	e3033250 	movw	r3, #12880	; 0x3250
178012c4:	e3413780 	movt	r3, #6016	; 0x1780
178012c8:	e7932102 	ldr	r2, [r3, r2, lsl #2]
178012cc:	e3043014 	movw	r3, #16404	; 0x4014
178012d0:	e340320c 	movt	r3, #524	; 0x20c
178012d4:	e5933000 	ldr	r3, [r3]
178012d8:	e1a03523 	lsr	r3, r3, #10
178012dc:	e2033007 	and	r3, r3, #7
178012e0:	e2833001 	add	r3, r3, #1
178012e4:	e1a01003 	mov	r1, r3
178012e8:	e1a00002 	mov	r0, r2
178012ec:	eb000790 	bl	17803134 <__udivsi3>
178012f0:	e1a03000 	mov	r3, r0
178012f4:	e1a02003 	mov	r2, r3
178012f8:	e3043014 	movw	r3, #16404	; 0x4014
178012fc:	e340320c 	movt	r3, #524	; 0x20c
17801300:	e5933000 	ldr	r3, [r3]
17801304:	e1a03423 	lsr	r3, r3, #8
17801308:	e2033003 	and	r3, r3, #3
1780130c:	e2833001 	add	r3, r3, #1
17801310:	e1a01003 	mov	r1, r3
17801314:	e1a00002 	mov	r0, r2
17801318:	eb000785 	bl	17803134 <__udivsi3>
1780131c:	e1a03000 	mov	r3, r0
17801320:	e1a02003 	mov	r2, r3
17801324:	e30d3e83 	movw	r3, #56963	; 0xde83
17801328:	e344331b 	movt	r3, #17179	; 0x431b
1780132c:	e0832392 	umull	r2, r3, r2, r3
17801330:	e1a03923 	lsr	r3, r3, #18
17801334:	e1a02203 	lsl	r2, r3, #4
17801338:	e30f3ff0 	movw	r3, #65520	; 0xfff0
1780133c:	e0033002 	and	r3, r3, r2
17801340:	e51b2008 	ldr	r2, [fp, #-8]
17801344:	e1823003 	orr	r3, r2, r3
17801348:	e50b3008 	str	r3, [fp, #-8]
1780134c:	e51b3008 	ldr	r3, [fp, #-8]
17801350:	e3833008 	orr	r3, r3, #8
17801354:	e50b3008 	str	r3, [fp, #-8]
17801358:	e320f000 	nop	{0}
1780135c:	e51b3008 	ldr	r3, [fp, #-8]
17801360:	e3833702 	orr	r3, r3, #524288	; 0x80000
17801364:	e50b3008 	str	r3, [fp, #-8]
17801368:	e51b3008 	ldr	r3, [fp, #-8]
1780136c:	e3833602 	orr	r3, r3, #2097152	; 0x200000
17801370:	e50b3008 	str	r3, [fp, #-8]
17801374:	e320f000 	nop	{0}
17801378:	e51b3008 	ldr	r3, [fp, #-8]
1780137c:	e3833802 	orr	r3, r3, #131072	; 0x20000
17801380:	e50b3008 	str	r3, [fp, #-8]
17801384:	e51b3008 	ldr	r3, [fp, #-8]
17801388:	e3833002 	orr	r3, r3, #2
1780138c:	e50b3008 	str	r3, [fp, #-8]
17801390:	e51b3010 	ldr	r3, [fp, #-16]
17801394:	e3530001 	cmp	r3, #1
17801398:	0a000007 	beq	178013bc <ltz_epit_init+0x210>
1780139c:	e51b3010 	ldr	r3, [fp, #-16]
178013a0:	e3530002 	cmp	r3, #2
178013a4:	1a000002 	bne	178013b4 <ltz_epit_init+0x208>
178013a8:	e3a03901 	mov	r3, #16384	; 0x4000
178013ac:	e340320d 	movt	r3, #525	; 0x20d
178013b0:	ea000003 	b	178013c4 <ltz_epit_init+0x218>
178013b4:	e3a0360d 	mov	r3, #13631488	; 0xd00000
178013b8:	ea000001 	b	178013c4 <ltz_epit_init+0x218>
178013bc:	e3a03000 	mov	r3, #0
178013c0:	e340320d 	movt	r3, #525	; 0x20d
178013c4:	e51b2008 	ldr	r2, [fp, #-8]
178013c8:	e5832000 	str	r2, [r3]
178013cc:	e51b3010 	ldr	r3, [fp, #-16]
178013d0:	e3530001 	cmp	r3, #1
178013d4:	0a000008 	beq	178013fc <ltz_epit_init+0x250>
178013d8:	e51b3010 	ldr	r3, [fp, #-16]
178013dc:	e3530002 	cmp	r3, #2
178013e0:	1a000002 	bne	178013f0 <ltz_epit_init+0x244>
178013e4:	e3043008 	movw	r3, #16392	; 0x4008
178013e8:	e340320d 	movt	r3, #525	; 0x20d
178013ec:	ea000004 	b	17801404 <ltz_epit_init+0x258>
178013f0:	e3a03008 	mov	r3, #8
178013f4:	e34030d0 	movt	r3, #208	; 0xd0
178013f8:	ea000001 	b	17801404 <ltz_epit_init+0x258>
178013fc:	e3a03008 	mov	r3, #8
17801400:	e340320d 	movt	r3, #525	; 0x20d
17801404:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
17801408:	e5832000 	str	r2, [r3]
1780140c:	e320f000 	nop	{0}
17801410:	e24bd004 	sub	sp, fp, #4
17801414:	e8bd8800 	pop	{fp, pc}

17801418 <ltz_epit_get_compare_event>:
17801418:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
1780141c:	e28db000 	add	fp, sp, #0
17801420:	e24dd014 	sub	sp, sp, #20
17801424:	e50b0010 	str	r0, [fp, #-16]
17801428:	e51b3010 	ldr	r3, [fp, #-16]
1780142c:	e3530001 	cmp	r3, #1
17801430:	0a000008 	beq	17801458 <ltz_epit_get_compare_event+0x40>
17801434:	e51b3010 	ldr	r3, [fp, #-16]
17801438:	e3530002 	cmp	r3, #2
1780143c:	1a000002 	bne	1780144c <ltz_epit_get_compare_event+0x34>
17801440:	e3043004 	movw	r3, #16388	; 0x4004
17801444:	e340320d 	movt	r3, #525	; 0x20d
17801448:	ea000004 	b	17801460 <ltz_epit_get_compare_event+0x48>
1780144c:	e3a03004 	mov	r3, #4
17801450:	e34030d0 	movt	r3, #208	; 0xd0
17801454:	ea000001 	b	17801460 <ltz_epit_get_compare_event+0x48>
17801458:	e3a03004 	mov	r3, #4
1780145c:	e340320d 	movt	r3, #525	; 0x20d
17801460:	e5933000 	ldr	r3, [r3]
17801464:	e50b3008 	str	r3, [fp, #-8]
17801468:	e51b3008 	ldr	r3, [fp, #-8]
1780146c:	e2033001 	and	r3, r3, #1
17801470:	e3530000 	cmp	r3, #0
17801474:	0a00001e 	beq	178014f4 <ltz_epit_get_compare_event+0xdc>
17801478:	e51b3010 	ldr	r3, [fp, #-16]
1780147c:	e3530001 	cmp	r3, #1
17801480:	0a000008 	beq	178014a8 <ltz_epit_get_compare_event+0x90>
17801484:	e51b3010 	ldr	r3, [fp, #-16]
17801488:	e3530002 	cmp	r3, #2
1780148c:	1a000002 	bne	1780149c <ltz_epit_get_compare_event+0x84>
17801490:	e3043004 	movw	r3, #16388	; 0x4004
17801494:	e340320d 	movt	r3, #525	; 0x20d
17801498:	ea000004 	b	178014b0 <ltz_epit_get_compare_event+0x98>
1780149c:	e3a03004 	mov	r3, #4
178014a0:	e34030d0 	movt	r3, #208	; 0xd0
178014a4:	ea000001 	b	178014b0 <ltz_epit_get_compare_event+0x98>
178014a8:	e3a03004 	mov	r3, #4
178014ac:	e340320d 	movt	r3, #525	; 0x20d
178014b0:	e5932000 	ldr	r2, [r3]
178014b4:	e51b3010 	ldr	r3, [fp, #-16]
178014b8:	e3530001 	cmp	r3, #1
178014bc:	0a000008 	beq	178014e4 <ltz_epit_get_compare_event+0xcc>
178014c0:	e51b3010 	ldr	r3, [fp, #-16]
178014c4:	e3530002 	cmp	r3, #2
178014c8:	1a000002 	bne	178014d8 <ltz_epit_get_compare_event+0xc0>
178014cc:	e3043004 	movw	r3, #16388	; 0x4004
178014d0:	e340320d 	movt	r3, #525	; 0x20d
178014d4:	ea000004 	b	178014ec <ltz_epit_get_compare_event+0xd4>
178014d8:	e3a03004 	mov	r3, #4
178014dc:	e34030d0 	movt	r3, #208	; 0xd0
178014e0:	ea000001 	b	178014ec <ltz_epit_get_compare_event+0xd4>
178014e4:	e3a03004 	mov	r3, #4
178014e8:	e340320d 	movt	r3, #525	; 0x20d
178014ec:	e3822001 	orr	r2, r2, #1
178014f0:	e5832000 	str	r2, [r3]
178014f4:	e51b3008 	ldr	r3, [fp, #-8]
178014f8:	e2033001 	and	r3, r3, #1
178014fc:	e1a00003 	mov	r0, r3
17801500:	e28bd000 	add	sp, fp, #0
17801504:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17801508:	e12fff1e 	bx	lr

1780150c <ltz_epit_delay_us>:
1780150c:	e92d4800 	push	{fp, lr}
17801510:	e28db004 	add	fp, sp, #4
17801514:	e24dd008 	sub	sp, sp, #8
17801518:	e50b0008 	str	r0, [fp, #-8]
1780151c:	e50b100c 	str	r1, [fp, #-12]
17801520:	e51b300c 	ldr	r3, [fp, #-12]
17801524:	e3530000 	cmp	r3, #0
17801528:	0a00000d 	beq	17801564 <ltz_epit_delay_us+0x58>
1780152c:	e51b100c 	ldr	r1, [fp, #-12]
17801530:	e51b0008 	ldr	r0, [fp, #-8]
17801534:	ebffff03 	bl	17801148 <ltz_epit_reload>
17801538:	e51b0008 	ldr	r0, [fp, #-8]
1780153c:	ebfffe2f 	bl	17800e00 <ltz_epit_enable>
17801540:	e320f000 	nop	{0}
17801544:	e51b0008 	ldr	r0, [fp, #-8]
17801548:	ebffffb2 	bl	17801418 <ltz_epit_get_compare_event>
1780154c:	e1a03000 	mov	r3, r0
17801550:	e3530000 	cmp	r3, #0
17801554:	0afffffa 	beq	17801544 <ltz_epit_delay_us+0x38>
17801558:	e51b0008 	ldr	r0, [fp, #-8]
1780155c:	ebfffe88 	bl	17800f84 <ltz_epit_disable>
17801560:	ea000000 	b	17801568 <ltz_epit_delay_us+0x5c>
17801564:	e320f000 	nop	{0}
17801568:	e24bd004 	sub	sp, fp, #4
1780156c:	e8bd8800 	pop	{fp, pc}

17801570 <ltz_init_global_timer>:
17801570:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17801574:	e28db000 	add	fp, sp, #0
17801578:	e24dd00c 	sub	sp, sp, #12
1780157c:	e303324c 	movw	r3, #12876	; 0x324c
17801580:	e3413780 	movt	r3, #6016	; 0x1780
17801584:	e5932000 	ldr	r2, [r3]
17801588:	e30d3e83 	movw	r3, #56963	; 0xde83
1780158c:	e344331b 	movt	r3, #17179	; 0x431b
17801590:	e0832392 	umull	r2, r3, r2, r3
17801594:	e1a039a3 	lsr	r3, r3, #19
17801598:	e2433001 	sub	r3, r3, #1
1780159c:	e50b3008 	str	r3, [fp, #-8]
178015a0:	e3033778 	movw	r3, #14200	; 0x3778
178015a4:	e3413780 	movt	r3, #6016	; 0x1780
178015a8:	e3a02001 	mov	r2, #1
178015ac:	e5832000 	str	r2, [r3]
178015b0:	ea000009 	b	178015dc <ltz_init_global_timer+0x6c>
178015b4:	e51b3008 	ldr	r3, [fp, #-8]
178015b8:	e1a030a3 	lsr	r3, r3, #1
178015bc:	e50b3008 	str	r3, [fp, #-8]
178015c0:	e3033778 	movw	r3, #14200	; 0x3778
178015c4:	e3413780 	movt	r3, #6016	; 0x1780
178015c8:	e5933000 	ldr	r3, [r3]
178015cc:	e2832001 	add	r2, r3, #1
178015d0:	e3033778 	movw	r3, #14200	; 0x3778
178015d4:	e3413780 	movt	r3, #6016	; 0x1780
178015d8:	e5832000 	str	r2, [r3]
178015dc:	e51b3008 	ldr	r3, [fp, #-8]
178015e0:	e35300ff 	cmp	r3, #255	; 0xff
178015e4:	8afffff2 	bhi	178015b4 <ltz_init_global_timer+0x44>
178015e8:	e3a03f82 	mov	r3, #520	; 0x208
178015ec:	e34030a0 	movt	r3, #160	; 0xa0
178015f0:	e5932000 	ldr	r2, [r3]
178015f4:	e3a03f82 	mov	r3, #520	; 0x208
178015f8:	e34030a0 	movt	r3, #160	; 0xa0
178015fc:	e3c22001 	bic	r2, r2, #1
17801600:	e5832000 	str	r2, [r3]
17801604:	e3a03f81 	mov	r3, #516	; 0x204
17801608:	e34030a0 	movt	r3, #160	; 0xa0
1780160c:	e3a02000 	mov	r2, #0
17801610:	e5832000 	str	r2, [r3]
17801614:	e3a03f82 	mov	r3, #520	; 0x208
17801618:	e34030a0 	movt	r3, #160	; 0xa0
1780161c:	e3a02000 	mov	r2, #0
17801620:	e5832000 	str	r2, [r3]
17801624:	e3a03f82 	mov	r3, #520	; 0x208
17801628:	e34030a0 	movt	r3, #160	; 0xa0
1780162c:	e5931000 	ldr	r1, [r3]
17801630:	e51b3008 	ldr	r3, [fp, #-8]
17801634:	e1a03403 	lsl	r3, r3, #8
17801638:	e6ff2073 	uxth	r2, r3
1780163c:	e3a03f82 	mov	r3, #520	; 0x208
17801640:	e34030a0 	movt	r3, #160	; 0xa0
17801644:	e1812002 	orr	r2, r1, r2
17801648:	e5832000 	str	r2, [r3]
1780164c:	e3a03f82 	mov	r3, #520	; 0x208
17801650:	e34030a0 	movt	r3, #160	; 0xa0
17801654:	e5932000 	ldr	r2, [r3]
17801658:	e3a03f82 	mov	r3, #520	; 0x208
1780165c:	e34030a0 	movt	r3, #160	; 0xa0
17801660:	e3822001 	orr	r2, r2, #1
17801664:	e5832000 	str	r2, [r3]
17801668:	e320f000 	nop	{0}
1780166c:	e28bd000 	add	sp, fp, #0
17801670:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17801674:	e12fff1e 	bx	lr

17801678 <ltz_get_microseconds>:
17801678:	e92d4800 	push	{fp, lr}
1780167c:	e28db004 	add	fp, sp, #4
17801680:	e24dd010 	sub	sp, sp, #16
17801684:	e3a03f82 	mov	r3, #520	; 0x208
17801688:	e34030a0 	movt	r3, #160	; 0xa0
1780168c:	e5933000 	ldr	r3, [r3]
17801690:	e50b3008 	str	r3, [fp, #-8]
17801694:	e3a03f81 	mov	r3, #516	; 0x204
17801698:	e34030a0 	movt	r3, #160	; 0xa0
1780169c:	e5933000 	ldr	r3, [r3]
178016a0:	e50b300c 	str	r3, [fp, #-12]
178016a4:	e3a03f82 	mov	r3, #520	; 0x208
178016a8:	e34030a0 	movt	r3, #160	; 0xa0
178016ac:	e5933000 	ldr	r3, [r3]
178016b0:	e50b3010 	str	r3, [fp, #-16]
178016b4:	e51b2010 	ldr	r2, [fp, #-16]
178016b8:	e51b3008 	ldr	r3, [fp, #-8]
178016bc:	e1520003 	cmp	r2, r3
178016c0:	1a00000e 	bne	17801700 <ltz_get_microseconds+0x88>
178016c4:	e3a02020 	mov	r2, #32
178016c8:	e51b3010 	ldr	r3, [fp, #-16]
178016cc:	e1a02213 	lsl	r2, r3, r2
178016d0:	e51b300c 	ldr	r3, [fp, #-12]
178016d4:	e1822003 	orr	r2, r2, r3
178016d8:	e3033778 	movw	r3, #14200	; 0x3778
178016dc:	e3413780 	movt	r3, #6016	; 0x1780
178016e0:	e5933000 	ldr	r3, [r3]
178016e4:	e1a01003 	mov	r1, r3
178016e8:	e1a00002 	mov	r0, r2
178016ec:	eb000690 	bl	17803134 <__udivsi3>
178016f0:	e1a03000 	mov	r3, r0
178016f4:	e1a02003 	mov	r2, r3
178016f8:	e3a03000 	mov	r3, #0
178016fc:	ea000002 	b	1780170c <ltz_get_microseconds+0x94>
17801700:	e51b3010 	ldr	r3, [fp, #-16]
17801704:	e50b3008 	str	r3, [fp, #-8]
17801708:	eaffffe1 	b	17801694 <ltz_get_microseconds+0x1c>
1780170c:	e1a00002 	mov	r0, r2
17801710:	e1a01003 	mov	r1, r3
17801714:	e24bd004 	sub	sp, fp, #4
17801718:	e8bd8800 	pop	{fp, pc}

1780171c <ltz_system_time_init>:
1780171c:	e92d4800 	push	{fp, lr}
17801720:	e28db004 	add	fp, sp, #4
17801724:	ebffff91 	bl	17801570 <ltz_init_global_timer>
17801728:	e3a01ffa 	mov	r1, #1000	; 0x3e8
1780172c:	e3a00001 	mov	r0, #1
17801730:	ebfffe9d 	bl	178011ac <ltz_epit_init>
17801734:	e320f000 	nop	{0}
17801738:	e8bd8800 	pop	{fp, pc}

1780173c <memcpy>:
1780173c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17801740:	e28db000 	add	fp, sp, #0
17801744:	e24dd024 	sub	sp, sp, #36	; 0x24
17801748:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
1780174c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
17801750:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
17801754:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
17801758:	e50b300c 	str	r3, [fp, #-12]
1780175c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
17801760:	e50b3010 	str	r3, [fp, #-16]
17801764:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
17801768:	e2033003 	and	r3, r3, #3
1780176c:	e3530000 	cmp	r3, #0
17801770:	1a000038 	bne	17801858 <memcpy+0x11c>
17801774:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
17801778:	e2033003 	and	r3, r3, #3
1780177c:	e3530000 	cmp	r3, #0
17801780:	1a000034 	bne	17801858 <memcpy+0x11c>
17801784:	e3a03000 	mov	r3, #0
17801788:	e50b3008 	str	r3, [fp, #-8]
1780178c:	ea000013 	b	178017e0 <memcpy+0xa4>
17801790:	e51b3008 	ldr	r3, [fp, #-8]
17801794:	e2833003 	add	r3, r3, #3
17801798:	e1a02003 	mov	r2, r3
1780179c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
178017a0:	e2433001 	sub	r3, r3, #1
178017a4:	e1520003 	cmp	r2, r3
178017a8:	8a000011 	bhi	178017f4 <memcpy+0xb8>
178017ac:	e51b3010 	ldr	r3, [fp, #-16]
178017b0:	e5932000 	ldr	r2, [r3]
178017b4:	e51b300c 	ldr	r3, [fp, #-12]
178017b8:	e5832000 	str	r2, [r3]
178017bc:	e51b300c 	ldr	r3, [fp, #-12]
178017c0:	e2833004 	add	r3, r3, #4
178017c4:	e50b300c 	str	r3, [fp, #-12]
178017c8:	e51b3010 	ldr	r3, [fp, #-16]
178017cc:	e2833004 	add	r3, r3, #4
178017d0:	e50b3010 	str	r3, [fp, #-16]
178017d4:	e51b3008 	ldr	r3, [fp, #-8]
178017d8:	e2833004 	add	r3, r3, #4
178017dc:	e50b3008 	str	r3, [fp, #-8]
178017e0:	e51b3008 	ldr	r3, [fp, #-8]
178017e4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
178017e8:	e1520003 	cmp	r2, r3
178017ec:	8affffe7 	bhi	17801790 <memcpy+0x54>
178017f0:	ea000000 	b	178017f8 <memcpy+0xbc>
178017f4:	e320f000 	nop	{0}
178017f8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
178017fc:	e2432001 	sub	r2, r3, #1
17801800:	e51b3008 	ldr	r3, [fp, #-8]
17801804:	e1520003 	cmp	r2, r3
17801808:	3a000024 	bcc	178018a0 <memcpy+0x164>
1780180c:	ea00000c 	b	17801844 <memcpy+0x108>
17801810:	e51b3010 	ldr	r3, [fp, #-16]
17801814:	e5d32000 	ldrb	r2, [r3]
17801818:	e51b300c 	ldr	r3, [fp, #-12]
1780181c:	e5c32000 	strb	r2, [r3]
17801820:	e51b300c 	ldr	r3, [fp, #-12]
17801824:	e2833001 	add	r3, r3, #1
17801828:	e50b300c 	str	r3, [fp, #-12]
1780182c:	e51b3010 	ldr	r3, [fp, #-16]
17801830:	e2833001 	add	r3, r3, #1
17801834:	e50b3010 	str	r3, [fp, #-16]
17801838:	e51b3008 	ldr	r3, [fp, #-8]
1780183c:	e2833001 	add	r3, r3, #1
17801840:	e50b3008 	str	r3, [fp, #-8]
17801844:	e51b3008 	ldr	r3, [fp, #-8]
17801848:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
1780184c:	e1520003 	cmp	r2, r3
17801850:	8affffee 	bhi	17801810 <memcpy+0xd4>
17801854:	ea000011 	b	178018a0 <memcpy+0x164>
17801858:	e3a03000 	mov	r3, #0
1780185c:	e50b3008 	str	r3, [fp, #-8]
17801860:	ea00000a 	b	17801890 <memcpy+0x154>
17801864:	e51b3008 	ldr	r3, [fp, #-8]
17801868:	e51b2010 	ldr	r2, [fp, #-16]
1780186c:	e0822003 	add	r2, r2, r3
17801870:	e51b3008 	ldr	r3, [fp, #-8]
17801874:	e51b100c 	ldr	r1, [fp, #-12]
17801878:	e0813003 	add	r3, r1, r3
1780187c:	e5d22000 	ldrb	r2, [r2]
17801880:	e5c32000 	strb	r2, [r3]
17801884:	e51b3008 	ldr	r3, [fp, #-8]
17801888:	e2833001 	add	r3, r3, #1
1780188c:	e50b3008 	str	r3, [fp, #-8]
17801890:	e51b3008 	ldr	r3, [fp, #-8]
17801894:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
17801898:	e1520003 	cmp	r2, r3
1780189c:	8afffff0 	bhi	17801864 <memcpy+0x128>
178018a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
178018a4:	e1a00003 	mov	r0, r3
178018a8:	e28bd000 	add	sp, fp, #0
178018ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
178018b0:	e12fff1e 	bx	lr

178018b4 <memset>:
178018b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
178018b8:	e28db000 	add	fp, sp, #0
178018bc:	e24dd01c 	sub	sp, sp, #28
178018c0:	e50b0010 	str	r0, [fp, #-16]
178018c4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
178018c8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
178018cc:	e51b3010 	ldr	r3, [fp, #-16]
178018d0:	e50b3008 	str	r3, [fp, #-8]
178018d4:	ea000006 	b	178018f4 <memset+0x40>
178018d8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
178018dc:	e6ef2073 	uxtb	r2, r3
178018e0:	e51b3008 	ldr	r3, [fp, #-8]
178018e4:	e5c32000 	strb	r2, [r3]
178018e8:	e51b3008 	ldr	r3, [fp, #-8]
178018ec:	e2833001 	add	r3, r3, #1
178018f0:	e50b3008 	str	r3, [fp, #-8]
178018f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
178018f8:	e2432001 	sub	r2, r3, #1
178018fc:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
17801900:	e3530000 	cmp	r3, #0
17801904:	1afffff3 	bne	178018d8 <memset+0x24>
17801908:	e51b3010 	ldr	r3, [fp, #-16]
1780190c:	e1a00003 	mov	r0, r3
17801910:	e28bd000 	add	sp, fp, #0
17801914:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17801918:	e12fff1e 	bx	lr

1780191c <strcat>:
1780191c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17801920:	e28db000 	add	fp, sp, #0
17801924:	e24dd014 	sub	sp, sp, #20
17801928:	e50b0010 	str	r0, [fp, #-16]
1780192c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
17801930:	e51b3010 	ldr	r3, [fp, #-16]
17801934:	e50b3008 	str	r3, [fp, #-8]
17801938:	ea000002 	b	17801948 <strcat+0x2c>
1780193c:	e51b3010 	ldr	r3, [fp, #-16]
17801940:	e2833001 	add	r3, r3, #1
17801944:	e50b3010 	str	r3, [fp, #-16]
17801948:	e51b3010 	ldr	r3, [fp, #-16]
1780194c:	e5d33000 	ldrb	r3, [r3]
17801950:	e3530000 	cmp	r3, #0
17801954:	1afffff8 	bne	1780193c <strcat+0x20>
17801958:	e320f000 	nop	{0}
1780195c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
17801960:	e2823001 	add	r3, r2, #1
17801964:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
17801968:	e51b3010 	ldr	r3, [fp, #-16]
1780196c:	e2831001 	add	r1, r3, #1
17801970:	e50b1010 	str	r1, [fp, #-16]
17801974:	e5d22000 	ldrb	r2, [r2]
17801978:	e5c32000 	strb	r2, [r3]
1780197c:	e5d33000 	ldrb	r3, [r3]
17801980:	e3530000 	cmp	r3, #0
17801984:	1afffff4 	bne	1780195c <strcat+0x40>
17801988:	e51b3008 	ldr	r3, [fp, #-8]
1780198c:	e1a00003 	mov	r0, r3
17801990:	e28bd000 	add	sp, fp, #0
17801994:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17801998:	e12fff1e 	bx	lr

1780199c <strlen>:
1780199c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
178019a0:	e28db000 	add	fp, sp, #0
178019a4:	e24dd014 	sub	sp, sp, #20
178019a8:	e50b0010 	str	r0, [fp, #-16]
178019ac:	e51b3010 	ldr	r3, [fp, #-16]
178019b0:	e50b3008 	str	r3, [fp, #-8]
178019b4:	ea000002 	b	178019c4 <strlen+0x28>
178019b8:	e51b3008 	ldr	r3, [fp, #-8]
178019bc:	e2833001 	add	r3, r3, #1
178019c0:	e50b3008 	str	r3, [fp, #-8]
178019c4:	e51b3008 	ldr	r3, [fp, #-8]
178019c8:	e5d33000 	ldrb	r3, [r3]
178019cc:	e3530000 	cmp	r3, #0
178019d0:	1afffff8 	bne	178019b8 <strlen+0x1c>
178019d4:	e51b2008 	ldr	r2, [fp, #-8]
178019d8:	e51b3010 	ldr	r3, [fp, #-16]
178019dc:	e0423003 	sub	r3, r2, r3
178019e0:	e1a00003 	mov	r0, r3
178019e4:	e28bd000 	add	sp, fp, #0
178019e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
178019ec:	e12fff1e 	bx	lr

178019f0 <strnlen>:
178019f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
178019f4:	e28db000 	add	fp, sp, #0
178019f8:	e24dd014 	sub	sp, sp, #20
178019fc:	e50b0010 	str	r0, [fp, #-16]
17801a00:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
17801a04:	e51b3010 	ldr	r3, [fp, #-16]
17801a08:	e50b3008 	str	r3, [fp, #-8]
17801a0c:	ea000002 	b	17801a1c <strnlen+0x2c>
17801a10:	e51b3008 	ldr	r3, [fp, #-8]
17801a14:	e2833001 	add	r3, r3, #1
17801a18:	e50b3008 	str	r3, [fp, #-8]
17801a1c:	e51b3008 	ldr	r3, [fp, #-8]
17801a20:	e5d33000 	ldrb	r3, [r3]
17801a24:	e3530000 	cmp	r3, #0
17801a28:	0a000004 	beq	17801a40 <strnlen+0x50>
17801a2c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17801a30:	e2432001 	sub	r2, r3, #1
17801a34:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
17801a38:	e3530000 	cmp	r3, #0
17801a3c:	1afffff3 	bne	17801a10 <strnlen+0x20>
17801a40:	e51b2008 	ldr	r2, [fp, #-8]
17801a44:	e51b3010 	ldr	r3, [fp, #-16]
17801a48:	e0423003 	sub	r3, r2, r3
17801a4c:	e1a00003 	mov	r0, r3
17801a50:	e28bd000 	add	sp, fp, #0
17801a54:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17801a58:	e12fff1e 	bx	lr

17801a5c <strcpy>:
17801a5c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17801a60:	e28db000 	add	fp, sp, #0
17801a64:	e24dd014 	sub	sp, sp, #20
17801a68:	e50b0010 	str	r0, [fp, #-16]
17801a6c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
17801a70:	e51b3010 	ldr	r3, [fp, #-16]
17801a74:	e50b3008 	str	r3, [fp, #-8]
17801a78:	e320f000 	nop	{0}
17801a7c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
17801a80:	e2823001 	add	r3, r2, #1
17801a84:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
17801a88:	e51b3010 	ldr	r3, [fp, #-16]
17801a8c:	e2831001 	add	r1, r3, #1
17801a90:	e50b1010 	str	r1, [fp, #-16]
17801a94:	e5d22000 	ldrb	r2, [r2]
17801a98:	e5c32000 	strb	r2, [r3]
17801a9c:	e5d33000 	ldrb	r3, [r3]
17801aa0:	e3530000 	cmp	r3, #0
17801aa4:	1afffff4 	bne	17801a7c <strcpy+0x20>
17801aa8:	e51b3008 	ldr	r3, [fp, #-8]
17801aac:	e1a00003 	mov	r0, r3
17801ab0:	e28bd000 	add	sp, fp, #0
17801ab4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17801ab8:	e12fff1e 	bx	lr

17801abc <csu_init>:
17801abc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17801ac0:	e28db000 	add	fp, sp, #0
17801ac4:	e24dd00c 	sub	sp, sp, #12
17801ac8:	e3a03787 	mov	r3, #35389440	; 0x21c0000
17801acc:	e50b3008 	str	r3, [fp, #-8]
17801ad0:	ea000006 	b	17801af0 <csu_init+0x34>
17801ad4:	e51b2008 	ldr	r2, [fp, #-8]
17801ad8:	e3a030ff 	mov	r3, #255	; 0xff
17801adc:	e34030ff 	movt	r3, #255	; 0xff
17801ae0:	e5823000 	str	r3, [r2]
17801ae4:	e51b3008 	ldr	r3, [fp, #-8]
17801ae8:	e2833004 	add	r3, r3, #4
17801aec:	e50b3008 	str	r3, [fp, #-8]
17801af0:	e51b2008 	ldr	r2, [fp, #-8]
17801af4:	e3a0309f 	mov	r3, #159	; 0x9f
17801af8:	e340321c 	movt	r3, #540	; 0x21c
17801afc:	e1520003 	cmp	r2, r3
17801b00:	9afffff3 	bls	17801ad4 <csu_init+0x18>
17801b04:	e3a03028 	mov	r3, #40	; 0x28
17801b08:	e340320e 	movt	r3, #526	; 0x20e
17801b0c:	e3032810 	movw	r2, #14352	; 0x3810
17801b10:	e5832000 	str	r2, [r3]
17801b14:	e320f000 	nop	{0}
17801b18:	e28bd000 	add	sp, fp, #0
17801b1c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17801b20:	e12fff1e 	bx	lr

17801b24 <normal_world>:
17801b24:	e92d4800 	push	{fp, lr}
17801b28:	e28db004 	add	fp, sp, #4
17801b2c:	e24dd008 	sub	sp, sp, #8
17801b30:	e3a03000 	mov	r3, #0
17801b34:	e50b3008 	str	r3, [fp, #-8]
17801b38:	e3030280 	movw	r0, #12928	; 0x3280
17801b3c:	e3410780 	movt	r0, #6016	; 0x1780
17801b40:	ebfffb5f 	bl	178008c4 <printk>
17801b44:	e3030298 	movw	r0, #12952	; 0x3298
17801b48:	e3410780 	movt	r0, #6016	; 0x1780
17801b4c:	ebfffb5c 	bl	178008c4 <printk>
17801b50:	e30302a8 	movw	r0, #12968	; 0x32a8
17801b54:	e3410780 	movt	r0, #6016	; 0x1780
17801b58:	ebfffb59 	bl	178008c4 <printk>
17801b5c:	e3a03000 	mov	r3, #0
17801b60:	e50b3008 	str	r3, [fp, #-8]
17801b64:	ea000002 	b	17801b74 <normal_world+0x50>
17801b68:	e51b3008 	ldr	r3, [fp, #-8]
17801b6c:	e2833001 	add	r3, r3, #1
17801b70:	e50b3008 	str	r3, [fp, #-8]
17801b74:	e51b3008 	ldr	r3, [fp, #-8]
17801b78:	e30c234f 	movw	r2, #49999	; 0xc34f
17801b7c:	e1530002 	cmp	r3, r2
17801b80:	dafffff8 	ble	17801b68 <normal_world+0x44>
17801b84:	eafffff1 	b	17801b50 <normal_world+0x2c>

17801b88 <epit_delay_test>:
17801b88:	e92d4800 	push	{fp, lr}
17801b8c:	e28db004 	add	fp, sp, #4
17801b90:	e24dd008 	sub	sp, sp, #8
17801b94:	e3a03000 	mov	r3, #0
17801b98:	e50b3008 	str	r3, [fp, #-8]
17801b9c:	e3a0300a 	mov	r3, #10
17801ba0:	e50b300c 	str	r3, [fp, #-12]
17801ba4:	e30302bc 	movw	r0, #12988	; 0x32bc
17801ba8:	e3410780 	movt	r0, #6016	; 0x1780
17801bac:	ebfffb44 	bl	178008c4 <printk>
17801bb0:	e51b100c 	ldr	r1, [fp, #-12]
17801bb4:	e30302f0 	movw	r0, #13040	; 0x32f0
17801bb8:	e3410780 	movt	r0, #6016	; 0x1780
17801bbc:	ebfffb40 	bl	178008c4 <printk>
17801bc0:	ea00000a 	b	17801bf0 <epit_delay_test+0x68>
17801bc4:	e3041240 	movw	r1, #16960	; 0x4240
17801bc8:	e340100f 	movt	r1, #15
17801bcc:	e3a00002 	mov	r0, #2
17801bd0:	ebfffe4d 	bl	1780150c <ltz_epit_delay_us>
17801bd4:	e51b3008 	ldr	r3, [fp, #-8]
17801bd8:	e2833001 	add	r3, r3, #1
17801bdc:	e50b3008 	str	r3, [fp, #-8]
17801be0:	e51b1008 	ldr	r1, [fp, #-8]
17801be4:	e3030314 	movw	r0, #13076	; 0x3314
17801be8:	e3410780 	movt	r0, #6016	; 0x1780
17801bec:	ebfffb34 	bl	178008c4 <printk>
17801bf0:	e51b2008 	ldr	r2, [fp, #-8]
17801bf4:	e51b300c 	ldr	r3, [fp, #-12]
17801bf8:	e1520003 	cmp	r2, r3
17801bfc:	1afffff0 	bne	17801bc4 <epit_delay_test+0x3c>
17801c00:	e320f000 	nop	{0}
17801c04:	e24bd004 	sub	sp, fp, #4
17801c08:	e8bd8800 	pop	{fp, pc}

17801c0c <tick_timer_interrupt_routine>:
17801c0c:	e92d4800 	push	{fp, lr}
17801c10:	e28db004 	add	fp, sp, #4
17801c14:	e3033760 	movw	r3, #14176	; 0x3760
17801c18:	e3413780 	movt	r3, #6016	; 0x1780
17801c1c:	e3a02000 	mov	r2, #0
17801c20:	e5c32000 	strb	r2, [r3]
17801c24:	e3a00002 	mov	r0, #2
17801c28:	ebfffdfa 	bl	17801418 <ltz_epit_get_compare_event>
17801c2c:	e320f000 	nop	{0}
17801c30:	e8bd8800 	pop	{fp, pc}

17801c34 <epit_kickoff>:
17801c34:	e92d4800 	push	{fp, lr}
17801c38:	e28db004 	add	fp, sp, #4
17801c3c:	e24dd008 	sub	sp, sp, #8
17801c40:	e3a03059 	mov	r3, #89	; 0x59
17801c44:	e50b3008 	str	r3, [fp, #-8]
17801c48:	e303031c 	movw	r0, #13084	; 0x331c
17801c4c:	e3410780 	movt	r0, #6016	; 0x1780
17801c50:	ebfffb1b 	bl	178008c4 <printk>
17801c54:	e3081480 	movw	r1, #33920	; 0x8480
17801c58:	e340101e 	movt	r1, #30
17801c5c:	e3a00002 	mov	r0, #2
17801c60:	ebfffd51 	bl	178011ac <ltz_epit_init>
17801c64:	e51b3008 	ldr	r3, [fp, #-8]
17801c68:	e3011c0c 	movw	r1, #7180	; 0x1c0c
17801c6c:	e3411780 	movt	r1, #6016	; 0x1780
17801c70:	e1a00003 	mov	r0, r3
17801c74:	eb000330 	bl	1780293c <register_interrupt_routine>
17801c78:	e51b3008 	ldr	r3, [fp, #-8]
17801c7c:	e3a02000 	mov	r2, #0
17801c80:	e3a01000 	mov	r1, #0
17801c84:	e1a00003 	mov	r0, r3
17801c88:	eb000315 	bl	178028e4 <enable_interrupt>
17801c8c:	e51b3008 	ldr	r3, [fp, #-8]
17801c90:	e3a02000 	mov	r2, #0
17801c94:	e3a01000 	mov	r1, #0
17801c98:	e1a00003 	mov	r0, r3
17801c9c:	eb00033f 	bl	178029a0 <enable_secure_interrupt>
17801ca0:	e3a00002 	mov	r0, #2
17801ca4:	ebfffc55 	bl	17800e00 <ltz_epit_enable>
17801ca8:	eafffffe 	b	17801ca8 <epit_kickoff+0x74>

17801cac <epit_tick_test>:
17801cac:	e92d4800 	push	{fp, lr}
17801cb0:	e28db004 	add	fp, sp, #4
17801cb4:	e24dd010 	sub	sp, sp, #16
17801cb8:	e3a03000 	mov	r3, #0
17801cbc:	e50b3008 	str	r3, [fp, #-8]
17801cc0:	e3a0300a 	mov	r3, #10
17801cc4:	e50b300c 	str	r3, [fp, #-12]
17801cc8:	e3a03000 	mov	r3, #0
17801ccc:	e50b3010 	str	r3, [fp, #-16]
17801cd0:	e3a03059 	mov	r3, #89	; 0x59
17801cd4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
17801cd8:	e3030364 	movw	r0, #13156	; 0x3364
17801cdc:	e3410780 	movt	r0, #6016	; 0x1780
17801ce0:	ebfffaf7 	bl	178008c4 <printk>
17801ce4:	e51b100c 	ldr	r1, [fp, #-12]
17801ce8:	e30303b0 	movw	r0, #13232	; 0x33b0
17801cec:	e3410780 	movt	r0, #6016	; 0x1780
17801cf0:	ebfffaf3 	bl	178008c4 <printk>
17801cf4:	e3041b40 	movw	r1, #19264	; 0x4b40
17801cf8:	e340104c 	movt	r1, #76	; 0x4c
17801cfc:	e3a00002 	mov	r0, #2
17801d00:	ebfffd29 	bl	178011ac <ltz_epit_init>
17801d04:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17801d08:	e3011c0c 	movw	r1, #7180	; 0x1c0c
17801d0c:	e3411780 	movt	r1, #6016	; 0x1780
17801d10:	e1a00003 	mov	r0, r3
17801d14:	eb000308 	bl	1780293c <register_interrupt_routine>
17801d18:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17801d1c:	e3a02000 	mov	r2, #0
17801d20:	e3a01000 	mov	r1, #0
17801d24:	e1a00003 	mov	r0, r3
17801d28:	eb0002ed 	bl	178028e4 <enable_interrupt>
17801d2c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17801d30:	e3a02000 	mov	r2, #0
17801d34:	e3a01000 	mov	r1, #0
17801d38:	e1a00003 	mov	r0, r3
17801d3c:	eb000317 	bl	178029a0 <enable_secure_interrupt>
17801d40:	e3a00002 	mov	r0, #2
17801d44:	ebfffc2d 	bl	17800e00 <ltz_epit_enable>
17801d48:	ea000019 	b	17801db4 <epit_tick_test+0x108>
17801d4c:	e3033760 	movw	r3, #14176	; 0x3760
17801d50:	e3413780 	movt	r3, #6016	; 0x1780
17801d54:	e3a02001 	mov	r2, #1
17801d58:	e5c32000 	strb	r2, [r3]
17801d5c:	e320f000 	nop	{0}
17801d60:	e3033760 	movw	r3, #14176	; 0x3760
17801d64:	e3413780 	movt	r3, #6016	; 0x1780
17801d68:	e5d33000 	ldrb	r3, [r3]
17801d6c:	e6ef3073 	uxtb	r3, r3
17801d70:	e3530001 	cmp	r3, #1
17801d74:	0afffff9 	beq	17801d60 <epit_tick_test+0xb4>
17801d78:	e51b3008 	ldr	r3, [fp, #-8]
17801d7c:	e2833001 	add	r3, r3, #1
17801d80:	e50b3008 	str	r3, [fp, #-8]
17801d84:	e51b3008 	ldr	r3, [fp, #-8]
17801d88:	e3530000 	cmp	r3, #0
17801d8c:	1a000008 	bne	17801db4 <epit_tick_test+0x108>
17801d90:	e51b2008 	ldr	r2, [fp, #-8]
17801d94:	e1a03002 	mov	r3, r2
17801d98:	e1a03103 	lsl	r3, r3, #2
17801d9c:	e0833002 	add	r3, r3, r2
17801da0:	e51b2008 	ldr	r2, [fp, #-8]
17801da4:	e1a01003 	mov	r1, r3
17801da8:	e30303d4 	movw	r0, #13268	; 0x33d4
17801dac:	e3410780 	movt	r0, #6016	; 0x1780
17801db0:	ebfffac3 	bl	178008c4 <printk>
17801db4:	e51b2008 	ldr	r2, [fp, #-8]
17801db8:	e30c3ccd 	movw	r3, #52429	; 0xcccd
17801dbc:	e34c3ccc 	movt	r3, #52428	; 0xcccc
17801dc0:	e0832392 	umull	r2, r3, r2, r3
17801dc4:	e1a031a3 	lsr	r3, r3, #3
17801dc8:	e51b200c 	ldr	r2, [fp, #-12]
17801dcc:	e1520003 	cmp	r2, r3
17801dd0:	1affffdd 	bne	17801d4c <epit_tick_test+0xa0>
17801dd4:	e3a00002 	mov	r0, #2
17801dd8:	ebfffc69 	bl	17800f84 <ltz_epit_disable>
17801ddc:	e320f000 	nop	{0}
17801de0:	e24bd004 	sub	sp, fp, #4
17801de4:	e8bd8800 	pop	{fp, pc}

17801de8 <main>:
17801de8:	e92d4800 	push	{fp, lr}
17801dec:	e28db004 	add	fp, sp, #4
17801df0:	e3a00cc2 	mov	r0, #49664	; 0xc200
17801df4:	e3400001 	movt	r0, #1
17801df8:	ebfffac6 	bl	17800918 <ltz_uart_init>
17801dfc:	eb0001d7 	bl	17802560 <gic_init>
17801e00:	e3a00001 	mov	r0, #1
17801e04:	eb00024e 	bl	17802744 <arm_set_interrupt_state>
17801e08:	ebffff2b 	bl	17801abc <csu_init>
17801e0c:	ebfffe42 	bl	1780171c <ltz_system_time_init>
17801e10:	ebffffa5 	bl	17801cac <epit_tick_test>
17801e14:	eafffffe 	b	17801e14 <main+0x2c>
	...

17801e20 <monitor>:
17801e20:	e1a00000 	nop			; (mov r0, r0)
17801e24:	e1a00000 	nop			; (mov r0, r0)
17801e28:	ea000004 	b	17801e40 <smc_handler>
17801e2c:	e1a00000 	nop			; (mov r0, r0)
17801e30:	e1a00000 	nop			; (mov r0, r0)
17801e34:	e1a00000 	nop			; (mov r0, r0)
17801e38:	ea000456 	b	17802f98 <MON_IRQ_HDLR>
17801e3c:	ea000422 	b	17802ecc <MON_FIQ_HDLR>

17801e40 <smc_handler>:
17801e40:	e92d000f 	push	{r0, r1, r2, r3}
17801e44:	ee110f11 	mrc	15, 0, r0, cr1, cr1, {0}
17801e48:	e3100001 	tst	r0, #1
17801e4c:	e2200001 	eor	r0, r0, #1
17801e50:	e2200004 	eor	r0, r0, #4
17801e54:	ee010f11 	mcr	15, 0, r0, cr1, cr1, {0}
17801e58:	059f01d0 	ldreq	r0, [pc, #464]	; 17802030 <ns_image+0x4>
17801e5c:	159f01d0 	ldrne	r0, [pc, #464]	; 17802034 <ns_image+0x8>
17801e60:	e5902000 	ldr	r2, [r0]
17801e64:	059f11c8 	ldreq	r1, [pc, #456]	; 17802034 <ns_image+0x8>
17801e68:	159f11c0 	ldrne	r1, [pc, #448]	; 17802030 <ns_image+0x4>
17801e6c:	e5913000 	ldr	r3, [r1]
17801e70:	e9221ff0 	stmdb	r2!, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
17801e74:	e14f4000 	mrs	r4, SPSR
17801e78:	e9224010 	stmdb	r2!, {r4, lr}
17801e7c:	e5802000 	str	r2, [r0]
17801e80:	e8b34001 	ldm	r3!, {r0, lr}
17801e84:	e16ff000 	msr	SPSR_fsxc, r0
17801e88:	e8b31ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
17801e8c:	e5813000 	str	r3, [r1]
17801e90:	f57ff01f 	clrex
17801e94:	e8bd000f 	pop	{r0, r1, r2, r3}
17801e98:	e1b0000e 	movs	r0, lr
17801e9c:	eb0003e9 	bl	17802e48 <MON_ABT_HDLR>
17801ea0:	e1b0f00e 	movs	pc, lr

17801ea4 <init_secure_monitor>:
17801ea4:	e59f118c 	ldr	r1, [pc, #396]	; 17802038 <ns_image+0xc>
17801ea8:	e5810000 	str	r0, [r1]
17801eac:	e59f0188 	ldr	r0, [pc, #392]	; 1780203c <ns_image+0x10>
17801eb0:	ee0c0f30 	mcr	15, 0, r0, cr12, cr0, {1}
17801eb4:	e59f0184 	ldr	r0, [pc, #388]	; 17802040 <ns_image+0x14>
17801eb8:	e9201ff0 	stmdb	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
17801ebc:	e10f1000 	mrs	r1, CPSR
17801ec0:	e9204002 	stmdb	r0!, {r1, lr}
17801ec4:	f1020016 	cps	#22
17801ec8:	e59f1160 	ldr	r1, [pc, #352]	; 17802030 <ns_image+0x4>
17801ecc:	e5810000 	str	r0, [r1]
17801ed0:	e59f015c 	ldr	r0, [pc, #348]	; 17802034 <ns_image+0x8>
17801ed4:	e59f1168 	ldr	r1, [pc, #360]	; 17802044 <ns_image+0x18>
17801ed8:	e5801000 	str	r1, [r0]
17801edc:	e59fe148 	ldr	lr, [pc, #328]	; 1780202c <ns_image>
17801ee0:	e36ff013 	msr	SPSR_fsxc, #19
17801ee4:	ee114f11 	mrc	15, 0, r4, cr1, cr1, {0}
17801ee8:	e3844001 	orr	r4, r4, #1
17801eec:	e3844004 	orr	r4, r4, #4
17801ef0:	ee014f11 	mcr	15, 0, r4, cr1, cr1, {0}
17801ef4:	e3a00000 	mov	r0, #0
17801ef8:	e3a01000 	mov	r1, #0
17801efc:	e3a02000 	mov	r2, #0
17801f00:	e3a03000 	mov	r3, #0
17801f04:	e3a04000 	mov	r4, #0
17801f08:	e3a05000 	mov	r5, #0
17801f0c:	e3a06000 	mov	r6, #0
17801f10:	e3a07000 	mov	r7, #0
17801f14:	e3a08000 	mov	r8, #0
17801f18:	e3a09000 	mov	r9, #0
17801f1c:	e3a0a000 	mov	sl, #0
17801f20:	e3a0b000 	mov	fp, #0
17801f24:	e3a0c000 	mov	ip, #0
17801f28:	e1b0f00e 	movs	pc, lr

17801f2c <NS_STACK_BASE>:
	...

17801fa8 <NS_STACK_LIMIT>:
	...

17802024 <NS_STACK_SP>:
17802024:	00000000 	andeq	r0, r0, r0

17802028 <S_STACK_SP>:
17802028:	00000000 	andeq	r0, r0, r0

1780202c <ns_image>:
1780202c:	00000000 	andeq	r0, r0, r0
17802030:	17802028 	strne	r2, [r0, r8, lsr #32]
17802034:	17802024 	strne	r2, [r0, r4, lsr #32]
17802038:	1780202c 	strne	r2, [r0, ip, lsr #32]
1780203c:	17801e20 	strne	r1, [r0, r0, lsr #28]
17802040:	17802024 	strne	r2, [r0, r4, lsr #32]
17802044:	17801fa8 	strne	r1, [r0, r8, lsr #31]

17802048 <ltzvisor_hw_init>:
17802048:	e92d4800 	push	{fp, lr}
1780204c:	e28db004 	add	fp, sp, #4
17802050:	e24dd010 	sub	sp, sp, #16
17802054:	e3a03001 	mov	r3, #1
17802058:	e50b3008 	str	r3, [fp, #-8]
1780205c:	e3a03003 	mov	r3, #3
17802060:	e50b300c 	str	r3, [fp, #-12]
17802064:	e3a03000 	mov	r3, #0
17802068:	e50b3010 	str	r3, [fp, #-16]
1780206c:	e3a03000 	mov	r3, #0
17802070:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
17802074:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
17802078:	e51b1010 	ldr	r1, [fp, #-16]
1780207c:	e51b000c 	ldr	r0, [fp, #-12]
17802080:	eb000217 	bl	178028e4 <enable_interrupt>
17802084:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
17802088:	e51b1010 	ldr	r1, [fp, #-16]
1780208c:	e51b000c 	ldr	r0, [fp, #-12]
17802090:	eb000242 	bl	178029a0 <enable_secure_interrupt>
17802094:	e51b3008 	ldr	r3, [fp, #-8]
17802098:	e1a00003 	mov	r0, r3
1780209c:	e24bd004 	sub	sp, fp, #4
178020a0:	e8bd8800 	pop	{fp, pc}

178020a4 <gic_get_gicd>:
178020a4:	e92d4800 	push	{fp, lr}
178020a8:	e28db004 	add	fp, sp, #4
178020ac:	e24dd008 	sub	sp, sp, #8
178020b0:	eb0001c3 	bl	178027c4 <get_arm_private_peripheral_base>
178020b4:	e1a03000 	mov	r3, r0
178020b8:	e2833a01 	add	r3, r3, #4096	; 0x1000
178020bc:	e50b3008 	str	r3, [fp, #-8]
178020c0:	e51b3008 	ldr	r3, [fp, #-8]
178020c4:	e1a00003 	mov	r0, r3
178020c8:	e24bd004 	sub	sp, fp, #4
178020cc:	e8bd8800 	pop	{fp, pc}

178020d0 <gic_get_gicc>:
178020d0:	e92d4800 	push	{fp, lr}
178020d4:	e28db004 	add	fp, sp, #4
178020d8:	e24dd008 	sub	sp, sp, #8
178020dc:	eb0001b8 	bl	178027c4 <get_arm_private_peripheral_base>
178020e0:	e1a03000 	mov	r3, r0
178020e4:	e2833c01 	add	r3, r3, #256	; 0x100
178020e8:	e50b3008 	str	r3, [fp, #-8]
178020ec:	e51b3008 	ldr	r3, [fp, #-8]
178020f0:	e1a00003 	mov	r0, r3
178020f4:	e24bd004 	sub	sp, fp, #4
178020f8:	e8bd8800 	pop	{fp, pc}

178020fc <irq_get_register_offset>:
178020fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17802100:	e28db000 	add	fp, sp, #0
17802104:	e24dd00c 	sub	sp, sp, #12
17802108:	e50b0008 	str	r0, [fp, #-8]
1780210c:	e51b3008 	ldr	r3, [fp, #-8]
17802110:	e1a032a3 	lsr	r3, r3, #5
17802114:	e1a00003 	mov	r0, r3
17802118:	e28bd000 	add	sp, fp, #0
1780211c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17802120:	e12fff1e 	bx	lr

17802124 <irq_get_bit_offset>:
17802124:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17802128:	e28db000 	add	fp, sp, #0
1780212c:	e24dd00c 	sub	sp, sp, #12
17802130:	e50b0008 	str	r0, [fp, #-8]
17802134:	e51b3008 	ldr	r3, [fp, #-8]
17802138:	e203301f 	and	r3, r3, #31
1780213c:	e1a00003 	mov	r0, r3
17802140:	e28bd000 	add	sp, fp, #0
17802144:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17802148:	e12fff1e 	bx	lr

1780214c <irq_get_bit_mask>:
1780214c:	e92d4800 	push	{fp, lr}
17802150:	e28db004 	add	fp, sp, #4
17802154:	e24dd008 	sub	sp, sp, #8
17802158:	e50b0008 	str	r0, [fp, #-8]
1780215c:	e51b0008 	ldr	r0, [fp, #-8]
17802160:	ebffffef 	bl	17802124 <irq_get_bit_offset>
17802164:	e1a02000 	mov	r2, r0
17802168:	e3a03001 	mov	r3, #1
1780216c:	e1a03213 	lsl	r3, r3, r2
17802170:	e1a00003 	mov	r0, r3
17802174:	e24bd004 	sub	sp, fp, #4
17802178:	e8bd8800 	pop	{fp, pc}

1780217c <gic_enable>:
1780217c:	e92d4800 	push	{fp, lr}
17802180:	e28db004 	add	fp, sp, #4
17802184:	e24dd010 	sub	sp, sp, #16
17802188:	e1a03000 	mov	r3, r0
1780218c:	e54b300d 	strb	r3, [fp, #-13]
17802190:	ebffffc3 	bl	178020a4 <gic_get_gicd>
17802194:	e50b0008 	str	r0, [fp, #-8]
17802198:	e55b300d 	ldrb	r3, [fp, #-13]
1780219c:	e3530000 	cmp	r3, #0
178021a0:	0a000005 	beq	178021bc <gic_enable+0x40>
178021a4:	e51b3008 	ldr	r3, [fp, #-8]
178021a8:	e5933000 	ldr	r3, [r3]
178021ac:	e3832003 	orr	r2, r3, #3
178021b0:	e51b3008 	ldr	r3, [fp, #-8]
178021b4:	e5832000 	str	r2, [r3]
178021b8:	ea000004 	b	178021d0 <gic_enable+0x54>
178021bc:	e51b3008 	ldr	r3, [fp, #-8]
178021c0:	e5933000 	ldr	r3, [r3]
178021c4:	e3c32003 	bic	r2, r3, #3
178021c8:	e51b3008 	ldr	r3, [fp, #-8]
178021cc:	e5832000 	str	r2, [r3]
178021d0:	e320f000 	nop	{0}
178021d4:	e24bd004 	sub	sp, fp, #4
178021d8:	e8bd8800 	pop	{fp, pc}

178021dc <gic_set_irq_security>:
178021dc:	e92d4800 	push	{fp, lr}
178021e0:	e28db004 	add	fp, sp, #4
178021e4:	e24dd018 	sub	sp, sp, #24
178021e8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
178021ec:	e1a03001 	mov	r3, r1
178021f0:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
178021f4:	ebffffaa 	bl	178020a4 <gic_get_gicd>
178021f8:	e50b000c 	str	r0, [fp, #-12]
178021fc:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
17802200:	ebffffbd 	bl	178020fc <irq_get_register_offset>
17802204:	e50b0010 	str	r0, [fp, #-16]
17802208:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
1780220c:	ebffffce 	bl	1780214c <irq_get_bit_mask>
17802210:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
17802214:	e51b300c 	ldr	r3, [fp, #-12]
17802218:	e51b2010 	ldr	r2, [fp, #-16]
1780221c:	e2822020 	add	r2, r2, #32
17802220:	e7933102 	ldr	r3, [r3, r2, lsl #2]
17802224:	e50b3008 	str	r3, [fp, #-8]
17802228:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
1780222c:	e2233001 	eor	r3, r3, #1
17802230:	e6ef3073 	uxtb	r3, r3
17802234:	e3530000 	cmp	r3, #0
17802238:	0a000005 	beq	17802254 <gic_set_irq_security+0x78>
1780223c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17802240:	e1e03003 	mvn	r3, r3
17802244:	e51b2008 	ldr	r2, [fp, #-8]
17802248:	e0033002 	and	r3, r3, r2
1780224c:	e50b3008 	str	r3, [fp, #-8]
17802250:	ea000003 	b	17802264 <gic_set_irq_security+0x88>
17802254:	e51b2008 	ldr	r2, [fp, #-8]
17802258:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
1780225c:	e1823003 	orr	r3, r2, r3
17802260:	e50b3008 	str	r3, [fp, #-8]
17802264:	e51b300c 	ldr	r3, [fp, #-12]
17802268:	e51b2010 	ldr	r2, [fp, #-16]
1780226c:	e2822020 	add	r2, r2, #32
17802270:	e51b1008 	ldr	r1, [fp, #-8]
17802274:	e7831102 	str	r1, [r3, r2, lsl #2]
17802278:	e320f000 	nop	{0}
1780227c:	e24bd004 	sub	sp, fp, #4
17802280:	e8bd8800 	pop	{fp, pc}

17802284 <gic_enable_irq>:
17802284:	e92d4800 	push	{fp, lr}
17802288:	e28db004 	add	fp, sp, #4
1780228c:	e24dd018 	sub	sp, sp, #24
17802290:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
17802294:	e1a03001 	mov	r3, r1
17802298:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
1780229c:	ebffff80 	bl	178020a4 <gic_get_gicd>
178022a0:	e50b0008 	str	r0, [fp, #-8]
178022a4:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
178022a8:	ebffff93 	bl	178020fc <irq_get_register_offset>
178022ac:	e50b000c 	str	r0, [fp, #-12]
178022b0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
178022b4:	ebffffa4 	bl	1780214c <irq_get_bit_mask>
178022b8:	e50b0010 	str	r0, [fp, #-16]
178022bc:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
178022c0:	e3530000 	cmp	r3, #0
178022c4:	0a000005 	beq	178022e0 <gic_enable_irq+0x5c>
178022c8:	e51b3008 	ldr	r3, [fp, #-8]
178022cc:	e51b200c 	ldr	r2, [fp, #-12]
178022d0:	e2822040 	add	r2, r2, #64	; 0x40
178022d4:	e51b1010 	ldr	r1, [fp, #-16]
178022d8:	e7831102 	str	r1, [r3, r2, lsl #2]
178022dc:	ea000004 	b	178022f4 <gic_enable_irq+0x70>
178022e0:	e51b3008 	ldr	r3, [fp, #-8]
178022e4:	e51b200c 	ldr	r2, [fp, #-12]
178022e8:	e2822060 	add	r2, r2, #96	; 0x60
178022ec:	e51b1010 	ldr	r1, [fp, #-16]
178022f0:	e7831102 	str	r1, [r3, r2, lsl #2]
178022f4:	e320f000 	nop	{0}
178022f8:	e24bd004 	sub	sp, fp, #4
178022fc:	e8bd8800 	pop	{fp, pc}

17802300 <gic_set_irq_priority>:
17802300:	e92d4800 	push	{fp, lr}
17802304:	e28db004 	add	fp, sp, #4
17802308:	e24dd010 	sub	sp, sp, #16
1780230c:	e50b0010 	str	r0, [fp, #-16]
17802310:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
17802314:	ebffff62 	bl	178020a4 <gic_get_gicd>
17802318:	e50b0008 	str	r0, [fp, #-8]
1780231c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17802320:	e6ef1073 	uxtb	r1, r3
17802324:	e51b2008 	ldr	r2, [fp, #-8]
17802328:	e51b3010 	ldr	r3, [fp, #-16]
1780232c:	e0823003 	add	r3, r2, r3
17802330:	e2833b01 	add	r3, r3, #1024	; 0x400
17802334:	e1a02001 	mov	r2, r1
17802338:	e5c32000 	strb	r2, [r3]
1780233c:	e320f000 	nop	{0}
17802340:	e24bd004 	sub	sp, fp, #4
17802344:	e8bd8800 	pop	{fp, pc}

17802348 <gic_set_cpu_target>:
17802348:	e92d4800 	push	{fp, lr}
1780234c:	e28db004 	add	fp, sp, #4
17802350:	e24dd018 	sub	sp, sp, #24
17802354:	e50b0010 	str	r0, [fp, #-16]
17802358:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
1780235c:	e1a03002 	mov	r3, r2
17802360:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
17802364:	ebffff4e 	bl	178020a4 <gic_get_gicd>
17802368:	e50b0008 	str	r0, [fp, #-8]
1780236c:	e3a02001 	mov	r2, #1
17802370:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17802374:	e1a03312 	lsl	r3, r2, r3
17802378:	e54b3009 	strb	r3, [fp, #-9]
1780237c:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
17802380:	e3530000 	cmp	r3, #0
17802384:	0a00000f 	beq	178023c8 <gic_set_cpu_target+0x80>
17802388:	e51b2008 	ldr	r2, [fp, #-8]
1780238c:	e51b3010 	ldr	r3, [fp, #-16]
17802390:	e0823003 	add	r3, r2, r3
17802394:	e2833b02 	add	r3, r3, #2048	; 0x800
17802398:	e5d33000 	ldrb	r3, [r3]
1780239c:	e6ef2073 	uxtb	r2, r3
178023a0:	e55b3009 	ldrb	r3, [fp, #-9]
178023a4:	e1823003 	orr	r3, r2, r3
178023a8:	e6ef1073 	uxtb	r1, r3
178023ac:	e51b2008 	ldr	r2, [fp, #-8]
178023b0:	e51b3010 	ldr	r3, [fp, #-16]
178023b4:	e0823003 	add	r3, r2, r3
178023b8:	e2833b02 	add	r3, r3, #2048	; 0x800
178023bc:	e1a02001 	mov	r2, r1
178023c0:	e5c32000 	strb	r2, [r3]
178023c4:	ea000012 	b	17802414 <gic_set_cpu_target+0xcc>
178023c8:	e51b2008 	ldr	r2, [fp, #-8]
178023cc:	e51b3010 	ldr	r3, [fp, #-16]
178023d0:	e0823003 	add	r3, r2, r3
178023d4:	e2833b02 	add	r3, r3, #2048	; 0x800
178023d8:	e5d33000 	ldrb	r3, [r3]
178023dc:	e6ef3073 	uxtb	r3, r3
178023e0:	e6af2073 	sxtb	r2, r3
178023e4:	e15b30d9 	ldrsb	r3, [fp, #-9]
178023e8:	e1e03003 	mvn	r3, r3
178023ec:	e6af3073 	sxtb	r3, r3
178023f0:	e0033002 	and	r3, r3, r2
178023f4:	e6af3073 	sxtb	r3, r3
178023f8:	e6ef1073 	uxtb	r1, r3
178023fc:	e51b2008 	ldr	r2, [fp, #-8]
17802400:	e51b3010 	ldr	r3, [fp, #-16]
17802404:	e0823003 	add	r3, r2, r3
17802408:	e2833b02 	add	r3, r3, #2048	; 0x800
1780240c:	e1a02001 	mov	r2, r1
17802410:	e5c32000 	strb	r2, [r3]
17802414:	e320f000 	nop	{0}
17802418:	e24bd004 	sub	sp, fp, #4
1780241c:	e8bd8800 	pop	{fp, pc}

17802420 <gic_send_sgi>:
17802420:	e92d4800 	push	{fp, lr}
17802424:	e28db004 	add	fp, sp, #4
17802428:	e24dd018 	sub	sp, sp, #24
1780242c:	e50b0010 	str	r0, [fp, #-16]
17802430:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
17802434:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
17802438:	ebffff19 	bl	178020a4 <gic_get_gicd>
1780243c:	e50b0008 	str	r0, [fp, #-8]
17802440:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
17802444:	e1a02c03 	lsl	r2, r3, #24
17802448:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
1780244c:	e1a03803 	lsl	r3, r3, #16
17802450:	e1822003 	orr	r2, r2, r3
17802454:	e51b3010 	ldr	r3, [fp, #-16]
17802458:	e203300f 	and	r3, r3, #15
1780245c:	e1822003 	orr	r2, r2, r3
17802460:	e51b3008 	ldr	r3, [fp, #-8]
17802464:	e5832f00 	str	r2, [r3, #3840]	; 0xf00
17802468:	e320f000 	nop	{0}
1780246c:	e24bd004 	sub	sp, fp, #4
17802470:	e8bd8800 	pop	{fp, pc}

17802474 <gic_cpu_enable>:
17802474:	e92d4800 	push	{fp, lr}
17802478:	e28db004 	add	fp, sp, #4
1780247c:	e24dd010 	sub	sp, sp, #16
17802480:	e1a03000 	mov	r3, r0
17802484:	e54b300d 	strb	r3, [fp, #-13]
17802488:	ebffff10 	bl	178020d0 <gic_get_gicc>
1780248c:	e50b0008 	str	r0, [fp, #-8]
17802490:	e55b300d 	ldrb	r3, [fp, #-13]
17802494:	e3530000 	cmp	r3, #0
17802498:	0a000005 	beq	178024b4 <gic_cpu_enable+0x40>
1780249c:	e51b3008 	ldr	r3, [fp, #-8]
178024a0:	e5933000 	ldr	r3, [r3]
178024a4:	e383200b 	orr	r2, r3, #11
178024a8:	e51b3008 	ldr	r3, [fp, #-8]
178024ac:	e5832000 	str	r2, [r3]
178024b0:	ea000004 	b	178024c8 <gic_cpu_enable+0x54>
178024b4:	e51b3008 	ldr	r3, [fp, #-8]
178024b8:	e5933000 	ldr	r3, [r3]
178024bc:	e3c3200b 	bic	r2, r3, #11
178024c0:	e51b3008 	ldr	r3, [fp, #-8]
178024c4:	e5832000 	str	r2, [r3]
178024c8:	e320f000 	nop	{0}
178024cc:	e24bd004 	sub	sp, fp, #4
178024d0:	e8bd8800 	pop	{fp, pc}

178024d4 <gic_set_cpu_priority_mask>:
178024d4:	e92d4800 	push	{fp, lr}
178024d8:	e28db004 	add	fp, sp, #4
178024dc:	e24dd010 	sub	sp, sp, #16
178024e0:	e50b0010 	str	r0, [fp, #-16]
178024e4:	ebfffef9 	bl	178020d0 <gic_get_gicc>
178024e8:	e50b0008 	str	r0, [fp, #-8]
178024ec:	e51b3010 	ldr	r3, [fp, #-16]
178024f0:	e6ef2073 	uxtb	r2, r3
178024f4:	e51b3008 	ldr	r3, [fp, #-8]
178024f8:	e5832004 	str	r2, [r3, #4]
178024fc:	e320f000 	nop	{0}
17802500:	e24bd004 	sub	sp, fp, #4
17802504:	e8bd8800 	pop	{fp, pc}

17802508 <gic_read_irq_ack>:
17802508:	e92d4800 	push	{fp, lr}
1780250c:	e28db004 	add	fp, sp, #4
17802510:	e24dd008 	sub	sp, sp, #8
17802514:	ebfffeed 	bl	178020d0 <gic_get_gicc>
17802518:	e50b0008 	str	r0, [fp, #-8]
1780251c:	e51b3008 	ldr	r3, [fp, #-8]
17802520:	e593300c 	ldr	r3, [r3, #12]
17802524:	e1a00003 	mov	r0, r3
17802528:	e24bd004 	sub	sp, fp, #4
1780252c:	e8bd8800 	pop	{fp, pc}

17802530 <gic_write_end_of_irq>:
17802530:	e92d4800 	push	{fp, lr}
17802534:	e28db004 	add	fp, sp, #4
17802538:	e24dd010 	sub	sp, sp, #16
1780253c:	e50b0010 	str	r0, [fp, #-16]
17802540:	ebfffee2 	bl	178020d0 <gic_get_gicc>
17802544:	e50b0008 	str	r0, [fp, #-8]
17802548:	e51b3008 	ldr	r3, [fp, #-8]
1780254c:	e51b2010 	ldr	r2, [fp, #-16]
17802550:	e5832010 	str	r2, [r3, #16]
17802554:	e320f000 	nop	{0}
17802558:	e24bd004 	sub	sp, fp, #4
1780255c:	e8bd8800 	pop	{fp, pc}

17802560 <gic_init>:
17802560:	e92d4800 	push	{fp, lr}
17802564:	e28db004 	add	fp, sp, #4
17802568:	e24dd008 	sub	sp, sp, #8
1780256c:	ebfffecc 	bl	178020a4 <gic_get_gicd>
17802570:	e50b000c 	str	r0, [fp, #-12]
17802574:	e3a00000 	mov	r0, #0
17802578:	ebfffeff 	bl	1780217c <gic_enable>
1780257c:	e3a03000 	mov	r3, #0
17802580:	e50b3008 	str	r3, [fp, #-8]
17802584:	ea000007 	b	178025a8 <gic_init+0x48>
17802588:	e51b300c 	ldr	r3, [fp, #-12]
1780258c:	e51b2008 	ldr	r2, [fp, #-8]
17802590:	e28220a0 	add	r2, r2, #160	; 0xa0
17802594:	e3e01000 	mvn	r1, #0
17802598:	e7831102 	str	r1, [r3, r2, lsl #2]
1780259c:	e51b3008 	ldr	r3, [fp, #-8]
178025a0:	e2833001 	add	r3, r3, #1
178025a4:	e50b3008 	str	r3, [fp, #-8]
178025a8:	e51b3008 	ldr	r3, [fp, #-8]
178025ac:	e353001f 	cmp	r3, #31
178025b0:	dafffff4 	ble	17802588 <gic_init+0x28>
178025b4:	e3a03000 	mov	r3, #0
178025b8:	e50b3008 	str	r3, [fp, #-8]
178025bc:	ea000007 	b	178025e0 <gic_init+0x80>
178025c0:	e51b300c 	ldr	r3, [fp, #-12]
178025c4:	e51b2008 	ldr	r2, [fp, #-8]
178025c8:	e2822020 	add	r2, r2, #32
178025cc:	e3a01000 	mov	r1, #0
178025d0:	e7831102 	str	r1, [r3, r2, lsl #2]
178025d4:	e51b3008 	ldr	r3, [fp, #-8]
178025d8:	e2833001 	add	r3, r3, #1
178025dc:	e50b3008 	str	r3, [fp, #-8]
178025e0:	e51b3008 	ldr	r3, [fp, #-8]
178025e4:	e3530007 	cmp	r3, #7
178025e8:	dafffff4 	ble	178025c0 <gic_init+0x60>
178025ec:	eb000004 	bl	17802604 <gic_init_cpu>
178025f0:	e3a00001 	mov	r0, #1
178025f4:	ebfffee0 	bl	1780217c <gic_enable>
178025f8:	e320f000 	nop	{0}
178025fc:	e24bd004 	sub	sp, fp, #4
17802600:	e8bd8800 	pop	{fp, pc}

17802604 <gic_init_cpu>:
17802604:	e92d4800 	push	{fp, lr}
17802608:	e28db004 	add	fp, sp, #4
1780260c:	e24dd008 	sub	sp, sp, #8
17802610:	e3a000ff 	mov	r0, #255	; 0xff
17802614:	ebffffae 	bl	178024d4 <gic_set_cpu_priority_mask>
17802618:	ebfffeac 	bl	178020d0 <gic_get_gicc>
1780261c:	e50b0008 	str	r0, [fp, #-8]
17802620:	e51b3008 	ldr	r3, [fp, #-8]
17802624:	e3a02007 	mov	r2, #7
17802628:	e5832008 	str	r2, [r3, #8]
1780262c:	e3a00001 	mov	r0, #1
17802630:	ebffff8f 	bl	17802474 <gic_cpu_enable>
17802634:	e320f000 	nop	{0}
17802638:	e24bd004 	sub	sp, fp, #4
1780263c:	e8bd8800 	pop	{fp, pc}

17802640 <Print_CPUInterface>:
17802640:	e92d4800 	push	{fp, lr}
17802644:	e28db004 	add	fp, sp, #4
17802648:	e24dd008 	sub	sp, sp, #8
1780264c:	ebfffe9f 	bl	178020d0 <gic_get_gicc>
17802650:	e50b0008 	str	r0, [fp, #-8]
17802654:	e30303fc 	movw	r0, #13308	; 0x33fc
17802658:	e3410780 	movt	r0, #6016	; 0x1780
1780265c:	ebfff898 	bl	178008c4 <printk>
17802660:	e3030418 	movw	r0, #13336	; 0x3418
17802664:	e3410780 	movt	r0, #6016	; 0x1780
17802668:	ebfff895 	bl	178008c4 <printk>
1780266c:	e51b3008 	ldr	r3, [fp, #-8]
17802670:	e5933000 	ldr	r3, [r3]
17802674:	e1a01003 	mov	r1, r3
17802678:	e3030458 	movw	r0, #13400	; 0x3458
1780267c:	e3410780 	movt	r0, #6016	; 0x1780
17802680:	ebfff88f 	bl	178008c4 <printk>
17802684:	e51b3008 	ldr	r3, [fp, #-8]
17802688:	e5933004 	ldr	r3, [r3, #4]
1780268c:	e1a01003 	mov	r1, r3
17802690:	e303047c 	movw	r0, #13436	; 0x347c
17802694:	e3410780 	movt	r0, #6016	; 0x1780
17802698:	ebfff889 	bl	178008c4 <printk>
1780269c:	e51b3008 	ldr	r3, [fp, #-8]
178026a0:	e5933008 	ldr	r3, [r3, #8]
178026a4:	e1a01003 	mov	r1, r3
178026a8:	e30304a4 	movw	r0, #13476	; 0x34a4
178026ac:	e3410780 	movt	r0, #6016	; 0x1780
178026b0:	ebfff883 	bl	178008c4 <printk>
178026b4:	e51b3008 	ldr	r3, [fp, #-8]
178026b8:	e593300c 	ldr	r3, [r3, #12]
178026bc:	e1a01003 	mov	r1, r3
178026c0:	e30304c0 	movw	r0, #13504	; 0x34c0
178026c4:	e3410780 	movt	r0, #6016	; 0x1780
178026c8:	ebfff87d 	bl	178008c4 <printk>
178026cc:	e51b3008 	ldr	r3, [fp, #-8]
178026d0:	e5933014 	ldr	r3, [r3, #20]
178026d4:	e1a01003 	mov	r1, r3
178026d8:	e30304e0 	movw	r0, #13536	; 0x34e0
178026dc:	e3410780 	movt	r0, #6016	; 0x1780
178026e0:	ebfff877 	bl	178008c4 <printk>
178026e4:	e51b3008 	ldr	r3, [fp, #-8]
178026e8:	e5933018 	ldr	r3, [r3, #24]
178026ec:	e1a01003 	mov	r1, r3
178026f0:	e3030500 	movw	r0, #13568	; 0x3500
178026f4:	e3410780 	movt	r0, #6016	; 0x1780
178026f8:	ebfff871 	bl	178008c4 <printk>
178026fc:	e51b3008 	ldr	r3, [fp, #-8]
17802700:	e593301c 	ldr	r3, [r3, #28]
17802704:	e1a01003 	mov	r1, r3
17802708:	e3030534 	movw	r0, #13620	; 0x3534
1780270c:	e3410780 	movt	r0, #6016	; 0x1780
17802710:	ebfff86b 	bl	178008c4 <printk>
17802714:	e51b3008 	ldr	r3, [fp, #-8]
17802718:	e5933100 	ldr	r3, [r3, #256]	; 0x100
1780271c:	e1a01003 	mov	r1, r3
17802720:	e3030558 	movw	r0, #13656	; 0x3558
17802724:	e3410780 	movt	r0, #6016	; 0x1780
17802728:	ebfff865 	bl	178008c4 <printk>
1780272c:	e3030418 	movw	r0, #13336	; 0x3418
17802730:	e3410780 	movt	r0, #6016	; 0x1780
17802734:	ebfff862 	bl	178008c4 <printk>
17802738:	e320f000 	nop	{0}
1780273c:	e24bd004 	sub	sp, fp, #4
17802740:	e8bd8800 	pop	{fp, pc}

17802744 <arm_set_interrupt_state>:
17802744:	e10f2000 	mrs	r2, CPSR
17802748:	e3300000 	teq	r0, #0
1780274c:	13c210c0 	bicne	r1, r2, #192	; 0xc0
17802750:	038210c0 	orreq	r1, r2, #192	; 0xc0
17802754:	e121f001 	msr	CPSR_c, r1
17802758:	e3120080 	tst	r2, #128	; 0x80
1780275c:	13a00000 	movne	r0, #0
17802760:	03a00001 	moveq	r0, #1
17802764:	e12fff1e 	bx	lr

17802768 <cpu_get_current>:
17802768:	ee100fb0 	mrc	15, 0, r0, cr0, cr0, {5}
1780276c:	e2000003 	and	r0, r0, #3
17802770:	e12fff1e 	bx	lr

17802774 <enable_neon_fpu>:
17802774:	ee110f51 	mrc	15, 0, r0, cr1, cr1, {2}
17802778:	e3800b03 	orr	r0, r0, #3072	; 0xc00
1780277c:	ee010f51 	mcr	15, 0, r0, cr1, cr1, {2}
17802780:	e3a0060f 	mov	r0, #15728640	; 0xf00000
17802784:	ee010f50 	mcr	15, 0, r0, cr1, cr0, {2}
17802788:	e3a03101 	mov	r3, #1073741824	; 0x40000000
1780278c:	eee83a10 	vmsr	fpexc, r3

17802790 <disable_strict_align_check>:
17802790:	e92d4001 	push	{r0, lr}
17802794:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
17802798:	e3c00002 	bic	r0, r0, #2
1780279c:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
178027a0:	e8bd8001 	pop	{r0, pc}

178027a4 <disable_L1_cache>:
178027a4:	e92d407f 	push	{r0, r1, r2, r3, r4, r5, r6, lr}
178027a8:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
178027ac:	e3c00a01 	bic	r0, r0, #4096	; 0x1000
178027b0:	e3c00b02 	bic	r0, r0, #2048	; 0x800
178027b4:	e3c00004 	bic	r0, r0, #4
178027b8:	e3c00001 	bic	r0, r0, #1
178027bc:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
178027c0:	e8bd807f 	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

178027c4 <get_arm_private_peripheral_base>:
178027c4:	ee9f0f10 	mrc	15, 4, r0, cr15, cr0, {0}
178027c8:	e12fff1e 	bx	lr

178027cc <arm_unified_tlb_invalidate>:
178027cc:	e3a00001 	mov	r0, #1
178027d0:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
178027d4:	f57ff04f 	dsb	sy
178027d8:	e12fff1e 	bx	lr

178027dc <arm_unified_tlb_invalidate_is>:
178027dc:	e3a00001 	mov	r0, #1
178027e0:	ee080f13 	mcr	15, 0, r0, cr8, cr3, {0}
178027e4:	f57ff04f 	dsb	sy
178027e8:	e12fff1e 	bx	lr

178027ec <arm_branch_prediction_enable>:
178027ec:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
178027f0:	e3800b02 	orr	r0, r0, #2048	; 0x800
178027f4:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
178027f8:	e12fff1e 	bx	lr

178027fc <arm_branch_prediction_disable>:
178027fc:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
17802800:	e3c00b02 	bic	r0, r0, #2048	; 0x800
17802804:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
17802808:	e12fff1e 	bx	lr

1780280c <arm_branch_target_cache_invalidate>:
1780280c:	e3a00000 	mov	r0, #0
17802810:	ee070fd5 	mcr	15, 0, r0, cr7, cr5, {6}
17802814:	e12fff1e 	bx	lr

17802818 <arm_branch_target_cache_invalidate_is>:
17802818:	e3a00000 	mov	r0, #0
1780281c:	ee070fd1 	mcr	15, 0, r0, cr7, cr1, {6}
17802820:	e12fff1e 	bx	lr

17802824 <scu_enable>:
17802824:	ee9f0f10 	mrc	15, 4, r0, cr15, cr0, {0}
17802828:	e5901000 	ldr	r1, [r0]
1780282c:	e3811001 	orr	r1, r1, #1
17802830:	e5801000 	str	r1, [r0]
17802834:	e12fff1e 	bx	lr

17802838 <scu_join_smp>:
17802838:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
1780283c:	e3800040 	orr	r0, r0, #64	; 0x40
17802840:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}
17802844:	e12fff1e 	bx	lr

17802848 <scu_leave_smp>:
17802848:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
1780284c:	e3c00040 	bic	r0, r0, #64	; 0x40
17802850:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}
17802854:	e12fff1e 	bx	lr

17802858 <scu_get_cpus_in_smp>:
17802858:	ee9f0f10 	mrc	15, 4, r0, cr15, cr0, {0}
1780285c:	e5900004 	ldr	r0, [r0, #4]
17802860:	e1a00220 	lsr	r0, r0, #4
17802864:	e200000f 	and	r0, r0, #15
17802868:	e12fff1e 	bx	lr

1780286c <scu_enable_maintenance_broadcast>:
1780286c:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
17802870:	e3800001 	orr	r0, r0, #1
17802874:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}
17802878:	e12fff1e 	bx	lr

1780287c <scu_disable_maintenance_broadcast>:
1780287c:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
17802880:	e3c00001 	bic	r0, r0, #1
17802884:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}
17802888:	e12fff1e 	bx	lr

1780288c <scu_secure_invalidate>:
1780288c:	e2000003 	and	r0, r0, #3
17802890:	e1a00100 	lsl	r0, r0, #2
17802894:	e201100f 	and	r1, r1, #15
17802898:	e1a01011 	lsl	r1, r1, r0
1780289c:	ee9f2f10 	mrc	15, 4, r2, cr15, cr0, {0}
178028a0:	e582100c 	str	r1, [r2, #12]
178028a4:	e12fff1e 	bx	lr

178028a8 <disable_interrupt>:
178028a8:	e92d4800 	push	{fp, lr}
178028ac:	e28db004 	add	fp, sp, #4
178028b0:	e24dd008 	sub	sp, sp, #8
178028b4:	e50b0008 	str	r0, [fp, #-8]
178028b8:	e50b100c 	str	r1, [fp, #-12]
178028bc:	e3a01000 	mov	r1, #0
178028c0:	e51b0008 	ldr	r0, [fp, #-8]
178028c4:	ebfffe6e 	bl	17802284 <gic_enable_irq>
178028c8:	e3a02000 	mov	r2, #0
178028cc:	e51b100c 	ldr	r1, [fp, #-12]
178028d0:	e51b0008 	ldr	r0, [fp, #-8]
178028d4:	ebfffe9b 	bl	17802348 <gic_set_cpu_target>
178028d8:	e320f000 	nop	{0}
178028dc:	e24bd004 	sub	sp, fp, #4
178028e0:	e8bd8800 	pop	{fp, pc}

178028e4 <enable_interrupt>:
178028e4:	e92d4800 	push	{fp, lr}
178028e8:	e28db004 	add	fp, sp, #4
178028ec:	e24dd010 	sub	sp, sp, #16
178028f0:	e50b0008 	str	r0, [fp, #-8]
178028f4:	e50b100c 	str	r1, [fp, #-12]
178028f8:	e50b2010 	str	r2, [fp, #-16]
178028fc:	e51b1010 	ldr	r1, [fp, #-16]
17802900:	e51b0008 	ldr	r0, [fp, #-8]
17802904:	ebfffe7d 	bl	17802300 <gic_set_irq_priority>
17802908:	e3a01001 	mov	r1, #1
1780290c:	e51b0008 	ldr	r0, [fp, #-8]
17802910:	ebfffe31 	bl	178021dc <gic_set_irq_security>
17802914:	e3a02001 	mov	r2, #1
17802918:	e51b100c 	ldr	r1, [fp, #-12]
1780291c:	e51b0008 	ldr	r0, [fp, #-8]
17802920:	ebfffe88 	bl	17802348 <gic_set_cpu_target>
17802924:	e3a01001 	mov	r1, #1
17802928:	e51b0008 	ldr	r0, [fp, #-8]
1780292c:	ebfffe54 	bl	17802284 <gic_enable_irq>
17802930:	e320f000 	nop	{0}
17802934:	e24bd004 	sub	sp, fp, #4
17802938:	e8bd8800 	pop	{fp, pc}

1780293c <register_interrupt_routine>:
1780293c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
17802940:	e28db000 	add	fp, sp, #0
17802944:	e24dd00c 	sub	sp, sp, #12
17802948:	e50b0008 	str	r0, [fp, #-8]
1780294c:	e50b100c 	str	r1, [fp, #-12]
17802950:	e303378c 	movw	r3, #14220	; 0x378c
17802954:	e3413780 	movt	r3, #6016	; 0x1780
17802958:	e51b2008 	ldr	r2, [fp, #-8]
1780295c:	e51b100c 	ldr	r1, [fp, #-12]
17802960:	e7831102 	str	r1, [r3, r2, lsl #2]
17802964:	e320f000 	nop	{0}
17802968:	e28bd000 	add	sp, fp, #0
1780296c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
17802970:	e12fff1e 	bx	lr

17802974 <default_interrupt_routine>:
17802974:	e92d4800 	push	{fp, lr}
17802978:	e28db004 	add	fp, sp, #4
1780297c:	e303377c 	movw	r3, #14204	; 0x377c
17802980:	e3413780 	movt	r3, #6016	; 0x1780
17802984:	e5933000 	ldr	r3, [r3]
17802988:	e1a01003 	mov	r1, r3
1780298c:	e3030584 	movw	r0, #13700	; 0x3584
17802990:	e3410780 	movt	r0, #6016	; 0x1780
17802994:	ebfff7ca 	bl	178008c4 <printk>
17802998:	e320f000 	nop	{0}
1780299c:	e8bd8800 	pop	{fp, pc}

178029a0 <enable_secure_interrupt>:
178029a0:	e92d4800 	push	{fp, lr}
178029a4:	e28db004 	add	fp, sp, #4
178029a8:	e24dd010 	sub	sp, sp, #16
178029ac:	e50b0008 	str	r0, [fp, #-8]
178029b0:	e50b100c 	str	r1, [fp, #-12]
178029b4:	e50b2010 	str	r2, [fp, #-16]
178029b8:	e51b1010 	ldr	r1, [fp, #-16]
178029bc:	e51b0008 	ldr	r0, [fp, #-8]
178029c0:	ebfffe4e 	bl	17802300 <gic_set_irq_priority>
178029c4:	e3a01000 	mov	r1, #0
178029c8:	e51b0008 	ldr	r0, [fp, #-8]
178029cc:	ebfffe02 	bl	178021dc <gic_set_irq_security>
178029d0:	e3a02001 	mov	r2, #1
178029d4:	e51b100c 	ldr	r1, [fp, #-12]
178029d8:	e51b0008 	ldr	r0, [fp, #-8]
178029dc:	ebfffe59 	bl	17802348 <gic_set_cpu_target>
178029e0:	e3a01001 	mov	r1, #1
178029e4:	e51b0008 	ldr	r0, [fp, #-8]
178029e8:	ebfffe25 	bl	17802284 <gic_enable_irq>
178029ec:	e320f000 	nop	{0}
178029f0:	e24bd004 	sub	sp, fp, #4
178029f4:	e8bd8800 	pop	{fp, pc}

178029f8 <FIQ_HDLR>:
178029f8:	e24ee004 	sub	lr, lr, #4
178029fc:	e92d400f 	push	{r0, r1, r2, r3, lr}
17802a00:	e28db010 	add	fp, sp, #16
17802a04:	e24dd014 	sub	sp, sp, #20
17802a08:	ebfffebe 	bl	17802508 <gic_read_irq_ack>
17802a0c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
17802a10:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
17802a14:	e30305a4 	movw	r0, #13732	; 0x35a4
17802a18:	e3410780 	movt	r0, #6016	; 0x1780
17802a1c:	ebfff7a8 	bl	178008c4 <printk>
17802a20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
17802a24:	e2033c02 	and	r3, r3, #512	; 0x200
17802a28:	e3530000 	cmp	r3, #0
17802a2c:	0a000002 	beq	17802a3c <FIQ_HDLR+0x44>
17802a30:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
17802a34:	ebfffebd 	bl	17802530 <gic_write_end_of_irq>
17802a38:	ea00001e 	b	17802ab8 <FIQ_HDLR+0xc0>
17802a3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
17802a40:	e1a03523 	lsr	r3, r3, #10
17802a44:	e2033007 	and	r3, r3, #7
17802a48:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
17802a4c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
17802a50:	e7e83053 	ubfx	r3, r3, #0, #9
17802a54:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
17802a58:	e303377c 	movw	r3, #14204	; 0x377c
17802a5c:	e3413780 	movt	r3, #6016	; 0x1780
17802a60:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
17802a64:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
17802a68:	e7831102 	str	r1, [r3, r2, lsl #2]
17802a6c:	e303378c 	movw	r3, #14220	; 0x378c
17802a70:	e3413780 	movt	r3, #6016	; 0x1780
17802a74:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
17802a78:	e7933102 	ldr	r3, [r3, r2, lsl #2]
17802a7c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
17802a80:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
17802a84:	e3530000 	cmp	r3, #0
17802a88:	0a000002 	beq	17802a98 <FIQ_HDLR+0xa0>
17802a8c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
17802a90:	e12fff33 	blx	r3
17802a94:	ea000000 	b	17802a9c <FIQ_HDLR+0xa4>
17802a98:	ebffffb5 	bl	17802974 <default_interrupt_routine>
17802a9c:	e303377c 	movw	r3, #14204	; 0x377c
17802aa0:	e3413780 	movt	r3, #6016	; 0x1780
17802aa4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
17802aa8:	e3a01000 	mov	r1, #0
17802aac:	e7831102 	str	r1, [r3, r2, lsl #2]
17802ab0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
17802ab4:	ebfffe9d 	bl	17802530 <gic_write_end_of_irq>
17802ab8:	e320f000 	nop	{0}
17802abc:	e24bd010 	sub	sp, fp, #16
17802ac0:	e8fd800f 	ldm	sp!, {r0, r1, r2, r3, pc}^

17802ac4 <IRQ_HDLR>:
17802ac4:	e24ee004 	sub	lr, lr, #4
17802ac8:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
17802acc:	e28db018 	add	fp, sp, #24
17802ad0:	e24dd014 	sub	sp, sp, #20
17802ad4:	ebfffe8b 	bl	17802508 <gic_read_irq_ack>
17802ad8:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
17802adc:	ebfffed7 	bl	17802640 <Print_CPUInterface>
17802ae0:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
17802ae4:	e30305c0 	movw	r0, #13760	; 0x35c0
17802ae8:	e3410780 	movt	r0, #6016	; 0x1780
17802aec:	ebfff774 	bl	178008c4 <printk>
17802af0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
17802af4:	e2033c02 	and	r3, r3, #512	; 0x200
17802af8:	e3530000 	cmp	r3, #0
17802afc:	0a000002 	beq	17802b0c <IRQ_HDLR+0x48>
17802b00:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
17802b04:	ebfffe89 	bl	17802530 <gic_write_end_of_irq>
17802b08:	ea000021 	b	17802b94 <IRQ_HDLR+0xd0>
17802b0c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
17802b10:	e1a03523 	lsr	r3, r3, #10
17802b14:	e2033007 	and	r3, r3, #7
17802b18:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
17802b1c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
17802b20:	e7e83053 	ubfx	r3, r3, #0, #9
17802b24:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
17802b28:	e303377c 	movw	r3, #14204	; 0x377c
17802b2c:	e3413780 	movt	r3, #6016	; 0x1780
17802b30:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
17802b34:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
17802b38:	e7831102 	str	r1, [r3, r2, lsl #2]
17802b3c:	e303378c 	movw	r3, #14220	; 0x378c
17802b40:	e3413780 	movt	r3, #6016	; 0x1780
17802b44:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
17802b48:	e7933102 	ldr	r3, [r3, r2, lsl #2]
17802b4c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
17802b50:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
17802b54:	e3530000 	cmp	r3, #0
17802b58:	0a000002 	beq	17802b68 <IRQ_HDLR+0xa4>
17802b5c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
17802b60:	e12fff33 	blx	r3
17802b64:	ea000000 	b	17802b6c <IRQ_HDLR+0xa8>
17802b68:	ebffff81 	bl	17802974 <default_interrupt_routine>
17802b6c:	e303377c 	movw	r3, #14204	; 0x377c
17802b70:	e3413780 	movt	r3, #6016	; 0x1780
17802b74:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
17802b78:	e3a01000 	mov	r1, #0
17802b7c:	e7831102 	str	r1, [r3, r2, lsl #2]
17802b80:	ebfffeae 	bl	17802640 <Print_CPUInterface>
17802b84:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
17802b88:	ebfffe68 	bl	17802530 <gic_write_end_of_irq>
17802b8c:	ebfffeab 	bl	17802640 <Print_CPUInterface>
17802b90:	eafffffe 	b	17802b90 <IRQ_HDLR+0xcc>
17802b94:	e24bd018 	sub	sp, fp, #24
17802b98:	e8fd980f 	ldm	sp!, {r0, r1, r2, r3, fp, ip, pc}^

17802b9c <fiq_default_interrupt_routine>:
17802b9c:	e92d4800 	push	{fp, lr}
17802ba0:	e28db004 	add	fp, sp, #4
17802ba4:	e30305d8 	movw	r0, #13784	; 0x35d8
17802ba8:	e3410780 	movt	r0, #6016	; 0x1780
17802bac:	ebfff744 	bl	178008c4 <printk>
17802bb0:	e320f000 	nop	{0}
17802bb4:	e8bd8800 	pop	{fp, pc}

17802bb8 <UNDEFINED_HDLR>:
17802bb8:	e92d4800 	push	{fp, lr}
17802bbc:	e28db004 	add	fp, sp, #4
17802bc0:	e24dd018 	sub	sp, sp, #24
17802bc4:	e50b0008 	str	r0, [fp, #-8]
17802bc8:	e50b100c 	str	r1, [fp, #-12]
17802bcc:	e50b2010 	str	r2, [fp, #-16]
17802bd0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
17802bd4:	e59b3004 	ldr	r3, [fp, #4]
17802bd8:	e58d3004 	str	r3, [sp, #4]
17802bdc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
17802be0:	e58d3000 	str	r3, [sp]
17802be4:	e51b3010 	ldr	r3, [fp, #-16]
17802be8:	e51b200c 	ldr	r2, [fp, #-12]
17802bec:	e51b1008 	ldr	r1, [fp, #-8]
17802bf0:	e30305e8 	movw	r0, #13800	; 0x35e8
17802bf4:	e3410780 	movt	r0, #6016	; 0x1780
17802bf8:	ebfff731 	bl	178008c4 <printk>
17802bfc:	eafffffe 	b	17802bfc <UNDEFINED_HDLR+0x44>

17802c00 <ABT_HDLR>:
17802c00:	e92d4800 	push	{fp, lr}
17802c04:	e28db004 	add	fp, sp, #4
17802c08:	e24dd008 	sub	sp, sp, #8
17802c0c:	e50b0008 	str	r0, [fp, #-8]
17802c10:	e303062c 	movw	r0, #13868	; 0x362c
17802c14:	e3410780 	movt	r0, #6016	; 0x1780
17802c18:	ebfff729 	bl	178008c4 <printk>
17802c1c:	e320f000 	nop	{0}
17802c20:	e24bd004 	sub	sp, fp, #4
17802c24:	e8bd8800 	pop	{fp, pc}

17802c28 <PREFECH_HDLR>:
17802c28:	e92d4800 	push	{fp, lr}
17802c2c:	e28db004 	add	fp, sp, #4
17802c30:	e24dd008 	sub	sp, sp, #8
17802c34:	e50b0008 	str	r0, [fp, #-8]
17802c38:	e303063c 	movw	r0, #13884	; 0x363c
17802c3c:	e3410780 	movt	r0, #6016	; 0x1780
17802c40:	ebfff71f 	bl	178008c4 <printk>
17802c44:	eafffffe 	b	17802c44 <PREFECH_HDLR+0x1c>

17802c48 <SWI_HDLR>:
17802c48:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
17802c4c:	e28db018 	add	fp, sp, #24
17802c50:	e24dd00c 	sub	sp, sp, #12
17802c54:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
17802c58:	e3030650 	movw	r0, #13904	; 0x3650
17802c5c:	e3410780 	movt	r0, #6016	; 0x1780
17802c60:	ebfff717 	bl	178008c4 <printk>
17802c64:	eafffffe 	b	17802c64 <SWI_HDLR+0x1c>

17802c68 <RESERVED_HDLR>:
17802c68:	e92d4800 	push	{fp, lr}
17802c6c:	e28db004 	add	fp, sp, #4
17802c70:	e24dd008 	sub	sp, sp, #8
17802c74:	e50b0008 	str	r0, [fp, #-8]
17802c78:	e3030660 	movw	r0, #13920	; 0x3660
17802c7c:	e3410780 	movt	r0, #6016	; 0x1780
17802c80:	ebfff70f 	bl	178008c4 <printk>
17802c84:	eafffffe 	b	17802c84 <RESERVED_HDLR+0x1c>
	...

17802d00 <vectors>:
17802d00:	e59ff01c 	ldr	pc, [pc, #28]	; 17802d24 <.reset_exception>
17802d04:	e59ff01c 	ldr	pc, [pc, #28]	; 17802d28 <.undefined_exception>
17802d08:	e59ff01c 	ldr	pc, [pc, #28]	; 17802d2c <.swi_exception>
17802d0c:	e59ff01c 	ldr	pc, [pc, #28]	; 17802d30 <.prefetch_abort_exception>
17802d10:	e59ff01c 	ldr	pc, [pc, #28]	; 17802d34 <.data_abort_exception>
17802d14:	e59ff01c 	ldr	pc, [pc, #28]	; 17802d38 <.reserved_exception>
17802d18:	e59ff01c 	ldr	pc, [pc, #28]	; 17802d3c <.irq_exception>
17802d1c:	e59ff01c 	ldr	pc, [pc, #28]	; 17802d40 <.fiq_exception>
17802d20:	00000000 	andeq	r0, r0, r0

17802d24 <.reset_exception>:
17802d24:	17800000 	strne	r0, [r0, r0]

17802d28 <.undefined_exception>:
17802d28:	17802bb8 			; <UNDEFINED> instruction: 0x17802bb8

17802d2c <.swi_exception>:
17802d2c:	17802c48 	strne	r2, [r0, r8, asr #24]

17802d30 <.prefetch_abort_exception>:
17802d30:	17802c28 	strne	r2, [r0, r8, lsr #24]

17802d34 <.data_abort_exception>:
17802d34:	17802c00 	strne	r2, [r0, r0, lsl #24]

17802d38 <.reserved_exception>:
17802d38:	17802c68 	strne	r2, [r0, r8, ror #24]

17802d3c <.irq_exception>:
17802d3c:	17802ac4 	strne	r2, [r0, r4, asr #21]

17802d40 <.fiq_exception>:
17802d40:	178029f8 			; <UNDEFINED> instruction: 0x178029f8

17802d44 <FIQ_HDLR2>:
17802d44:	eb0000eb 	bl	178030f8 <im_here>
17802d48:	e24ee004 	sub	lr, lr, #4
17802d4c:	e92d4010 	push	{r4, lr}
17802d50:	e92d000f 	push	{r0, r1, r2, r3}
17802d54:	ee9f0f10 	mrc	15, 4, r0, cr15, cr0, {0}
17802d58:	e2800c01 	add	r0, r0, #256	; 0x100
17802d5c:	e590100c 	ldr	r1, [r0, #12]
17802d60:	e59f2028 	ldr	r2, [pc, #40]	; 17802d90 <__reserved_exception+0x4>
17802d64:	e5821000 	str	r1, [r2]
17802d68:	e590000c 	ldr	r0, [r0, #12]
17802d6c:	e59f201c 	ldr	r2, [pc, #28]	; 17802d90 <__reserved_exception+0x4>
17802d70:	e5920000 	ldr	r0, [r2]
17802d74:	e3a01000 	mov	r1, #0
17802d78:	ebfffdec 	bl	17802530 <gic_write_end_of_irq>
17802d7c:	eb0000dd 	bl	178030f8 <im_here>
17802d80:	e8bd4010 	pop	{r4, lr}
17802d84:	e8bd000f 	pop	{r0, r1, r2, r3}
17802d88:	e12fff1e 	bx	lr

17802d8c <__reserved_exception>:
17802d8c:	eafffffe 	b	17802d8c <__reserved_exception>
17802d90:	17803754 			; <UNDEFINED> instruction: 0x17803754
	...

17802e00 <m_vectors>:
17802e00:	e59ff01c 	ldr	pc, [pc, #28]	; 17802e24 <.m_reset_exception>
17802e04:	e59ff01c 	ldr	pc, [pc, #28]	; 17802e28 <.m_undefined_exception>
17802e08:	e59ff01c 	ldr	pc, [pc, #28]	; 17802e2c <.m_smc_exception>
17802e0c:	e59ff01c 	ldr	pc, [pc, #28]	; 17802e30 <.m_prefetch_abort_exception>
17802e10:	e59ff01c 	ldr	pc, [pc, #28]	; 17802e34 <.m_data_abort_exception>
17802e14:	e59ff01c 	ldr	pc, [pc, #28]	; 17802e38 <.m_reserved_exception>
17802e18:	e59ff01c 	ldr	pc, [pc, #28]	; 17802e3c <.m_irq_exception>
17802e1c:	e59ff01c 	ldr	pc, [pc, #28]	; 17802e40 <.m_fiq_exception>
17802e20:	00000000 	andeq	r0, r0, r0

17802e24 <.m_reset_exception>:
17802e24:	17800000 	strne	r0, [r0, r0]

17802e28 <.m_undefined_exception>:
17802e28:	178030d8 			; <UNDEFINED> instruction: 0x178030d8

17802e2c <.m_smc_exception>:
17802e2c:	17802e8c 	strne	r2, [r0, ip, lsl #29]

17802e30 <.m_prefetch_abort_exception>:
17802e30:	17802e6c 	strne	r2, [r0, ip, ror #28]

17802e34 <.m_data_abort_exception>:
17802e34:	17802e48 	strne	r2, [r0, r8, asr #28]

17802e38 <.m_reserved_exception>:
17802e38:	17802eac 	strne	r2, [r0, ip, lsr #29]

17802e3c <.m_irq_exception>:
17802e3c:	17802f98 			; <UNDEFINED> instruction: 0x17802f98

17802e40 <.m_fiq_exception>:
17802e40:	17802ecc 	strne	r2, [r0, ip, asr #29]

17802e44 <__reserved_exception>:
17802e44:	eafffffe 	b	17802e44 <__reserved_exception>

17802e48 <MON_ABT_HDLR>:
17802e48:	e92d4800 	push	{fp, lr}
17802e4c:	e28db004 	add	fp, sp, #4
17802e50:	e24dd008 	sub	sp, sp, #8
17802e54:	e50b0008 	str	r0, [fp, #-8]
17802e58:	e51b1008 	ldr	r1, [fp, #-8]
17802e5c:	e3030674 	movw	r0, #13940	; 0x3674
17802e60:	e3410780 	movt	r0, #6016	; 0x1780
17802e64:	ebfff696 	bl	178008c4 <printk>
17802e68:	eafffffe 	b	17802e68 <MON_ABT_HDLR+0x20>

17802e6c <MON_PREFECH_HDLR>:
17802e6c:	e92d4800 	push	{fp, lr}
17802e70:	e28db004 	add	fp, sp, #4
17802e74:	e24dd008 	sub	sp, sp, #8
17802e78:	e50b0008 	str	r0, [fp, #-8]
17802e7c:	e3030688 	movw	r0, #13960	; 0x3688
17802e80:	e3410780 	movt	r0, #6016	; 0x1780
17802e84:	ebfff68e 	bl	178008c4 <printk>
17802e88:	eafffffe 	b	17802e88 <MON_PREFECH_HDLR+0x1c>

17802e8c <MON_SMC_HDLR>:
17802e8c:	e92d4800 	push	{fp, lr}
17802e90:	e28db004 	add	fp, sp, #4
17802e94:	e24dd008 	sub	sp, sp, #8
17802e98:	e50b0008 	str	r0, [fp, #-8]
17802e9c:	e30306a0 	movw	r0, #13984	; 0x36a0
17802ea0:	e3410780 	movt	r0, #6016	; 0x1780
17802ea4:	ebfff686 	bl	178008c4 <printk>
17802ea8:	eafffffe 	b	17802ea8 <MON_SMC_HDLR+0x1c>

17802eac <MON_RESERVED_HDLR>:
17802eac:	e92d4800 	push	{fp, lr}
17802eb0:	e28db004 	add	fp, sp, #4
17802eb4:	e24dd008 	sub	sp, sp, #8
17802eb8:	e50b0008 	str	r0, [fp, #-8]
17802ebc:	e30306b0 	movw	r0, #14000	; 0x36b0
17802ec0:	e3410780 	movt	r0, #6016	; 0x1780
17802ec4:	ebfff67e 	bl	178008c4 <printk>
17802ec8:	eafffffe 	b	17802ec8 <MON_RESERVED_HDLR+0x1c>

17802ecc <MON_FIQ_HDLR>:
17802ecc:	e24ee004 	sub	lr, lr, #4
17802ed0:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
17802ed4:	e28db018 	add	fp, sp, #24
17802ed8:	e24dd014 	sub	sp, sp, #20
17802edc:	ebfffd89 	bl	17802508 <gic_read_irq_ack>
17802ee0:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
17802ee4:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
17802ee8:	e30306c8 	movw	r0, #14024	; 0x36c8
17802eec:	e3410780 	movt	r0, #6016	; 0x1780
17802ef0:	ebfff673 	bl	178008c4 <printk>
17802ef4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
17802ef8:	e2033c02 	and	r3, r3, #512	; 0x200
17802efc:	e3530000 	cmp	r3, #0
17802f00:	0a000002 	beq	17802f10 <MON_FIQ_HDLR+0x44>
17802f04:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
17802f08:	ebfffd88 	bl	17802530 <gic_write_end_of_irq>
17802f0c:	ea00001e 	b	17802f8c <MON_FIQ_HDLR+0xc0>
17802f10:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
17802f14:	e1a03523 	lsr	r3, r3, #10
17802f18:	e2033007 	and	r3, r3, #7
17802f1c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
17802f20:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
17802f24:	e7e83053 	ubfx	r3, r3, #0, #9
17802f28:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
17802f2c:	e303377c 	movw	r3, #14204	; 0x377c
17802f30:	e3413780 	movt	r3, #6016	; 0x1780
17802f34:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
17802f38:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
17802f3c:	e7831102 	str	r1, [r3, r2, lsl #2]
17802f40:	e303378c 	movw	r3, #14220	; 0x378c
17802f44:	e3413780 	movt	r3, #6016	; 0x1780
17802f48:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
17802f4c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
17802f50:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
17802f54:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
17802f58:	e3530000 	cmp	r3, #0
17802f5c:	0a000002 	beq	17802f6c <MON_FIQ_HDLR+0xa0>
17802f60:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
17802f64:	e12fff33 	blx	r3
17802f68:	ea000000 	b	17802f70 <MON_FIQ_HDLR+0xa4>
17802f6c:	ebfffe80 	bl	17802974 <default_interrupt_routine>
17802f70:	e303377c 	movw	r3, #14204	; 0x377c
17802f74:	e3413780 	movt	r3, #6016	; 0x1780
17802f78:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
17802f7c:	e3a01000 	mov	r1, #0
17802f80:	e7831102 	str	r1, [r3, r2, lsl #2]
17802f84:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
17802f88:	ebfffd68 	bl	17802530 <gic_write_end_of_irq>
17802f8c:	e320f000 	nop	{0}
17802f90:	e24bd018 	sub	sp, fp, #24
17802f94:	e8fd980f 	ldm	sp!, {r0, r1, r2, r3, fp, ip, pc}^

17802f98 <MON_IRQ_HDLR>:
17802f98:	e24ee004 	sub	lr, lr, #4
17802f9c:	e92d580f 	push	{r0, r1, r2, r3, fp, ip, lr}
17802fa0:	e28db018 	add	fp, sp, #24
17802fa4:	e24dd014 	sub	sp, sp, #20
17802fa8:	ebfffd56 	bl	17802508 <gic_read_irq_ack>
17802fac:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
17802fb0:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
17802fb4:	e30306e4 	movw	r0, #14052	; 0x36e4
17802fb8:	e3410780 	movt	r0, #6016	; 0x1780
17802fbc:	ebfff640 	bl	178008c4 <printk>
17802fc0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
17802fc4:	e2033c02 	and	r3, r3, #512	; 0x200
17802fc8:	e3530000 	cmp	r3, #0
17802fcc:	0a000002 	beq	17802fdc <MON_IRQ_HDLR+0x44>
17802fd0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
17802fd4:	ebfffd55 	bl	17802530 <gic_write_end_of_irq>
17802fd8:	ea00001e 	b	17803058 <MON_IRQ_HDLR+0xc0>
17802fdc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
17802fe0:	e1a03523 	lsr	r3, r3, #10
17802fe4:	e2033007 	and	r3, r3, #7
17802fe8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
17802fec:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
17802ff0:	e7e83053 	ubfx	r3, r3, #0, #9
17802ff4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
17802ff8:	e303377c 	movw	r3, #14204	; 0x377c
17802ffc:	e3413780 	movt	r3, #6016	; 0x1780
17803000:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
17803004:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
17803008:	e7831102 	str	r1, [r3, r2, lsl #2]
1780300c:	e303378c 	movw	r3, #14220	; 0x378c
17803010:	e3413780 	movt	r3, #6016	; 0x1780
17803014:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
17803018:	e7933102 	ldr	r3, [r3, r2, lsl #2]
1780301c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
17803020:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
17803024:	e3530000 	cmp	r3, #0
17803028:	0a000002 	beq	17803038 <MON_IRQ_HDLR+0xa0>
1780302c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
17803030:	e12fff33 	blx	r3
17803034:	ea000000 	b	1780303c <MON_IRQ_HDLR+0xa4>
17803038:	ebfffe4d 	bl	17802974 <default_interrupt_routine>
1780303c:	e303377c 	movw	r3, #14204	; 0x377c
17803040:	e3413780 	movt	r3, #6016	; 0x1780
17803044:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
17803048:	e3a01000 	mov	r1, #0
1780304c:	e7831102 	str	r1, [r3, r2, lsl #2]
17803050:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
17803054:	ebfffd35 	bl	17802530 <gic_write_end_of_irq>
17803058:	e320f000 	nop	{0}
1780305c:	e24bd018 	sub	sp, fp, #24
17803060:	e8fd980f 	ldm	sp!, {r0, r1, r2, r3, fp, ip, pc}^

17803064 <MON_FIQ2_HDLR>:
17803064:	e24ee004 	sub	lr, lr, #4
17803068:	e92d400f 	push	{r0, r1, r2, r3, lr}
1780306c:	e28db010 	add	fp, sp, #16
17803070:	e24dd014 	sub	sp, sp, #20
17803074:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
17803078:	ebfffd22 	bl	17802508 <gic_read_irq_ack>
1780307c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
17803080:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
17803084:	e30306fc 	movw	r0, #14076	; 0x36fc
17803088:	e3410780 	movt	r0, #6016	; 0x1780
1780308c:	ebfff60c 	bl	178008c4 <printk>
17803090:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
17803094:	e2033c02 	and	r3, r3, #512	; 0x200
17803098:	e3530000 	cmp	r3, #0
1780309c:	0a000003 	beq	178030b0 <MON_FIQ2_HDLR+0x4c>
178030a0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
178030a4:	ebfffd21 	bl	17802530 <gic_write_end_of_irq>
178030a8:	ebfffd64 	bl	17802640 <Print_CPUInterface>
178030ac:	ea000006 	b	178030cc <MON_FIQ2_HDLR+0x68>
178030b0:	ebfffd62 	bl	17802640 <Print_CPUInterface>
178030b4:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
178030b8:	ebfffd1c 	bl	17802530 <gic_write_end_of_irq>
178030bc:	ebfffd5f 	bl	17802640 <Print_CPUInterface>
178030c0:	e3030718 	movw	r0, #14104	; 0x3718
178030c4:	e3410780 	movt	r0, #6016	; 0x1780
178030c8:	ebfff5fd 	bl	178008c4 <printk>
178030cc:	e320f000 	nop	{0}
178030d0:	e24bd010 	sub	sp, fp, #16
178030d4:	e8fd800f 	ldm	sp!, {r0, r1, r2, r3, pc}^

178030d8 <MON_UNDEFINED_HDLR>:
178030d8:	e92d4800 	push	{fp, lr}
178030dc:	e28db004 	add	fp, sp, #4
178030e0:	e24dd008 	sub	sp, sp, #8
178030e4:	e50b0008 	str	r0, [fp, #-8]
178030e8:	e303072c 	movw	r0, #14124	; 0x372c
178030ec:	e3410780 	movt	r0, #6016	; 0x1780
178030f0:	ebfff5f3 	bl	178008c4 <printk>
178030f4:	eafffffe 	b	178030f4 <MON_UNDEFINED_HDLR+0x1c>

178030f8 <im_here>:
178030f8:	e92d4800 	push	{fp, lr}
178030fc:	e28db004 	add	fp, sp, #4
17803100:	e3033774 	movw	r3, #14196	; 0x3774
17803104:	e3413780 	movt	r3, #6016	; 0x1780
17803108:	e5932000 	ldr	r2, [r3]
1780310c:	e2821001 	add	r1, r2, #1
17803110:	e3033774 	movw	r3, #14196	; 0x3774
17803114:	e3413780 	movt	r3, #6016	; 0x1780
17803118:	e5831000 	str	r1, [r3]
1780311c:	e1a01002 	mov	r1, r2
17803120:	e3030744 	movw	r0, #14148	; 0x3744
17803124:	e3410780 	movt	r0, #6016	; 0x1780
17803128:	ebfff5e5 	bl	178008c4 <printk>
1780312c:	e320f000 	nop	{0}
17803130:	e8bd8800 	pop	{fp, pc}

17803134 <__udivsi3>:
17803134:	e2512001 	subs	r2, r1, #1
17803138:	012fff1e 	bxeq	lr
1780313c:	3a000036 	bcc	1780321c <__udivsi3+0xe8>
17803140:	e1500001 	cmp	r0, r1
17803144:	9a000022 	bls	178031d4 <__udivsi3+0xa0>
17803148:	e1110002 	tst	r1, r2
1780314c:	0a000023 	beq	178031e0 <__udivsi3+0xac>
17803150:	e311020e 	tst	r1, #-536870912	; 0xe0000000
17803154:	01a01181 	lsleq	r1, r1, #3
17803158:	03a03008 	moveq	r3, #8
1780315c:	13a03001 	movne	r3, #1
17803160:	e3510201 	cmp	r1, #268435456	; 0x10000000
17803164:	31510000 	cmpcc	r1, r0
17803168:	31a01201 	lslcc	r1, r1, #4
1780316c:	31a03203 	lslcc	r3, r3, #4
17803170:	3afffffa 	bcc	17803160 <__udivsi3+0x2c>
17803174:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
17803178:	31510000 	cmpcc	r1, r0
1780317c:	31a01081 	lslcc	r1, r1, #1
17803180:	31a03083 	lslcc	r3, r3, #1
17803184:	3afffffa 	bcc	17803174 <__udivsi3+0x40>
17803188:	e3a02000 	mov	r2, #0
1780318c:	e1500001 	cmp	r0, r1
17803190:	20400001 	subcs	r0, r0, r1
17803194:	21822003 	orrcs	r2, r2, r3
17803198:	e15000a1 	cmp	r0, r1, lsr #1
1780319c:	204000a1 	subcs	r0, r0, r1, lsr #1
178031a0:	218220a3 	orrcs	r2, r2, r3, lsr #1
178031a4:	e1500121 	cmp	r0, r1, lsr #2
178031a8:	20400121 	subcs	r0, r0, r1, lsr #2
178031ac:	21822123 	orrcs	r2, r2, r3, lsr #2
178031b0:	e15001a1 	cmp	r0, r1, lsr #3
178031b4:	204001a1 	subcs	r0, r0, r1, lsr #3
178031b8:	218221a3 	orrcs	r2, r2, r3, lsr #3
178031bc:	e3500000 	cmp	r0, #0
178031c0:	11b03223 	lsrsne	r3, r3, #4
178031c4:	11a01221 	lsrne	r1, r1, #4
178031c8:	1affffef 	bne	1780318c <__udivsi3+0x58>
178031cc:	e1a00002 	mov	r0, r2
178031d0:	e12fff1e 	bx	lr
178031d4:	03a00001 	moveq	r0, #1
178031d8:	13a00000 	movne	r0, #0
178031dc:	e12fff1e 	bx	lr
178031e0:	e3510801 	cmp	r1, #65536	; 0x10000
178031e4:	21a01821 	lsrcs	r1, r1, #16
178031e8:	23a02010 	movcs	r2, #16
178031ec:	33a02000 	movcc	r2, #0
178031f0:	e3510c01 	cmp	r1, #256	; 0x100
178031f4:	21a01421 	lsrcs	r1, r1, #8
178031f8:	22822008 	addcs	r2, r2, #8
178031fc:	e3510010 	cmp	r1, #16
17803200:	21a01221 	lsrcs	r1, r1, #4
17803204:	22822004 	addcs	r2, r2, #4
17803208:	e3510004 	cmp	r1, #4
1780320c:	82822003 	addhi	r2, r2, #3
17803210:	908220a1 	addls	r2, r2, r1, lsr #1
17803214:	e1a00230 	lsr	r0, r0, r2
17803218:	e12fff1e 	bx	lr
1780321c:	e3500000 	cmp	r0, #0
17803220:	13e00000 	mvnne	r0, #0
17803224:	ea000007 	b	17803248 <__aeabi_idiv0>

17803228 <__aeabi_uidivmod>:
17803228:	e3510000 	cmp	r1, #0
1780322c:	0afffffa 	beq	1780321c <__udivsi3+0xe8>
17803230:	e92d4003 	push	{r0, r1, lr}
17803234:	ebffffbe 	bl	17803134 <__udivsi3>
17803238:	e8bd4006 	pop	{r1, r2, lr}
1780323c:	e0030092 	mul	r3, r2, r0
17803240:	e0411003 	sub	r1, r1, r3
17803244:	e12fff1e 	bx	lr

17803248 <__aeabi_idiv0>:
17803248:	e12fff1e 	bx	lr

Disassembly of section .rodata:

1780324c <PLL1_CLOCK>:
1780324c:	2f34f600 	svccs	0x0034f600

17803250 <PLL2_CLOCK>:
17803250:	1f78a400 	svcne	0x0078a400
17803254:	179a7b00 	ldrne	r7, [sl, r0, lsl #22]
17803258:	14fb1800 	ldrbtne	r1, [fp], #2048	; 0x800
1780325c:	0bcd3d80 	bleq	16b52864 <Offset_USR_Stack+0x16b52564>
17803260:	2367b880 	cmncs	r7, #128, 16	; 0x800000

17803264 <PLL3_CLOCK>:
17803264:	1c9c3800 	ldcne	8, cr3, [ip], {0}
17803268:	2aea5400 	bcs	17298270 <Offset_USR_Stack+0x17297f70>
1780326c:	202fbf00 	eorcs	fp, pc, r0, lsl #30
17803270:	1e4b0e1e 	mcrne	14, 2, r0, cr11, cr14, {0}
17803274:	1b1abbca 	blne	17eb21a4 <STACK_ADDR+0x5b21a4>

17803278 <PLL4_CLOCK>:
17803278:	26be3680 	ldrtcs	r3, [lr], r0, lsl #13

1780327c <PLL5_CLOCK>:
1780327c:	26be3680 	ldrtcs	r3, [lr], r0, lsl #13

17803280 <.LC0>:
17803280:	666e6f43 	strbtvs	r6, [lr], -r3, asr #30
17803284:	72756769 	rsbsvc	r6, r5, #27525120	; 0x1a40000
17803288:	20676e69 	rsbcs	r6, r7, r9, ror #28
1780328c:	54495045 	strbpl	r5, [r9], #-69	; 0xffffffbb
17803290:	0a2e2e2e 	beq	1838eb50 <STACK_ADDR+0xa8eb50>
17803294:	00000000 	andeq	r0, r0, r0

17803298 <.LC1>:
17803298:	656e6f44 	strbvs	r6, [lr, #-3908]!	; 0xfffff0bc
1780329c:	74697720 	strbtvc	r7, [r9], #-1824	; 0xfffff8e0
178032a0:	50452068 	subpl	r2, r5, r8, rrx
178032a4:	000a5449 	andeq	r5, sl, r9, asr #8

178032a8 <.LC2>:
178032a8:	6d726f4e 	ldclvs	15, cr6, [r2, #-312]!	; 0xfffffec8
178032ac:	4f206c61 	svcmi	0x00206c61
178032b0:	75522053 	ldrbvc	r2, [r2, #-83]	; 0xffffffad
178032b4:	6e696e6e 	cdpvs	14, 6, cr6, cr9, cr14, {3}
178032b8:	000a2067 	andeq	r2, sl, r7, rrx

178032bc <.LC3>:
178032bc:	73696854 	cmnvc	r9, #84, 16	; 0x540000
178032c0:	73657420 	cmnvc	r5, #32, 8	; 0x20000000
178032c4:	69642074 	stmdbvs	r4!, {r2, r4, r5, r6, sp}^
178032c8:	616c7073 	smcvs	50947	; 0xc703
178032cc:	74207379 	strtvc	r7, [r0], #-889	; 0xfffffc87
178032d0:	65206568 	strvs	r6, [r0, #-1384]!	; 0xfffffa98
178032d4:	7370616c 	cmnvc	r0, #108, 2
178032d8:	6e206465 	cdpvs	4, 2, cr6, cr0, cr5, {3}
178032dc:	65626d75 	strbvs	r6, [r2, #-3445]!	; 0xfffff28b
178032e0:	666f2072 			; <UNDEFINED> instruction: 0x666f2072
178032e4:	63657320 	cmnvs	r5, #32, 6	; 0x80000000
178032e8:	2e646e6f 	cdpcs	14, 6, cr6, cr4, cr15, {3}
178032ec:	0000000a 	andeq	r0, r0, sl

178032f0 <.LC4>:
178032f0:	20656854 	rsbcs	r6, r5, r4, asr r8
178032f4:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
178032f8:	69786520 	ldmdbvs	r8!, {r5, r8, sl, sp, lr}^
178032fc:	20737473 	rsbscs	r7, r3, r3, ror r4
17803300:	65746661 	ldrbvs	r6, [r4, #-1633]!	; 0xfffff99f
17803304:	64252072 	strtvs	r2, [r5], #-114	; 0xffffff8e
17803308:	63657320 	cmnvs	r5, #32, 6	; 0x80000000
1780330c:	73646e6f 	cmnvc	r4, #1776	; 0x6f0
17803310:	00000a2e 	andeq	r0, r0, lr, lsr #20

17803314 <.LC5>:
17803314:	0a736425 	beq	194dc3b0 <STACK_ADDR+0x1bdc3b0>
17803318:	00000000 	andeq	r0, r0, r0

1780331c <.LC6>:
1780331c:	54495045 	strbpl	r5, [r9], #-69	; 0xffffffbb
17803320:	20736920 	rsbscs	r6, r3, r0, lsr #18
17803324:	676f7270 			; <UNDEFINED> instruction: 0x676f7270
17803328:	6d6d6172 	stfvse	f6, [sp, #-456]!	; 0xfffffe38
1780332c:	74206465 	strtvc	r6, [r0], #-1125	; 0xfffffb9b
17803330:	6567206f 	strbvs	r2, [r7, #-111]!	; 0xffffff91
17803334:	6172656e 	cmnvs	r2, lr, ror #10
17803338:	61206574 			; <UNDEFINED> instruction: 0x61206574
1780333c:	6e69206e 	cdpvs	0, 6, cr2, cr9, cr14, {3}
17803340:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
17803344:	20747075 	rsbscs	r7, r4, r5, ror r0
17803348:	72657665 	rsbvc	r7, r5, #105906176	; 0x6500000
1780334c:	73352079 	teqvc	r5, #121	; 0x79
17803350:	20736120 	rsbscs	r6, r3, r0, lsr #2
17803354:	69742061 	ldmdbvs	r4!, {r0, r5, r6, sp}^
17803358:	74206b63 	strtvc	r6, [r0], #-2915	; 0xfffff49d
1780335c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
17803360:	00000a2e 	andeq	r0, r0, lr, lsr #20

17803364 <.LC7>:
17803364:	54495045 	strbpl	r5, [r9], #-69	; 0xffffffbb
17803368:	20736920 	rsbscs	r6, r3, r0, lsr #18
1780336c:	676f7270 			; <UNDEFINED> instruction: 0x676f7270
17803370:	6d6d6172 	stfvse	f6, [sp, #-456]!	; 0xfffffe38
17803374:	74206465 	strtvc	r6, [r0], #-1125	; 0xfffffb9b
17803378:	6567206f 	strbvs	r2, [r7, #-111]!	; 0xffffff91
1780337c:	6172656e 	cmnvs	r2, lr, ror #10
17803380:	61206574 			; <UNDEFINED> instruction: 0x61206574
17803384:	6e69206e 	cdpvs	0, 6, cr2, cr9, cr14, {3}
17803388:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
1780338c:	20747075 	rsbscs	r7, r4, r5, ror r0
17803390:	72657665 	rsbvc	r7, r5, #105906176	; 0x6500000
17803394:	30312079 	eorscc	r2, r1, r9, ror r0
17803398:	6120736d 			; <UNDEFINED> instruction: 0x6120736d
1780339c:	20612073 	rsbcs	r2, r1, r3, ror r0
178033a0:	6b636974 	blvs	190dd978 <STACK_ADDR+0x17dd978>
178033a4:	6d697420 	cfstrdvs	mvd7, [r9, #-128]!	; 0xffffff80
178033a8:	0a2e7265 	beq	1839fd44 <STACK_ADDR+0xa9fd44>
178033ac:	00000000 	andeq	r0, r0, r0

178033b0 <.LC8>:
178033b0:	20656854 	rsbcs	r6, r5, r4, asr r8
178033b4:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
178033b8:	69786520 	ldmdbvs	r8!, {r5, r8, sl, sp, lr}^
178033bc:	61207374 			; <UNDEFINED> instruction: 0x61207374
178033c0:	72657466 	rsbvc	r7, r5, #1711276032	; 0x66000000
178033c4:	20642520 	rsbcs	r2, r4, r0, lsr #10
178033c8:	6f636573 	svcvs	0x00636573
178033cc:	2e73646e 	cdpcs	4, 7, cr6, cr3, cr14, {3}
178033d0:	0000000a 	andeq	r0, r0, sl

178033d4 <.LC9>:
178033d4:	70616c45 	rsbvc	r6, r1, r5, asr #24
178033d8:	20646573 	rsbcs	r6, r4, r3, ror r5
178033dc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
178033e0:	20642520 	rsbcs	r2, r4, r0, lsr #10
178033e4:	6f636573 	svcvs	0x00636573
178033e8:	2073646e 	rsbscs	r6, r3, lr, ror #8
178033ec:	203e3d3c 	eorscs	r3, lr, ip, lsr sp
178033f0:	74206425 	strtvc	r6, [r0], #-1061	; 0xfffffbdb
178033f4:	736b6369 	cmnvc	fp, #-1543503871	; 0xa4000001
178033f8:	00000a2e 	andeq	r0, r0, lr, lsr #20

178033fc <.LC0>:
178033fc:	20555043 	subscs	r5, r5, r3, asr #32
17803400:	65746e49 	ldrbvs	r6, [r4, #-3657]!	; 0xfffff1b7
17803404:	63616672 	cmnvs	r1, #119537664	; 0x7200000
17803408:	65522065 	ldrbvs	r2, [r2, #-101]	; 0xffffff9b
1780340c:	74736967 	ldrbtvc	r6, [r3], #-2407	; 0xfffff699
17803410:	0a737265 	beq	194dfdac <STACK_ADDR+0x1bdfdac>
17803414:	00000000 	andeq	r0, r0, r0

17803418 <.LC1>:
17803418:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
1780341c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803420:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803424:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803428:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
1780342c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803430:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803434:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803438:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
1780343c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803440:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803444:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803448:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
1780344c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
17803450:	0a2d2d2d 	beq	1834e90c <STACK_ADDR+0xa4e90c>
17803454:	00000000 	andeq	r0, r0, r0

17803458 <.LC2>:
17803458:	20555043 	subscs	r5, r5, r3, asr #32
1780345c:	65746e49 	ldrbvs	r6, [r4, #-3657]!	; 0xfffff1b7
17803460:	63616672 	cmnvs	r1, #119537664	; 0x7200000
17803464:	6f432065 	svcvs	0x00432065
17803468:	6f72746e 	svcvs	0x0072746e
1780346c:	6552206c 	ldrbvs	r2, [r2, #-108]	; 0xffffff94
17803470:	74736967 	ldrbtvc	r6, [r3], #-2407	; 0xfffff699
17803474:	203a7265 	eorscs	r7, sl, r5, ror #4
17803478:	000a6425 	andeq	r6, sl, r5, lsr #8

1780347c <.LC3>:
1780347c:	65746e49 	ldrbvs	r6, [r4, #-3657]!	; 0xfffff1b7
17803480:	70757272 	rsbsvc	r7, r5, r2, ror r2
17803484:	72502074 	subsvc	r2, r0, #116	; 0x74
17803488:	69726f69 	ldmdbvs	r2!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
1780348c:	4d207974 			; <UNDEFINED> instruction: 0x4d207974
17803490:	206b7361 	rsbcs	r7, fp, r1, ror #6
17803494:	69676552 	stmdbvs	r7!, {r1, r4, r6, r8, sl, sp, lr}^
17803498:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
1780349c:	6425203a 	strtvs	r2, [r5], #-58	; 0xffffffc6
178034a0:	0000000a 	andeq	r0, r0, sl

178034a4 <.LC4>:
178034a4:	616e6942 	cmnvs	lr, r2, asr #18
178034a8:	50207972 	eorpl	r7, r0, r2, ror r9
178034ac:	746e696f 	strbtvc	r6, [lr], #-2415	; 0xfffff691
178034b0:	67655220 	strbvs	r5, [r5, -r0, lsr #4]!
178034b4:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
178034b8:	25203a72 	strcs	r3, [r0, #-2674]!	; 0xfffff58e
178034bc:	00000a64 	andeq	r0, r0, r4, ror #20

178034c0 <.LC5>:
178034c0:	20646e45 	rsbcs	r6, r4, r5, asr #28
178034c4:	4920666f 	stmdbmi	r0!, {r0, r1, r2, r3, r5, r6, r9, sl, sp, lr}
178034c8:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
178034cc:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
178034d0:	67655220 	strbvs	r5, [r5, -r0, lsr #4]!
178034d4:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
178034d8:	25203a72 	strcs	r3, [r0, #-2674]!	; 0xfffff58e
178034dc:	00000a64 	andeq	r0, r0, r4, ror #20

178034e0 <.LC6>:
178034e0:	6e6e7552 	mcrvs	5, 3, r7, cr14, cr2, {2}
178034e4:	20676e69 	rsbcs	r6, r7, r9, ror #28
178034e8:	6f697250 	svcvs	0x00697250
178034ec:	79746972 	ldmdbvc	r4!, {r1, r4, r5, r6, r8, fp, sp, lr}^
178034f0:	67655220 	strbvs	r5, [r5, -r0, lsr #4]!
178034f4:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
178034f8:	25203a72 	strcs	r3, [r0, #-2674]!	; 0xfffff58e
178034fc:	00000a64 	andeq	r0, r0, r4, ror #20

17803500 <.LC7>:
17803500:	68676948 	stmdavs	r7!, {r3, r6, r8, fp, sp, lr}^
17803504:	20747365 	rsbscs	r7, r4, r5, ror #6
17803508:	6f697250 	svcvs	0x00697250
1780350c:	79746972 	ldmdbvc	r4!, {r1, r4, r5, r6, r8, fp, sp, lr}^
17803510:	6e655020 	cdpvs	0, 6, cr5, cr5, cr0, {1}
17803514:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
17803518:	746e4920 	strbtvc	r4, [lr], #-2336	; 0xfffff6e0
1780351c:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
17803520:	52207470 	eorpl	r7, r0, #112, 8	; 0x70000000
17803524:	73696765 	cmnvc	r9, #26476544	; 0x1940000
17803528:	3a726574 	bcc	1949cb00 <STACK_ADDR+0x1b9cb00>
1780352c:	0a642520 	beq	1910c9b4 <STACK_ADDR+0x180c9b4>
17803530:	00000000 	andeq	r0, r0, r0

17803534 <.LC8>:
17803534:	61696c41 	cmnvs	r9, r1, asr #24
17803538:	20646573 	rsbcs	r6, r4, r3, ror r5
1780353c:	616e6942 	cmnvs	lr, r2, asr #18
17803540:	50207972 	eorpl	r7, r0, r2, ror r9
17803544:	746e696f 	strbtvc	r6, [lr], #-2415	; 0xfffff691
17803548:	67655220 	strbvs	r5, [r5, -r0, lsr #4]!
1780354c:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
17803550:	25203a72 	strcs	r3, [r0, #-2674]!	; 0xfffff58e
17803554:	00000a64 	andeq	r0, r0, r4, ror #20

17803558 <.LC9>:
17803558:	20555043 	subscs	r5, r5, r3, asr #32
1780355c:	65746e49 	ldrbvs	r6, [r4, #-3657]!	; 0xfffff1b7
17803560:	63616672 	cmnvs	r1, #119537664	; 0x7200000
17803564:	64492065 	strbvs	r2, [r9], #-101	; 0xffffff9b
17803568:	69746e65 	ldmdbvs	r4!, {r0, r2, r5, r6, r9, sl, fp, sp, lr}^
1780356c:	61636966 	cmnvs	r3, r6, ror #18
17803570:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
17803574:	67655220 	strbvs	r5, [r5, -r0, lsr #4]!
17803578:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
1780357c:	25203a72 	strcs	r3, [r0, #-2674]!	; 0xfffff58e
17803580:	00000a64 	andeq	r0, r0, r4, ror #20

17803584 <.LC0>:
17803584:	65746e49 	ldrbvs	r6, [r4, #-3657]!	; 0xfffff1b7
17803588:	70757272 	rsbsvc	r7, r5, r2, ror r2
1780358c:	64252074 	strtvs	r2, [r5], #-116	; 0xffffff8c
17803590:	73616820 	cmnvc	r1, #32, 16	; 0x200000
17803594:	65656220 	strbvs	r6, [r5, #-544]!	; 0xfffffde0
17803598:	7361206e 	cmnvc	r1, #110	; 0x6e
1780359c:	74726573 	ldrbtvc	r6, [r2], #-1395	; 0xfffffa8d
178035a0:	000a6465 	andeq	r6, sl, r5, ror #8

178035a4 <.LC1>:
178035a4:	74636556 	strbtvc	r6, [r3], #-1366	; 0xfffffaaa
178035a8:	4620726f 	strtmi	r7, [r0], -pc, ror #4
178035ac:	68205149 	stmdavs	r0!, {r0, r3, r6, r8, ip, lr}
178035b0:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
178035b4:	203a7265 	eorscs	r7, sl, r5, ror #4
178035b8:	203a4449 	eorscs	r4, sl, r9, asr #8
178035bc:	000a6425 	andeq	r6, sl, r5, lsr #8

178035c0 <.LC2>:
178035c0:	20515249 	subscs	r5, r1, r9, asr #4
178035c4:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
178035c8:	3a72656c 	bcc	1949cb80 <STACK_ADDR+0x1b9cb80>
178035cc:	3a444920 	bcc	18915a54 <STACK_ADDR+0x1015a54>
178035d0:	0a642520 	beq	1910ca58 <STACK_ADDR+0x180ca58>
178035d4:	00000000 	andeq	r0, r0, r0

178035d8 <.LC3>:
178035d8:	66206e49 	strtvs	r6, [r0], -r9, asr #28
178035dc:	64207169 	strtvs	r7, [r0], #-361	; 0xfffffe97
178035e0:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
178035e4:	000a746c 	andeq	r7, sl, ip, ror #8

178035e8 <.LC4>:
178035e8:	45444e55 	strbmi	r4, [r4, #-3669]	; 0xfffff1ab
178035ec:	454e4946 	strbmi	r4, [lr, #-2374]	; 0xfffff6ba
178035f0:	44485f44 	strbmi	r5, [r8], #-3908	; 0xfffff0bc
178035f4:	520a524c 	andpl	r5, sl, #76, 4	; 0xc0000004
178035f8:	73696765 	cmnvc	r9, #26476544	; 0x1940000
178035fc:	73726574 	cmnvc	r2, #116, 10	; 0x1d000000
17803600:	6c617620 	stclvs	6, cr7, [r1], #-128	; 0xffffff80
17803604:	20736575 	rsbscs	r6, r3, r5, ror r5
17803608:	2d203072 	stccs	0, cr3, [r0, #-456]!	; 0xfffffe38
1780360c:	0a357220 	beq	1855fe94 <STACK_ADDR+0xc5fe94>
17803610:	7825203a 	stmdavc	r5!, {r1, r3, r4, r5, sp}
17803614:	25202d20 	strcs	r2, [r0, #-3360]!	; 0xfffff2e0
17803618:	202d2078 	eorcs	r2, sp, r8, ror r0
1780361c:	2d207825 	stccs	8, cr7, [r0, #-148]!	; 0xffffff6c
17803620:	20782520 	rsbscs	r2, r8, r0, lsr #10
17803624:	7825202d 	stmdavc	r5!, {r0, r2, r3, r5, sp}
17803628:	0000000a 	andeq	r0, r0, sl

1780362c <.LC5>:
1780362c:	20544241 	subscs	r4, r4, r1, asr #4
17803630:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
17803634:	0a72656c 	beq	1949cbec <STACK_ADDR+0x1b9cbec>
17803638:	00000000 	andeq	r0, r0, r0

1780363c <.LC6>:
1780363c:	46455250 			; <UNDEFINED> instruction: 0x46455250
17803640:	48435445 	stmdami	r3, {r0, r2, r6, sl, ip, lr}^
17803644:	6e616820 	cdpvs	8, 6, cr6, cr1, cr0, {1}
17803648:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
1780364c:	0000000a 	andeq	r0, r0, sl

17803650 <.LC7>:
17803650:	20495753 	subcs	r5, r9, r3, asr r7
17803654:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
17803658:	0a72656c 	beq	1949cc10 <STACK_ADDR+0x1b9cc10>
1780365c:	00000000 	andeq	r0, r0, r0

17803660 <.LC8>:
17803660:	45534552 	ldrbmi	r4, [r3, #-1362]	; 0xfffffaae
17803664:	44455652 	strbmi	r5, [r5], #-1618	; 0xfffff9ae
17803668:	6e616820 	cdpvs	8, 6, cr6, cr1, cr0, {1}
1780366c:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
17803670:	0000000a 	andeq	r0, r0, sl

17803674 <.LC0>:
17803674:	5f4e4f4d 	svcpl	0x004e4f4d
17803678:	20544241 	subscs	r4, r4, r1, asr #4
1780367c:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
17803680:	2072656c 	rsbscs	r6, r2, ip, ror #10
17803684:	000a7825 	andeq	r7, sl, r5, lsr #16

17803688 <.LC1>:
17803688:	5f4e4f4d 	svcpl	0x004e4f4d
1780368c:	46455250 			; <UNDEFINED> instruction: 0x46455250
17803690:	48435445 	stmdami	r3, {r0, r2, r6, sl, ip, lr}^
17803694:	6e616820 	cdpvs	8, 6, cr6, cr1, cr0, {1}
17803698:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
1780369c:	0000000a 	andeq	r0, r0, sl

178036a0 <.LC2>:
178036a0:	20434d53 	subcs	r4, r3, r3, asr sp
178036a4:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
178036a8:	0a72656c 	beq	1949cc60 <STACK_ADDR+0x1b9cc60>
178036ac:	00000000 	andeq	r0, r0, r0

178036b0 <.LC3>:
178036b0:	5f4e4f4d 	svcpl	0x004e4f4d
178036b4:	45534552 	ldrbmi	r4, [r3, #-1362]	; 0xfffffaae
178036b8:	44455652 	strbmi	r5, [r5], #-1618	; 0xfffff9ae
178036bc:	6e616820 	cdpvs	8, 6, cr6, cr1, cr0, {1}
178036c0:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
178036c4:	0000000a 	andeq	r0, r0, sl

178036c8 <.LC4>:
178036c8:	204e4f4d 	subcs	r4, lr, sp, asr #30
178036cc:	20514946 	subscs	r4, r1, r6, asr #18
178036d0:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
178036d4:	3a72656c 	bcc	1949cc8c <STACK_ADDR+0x1b9cc8c>
178036d8:	3a444920 	bcc	18915b60 <STACK_ADDR+0x1015b60>
178036dc:	0a642520 	beq	1910cb64 <STACK_ADDR+0x180cb64>
178036e0:	00000000 	andeq	r0, r0, r0

178036e4 <.LC5>:
178036e4:	20515249 	subscs	r5, r1, r9, asr #4
178036e8:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
178036ec:	3a72656c 	bcc	1949cca4 <STACK_ADDR+0x1b9cca4>
178036f0:	3a444920 	bcc	18915b78 <STACK_ADDR+0x1015b78>
178036f4:	0a642520 	beq	1910cb7c <STACK_ADDR+0x180cb7c>
178036f8:	00000000 	andeq	r0, r0, r0

178036fc <.LC6>:
178036fc:	72617453 	rsbvc	r7, r1, #1392508928	; 0x53000000
17803700:	49462074 	stmdbmi	r6, {r2, r4, r5, r6, sp}^
17803704:	61482051 	qdaddvs	r2, r1, r8
17803708:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
1780370c:	202d2072 	eorcs	r2, sp, r2, ror r0
17803710:	203a4449 	eorscs	r4, sl, r9, asr #8
17803714:	000a6425 	andeq	r6, sl, r5, lsr #8

17803718 <.LC7>:
17803718:	656e6f44 	strbvs	r6, [lr, #-3908]!	; 0xfffff0bc
1780371c:	51494620 	cmppl	r9, r0, lsr #12
17803720:	6e614820 	cdpvs	8, 6, cr4, cr1, cr0, {1}
17803724:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
17803728:	0000000a 	andeq	r0, r0, sl

1780372c <.LC8>:
1780372c:	5f4e4f4d 	svcpl	0x004e4f4d
17803730:	45444e55 	strbmi	r4, [r4, #-3669]	; 0xfffff1ab
17803734:	454e4946 	strbmi	r4, [lr, #-2374]	; 0xfffff6ba
17803738:	61682044 	cmnvs	r8, r4, asr #32
1780373c:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
17803740:	00000a72 	andeq	r0, r0, r2, ror sl

17803744 <.LC9>:
17803744:	45444f43 	strbmi	r4, [r4, #-3907]	; 0xfffff0bd
17803748:	52454820 	subpl	r4, r5, #32, 16	; 0x200000
1780374c:	25203a45 	strcs	r3, [r0, #-2629]!	; 0xfffff5bb
17803750:	Address 0x0000000017803750 is out of bounds.


Disassembly of section .data:

17803754 <FIQ_interruptID>:
17803754:	00000000 	andeq	r0, r0, r0

17803758 <mychar>:
17803758:	Address 0x0000000017803758 is out of bounds.


Disassembly of section .bss:

1780375c <__bss_start>:
1780375c:	00000000 	andeq	r0, r0, r0

17803760 <g_wait_for_irq>:
17803760:	00000000 	andeq	r0, r0, r0

17803764 <FIQ_interruptID>:
17803764:	00000000 	andeq	r0, r0, r0

17803768 <FIQ_interruptID>:
17803768:	00000000 	andeq	r0, r0, r0

1780376c <FIQ_interruptID>:
1780376c:	00000000 	andeq	r0, r0, r0

17803770 <FIQ_interruptID>:
17803770:	00000000 	andeq	r0, r0, r0

17803774 <i.3847>:
17803774:	00000000 	andeq	r0, r0, r0

17803778 <microsecondTimerMultiple>:
17803778:	00000000 	andeq	r0, r0, r0

1780377c <g_vectNum>:
	...

1780378c <g_interrupt_handlers>:
	...

Disassembly of section .ARM.attributes:

00000000 <STACK_ADDR-0x17900000>:
   0:	00003441 	andeq	r3, r0, r1, asr #8
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	0000002a 	andeq	r0, r0, sl, lsr #32
  10:	726f4305 	rsbvc	r4, pc, #335544320	; 0x14000000
  14:	2d786574 	cfldr64cs	mvdx6, [r8, #-464]!	; 0xfffffe30
  18:	06003941 	streq	r3, [r0], -r1, asr #18
  1c:	0841070a 	stmdaeq	r1, {r1, r3, r8, r9, sl}^
  20:	12020901 	andne	r0, r2, #16384	; 0x4000
  24:	15011404 	strne	r1, [r1, #-1028]	; 0xfffffbfc
  28:	18031701 	stmdane	r3, {r0, r8, r9, sl, ip}
  2c:	22011a01 	andcs	r1, r1, #4096	; 0x1000
  30:	44012a01 	strmi	r2, [r1], #-2561	; 0xfffff5ff
  34:	Address 0x0000000000000034 is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <Offset_USR_Stack+0x10d0a24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	206d7241 	rsbcs	r7, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xfffff2bb
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0xfffffb9c
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2073726f 	rsbscs	r7, r3, pc, ror #4
  2c:	30322d37 	eorscc	r2, r2, r7, lsr sp
  30:	712d3731 			; <UNDEFINED> instruction: 0x712d3731
  34:	616d2d34 	cmnvs	sp, r4, lsr sp
  38:	29726f6a 	ldmdbcs	r2!, {r1, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
  3c:	322e3720 	eorcc	r3, lr, #32, 14	; 0x800000
  40:	3220312e 	eorcc	r3, r0, #-2147483637	; 0x8000000b
  44:	30373130 	eorscc	r3, r7, r0, lsr r1
  48:	20343039 	eorscs	r3, r4, r9, lsr r0
  4c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  50:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0xfffffe9b
  54:	415b2029 	cmpmi	fp, r9, lsr #32
  58:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff30e <STACK_ADDR+0xe86ff30e>
  5c:	6465626d 	strbtvs	r6, [r5], #-621	; 0xfffffd93
  60:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  64:	72622d37 	rsbvc	r2, r2, #3520	; 0xdc0
  68:	68636e61 	stmdavs	r3!, {r0, r5, r6, r9, sl, fp, sp, lr}^
  6c:	76657220 	strbtvc	r7, [r5], -r0, lsr #4
  70:	6f697369 	svcvs	0x00697369
  74:	3532206e 	ldrcc	r2, [r2, #-110]!	; 0xffffff92
  78:	34303235 	ldrtcc	r3, [r0], #-565	; 0xfffffdcb
  7c:	Address 0x000000000000007c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c010001 	stcvc	0, cr0, [r1], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000000c 	andeq	r0, r0, ip
  14:	00000000 	andeq	r0, r0, r0
  18:	17803134 			; <UNDEFINED> instruction: 0x17803134
  1c:	000000f4 	strdeq	r0, [r0], -r4

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000000dd 	ldrdeq	r0, [r0], -sp
   4:	009e0002 	addseq	r0, lr, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	2f010000 	svccs	0x00010000
  1c:	2f74706f 	svccs	0x0074706f
  20:	61636f6c 	cmnvs	r3, ip, ror #30
  24:	61762f6c 	cmnvs	r6, ip, ror #30
  28:	616d2f72 	smcvs	54002	; 0xd2f2
  2c:	726f7063 	rsbvc	r7, pc, #99	; 0x63
  30:	622f7374 	eorvs	r7, pc, #116, 6	; 0xd0000001
  34:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
  38:	706f5f2f 	rsbvc	r5, pc, pc, lsr #30
  3c:	706d5f74 	rsbvc	r5, sp, r4, ror pc
  40:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
  44:	6f70645f 	svcvs	0x0070645f
  48:	5f737472 	svcpl	0x00737472
  4c:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
  50:	72615f73 	rsbvc	r5, r1, #460	; 0x1cc
  54:	6f6e2d6d 	svcvs	0x006e2d6d
  58:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
  5c:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
  60:	2f636367 	svccs	0x00636367
  64:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
  68:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
  6c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
  70:	63672d69 	cmnvs	r7, #6720	; 0x1a40
  74:	6f772f63 	svcvs	0x00772f63
  78:	672f6b72 			; <UNDEFINED> instruction: 0x672f6b72
  7c:	342d6363 	strtcc	r6, [sp], #-867	; 0xfffffc9d
  80:	322e372e 	eorcc	r3, lr, #12058624	; 0xb80000
  84:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
  88:	2f636367 	svccs	0x00636367
  8c:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
  90:	612f6769 			; <UNDEFINED> instruction: 0x612f6769
  94:	00006d72 	andeq	r6, r0, r2, ror sp
  98:	3162696c 	cmncc	r2, ip, ror #18
  9c:	636e7566 	cmnvs	lr, #427819008	; 0x19800000
  a0:	00532e73 	subseq	r2, r3, r3, ror lr
  a4:	00000001 	andeq	r0, r0, r1
  a8:	34020500 	strcc	r0, [r2], #-1280	; 0xfffffb00
  ac:	03178031 	tsteq	r7, #49	; 0x31
  b0:	300107cc 	andcc	r0, r1, ip, asr #15
  b4:	2f2f2f2f 	svccs	0x002f2f2f
  b8:	7cfe032f 	ldclvc	3, cr0, [lr], #188	; 0xbc
  bc:	0386032e 	orreq	r0, r6, #-1207959552	; 0xb8000000
  c0:	2f013e02 	svccs	0x00013e02
  c4:	032f2f31 			; <UNDEFINED> instruction: 0x032f2f31
  c8:	032e7db7 			; <UNDEFINED> instruction: 0x032e7db7
  cc:	900802cd 	andls	r0, r8, sp, asr #5
  d0:	1603322f 	strne	r3, [r3], -pc, lsr #4
  d4:	2f2f2f66 	svccs	0x002f2f66
  d8:	2f2f2f2f 	svccs	0x002f2f2f
  dc:	01000202 	tsteq	r0, r2, lsl #4
  e0:	0000b401 	andeq	fp, r0, r1, lsl #8
  e4:	9e000200 	cdpls	2, 0, cr0, cr0, cr0, {0}
  e8:	02000000 	andeq	r0, r0, #0
  ec:	0d0efb01 	vstreq	d15, [lr, #-4]
  f0:	01010100 	mrseq	r0, (UNDEF: 17)
  f4:	00000001 	andeq	r0, r0, r1
  f8:	01000001 	tsteq	r0, r1
  fc:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
 100:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
 104:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
 108:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; ffffff8c <STACK_ADDR+0xe86fff8c>
 10c:	6f706361 	svcvs	0x00706361
 110:	2f737472 	svccs	0x00737472
 114:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 118:	6f5f2f64 	svcvs	0x005f2f64
 11c:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; ffffff64 <STACK_ADDR+0xe86fff64>
 120:	74726f70 	ldrbtvc	r6, [r2], #-3952	; 0xfffff090
 124:	70645f73 	rsbvc	r5, r4, r3, ror pc
 128:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
 12c:	6f72635f 	svcvs	0x0072635f
 130:	615f7373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
 134:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 138:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 13c:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 140:	6363672d 	cmnvs	r3, #11796480	; 0xb40000
 144:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 148:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 14c:	61652d65 	cmnvs	r5, r5, ror #26
 150:	672d6962 	strvs	r6, [sp, -r2, ror #18]!
 154:	772f6363 	strvc	r6, [pc, -r3, ror #6]!
 158:	2f6b726f 	svccs	0x006b726f
 15c:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
 160:	2e372e34 	mrccs	14, 1, r2, cr7, cr4, {1}
 164:	696c2f32 	stmdbvs	ip!, {r1, r4, r5, r8, r9, sl, fp, sp}^
 168:	63636762 	cmnvs	r3, #25690112	; 0x1880000
 16c:	6e6f632f 	cdpvs	3, 6, cr6, cr15, cr15, {1}
 170:	2f676966 	svccs	0x00676966
 174:	006d7261 	rsbeq	r7, sp, r1, ror #4
 178:	62696c00 	rsbvs	r6, r9, #0, 24
 17c:	6e756631 	mrcvs	6, 3, r6, cr5, cr1, {1}
 180:	532e7363 			; <UNDEFINED> instruction: 0x532e7363
 184:	00000100 	andeq	r0, r0, r0, lsl #2
 188:	02050000 	andeq	r0, r5, #0
 18c:	17803248 	strne	r3, [r0, r8, asr #4]
 190:	010a9303 	tsteq	sl, r3, lsl #6
 194:	01000202 	tsteq	r0, r2, lsl #4
 198:	Address 0x0000000000000198 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000127 	andeq	r0, r0, r7, lsr #2
   4:	00000002 	andeq	r0, r0, r2
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	00000000 	andeq	r0, r0, r0
  10:	17803134 			; <UNDEFINED> instruction: 0x17803134
  14:	17803248 	strne	r3, [r0, r8, asr #4]
  18:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
  1c:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
  20:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
  24:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; fffffea8 <STACK_ADDR+0xe86ffea8>
  28:	6f706361 	svcvs	0x00706361
  2c:	2f737472 	svccs	0x00737472
  30:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
  34:	6f5f2f64 	svcvs	0x005f2f64
  38:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; fffffe80 <STACK_ADDR+0xe86ffe80>
  3c:	74726f70 	ldrbtvc	r6, [r2], #-3952	; 0xfffff090
  40:	70645f73 	rsbvc	r5, r4, r3, ror pc
  44:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
  48:	6f72635f 	svcvs	0x0072635f
  4c:	615f7373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
  50:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
  54:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
  58:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
  5c:	6363672d 	cmnvs	r3, #11796480	; 0xb40000
  60:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
  64:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
  68:	61652d65 	cmnvs	r5, r5, ror #26
  6c:	672d6962 	strvs	r6, [sp, -r2, ror #18]!
  70:	772f6363 	strvc	r6, [pc, -r3, ror #6]!
  74:	2f6b726f 	svccs	0x006b726f
  78:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
  7c:	2e372e34 	mrccs	14, 1, r2, cr7, cr4, {1}
  80:	696c2f32 	stmdbvs	ip!, {r1, r4, r5, r8, r9, sl, fp, sp}^
  84:	63636762 	cmnvs	r3, #25690112	; 0x1880000
  88:	6e6f632f 	cdpvs	3, 6, cr6, cr15, cr15, {1}
  8c:	2f676966 	svccs	0x00676966
  90:	2f6d7261 	svccs	0x006d7261
  94:	3162696c 	cmncc	r2, ip, ror #18
  98:	636e7566 	cmnvs	lr, #427819008	; 0x19800000
  9c:	00532e73 	subseq	r2, r3, r3, ror lr
  a0:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xfffff0d1
  a4:	636f6c2f 	cmnvs	pc, #12032	; 0x2f00
  a8:	762f6c61 	strtvc	r6, [pc], -r1, ror #24
  ac:	6d2f7261 	sfmvs	f7, 4, [pc, #-388]!	; ffffff30 <STACK_ADDR+0xe86fff30>
  b0:	6f706361 	svcvs	0x00706361
  b4:	2f737472 	svccs	0x00737472
  b8:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
  bc:	6f5f2f64 	svcvs	0x005f2f64
  c0:	6d5f7470 	cfldrdvs	mvd7, [pc, #-448]	; ffffff08 <STACK_ADDR+0xe86fff08>
  c4:	74726f70 	ldrbtvc	r6, [r2], #-3952	; 0xfffff090
  c8:	70645f73 	rsbvc	r5, r4, r3, ror pc
  cc:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
  d0:	6f72635f 	svcvs	0x0072635f
  d4:	615f7373 	cmpvs	pc, r3, ror r3	; <UNPREDICTABLE>
  d8:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
  dc:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
  e0:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
  e4:	6363672d 	cmnvs	r3, #11796480	; 0xb40000
  e8:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
  ec:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
  f0:	61652d65 	cmnvs	r5, r5, ror #26
  f4:	672d6962 	strvs	r6, [sp, -r2, ror #18]!
  f8:	772f6363 	strvc	r6, [pc, -r3, ror #6]!
  fc:	2f6b726f 	svccs	0x006b726f
 100:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 104:	72612f64 	rsbvc	r2, r1, #100, 30	; 0x190
 108:	6f6e2d6d 	svcvs	0x006e2d6d
 10c:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 110:	2f696261 	svccs	0x00696261
 114:	6762696c 	strbvs	r6, [r2, -ip, ror #18]!
 118:	47006363 	strmi	r6, [r0, -r3, ror #6]
 11c:	4120554e 			; <UNDEFINED> instruction: 0x4120554e
 120:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 124:	312e3332 			; <UNDEFINED> instruction: 0x312e3332
 128:	27800100 	strcs	r0, [r0, r0, lsl #2]
 12c:	02000001 	andeq	r0, r0, #1
 130:	00001400 	andeq	r1, r0, r0, lsl #8
 134:	e1010400 	tst	r1, r0, lsl #8
 138:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
 13c:	4c178032 	ldcmi	0, cr8, [r7], {50}	; 0x32
 140:	2f178032 	svccs	0x00178032
 144:	2f74706f 	svccs	0x0074706f
 148:	61636f6c 	cmnvs	r3, ip, ror #30
 14c:	61762f6c 	cmnvs	r6, ip, ror #30
 150:	616d2f72 	smcvs	54002	; 0xd2f2
 154:	726f7063 	rsbvc	r7, pc, #99	; 0x63
 158:	622f7374 	eorvs	r7, pc, #116, 6	; 0xd0000001
 15c:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
 160:	706f5f2f 	rsbvc	r5, pc, pc, lsr #30
 164:	706d5f74 	rsbvc	r5, sp, r4, ror pc
 168:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
 16c:	6f70645f 	svcvs	0x0070645f
 170:	5f737472 	svcpl	0x00737472
 174:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
 178:	72615f73 	rsbvc	r5, r1, #460	; 0x1cc
 17c:	6f6e2d6d 	svcvs	0x006e2d6d
 180:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 184:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 188:	2f636367 	svccs	0x00636367
 18c:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 190:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 194:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 198:	63672d69 	cmnvs	r7, #6720	; 0x1a40
 19c:	6f772f63 	svcvs	0x00772f63
 1a0:	672f6b72 			; <UNDEFINED> instruction: 0x672f6b72
 1a4:	342d6363 	strtcc	r6, [sp], #-867	; 0xfffffc9d
 1a8:	322e372e 	eorcc	r3, lr, #12058624	; 0xb80000
 1ac:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 1b0:	2f636367 	svccs	0x00636367
 1b4:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
 1b8:	612f6769 			; <UNDEFINED> instruction: 0x612f6769
 1bc:	6c2f6d72 	stcvs	13, cr6, [pc], #-456	; fffffffc <STACK_ADDR+0xe86ffffc>
 1c0:	66316269 	ldrtvs	r6, [r1], -r9, ror #4
 1c4:	73636e75 	cmnvc	r3, #1872	; 0x750
 1c8:	2f00532e 	svccs	0x0000532e
 1cc:	2f74706f 	svccs	0x0074706f
 1d0:	61636f6c 	cmnvs	r3, ip, ror #30
 1d4:	61762f6c 	cmnvs	r6, ip, ror #30
 1d8:	616d2f72 	smcvs	54002	; 0xd2f2
 1dc:	726f7063 	rsbvc	r7, pc, #99	; 0x63
 1e0:	622f7374 	eorvs	r7, pc, #116, 6	; 0xd0000001
 1e4:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
 1e8:	706f5f2f 	rsbvc	r5, pc, pc, lsr #30
 1ec:	706d5f74 	rsbvc	r5, sp, r4, ror pc
 1f0:	7374726f 	cmnvc	r4, #-268435450	; 0xf0000006
 1f4:	6f70645f 	svcvs	0x0070645f
 1f8:	5f737472 	svcpl	0x00737472
 1fc:	736f7263 	cmnvc	pc, #805306374	; 0x30000006
 200:	72615f73 	rsbvc	r5, r1, #460	; 0x1cc
 204:	6f6e2d6d 	svcvs	0x006e2d6d
 208:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 20c:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 210:	2f636367 	svccs	0x00636367
 214:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 218:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 21c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 220:	63672d69 	cmnvs	r7, #6720	; 0x1a40
 224:	6f772f63 	svcvs	0x00772f63
 228:	622f6b72 	eorvs	r6, pc, #116736	; 0x1c800
 22c:	646c6975 	strbtvs	r6, [ip], #-2421	; 0xfffff68b
 230:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 234:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 238:	61652d65 	cmnvs	r5, r5, ror #26
 23c:	6c2f6962 			; <UNDEFINED> instruction: 0x6c2f6962
 240:	63676269 	cmnvs	r7, #-1879048186	; 0x90000006
 244:	4e470063 	cdpmi	0, 4, cr0, cr7, cr3, {3}
 248:	53412055 	movtpl	r2, #4181	; 0x1055
 24c:	322e3220 	eorcc	r3, lr, #32, 4
 250:	00312e33 	eorseq	r2, r1, r3, lsr lr
 254:	Address 0x0000000000000254 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	andne	r1, r0, r1, lsl #2
   4:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
   8:	1b080301 	blne	200c14 <Offset_USR_Stack+0x200914>
   c:	13082508 	movwne	r2, #34056	; 0x8508
  10:	00000005 	andeq	r0, r0, r5
  14:	10001101 	andne	r1, r0, r1, lsl #2
  18:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
  1c:	1b080301 	blne	200c28 <Offset_USR_Stack+0x200928>
  20:	13082508 	movwne	r2, #34056	; 0x8508
  24:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	17803134 			; <UNDEFINED> instruction: 0x17803134
  14:	00000114 	andeq	r0, r0, r4, lsl r1
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	012b0002 			; <UNDEFINED> instruction: 0x012b0002
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	17803248 	strne	r3, [r0, r8, asr #4]
  34:	00000004 	andeq	r0, r0, r4
	...
