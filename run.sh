#!/bin/bash

echo "" > ./.env
sed -i '/ttyUSB/d' docker-compose.yml
sed -i 's:.* \["/opt/crash-logs/start\.sh".*:      \["/opt/crash-logs/start.sh":' docker-compose.yml

echo "how many com-ports? (min=1)"
read com_amt
if [[ $com_amt < 1 ]]; then exit; fi

com_path=""

for ((i=0; i < $com_amt; i++)) 
    do        
        echo "path to $i com (/dev/ttyUSB$i default):"
        read com_path
        if [[ "$com_path" = "" ]]; then com_path="/dev/ttyUSB$i"; fi        
        echo "      - \${COM_PATH${i}}:/dev/ttyUSB${i}" >> docker-compose.yml
        echo "COM_PATH${i}=$com_path" >> ./.env

        echo "logfile name of $i com (logs$i default):"
        read log_name
        if [[ "$log_name" = "" ]]; then log_name="logs$i"; fi
        sed -i '10 s:$:, "\${LOG_NAME'$i'}":' docker-compose.yml
        echo "LOG_NAME${i}=${log_name}" >> ./.env
        echo "" >> ./.env
    done

sed -i '10 s:$:\]:' docker-compose.yml

docker-compose down
if [[ $1 = "--rebuild" ]]; then docker rmi crash-logs-docker_crash_docker; fi
docker-compose up
