#ifndef __IMX6_CCM_H__
#define __IMX6_CCM_H__
#include "types.h"
#define REGS_CCM_BASE 			(0x020c4000) // Base address for CCM Control Register

//CCM Serial Clock Divider Register 1
#define HW_CCM_CSCDR1_ADDR      (REGS_CCM_BASE + 0x24) 
//CCM Clock Gating Register 1 
#define HW_CCM_CCGR1_ADDR      	(REGS_CCM_BASE + 0x6c)
//CCM Clock Gating Register 5 
#define HW_CCM_CCGR5_ADDR       (REGS_CCM_BASE + 0x7C)
//CCM Bus Clock Multiplexer Register (RW) 
#define HW_CCM_CBCMR_ADDR       (REGS_CCM_BASE + 0x18)
//CCM Bus Clock Divider Register (RW)
#define HW_CCM_CBCDR_ADDR       (REGS_CCM_BASE + 0x14)


#define HW_CCM_CSCDR1           (*(volatile uint32_t*)HW_CCM_CSCDR1_ADDR)
#define HW_CCM_CCGR1            (*(volatile uint32_t*) HW_CCM_CCGR1_ADDR)
#define HW_CCM_CCGR5            (*(volatile uint32_t*) HW_CCM_CCGR5_ADDR)
#define HW_CCM_CBCMR            (*(volatile uint32_t*) HW_CCM_CBCMR_ADDR)
#define HW_CCM_CBCDR            (*(volatile uint32_t*) HW_CCM_CBCDR_ADDR)

 
#define PRE_PERIPH_CLK_MULT_SEL ((HW_CCM_CBCMR & 0x00600000) >> 21)
/* Values: 
 * - 00 - derive clock from PLL2 main 528MHz clock
 * - 01 - derive clock from 396MHz PLL2 PFD (default)
 * - 10 - derive clock from 352M PFD
 * - 11 - derive clock from 198MHz clock (divided 396MHz PLL2 PFD)
*/
 
//clock source Reference Manual - pag 510
 

//AHB Default value - 132MHZ -> Reference Manual - pag 808
#define AHB_PODF_DIV 			(((HW_CCM_CBCDR & 0x00001c00)>>10)+1) 
//IPG Default value - 66MHZ  -> Reference Manual - pag 808
#define IPG_PODF_DIV 			(((HW_CCM_CBCDR & 0x00000300)>>8)+1)
//PLL2 - System PLL (functional frequency 528 MHz) - pag 810
//Although PLL2 does have a DIV_SELECT register field, it is intended that this PLL will only be run at the default frequency of 528 MHz.
#define CLOCK_SOURCE			(PLL2_CLOCK[PRE_PERIPH_CLK_MULT_SEL])

#define EPIT_MAIN_CLOCK 		(CLOCK_SOURCE / AHB_PODF_DIV / IPG_PODF_DIV)

#endif
