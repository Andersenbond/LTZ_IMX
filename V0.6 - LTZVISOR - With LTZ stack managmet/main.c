#include "inc/printk.h"
#include "inc/interrupt.h"
#include "inc/ltzvisor_hw.h"
#include "inc/imx6_uart_driver.h"
#include "inc/ltz_imx6_epit_driver.h"
#include "inc/ltz_imx6_global_timer.h"

// register the secure monitor vector
extern void init_secure_monitor();
#define __REG(x)        (*((volatile unsigned long *)(x)))

static volatile uint8_t g_wait_for_irq;

// Central Security Unit
void csu_init(void){
	unsigned long reg;
	/* For Peripheral access policy, This is may be similar with TZPC function in my opinion
	   it can be decide device secure or non-secure on the AXI-APB bus dynamically
	   now setting all peripheral can be access in non-secure
	   but it will change for secure access restrict, example the internal ram access permit
	*/
	for(reg = 0x021C0000; reg < 0x021C00A0; reg = reg + 4)
		__REG(reg) = 0x00ff00ff;

	// for OCRAM secure status setting
	// start address it 0, it means all internal ram will be use as secure ram
	__REG(0x020e0028) = 0x00003810;
}

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

void tick_timer_interrupt_routine(void){
	g_wait_for_irq = 0;
	printk("Timer ISR Executed\n");
	 ltz_epit_get_compare_event(2);
 }

void epit_kickoff(void){
	  int irq_id = 89;
    printk("EPIT is programmed to generate an interrupt every 5s as a tick timer.\n");
    ltz_epit_init(2,4000000);
    register_interrupt_routine(irq_id, tick_timer_interrupt_routine);
    enable_interrupt(irq_id, 0, 0);
    enable_secure_interrupt(irq_id, 0, 0);
    ltz_epit_enable(2);
		int i, j=0;
}

 ///////////////////////////////////////////////////////////

void main(void){
	int i = 5;
	ltz_uart_init(115200);
  gic_init();
  arm_set_interrupt_state(true);
  csu_init();
  ltz_system_time_init();
 	epit_kickoff();
  printk("ARM TrustZone on i.MX6 Board.\n");
  printk("Registering Monitor.\n");
  init_secure_monitor(normal_world);
  printk("Monitor Registered\n");
	while (1){
		printk("++++++++++++++++++++++++++++++++++++++\n");
    printk("    Secure OS Running - Count: %d\n", i++);
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
