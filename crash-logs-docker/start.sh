#!/bin/bash

#телнет соединение рестартует каждый час
#если это убрать, то соединенипе разрывается по таймауту

cat /opt/logs/$1 >> /opt/logs/$1_old
echo "" > /opt/logs/$1

while [ 1 ]; do
if [[ "$(pgrep telnet)" = "" ]]; then
    (
    sleep .5;
    echo -en "admin\r";
    sleep .5;
    echo -en "password\r";
    sleep 3600;
    ) | telnet $2 $3 >> /opt/logs/$1 #| screen -d -m -S screen_telnet
fi
sleep 3600
done