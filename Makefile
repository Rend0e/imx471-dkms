# Makefile for imx471 out-of-tree build
obj-m += imx471.o
obj-m += ipu-bridge.o
obj-m += intel_skl_int3472_discrete.o

intel_skl_int3472_discrete-y := discrete.o discrete_quirks.o clk_and_regulator.o led.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
    
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
