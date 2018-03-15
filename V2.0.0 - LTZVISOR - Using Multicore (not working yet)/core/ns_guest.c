#include "../inc/types.h"
#include "../inc/printk.h"
#include "../inc/ltzvisor_hw.h"
#include "../inc/ltzvisor_multicore_spinlock.h"
//extern uint32_t myvector_start, myvector_end;
//uint32_t *vectorptr = 0x00907000;
//uint32_t *vectorptr_end = &myvector_end;
#define vectorptr   (*(volatile uint32_t*) 0x00907000 )

extern spinlock_t printk_spinlock;
extern void configure_epit_ns(void);
extern int cpu_get_NS(void);


__attribute__ ((__section__(".ns_guest1")))
void ns_guest1_main(void){
   int i = 0, j = 0;
   //configure_epit_ns();
   while(1){
      ltzvisor_spin_lock(&printk_spinlock, TIMEOUT_FOREVER);
      printk("NS_Guest 1 Running on CORE%d\n",cpu_get_current());
      printk ("CORE%d - Security level: %x\n",cpu_get_current(), cpu_get_NS());
      ltzvisor_spin_unlock(&printk_spinlock);
      for(i = 0; i < 1000000; i++);
   }
}


__attribute__ ((__section__(".ns_guest2")))
void ns_guest2_main(void){
  int i = 0, j = 0;
  while(1){
      printk("NS_Guest 2 Running: %d\n", j++);
      for(i = 0; i < 1000000; i++);

   }
}
