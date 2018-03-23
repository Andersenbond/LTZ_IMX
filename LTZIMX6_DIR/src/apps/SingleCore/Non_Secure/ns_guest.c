#include <types.h>
#include <printk.h>
#include <ltzvisor_hw.h>



//#define nse_addr_ptr (*(volatile uint32_t*) 0x10000600)
//#define sec_addr_ptr (*(volatile uint32_t*) 0x19900000)
//  printk(":  NS_GUEST reading Secure   OCRAM: %d:\n",sec_addr_ptr);
//  printk(":  NS_GUEST reading N_Secure OCRAM: %d:\n",nse_addr_ptr);


__attribute__ ((__section__(".ns_guest1")))
void ns_guest1_main(void){
  int i = 0, j = 0;
  while(1){
          printk("NS_Guest 1 Running: %d\n",j++);
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
