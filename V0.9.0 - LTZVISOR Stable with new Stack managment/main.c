#include "inc/printk.h"
#include "inc/interrupt.h"
#include "inc/ltzvisor_hw.h"
#include "inc/imx6_uart_driver.h"
#include "inc/ltz_imx6_epit_driver.h"
#include "inc/ltz_imx6_global_timer.h"
#include "inc/ltzvisor_hw.h"
// register the secure monitor vector
extern void init_secure_monitor();

// code in TrustZone Normal World
void normal_world(){
	int i = 0, j=0;
  printk("Configuring EPIT...\n");
	printk("Done with EPIT\n");
	while(1){
			printk("Normal OS Running: %x \n",j++);
			for(i = 0; i < 1500000; i++);
	}
}


///////////////////////////////////////////////////////////
void extern nsguest_main(void);

 ///////////////////////////////////////////////////////////

void main(void){
	int i = 5;
	ltzvisor_hw_init();
  printk("ARM TrustZone on i.MX6 Board.\n");
  printk("Registering Monitor.\n");
  init_secure_monitor(nsguest_main);
  printk("Monitor Registered\n");

	while (1){
		printk("++++++++++++++++++++++++++++++++++++++\n");
    printk("    Secure OS Running - Count: %d\n", i++);
    printk("    Switching to Non-Secure \n");
		printk("++++++++++++++++++++++++++++++++++++++\n");
		//while(1);
    asm volatile("smc #0\n\t");
  }

	printk("**************************************************\n");
	printk("********************Test Done*********************\n");
	printk("**************************************************\n");
	while(1);
	return;
}
