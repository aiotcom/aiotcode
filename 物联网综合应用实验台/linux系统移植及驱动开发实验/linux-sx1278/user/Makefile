KERNELDIR ?=/home/forlinx/linux-4.1.15
PRINT_INC :=$(shell pwd)
all: app_sx1278.out 

app_sx1278.out : app_sx1278.c LORA/LORA.c
	arm-poky-linux-gnueabi-gcc -march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=/opt/fsl-imx-x11/4.1.15-2.1.0/sysroots/cortexa9hf-neon-poky-linux-gnueabi -I $(PRINT_INC) -I$(KERNELDIR) $^ -o $@ 
clean :
	rm app_sx1278.out
