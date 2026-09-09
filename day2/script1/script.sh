#!/bin/bash

<<comment
Write a script that scans a range of ports on a given host/IP and Print which ones are open.
comment

read -p "Host/IP :"  host
read -p "Starting port :" start_port
read -p "end port :" end_port

echo "Scanning ports from $start_port to $end_port :"

for i in $(seq "$start_port" "$end_port");
do
	timeout 2 bash -c "echo >/dev/tcp/$host/$i" 2 > /dev/null
	if [ $? -eq 0 ];then
		echo "Port $i is open"
	else
		echo "Port $i is closed"
	fi
done
