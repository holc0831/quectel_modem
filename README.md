# quectel_modem

source https://di-marco.net/blog/it/2020-08-01-qmi_interface_with_lte_base_hat/


Some command to test the modem connectivity on RasPi  

echo -ne 'AT+QCFG="usbnet"\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
mmcli -m 0 
mmcli -m 1 --simple-connect='apn=fast.t-mobile.com,ip-type=ipv4v6'
echo -ne 'AT+QENG="servingcell"\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
mmcli -m 1
mmcli -m 0 --bearer=1 
route
ifconfig wwan0
https://di-marco.net/blog/it/2020-08-01-qmi_interface_with_lte_base_hat/
&
ping -I wwan0 1.1.1.1
echo -ne 'AT+QENG="servingcell"\r\n' | busybox microcom -t 1000 /dev/ttyUSB2
