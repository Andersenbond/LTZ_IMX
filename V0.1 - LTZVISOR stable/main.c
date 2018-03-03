#include "inc/interrupt.h"
#include "inc/imx6_uart_driver.h"
#include "inc/printk.h"
#include "inc/ltzvisor_hw.h"

// register the secure monitor vector
extern void init_secure_monitor();
#define __REG(x)        (*((volatile unsigned long *)(x)))

// Central Security Unit
void csu_init(void)
{
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
  printk("Configuring SGI...\n");
  enable_interrupt(3, 0, 0);
  printk("Done with SGI\n");
	while(1){
		printk("Normal OS Running \n");
    printk("Switching to Secure...\n");
    asm volatile("smc #0\n\t");
    //gic_send_sgi(3, 1, kGicSgiFilter_UseTargetList);
	}
}



void main(void){
	ltz_uart_init(115200);
  gic_init();
  arm_set_interrupt_state(true);
  ltzvisor_hw_init();
  csu_init();
  printk("ARM TrustZone on i.MX6 Board.\n");
  printk("Registering Monitor.\n");
  init_secure_monitor(normal_world);
  printk("Monitor Registered\n");

  int i;
  for(i=0; i<10; i++){
    printk("    Secure OS Running - Count: %d\n", i);
    printk("    Switching to Non-Secure \n");
    asm volatile("smc #0\n\t");
  }

	printk("**************************************************\n");
	printk("********************Test Done*********************\n");
	printk("**************************************************\n");
	while(1);
	return;
}
