#include "inc/gic.h"
#include "inc/cortex_a9.h"

////////////////////////////////////////////////////////////////////////////////
// Prototypes
////////////////////////////////////////////////////////////////////////////////

static inline gicd_t * gic_get_gicd(void);
static inline gicc_t * gic_get_gicc(void);
static inline uint32_t irq_get_register_offset(uint32_t irqID);
static inline uint32_t irq_get_bit_offset(uint32_t irqID);
static inline uint32_t irq_get_bit_mask(uint32_t irqID);

////////////////////////////////////////////////////////////////////////////////
// Code
////////////////////////////////////////////////////////////////////////////////

static inline gicd_t * gic_get_gicd(void){
    uint32_t base = get_arm_private_peripheral_base() + GIC_Distributor_Offset;
    return (gicd_t *)base;
}

static inline gicc_t * gic_get_gicc(void){
    uint32_t base = get_arm_private_peripheral_base() + GIC_CPUInterfalce_Offset;
    return (gicc_t *)base;
}

static inline uint32_t irq_get_register_offset(uint32_t irqID){
    return irqID / 32;
}

static inline uint32_t irq_get_bit_offset(uint32_t irqID){
    return irqID & 0x1f;
}

static inline uint32_t irq_get_bit_mask(uint32_t irqID){
    return 1 << irq_get_bit_offset(irqID);
}

void gic_enable(bool enableIt){
    gicd_t * gicd = gic_get_gicd();

    if (enableIt){
        // Enable both secure and non-secure.
        gicd->CTLR |= kBM_GICD_CTLR_EnableGrp0 |kBM_GICD_CTLR_EnableGrp1;
    }
    else{
        // Clear the enable bits.
        gicd->CTLR &= ~(kBM_GICD_CTLR_EnableGrp0 | kBM_GICD_CTLR_EnableGrp1);
    }
}

void gic_set_irq_security(uint32_t irqID, bool isSecure){
    gicd_t * gicd = gic_get_gicd();

    uint32_t reg = irq_get_register_offset(irqID);
    uint32_t mask = irq_get_bit_mask(irqID);

    uint32_t value = gicd->IGROUPRn[reg];
    if (!isSecure){
        value &= ~mask;
    }
    else{
        value |= mask;
    }
    gicd->IGROUPRn[reg] = value;
}

void gic_enable_irq(uint32_t irqID, bool isEnabled){
    gicd_t * gicd = gic_get_gicd();

    uint32_t reg = irq_get_register_offset(irqID);
    uint32_t mask = irq_get_bit_mask(irqID);

    // Select set-enable or clear-enable register based on enable flag.
    if (isEnabled){
        gicd->ISENABLERn[reg] = mask;
    }
    else{
        gicd->ICENABLERn[reg] = mask;
    }
}

void gic_set_irq_priority(uint32_t ID, uint32_t priority){
    gicd_t * gicd = gic_get_gicd();

    // Update the priority register. The priority registers are byte accessible, and the register
    // struct has the priority registers as a byte array, so we can just index directly by the
    // interrupt ID.
    gicd->IPRIORITYRn[ID] = priority & 0xff;
}

void gic_set_cpu_target(uint32_t irqID, unsigned cpuNumber, bool enableIt)
{
    // Make sure the CPU number is valid.
    //assert(cpuNumber <= 7);

    gicd_t * gicd = gic_get_gicd();
    uint8_t cpuMask = 1 << cpuNumber;

    // Like the priority registers, the target registers are byte accessible, and the register
    // struct has the them as a byte array, so we can just index directly by the
    // interrupt ID.
    if (enableIt){
        gicd->ITARGETSRn[irqID] |= (cpuMask & 0xff);
    }
    else{
        gicd->ITARGETSRn[irqID] &= ~(cpuMask & 0xff);
    }
}

void gic_send_sgi(uint32_t irqID, uint32_t target_list, uint32_t filter_list){
    gicd_t * gicd = gic_get_gicd();

    gicd->SGIR = (filter_list << kBP_GICD_SGIR_TargetListFilter)
                    | (target_list << kBP_GICD_SGIR_CPUTargetList)
                    | (irqID & 0xf);
}

