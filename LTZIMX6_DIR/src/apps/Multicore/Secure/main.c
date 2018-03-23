
#include <ltzvisor_hw.h>
#include <ltzvisor_multicore_spinlock.h>
#include <ltz_led.h>
///////////////////////////////////////////////////////////
 int extern cpu_get_NS();
void extern ltz_led (bool status);
///////////////////////////////////////////////////////////



void SecureLED(int i){
		if ((i%2) == 0){
			printk("  -> Secure OS LED ON\n");
			ltz_led(true);
		}
		else {
				printk("  -> Secure OS LED OFF\n");
				ltz_led(false);
		}

}


void main(void){
	int i = 0, j = 0, k;
  printk("ARM TrustZone on i.MX6 Board.\n");
  printk("Registering NS Guest.\n");
  printk("Var addr: %x", &DONE_START_NS);
  ltzvisor_hw_init();
  DONE_START_NS = 0;
  //NS_START_DONE  = 0x0;
 	ltzvisor_wake_core(1);
	//ltzvisor_start_ns_guest_multicore(ns_guest1_main, 2);
  //ltzvisor_start_ns_guest_multicore(ns_guest1_main, 3);

	while(1);


	while(1){
		printk("++++++++++++++++++++++++++++++++++++++\n");
    		printk("     Secure OS Running - Count: %d\n", i++);
		SecureLED(i);
    		printk("    Switching to Non-Secure \n");
		printk("++++++++++++++++++++++++++++++++++++++\n");
		for (k = 0 ; k < 10000000; k++);

  	}
	ltzvisor_hw_disable();
	printk("**************************************************\n");
	printk("********************Test Done*********************\n");
	printk("**************************************************\n");
	while(1);
	return;
}
