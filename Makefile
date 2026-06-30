# Makefile for imx471 out-of-tree build
obj-m += imx471.o
obj-m += ipu-bridge.o

obj-$(CONFIG_INTEL_SKL_INT3472) += intel_skl_int3472_discrete.o intel_skl_int3472_tps68470.o intel_skl_int3472_common.o
intel_skl_int3472_discrete-y := discrete.o discrete_quirks.o clk_and_regulator.o led.o
intel_skl_int3472_tps68470-y := tps68470.o tps68470_board_data.o
intel_skl_int3472_common-y += common.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
    
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
