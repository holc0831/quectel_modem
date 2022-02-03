#!/bin/bash

################################################################################
# Copyright 2021 ModalAI Inc.
################################################################################

#echo -ne "AT+QNWPREFCFG=\"mode_pref\",LTE:NR5G\r" | busybox microcom -t 1000 /dev/ttyUSB2

echo -ne 'AT+CFUN=0\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+QNWPREFCFG="mode_pref",NR5G\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+QNWPREFCFG="nr5g_disable_mode",2\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+QNWPREFCFG="rat_acq_order",NR5G\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'at$qcprfmod=PID:1,OVRRIDEHOPDP:"IPV4V6"\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
#echo -ne 'AT+CGDCONT=1,"IPV4V6","fast.t-mobile.com"\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+CFUN=1,1\r\n' | busybox microcom -t 1000 /dev/ttyUSB2

#echo -ne 'AT+CFUN=0\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
#echo -ne 'AT+QNWPREFCFG="mode_pref",LTE:NR5G\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
#echo -ne 'AT+QNWPREFCFG="nr5g_disable_mode",0\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
#echo -ne 'AT+QNWPREFCFG="rat_acq_order",LTE:NR5G\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
#echo -ne 'at$qcprfmod=PID:1,OVRRIDEHOPDP:"IPV4V6"\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
#echo -ne 'AT+CFUN=1,1\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
