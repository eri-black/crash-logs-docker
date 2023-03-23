#!/bin/bash

cat /opt/logs/$1 >> /opt/logs/$1_old
echo "" > /opt/logs/$1


#    ser2net -C "TRACEFILE:tb0:/opt/logs/$1" tb=tb0
#    ser2net -n -C "51001:telnet:0:/dev/pts/0:115200 8DATABITS NONE 1STOPBIT" > /dev/null 2>&1 &

tail -f /dev/null