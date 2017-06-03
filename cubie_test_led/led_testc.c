#include <common.h>
#include <asm/io.h>
#include <asm/arch/clock.h>
#include <asm/arch/dram.h>
#include <asm/arch/timer.h>
#include <asm/arch/sys_proto.h>

#define SUNXI_PIO_BASE          0x01C20800
#define PH_CFG2			(SUNXI_PIO_BASE + 0x28)
#define PH_DAT			(SUNXI_PIO_BASE + 0x34)

#define readl(addr)             (*(unsigned long *)addr)
#define writel(b,addr)          (*(unsigned long *)addr = b)

/* set two LEDs oFF */
void set_led0_off(void)
{
    unsigned int tmp;
    
    /* PB10 and PB11 output 1 */
    tmp = readl(PH_DAT);
    tmp |= (0x1 << 10);
    writel(tmp, PH_DAT);
}

void set_led1_off(void)
{
    unsigned int tmp;
    
    /* PB10 and PB11 output 1 */
    tmp = readl(PH_DAT);
    tmp |= (0x1 << 11);
    writel(tmp, PH_DAT);
}

/* set two LEDs oN */
void set_led0_on(void)
{
    unsigned int tmp;

    /* PB10 and PB11 output 0 */
    tmp = readl(PH_DAT);
    tmp &= ~(0x1 << 10);
    writel(tmp, PH_DAT);
}

void set_led1_on(void)
{
    unsigned int tmp;

    /* PB10 and PB11 output 0 */
    tmp = readl(PH_DAT);
    tmp &= ~(0x1 << 11);
    writel(tmp, PH_DAT);
}

/* init PIO */
void led_init(void)
{
    unsigned int tmp;
    
    /* set PB10 and PB11 output */
    tmp = readl(PH_CFG2);
    tmp &= ~(0x7 << 8);
    tmp &= ~(0x7 << 12);
    tmp |= (0x1 << 8);
    tmp |= (0x1 << 12);
    writel(tmp, PH_CFG2);
    /* set PH20 and PH21 output 0 */
    tmp = readl(PH_DAT);
    tmp &= ~(0x1 << 10);
    tmp &= ~(0x1 << 11);
    writel(tmp, PH_DAT);
}

