#include "inc/ltzvisor_hw.h"
#include "inc/interrupt.h"

/**
 * LTZVisor hardware initialization
 *
 * @param  
 *
 * @retval Return TRUE if success or False if not
 */
uint32_t ltzvisor_hw_init(void){
	
	uint32_t ret = TRUE;
 
	uint32_t irq_id =3 , cpu_id = 0, priority = 0;
	//!< Software interrupt 3.
	enable_interrupt(irq_id,cpu_id,priority);
	enable_secure_interrupt(irq_id, cpu_id, priority);

	return ret;
}

