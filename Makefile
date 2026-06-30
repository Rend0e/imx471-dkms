# Makefile for imx471 out-of-tree build
KERNELRELEASE ?= $(shell uname -r)
KVER := $(shell echo "$(KERNELRELEASE)" | cut -d '.' -f1-2 )

obj-m += imx471.o
obj-m += ipu-bridge.o
obj-m += intel_skl_int3472_discrete.o

intel_skl_int3472_discrete-y := \
	$(KVER)/discrete.o \
	$(KVER)/discrete_quirks.o \
	$(KVER)/clk_and_regulator.o \
	$(KVER)/led.o

all:
	$(MAKE) -C /lib/modules/$(KERNELRELEASE)/build M=$(CURDIR) modules
    
clean:
	$(MAKE) -C /lib/modules/$(KERNELRELEASE)/build M=$(CURDIR) clean
