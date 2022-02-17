#!/bin/sh

while true; do

        ping -I wwan0 -c 1 8.8.8.8

        if [ $? -eq 0 ]; then
                echo "Connection up, reconnect not required..."
        else
                echo "Connection down, reconnecting"
                device=$(lsusb | grep "QCOM" | awk '{printf $6 "\n"}')
                usbreset $device
                sleep 10

        fi

        sleep 2
done
