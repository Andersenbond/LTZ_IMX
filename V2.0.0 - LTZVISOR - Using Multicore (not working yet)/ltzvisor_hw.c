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


void secure_scu_uart(bool IsSecure){
   if(IsSecure){
      __REG(0x021C0054) = 0x01330133;// 0x00330033;
   }
   else{
      __REG(0x021C0054) = 0x00ff00ff;
   }
}


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
 	      __REG(reg) = 0x01220122 ;//0x01330133;//0x00ff00ff;
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
   //enable_interrupt(irq_id, 0, 0);
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


uint32_t ltzvisor_hw_disable(void){
  gic_enable(false);
  arm_set_interrupt_state(false);
}



ltzvisor_start_ns_guest_multicore(void* func, int core){
    int i = 0;
    if (core > 3 || core < 1){
      printk("ERROR: Starting Secondary Core \n");
      return;
    }
  //for(i = 0; i<90000;i++);
  switch (core){
      case 1:{
         HW_SRC_GPR3 = ((uint32_t)& _start_secondary);
         HW_SRC_GPR4 = ((uint32_t) func);
         HW_SRC_SCR |= SRC_CORE1_ENABLE;
         break;
     }
     case 2:{
         HW_SRC_GPR5 = ((uint32_t) & _start_secondary);
         HW_SRC_GPR6 = ((uint32_t) func);

         HW_SRC_SCR |= SRC_CORE2_ENABLE;
         break;
     }
     case 3:{
         HW_SRC_GPR7 = ((uint32_t) & _start_secondary);
         HW_SRC_GPR8 = ((uint32_t) func);
         HW_SRC_SCR |= SRC_CORE3_ENABLE;
         break;
    }
  }
}

ltzvisor_stop_ns_guest_multicore(int core){
  if (core > 3 || core < 1){
    printk("ERROR: Stoping Secondary Core \n");
    return;
  }
  switch (core){
    case 1:{
       HW_SRC_SCR &= (~SRC_CORE1_ENABLE);
       break;
   }
   case 2:{
       HW_SRC_SCR &= (~SRC_CORE2_ENABLE);
       break;
   }
   case 3:{
       HW_SRC_SCR &= (~SRC_CORE3_ENABLE);
       break;
  }
}


}
