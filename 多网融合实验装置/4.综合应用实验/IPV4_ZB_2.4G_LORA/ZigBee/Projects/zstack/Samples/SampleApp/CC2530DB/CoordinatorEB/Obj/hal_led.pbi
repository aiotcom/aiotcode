This is an internal working file generated by the Source Browser.
14:57 09s
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Components\hal\target\CC2530EB\hal_led.c
-f
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\Tools\CC2530DB\f8wCoord.cfg
-f
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\Tools\CC2530DB\f8wConfig.cfg
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Components\hal\target\CC2530EB\hal_led.c
-D
ZIGBEEPRO
-D
ZTOOL_P1
-D
MT_SYS_FUNC
-D
xMT_ZDO_FUNC
-D
LCD_SUPPORTED=DEBUG
-D
NV_RESTORE
-lC
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\CoordinatorEB\List\
-lA
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\CoordinatorEB\List\
--diag_suppress
Pe001,Pa010
-o
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\CoordinatorEB\Obj\
-e
--debug
--core=plain
--dptr=16,1
--data_model=large
--code_model=banked
--calling_convention=xdata_reentrant
--place_constants=data_rom
--nr_virtual_regs
16
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\SOURCE\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\ZMAIN\TI2530DB\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\MT\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\HAL\INCLUDE\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\HAL\TARGET\CC2530EB\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\OSAL\MCU\CCSOC\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\OSAL\INCLUDE\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\STACK\AF\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\STACK\NWK\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\STACK\SEC\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\STACK\SAPI\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\STACK\SYS\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\STACK\ZDO\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\ZMAC\F8W\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\ZMAC\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\SERVICES\SADDR\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\SERVICES\SDATA\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\MAC\INCLUDE\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\MAC\HIGH_LEVEL\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\MAC\LOW_LEVEL\srf04\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\MAC\LOW_LEVEL\srf04\SINGLE_CHIP\
-I
E:\aiotcode-master\多网融合实验装置\4.综合应用实验\IPV4_ZB_2.4G_LORA\ZigBee\Projects\zstack\Samples\SampleApp\CC2530DB\..\..\..\..\..\COMPONENTS\HARDWARE\
-Ohz
