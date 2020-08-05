CC=arm-poky-linux-gnueabi-gcc -march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=/opt/fsl-imx-x11/4.1.15-2.1.0/sysroots/cortexa9hf-neon-poky-linux-gnueabi
all: one_led_test
one_led_test:one_led_test.c
	$(CC) one_led_test.c -o one_led_test.out -lpthread
clean:
	rm *.out
