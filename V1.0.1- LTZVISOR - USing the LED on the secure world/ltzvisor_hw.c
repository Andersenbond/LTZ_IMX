#include "inc/ltzvisor_hw.h"
#include "inc/interrupt.h"
#include "inc/printk.h"
#include "inc/imx6_uart_driver.h"
#include "inc/ltz_imx6_epit_driver.h"
#include "inc/ltz_imx6_global_timer.h"

/**
 * LTZVisor hardware initialization
 *
 * @param
 *
 * @retval Return TRUE if success or False if not
 */

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
for(reg = 0x021C0000; reg < 0x021C00A0; reg = reg + 4){
 	__REG(reg) = 0x00ff00ff;
  if(reg == 26*4)
  __REG(reg) = 0x01330133; // NS -> 0x00ff00ff;

}
 	// for OCRAM secure status setting
 	// start address it 0, it means all internal ram will be use as secure ram
 	__REG(0x020e0028) = 0x00003810;
}



void tick_timer_interrupt_routine(void){
 	 g_wait_for_irq = 0;
 	 printk("Timer ISR Executed\n");
   ltz_epit_get_compare_event(2);
}

void epit_kickoff(void){
   int irq_id = 89;
   printk("EPIT is programmed to generate an interrupt every 2s.\n");
   ltz_epit_init(2,2000000);
   register_interrupt_routine(irq_id, tick_timer_interrupt_routine);
   enable_interrupt(irq_id, 0, 0);
   enable_secure_interrupt(irq_id, 0, 0);
   ltz_epit_enable(2);
}



uint32_t ltzvisor_hw_init(void){

	uint32_t ret = TRUE;

	ltz_uart_init(115200);
	gic_init();
	arm_set_interrupt_state(true);
	csu_init();
	ltz_system_time_init();
	epit_kickoff();

	return ret;
}



uint32_t ltz_hw_disable(void){
  gic_enable(false);
  arm_set_interrupt_state(false);
}
