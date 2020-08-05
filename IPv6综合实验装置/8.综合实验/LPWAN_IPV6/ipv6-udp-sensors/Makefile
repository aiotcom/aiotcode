DEFINES+=PROJECT_CONF_H=\"project-conf.h\"
HAVE_BANKING=1
UIP_CONF_IPV6=1
UIP_CONF_RPL=1
CONTIKI_PROJECT = server client_atmos client_flame client_optoelectronic_switch client_smoke client_quake 
CFLAGS += -D$(M)

all: $(CONTIKI_PROJECT) 
CONTIKI = ../../..

include $(CONTIKI)/Makefile.include
