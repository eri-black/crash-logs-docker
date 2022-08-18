#!/bin/bash

cat /opt/logs/logs >> /opt/logs/logs_old
echo "" > /opt/logs/logs

service ssh restart
useradd -m -s /bin/bash tester
echo tester:tester | chpasswd

echo "admin" > /dev/ttyUSB0
echo "password" > /dev/ttyUSB0

# while read -r line; do echo "$line" >> /opt/logs/logs; done < /dev/ttyUSB0
ttylog -f -d /dev/ttyUSB0 > /opt/logs/logs

#tail -f /dev/null