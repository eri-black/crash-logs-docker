#!/bin/bash

cat /opt/logs/$1 >> /opt/logs/$1_old
echo "" > /opt/logs/$1

echo "admin" > /dev/ttyUSB0
echo "password" > /dev/ttyUSB0

ttylog -f -d /dev/ttyUSB0 > /opt/logs/$1

#tail -f /dev/null