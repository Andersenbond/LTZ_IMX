#include <printk.h>
#include <interrupt.h>
#include <ltzvisor_hw.h>
#include <imx6_uart_driver.h>
#include <ltz_imx6_epit_driver.h>
#include <ltz_imx6_global_timer.h>
#include <ltzvisor_hw.h>
#include <ltz_led.h>

///////////////////////////////////////////////////////////
extern void start_ns_guest();
void extern ns_guest1_main();
void extern ns_guest2_main();

///////////////////////////////////////////////////////////

#define YIELD(){ \
	asm volatile("ldr r0, =0x0");\
	asm volatile("smc #0");\
}
//////////////////////////////////////////////////////////

/*
#define _nse_addr_ptr (*(volatile uint32_t*) 0x10000600)
#define _sec_addr_ptr (*(volatile uint32_t*) 0x19900000)
_nse_addr_ptr = 5;
_sec_addr_ptr = 4;
_nse_addr_ptr *=2;
_sec_addr_ptr *=2;

printk(":   Secure OS Writing Secure   OCRAM: %d:\n",_sec_addr_ptr);
printk(":   Secure OS Writing N-Secure OCRAM: %d:\n",_nse_addr_ptr);
*/


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
	int i = 0, j = 0;
  printk("LTZVISOR - ARM TrustZone on i.MX6 Board.\n");

	start_ns_guest(ns_guest1_main);
	for(i = 0; i < 10; i++){

		printk("++++++++++++++++++++++++++++++++++++++\n");
    printk("    Secure OS Running - Count: %d\n", j++);
		SecureLED(i);
    printk("    Switching to Non-Secure \n");
		printk("++++++++++++++++++++++++++++++++++++++\n");
		YIELD();
  }


	ltz_hw_disable();
	printk("**************************************************\n");
	printk("********************Test Done*********************\n");
	printk("**************************************************\n");
	while(1);
	return;
}
