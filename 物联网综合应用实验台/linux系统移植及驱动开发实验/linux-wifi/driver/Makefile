ifeq ($(KERNELRELEASE),)

#KERNELDIR ?= /your/target/source/directory/
KERNELDIR ?=/home/forlinx/linux-4.1.15
ccflags-y += -mfloat-abi=soft
PWD := $(shell pwd)

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD)  modules

modules_install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions *.order *.symvers 

.PHONY: modules modules_install clean

else
    obj-m := esp8266.o
endif

