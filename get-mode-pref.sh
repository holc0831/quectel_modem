#!/bin/bash
echo -ne 'AT+CGPADDR=1\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+CGCONTRDP\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+CGDCONT?\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+QNWPREFCFG="mode_pref"\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+QNWPREFCFG="nr5g_disable_mode"\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+QNWPREFCFG="rat_acq_order"\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
echo -ne 'AT+QENG="servingcell"\r\n' | busybox microcom -t 2000 /dev/ttyUSB2
