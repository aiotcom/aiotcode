DEFINES+=PROJECT_CONF_H=\"project-conf.h\"
HAVE_BANKING=1
UIP_CONF_IPV6=1
UIP_CONF_RPL=1
PROJECT_SOURCEFILES += send_cmd.c
CONTIKI_PROJECT = client_temp_humi client_fan server
CFLAGS += -D$(M)
CFLAGS += -DUIP_CONF_IPV6

all: $(CONTIKI_PROJECT) 
CONTIKI = ../../..

include $(CONTIKI)/Makefile.include
