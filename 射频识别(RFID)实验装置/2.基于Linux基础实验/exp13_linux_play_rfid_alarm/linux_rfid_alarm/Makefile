KERNELDIR ?=/home/forlinx/linux-4.1.15
PRINT_INC :=$(shell pwd)

all: linux_rfid_alarm.out

linux_rfid_alarm.out : linux_rfid_alarm.c	RS485/RS485.c
	arm-poky-linux-gnueabi-gcc -march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=/opt/fsl-imx-x11/4.1.15-2.1.0/sysroots/cortexa9hf-neon-poky-linux-gnueabi -lpthread -I $(PRINT_INC) -I $(KERNELDIR) $^ -o $@ 
clean :
	rm linux_rfid_alarm.out
