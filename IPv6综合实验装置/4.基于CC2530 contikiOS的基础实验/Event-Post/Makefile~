CONTIKI_PROJECT = hello-world blink-hello timer-test sensors-demo

HAVE_BANKING=1
UIP_CONF_IPV6=1
UIP_CONF_RPL=1
CFLAGS += -DENABLE_OLED=1
CFLAGS += -DENABLE_SHT2x=1
all: $(CONTIKI_PROJECT) 

CONTIKI = ../../..

include $(CONTIKI)/Makefile.include
