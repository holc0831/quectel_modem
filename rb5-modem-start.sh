#!/bin/bash

################################################################################
# Copyright 2021 ModalAI Inc.
################################################################################


CONF_FILE=$(cat /etc/modalai/rb5-modem.conf)

parse_json(){
    echo $CONF_FILE | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["'$1'"]'
}

# Grab params from conf file
APN=$(parse_json apn)
MODEM=$(parse_json modem)

echo -e "\nWaiting for modem to enumerate (/dev/ttyUSB2)..."
rc=1
while [ $rc -ne 0 ]; do
    ls /dev | grep ttyUSB2
    rc=$?
    sleep 1
done

if [ $MODEM == "quectel" ]
then
    # Setting mode preference
    #echo -e "\Setting mode preference..."
    #set-mode-pref

    # Loop forever trying to get the cellular link up.
    echo -e "\nInitalizing cellular connection..."
    rc=1
    while [ $rc -ne 0 ]; do
        quectel-CM -s $APN
        rc=$?
        if [[ $rc -eq 0 ]]; then
            exit $rc
        fi
        sleep 1
    done
elif [ $MODEM == "telit" ]
then
    echo -e "\nSetting raw ip..."
    sudo ifconfig wwan0 down
        echo 'Y' | sudo tee /sys/class/net/wwan0/qmi/raw_ip
        sudo ifconfig wwan0 up

    sudo qmicli -d /dev/cdc-wdm0 --set-expected-data-format=raw-ip
    sudo ifconfig wwan0 up

    echo -e "\nStarting qmi network..."
    qmicli --device=/dev/cdc-wdm0 --device-open-proxy --wds-start-network="ip-type=4,apn=$APN" --client-no-release-cid

    echo -e "\Starting udhcpc..."
    sudo udhcpc -q -f -n -i wwan0
else
    echo -e "\nUnknown modem type: "$MODEM
    echo "Recognized modems: quectel, telit"
    exit 1
fi

echo -e "\nCellular connection complete."
