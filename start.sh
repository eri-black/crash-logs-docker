#!/bin/bash

com_num=0
file_name="$1"

function get_logs() {
    cat /opt/crash-logs/logs/${file_name} >> /opt/crash-logs/logs/${file_name}_old
    echo "" > /opt/crash-logs/logs/${file_name}

    echo "admin" > /dev/ttyUSB${com_num}
    echo "password" > /dev/ttyUSB${com_num}

    ttylog -b 115200 -f -d /dev/ttyUSB${com_num} > /opt/crash-logs/logs/${file_name} &
}

while [[ $# > 0 ]] 
    do        
	    if [[ "$1" = "" ]]; then continue; fi
        file_name="$1"
        get_logs
        let com_num=${com_num}+1
        shift
    done

tail -f /dev/null