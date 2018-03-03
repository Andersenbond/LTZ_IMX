#include "inc/types.h"
#include "inc/gic.h"
#include "inc/interrupt.h"


extern void monitor_fiq_handler();
irq_hdlr_t g_interrupt_handlers[IMX_INTERRUPT_COUNT];
volatile uint32_t g_vectNum[4];

__attribute__ ((interrupt("ABT")))
void MON_ABT_HDLR(int val){
 printk("MON_ABT handler %x\n",val );
   while(1);
}

__attribute__ ((interrupt("PREF")))
void MON_PREFECH_HDLR(int val){
  printk("MON_PREFETCH handler\n");
  while(1);
}

__attribute__ ((interrupt("SMC")))
void MON_SMC_HDLR(int val){
  printk("SMC handler\n");
  while(1);
}

__attribute__ ((interrupt("RESV")))
void MON_RESERVED_HDLR(int val){
  printk("MON_RESERVED handler\n");
  while(1);
}

//! @brief Handles IRQ exceptions.
__attribute__ ((interrupt("IRQ")))
void MON_FIQ_HDLR(void){
    uint32_t vectNum = gic_read_irq_ack();
    printk("MON FIQ handler: ID: %d\n",vectNum);
    if (vectNum & 0x0200){
        gic_write_end_of_irq(vectNum);  // send end of irq
    }else{
        unsigned cpu = (vectNum >> 10) & 0x7;
        unsigned irq = vectNum & 0x1FF;
        g_vectNum[cpu] = irq;
        irq_hdlr_t isr = g_interrupt_handlers[irq];
        if (isr){
            isr();
        }else{
            default_interrupt_routine();
        }
        g_vectNum[cpu] = 0;
        gic_write_end_of_irq(vectNum);
        im_here();
        //asm volatile("smc #1\n\t");
      //  monitor_fiq_handler();
    }
}




//! @brief Handles IRQ exceptions.
__attribute__ ((interrupt("IRQ")))
void MON_IRQ_HDLR(void){
    // vectNum = RESERVED[31:13] | CPUID[12:10] | INTERRUPT_ID[9:0]
    // send ack and get ID source
    uint32_t vectNum = gic_read_irq_ack();
    printk("IRQ handler: ID: %d\n",vectNum);

    // Check that INT_ID isn't 1023 or 1022 (spurious interrupt)
    if (vectNum & 0x0200)
    {
        gic_write_end_of_irq(vectNum);  // send end of irq
    }
    else
    {
        // copy the local value to the global image of CPUID
        unsigned cpu = (vectNum >> 10) & 0x7;
        unsigned irq = vectNum & 0x1FF;

        // Store the current interrupt number.
        g_vectNum[cpu] = irq;

        // Call the service routine stored in the handlers array. If there isn't
        // one for this IRQ, then call the default handler.
        irq_hdlr_t isr = g_interrupt_handlers[irq];
        if (isr)
        {
            isr();
        }
        else
        {
            default_interrupt_routine();
        }

        // Clear current interrupt number.
        g_vectNum[cpu] = 0;

        // Signal the end of the irq.
        gic_write_end_of_irq(vectNum);
    }
}





__attribute__ ((interrupt("FIQ")))
void MON_FIQ2_HDLR(int val){
  uint32_t vectNum = gic_read_irq_ack();
  printk("Start FIQ Handler - ID: %d\n",vectNum);

  // Check that INT_ID isn't 1023 or 1022 (spurious interrupt)
  if (vectNum & 0x0200){
      gic_write_end_of_irq(vectNum);  // send end of irq
      Print_CPUInterface();
  }
  else{
      // Signal the end of the irq.
      Print_CPUInterface();
      gic_write_end_of_irq(vectNum);
      Print_CPUInterface();
      printk("Done FIQ Handler\n");
       //while(1);
  }
//smc_handler();
}

__attribute__ ((interrupt("UND")))
void MON_UNDEFINED_HDLR(int val){
  printk("MON_UNDEFINED handler\n");
  while(1);
}


void im_here(void){
  static i = 0;
  printk("CODE HERE: %d\n", i++);
}

void show_regs(int r0, int r1, int r2, int r3, int r4, int r5){
  printk("---------------------------------------------------\n");
  printk("Registers: r0: %x | r1: %x | r2: %x | r3: %x | r4: %x | r5: %x\n ", r0, r1, r2, r3, r4, r5);
  printk("---------------------------------------------------\n");

}
