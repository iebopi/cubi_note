#include <common.h>
#include <asm/io.h>
#include <asm/CUSTOM/led_test.h>


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

