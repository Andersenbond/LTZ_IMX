 
#include "inc/imx6_uart_driver.h"
#include "inc/printk.h"
#include "config.h"

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
void normal_world()
{
	while(1)
	{
		printk("Begin Normal ... \n");
		// transit to Secure Monitor (Dst: Secure World)
		asm volatile("smc #0\n\t");
		printk("... end Normal\n");
		asm volatile("smc #0\n\t");
	}
}

void main(void){
 
	ltz_uart_init(115200);
	csu_init();

	printk("Test ARM TrustZone on i.MX53 Quick Start Board.\n");

	// register the TrustZone secure monitor vector
	printk("Register the TrustZone Secure Monitor Vector.\n");
	init_secure_monitor(normal_world);
	printk("Secure Monitor Vector Registration Successfully!\n");

	int i;
	for(i=0; i<10; i++)
	{
		printk("Start Secure ---- %d\n", i);
		// transit to Secure Monitor (Dst: Normal World)
		asm volatile("smc #0\n\t");
		printk(" --- end Secure%d\n", i);
		asm volatile("smc #0\n\t");
	};
	printk("**************************************************\n");
	printk("********************Test Done*********************\n");
	printk("**************************************************\n");
	while(1);
	return;
}
