KERNELDIR ?=/home/forlinx/linux-4.1.15
all: app_sht20.out 

app_sht20.out : app_sht20.c
	arm-poky-linux-gnueabi-gcc -march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=/opt/fsl-imx-x11/4.1.15-2.1.0/sysroots/cortexa9hf-neon-poky-linux-gnueabi -I$(KERNELDIR) $^ -o $@ 
clean :
	rm app_sht20.out
