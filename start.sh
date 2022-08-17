#!/bin/bash

cat /opt/logs/logs >> /opt/logs/logs_old
echo "" > /opt/logs/logs

service ssh restart
useradd -m -s /bin/bash tester
echo tester:tester | chpasswd

minicom -w -D /dev/ttyUSB0
echo "admin" > /dev/ttyUSB0
echo "password" > /dev/ttyUSB0

# мб в консоль + в файл? echo "$line" | tee /opt/logs/logs
while read -r line; do echo "$line" >> /opt/logs/logs; done < /dev/ttyUSB0


#tail -f /dev/null