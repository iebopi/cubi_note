cmd_arch/arm/boot/dts/sun7i-a20-cubieboard2.dtb := mkdir -p arch/arm/boot/dts/ ; /home/hui/Ceiv_linux/buildroot-2017.02.3/output/host/usr/bin/arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/.sun7i-a20-cubieboard2.dtb.d.pre.tmp -nostdinc -I./arch/arm/boot/dts -I./arch/arm/boot/dts/include -I./drivers/of/testcase-data -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.sun7i-a20-cubieboard2.dtb.dts.tmp arch/arm/boot/dts/sun7i-a20-cubieboard2.dts ; ./scripts/dtc/dtc -O dtb -o arch/arm/boot/dts/sun7i-a20-cubieboard2.dtb -b 0 -i arch/arm/boot/dts/  -d arch/arm/boot/dts/.sun7i-a20-cubieboard2.dtb.d.dtc.tmp arch/arm/boot/dts/.sun7i-a20-cubieboard2.dtb.dts.tmp ; cat arch/arm/boot/dts/.sun7i-a20-cubieboard2.dtb.d.pre.tmp arch/arm/boot/dts/.sun7i-a20-cubieboard2.dtb.d.dtc.tmp > arch/arm/boot/dts/.sun7i-a20-cubieboard2.dtb.d

source_arch/arm/boot/dts/sun7i-a20-cubieboard2.dtb := arch/arm/boot/dts/sun7i-a20-cubieboard2.dts

deps_arch/arm/boot/dts/sun7i-a20-cubieboard2.dtb := \
  arch/arm/boot/dts/sun7i-a20-cubieboard2_tmp.dts \
  arch/arm/boot/dts/sun7i-a20.dtsi \
  arch/arm/boot/dts/skeleton.dtsi \
  arch/arm/boot/dts/include/dt-bindings/interrupt-controller/arm-gic.h \
  arch/arm/boot/dts/include/dt-bindings/interrupt-controller/irq.h \
  arch/arm/boot/dts/include/dt-bindings/thermal/thermal.h \
  arch/arm/boot/dts/include/dt-bindings/clock/sun4i-a10-pll2.h \
  arch/arm/boot/dts/include/dt-bindings/dma/sun4i-a10.h \
  arch/arm/boot/dts/include/dt-bindings/pinctrl/sun4i-a10.h \
  arch/arm/boot/dts/sunxi-common-regulators.dtsi \
  arch/arm/boot/dts/include/dt-bindings/gpio/gpio.h \
  arch/arm/boot/dts/axp209.dtsi \

arch/arm/boot/dts/sun7i-a20-cubieboard2.dtb: $(deps_arch/arm/boot/dts/sun7i-a20-cubieboard2.dtb)

$(deps_arch/arm/boot/dts/sun7i-a20-cubieboard2.dtb):
