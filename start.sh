#!/bin/bash

cat /opt/logs/$2 >> /opt/logs/$2_old
echo "" > /opt/logs/$2

if [[ "$1" = "listen" ]]; then 
    ttylog -b 115200 -f -d /dev/ttyUSB0 > /opt/logs/$2
elif [[ "$1" = "busy" ]]; then 
    dpkg -i /opt/logs/slsnif-0-4-4.deb
    slsnif -n -i /opt/logs/$2 -s 115200 /dev/ttyUSB0 -u > /dev/null 2>&1 &
    ser2net -n -C "51001:telnet:0:/dev/pts/0:115200 8DATABITS NONE 1STOPBIT"
else
    echo "error mode" > /opt/logs/$2
fi

#tail -f /dev/null