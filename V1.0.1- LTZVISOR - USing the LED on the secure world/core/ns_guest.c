#include "../inc/types.h"
#include "../inc/printk.h"
#include "../inc/ltzvisor_hw.h"

//extern uint32_t myvector_start, myvector_end;
//uint32_t *vectorptr = 0x00907000;
//uint32_t *vectorptr_end = &myvector_end;
#define vectorptr   (*(volatile uint32_t*) 0x00907000 )

__attribute__ ((__section__(".ns_guest1")))
void ns_guest1_main(void){
  int i = 0, j = 0;
  while(1){
      //while(j < 50){
      //    vectorptr *=2;
        //  printk("NS_Guest 1 Running: Vec\n",j++);
          printk("NS_Guest 1 Running: %d\n",j++);
          for(i = 0; i < 1000000; i++);
        //  vectorptr++;
      
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
