#define SUNXI_PIO_BASE          0x01C20800
#define PH_CFG2			(SUNXI_PIO_BASE + 0x28)
#define PH_DAT			(SUNXI_PIO_BASE + 0x34)

#define readl(addr)             (*(unsigned long *)addr)
#define writel(b,addr)          (*(unsigned long *)addr = b)


void set_led0_on(void);

void set_led1_on(void);

void set_led0_off(void);

void set_led0_off(void);