void gic_cpu_enable(bool enableIt)
{
    gicc_t * gicc = gic_get_gicc();

    if (enableIt){
        gicc->CTLR |= kBM_GICC_CTLR_EnableS | kBM_GICC_CTLR_EnableNS | kBM_GICC_CTLR_FIQEn ;
    }
    else{
        gicc->CTLR &= ~(kBM_GICC_CTLR_EnableS | kBM_GICC_CTLR_EnableNS | kBM_GICC_CTLR_FIQEn );
    }
}

void gic_set_cpu_priority_mask(uint32_t priority){
    gicc_t * gicc = gic_get_gicc();
    gicc->PMR = priority & 0xff;
}

uint32_t gic_read_irq_ack(void){
    gicc_t * gicc = gic_get_gicc();
    return gicc->IAR;
}

void gic_write_end_of_irq(uint32_t irqID){
    gicc_t * gicc = gic_get_gicc();
    gicc->EOIR = irqID;
}

void gic_init(void){
    gicd_t * gicd = gic_get_gicd();

    // First disable the distributor.
    gic_enable(false);

    // Clear all pending interrupts.
    int i;
    for (i = 0; i < 32; ++i){
        gicd->ICPENDRn[i] = 0xffffffff;
    }

    // Set all interrupts to non-secure.
    for (i = 0; i < 8; ++i){
        gicd->IGROUPRn[i] = 0xffffffff;
    }

    // Init the GIC CPU interface.
    gic_init_cpu();

    // Now enable the distributor.
    gic_enable(true);
}

void gic_init_cpu(void){
    // Init the GIC CPU interface.
    gic_set_cpu_priority_mask(0xff);

    // Disable preemption.
    gicc_t * gicc = gic_get_gicc();
    gicc->BPR = 7;

    // Enable signaling the CPU.
    gic_cpu_enable(true);
}

void Print_CPUInterface(void){
    gicc_t * gicc = gic_get_gicc();
    printk("CPU Interface Registers\n");
    printk("-----------------------------------------------------------\n");
    printk("CPU Interface Control Register: %x\n", gicc->CTLR);
    printk("Interrupt Priority Mask Register: %x\n", gicc->PMR);
    printk("Binary Point Register: %x\n", gicc->BPR);
    printk("End of Interrupt Register: %x\n", gicc->IAR);
    printk("Running Priority Register: %x\n", gicc->RPR);
    printk("Highest Priority Pending Interrupt Register: %x\n", gicc->HPPIR);
    printk("Aliased Binary Point Register: %x\n", gicc->ABPR);
    printk("CPU Interface Identification Register: %x\n", gicc->IIDR);
    printk("-----------------------------------------------------------\n");
}

void Print_Distributor(void){
  int i = 0;
    gicd_t * gicd = gic_get_gicd();
    printk("CPU Interface Registers\n");
    printk("-----------------------------------------------------------\n");
    printk("Distributor Control Register: %x\n", gicd->CTLR);
    printk("Interrupt Controller Type Register: %x\n", gicd->TYPER);
    printk("Distributor Implementer Identification Register: %x\n", gicd->IIDR);
    for(i = 0; i < 8; i++)
      printk("Interrupt Group Registers: %d ->  %x \n",i, gicd->IGROUPRn[i]);
    for ( i = 0; i < 32; i++){
      printk("Interrupt Set-Enable Registers: %d-> %x\n",i, gicd->ISENABLERn[i]);
      printk("Interrupt Clear-Enable Registers:%d-> %x\n", i,gicd->ICENABLERn[i]);
      printk("Interrupt Set-Pending Registers:%d-> %x\n",i, gicd->ISPENDRn[i]);
      printk("Interrupt Clear-Pending Registers:%d-> %x\n", i, gicd->ICPENDRn[i]);
    }
    printk("Active Bits Registers: %x\n", gicd->ICDABRn[i]);
    printk("ULTIMO: %x\n", gicd->SGIR);
}




////////////////////////////////////////////////////////////////////////////////
// EOF
////////////////////////////////////////////////////////////////////////////////
