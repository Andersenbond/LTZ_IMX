#include "../inc/types.h"
#include "../inc/printk.h"
#include "../inc/ltzvisor_hw.h"
#include "../inc/ltzvisor_multicore_spinlock.h"



extern spinlock_t printk_spinlock;
extern void configure_epit_ns(void);
extern void scr_set_ns_bit(void);

#define ddr3_write_s_ptr  (*(volatile uint32_t*) 0x10000000)
#define ddr3_write_ns_ptr (*(volatile uint32_t*) 0x12000000)

__attribute__ ((__section__(".ns_guest1")))
void ns_guest1_main(void){
   int i = 0, j = 0;
    while(1){
      ltzvisor_spin_lock(&printk_spinlock, TIMEOUT_FOREVER);
      //ddr3_write_s_ptr  = 0xABC;
      //ddr3_write_ns_ptr = 0xABC;
      //printk("DDR WRITE SECURE: %x\n",ddr3_write_s_ptr);
      //printk("DDR WRITE N-SECURE: %x\n",ddr3_write_ns_ptr);
       printk("NS_Guest 1 Running on CORE%d\n",cpu_get_current());
       ltzvisor_spin_unlock(&printk_spinlock);
      for(i = 0; i < 1000000; i++);
   }
}


__attribute__ ((__section__(".ns_guest2")))
void ns_guest2_main(void){
  int i = 0, j = 0;
  while(1){
     ltzvisor_spin_lock(&printk_spinlock, TIMEOUT_FOREVER);
      printk("NS_Guest 2 Running: %d\n", j++);
      for(i = 0; i < 1000000; i++);
      ltzvisor_spin_unlock(&printk_spinlock);


   }
}
