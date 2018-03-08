#include "../inc/types.h"
#include "../inc/printk.h"
#include "../inc/ltzvisor_hw.h"


__attribute__ ((__section__(".ns_guest1")))
void ns_guest1_main(void){
  int i = 0, j = 0;
  while(1){
      printk("NS_Guest 1 Running: %d\n", j++);
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
