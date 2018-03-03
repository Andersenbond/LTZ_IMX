

__attribute__ ((interrupt("ABT")))
void MON_ABT_HDLR(int val){
 printk("MON_ABT handler\n");
   while(1);
}

__attribute__ ((interrupt("PREF")))
void MON_PREFECH_HDLR(int val){
  printk("MON_PREFETCH handler\n");
  while(1);
}

__attribute__ ((interrupt("SMC")))
void MON_SMC_HDLR(int val){
  printk("SMO handler\n");
  while(1);
}

__attribute__ ((interrupt("RESV")))
void MON_RESERVED_HDLR(int val){
  printk("MON_RESERVED handler\n");
  while(1);
}

__attribute__ ((interrupt("IRQ")))
void MON_IRQ_HDLR(int val){
  printk("MON_IRQ handler\n");
  while(1);
}

__attribute__ ((interrupt("FIQ")))
void MON_FIQ_HDLR(int val){
  printk("MON_FIQ handler\n");
  while(1);
}

__attribute__ ((interrupt("FIQ")))
void MON_UNDEFINED_HDLR(int val){
  printk("MON_UNDEFINED handler\n");
  while(1);
}
