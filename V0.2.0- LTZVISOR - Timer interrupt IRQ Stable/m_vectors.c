#include "inc/types.h"
#include "inc/gic.h"
extern void smc_handler();

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

__attribute__ ((interrupt("IRQ")))
void MON_IRQ_HDLR(int val){
  printk("MON_IRQ handler\n");
  while(1);
}

__attribute__ ((interrupt("FIQ")))
void MON_FIQ_HDLR(int val){
  uint32_t vectNum = gic_read_irq_ack();
  printk("Start FIQ Handler - ID: %d\n",vectNum);

  // Check that INT_ID isn't 1023 or 1022 (spurious interrupt)
  if (vectNum & 0x0200){
      gic_write_end_of_irq(vectNum);  // send end of irq
  }
  else{
      // Signal the end of the irq.
      gic_write_end_of_irq(vectNum);
      printk("Done FIQ Handler\n");
  }
//smc_handler();
}

__attribute__ ((interrupt("UND")))
void MON_UNDEFINED_HDLR(int val){
  printk("MON_UNDEFINED handler\n");
  while(1);
}
