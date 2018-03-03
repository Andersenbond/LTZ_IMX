CROSS_PREFIX= arm-none-eabi-

INCDIR=obj/inc
SRCDIR=src
OUTDIR=output
OBJDIR=obj




#SOURCES  := $(wildcard $(SRCDIR)/*.c)
#INCLUDES := $(wildcard $(SRCDIR)/*.h)
#OBJECTS=$(SOURCES:.c=.o)
#EXECUTABLE = LTZvisor


LDFLAGS=
AS = $(CROSS_PREFIX)as
CC = $(CROSS_PREFIX)gcc
LD = $(CROSS_PREFIX)ld
OBJCOPY = $(CROSS_PREFIX)objcopy
OBJDUMP = $(CROSS_PREFIX)objdump

MKIMAGE = mkimage
CFLAGS = -Wall -O0 -nostdlib -nostartfiles -ffreestanding -mcpu=cortex-a9
ASFLAGS = -Wall -march=cortex-a9
LDFLAGS = -L . -lgcc

#$(EXECUTABLE) : $(OBJECTS)
#	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

#.c.o:
#	$(CC) $(CFLAGS) $< -o $@

OBJS = \
	printk.o\
	imx6_uart_driver.o\
	ltz_uart_iomux_config.o\
	ltz_imx6_epit_driver.o\
	ltz_imx6_global_timer.o\
	ltz_ccm_driver.o\
	string.o\
	main.o\
	monitor.o\
	ltzvisor_hw.o\
	gic.o\
	cortexA9.o\
	interrupt.o\
	vectors.o\
	mAS_vectors.o\
	m_vectors.o


all : ltzvisor.img

cortexA9.o: cortexA9.s
	$(AS) cortexA9.s -o cortexA9.o

vectors.o: vectors.s
	$(AS) vectors.s -o vectors.o

mAS_vectors.o: m_vectors.s
	$(AS) m_vectors.s -o mAS_vectors.o

monitor.o: monitor.s
	$(AS) monitor.s -o monitor.o

startup.o : startup.S
	$(AS)  startup.S -o startup.o

ltzvisor.img : linker.ld startup.o  $(OBJS)
	$(LD) startup.o $(OBJS) -T linker.ld -o ltzvisor.elf $(LDFLAGS)
	$(OBJDUMP) -D ltzvisor.elf > ltzvisor.asm
	$(OBJCOPY) ltzvisor.elf -O binary ltzvisor.img
	$(MKIMAGE) -n imximage.cfg -T imximage -e 0x17800000 -d ltzvisor.img ltzvisor.imx

clean :
	rm -f *.o *.elf *.asm *.img *.imx
