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
void extern ltz_led (bool status);

///////////////////////////////////////////////////////////
int var __attribute__((at(0x00907000)));
int Vector[50];


void SecureLED(int i){
		if ((i%2) == 0){
			printk("Secure OS LED ON\n");
			ltz_led(true);
		}
		else {
				printk("Secure OS LED OFF\n");
				ltz_led(false);
		}

}

void main(void){
	int i = 0, j = 0, k;
	ltzvisor_hw_init();
  printk("ARM TrustZone on i.MX6 Board.\n");
  printk("Registering Monitor.\n");
  printk("Monitor Registered\n");
	//for(k = 0; k < 50; k++)
	//Vector[k] = 50-k;
  start_ns_guest(ns_guest1_main);
	for(i = 0; i < 10; i++){
		printk("++++++++++++++++++++++++++++++++++++++\n");
    printk("    Secure OS Running - Count: %d\n", j++);
		SecureLED(i);
		//printk(":   Secure OS Reading: Vec[%d]: %d\n",j++, Vector[j]);
    printk("    Switching to Non-Secure \n");
		printk("++++++++++++++++++++++++++++++++++++++\n");
    asm volatile("smc #0\n\t");
  }
	ltz_hw_disable();
	printk("**************************************************\n");
	printk("********************Test Done*********************\n");
	printk("**************************************************\n");
	while(1);
	return;
}
