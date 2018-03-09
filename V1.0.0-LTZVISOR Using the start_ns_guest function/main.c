#include "inc/printk.h"
#include "inc/interrupt.h"
#include "inc/ltzvisor_hw.h"
#include "inc/imx6_uart_driver.h"
#include "inc/ltz_imx6_epit_driver.h"
#include "inc/ltz_imx6_global_timer.h"
#include "inc/ltzvisor_hw.h"

///////////////////////////////////////////////////////////
extern void start_ns_guest();
void extern ns_guest1_main();
void extern ns_guest2_main();
///////////////////////////////////////////////////////////

void main(void){
	int i = 0, j = 0;
	ltzvisor_hw_init();
  printk("ARM TrustZone on i.MX6 Board.\n");
  printk("Registering Monitor.\n");
  printk("Monitor Registered\n");
  start_ns_guest(ns_guest1_main);
	for(i = 0; i < 10; i++){
		printk("++++++++++++++++++++++++++++++++++++++\n");
    printk("    Secure OS Running - Count: %d\n", j++);
    printk("    Switching to Non-Secure \n");
		printk("++++++++++++++++++++++++++++++++++++++\n");
    asm volatile("smc #0\n\t");
  }
	
	printk("**************************************************\n");
	printk("********************Test Done*********************\n");
	printk("**************************************************\n");
	while(1);
	return;
}
