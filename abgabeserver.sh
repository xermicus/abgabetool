#!/bin/bash

if [ "$1" = "start" ]; then
	for port in $(seq $2 $3)
	do
		nc -l -p $port > "bh_$port" &
	done

elif [ "$1" = "stop" ]; then
	kill $(ps aux | grep 'nc -l -p' | awk '{print $2}') > /dev/null 2>&1

else
	echo "Usage: ./abgabeserver.sh [start startport endport|stop]"
	exit 1
fi

