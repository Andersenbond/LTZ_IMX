#include "../inc/types.h"
#include "../inc/printk.h"

//#define nsguest_main
__attribute__ ((__section__(".ns_guest")))
void nsguest_main(void){
  int i = 0, j = 0;
  while(1){
      printk("NS_Guest Main executing: %d\n", j++);
    //  for(i = 0; i < 1000000; i++);
  }
}
