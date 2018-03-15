#include "inc/printk.h"
#include "inc/interrupt.h"
#include "inc/ltzvisor_hw.h"
#include "inc/imx6_uart_driver.h"
#include "inc/ltz_imx6_epit_driver.h"
#include "inc/ltz_imx6_global_timer.h"
#include "inc/ltzvisor_hw.h"
#include "inc/ltzvisor_multicore_spinlock.h"

///////////////////////////////////////////////////////////
extern void start_ns_guest();
void extern ns_guest1_main();
void extern ns_guest2_main();
 int extern cpu_get_NS();
void extern ltz_led (bool status);

///////////////////////////////////////////////////////////
int var __attribute__((at(0x00907000)));
int Vector[50];

 spinlock_t printk_spinlock;

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
	ltzvisor_hw_init();
  printk("ARM TrustZone on i.MX6 Board.\n");
  printk("Registering NS Guest.\n");
	ltzvisor_spin_init(&printk_spinlock);
	ltzvisor_start_ns_guest_multicore(ns_guest1_main, 1);
	//ltzvisor_start_ns_guest_multicore(ns_guest1_main, 2);
//	ltzvisor_start_ns_guest_multicore(ns_guest1_main, 3);

	//while(1){
  /*  ltzvisor_spin_lock(&printk_spinlock, TIMEOUT_FOREVER);
    printk("Secure Guest Running CORE%d\n",cpu_get_current());
    ltzvisor_spin_unlock(&printk_spinlock);
    asm volatile("DSB\n\t");
  	asm volatile("ISB\n\t");
    asm volatile("WFI\n\t");*/
  //};

	while(1){
    ltzvisor_spin_lock(&printk_spinlock, TIMEOUT_FOREVER);
//    secure_scu_uart(true);
//    printk ("CORE%d - Security level: %x\n",cpu_get_current(), cpu_get_NS());
    ltzvisor_spin_unlock(&printk_spinlock);
    while(1);
		printk("++++++++++++++++++++++++++++++++++++++\n");
    printk("     Secure OS Running - Count: %d\n", i++);
		SecureLED(i);
    printk("    Switching to Non-Secure \n");
		printk("++++++++++++++++++++++++++++++++++++++\n");
		for (k = 0 ; k < 10000000; k++);

    ltzvisor_spin_lock(&printk_spinlock, TIMEOUT_FOREVER);
  //  secure_scu_uart(false);
    ltzvisor_spin_unlock(&printk_spinlock);

    asm volatile("DSB\n\t");
    asm volatile("ISB\n\t");
    asm volatile("WFI\n\t");

  }
	ltzvisor_hw_disable();
	printk("**************************************************\n");
	printk("********************Test Done*********************\n");
	printk("**************************************************\n");
	while(1);
	return;
}
