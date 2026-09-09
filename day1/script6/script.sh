#!/bin/bash

<<comment
Create a server monitoring script to check CPU, RAM, and Disk usage every 5 minutes and print a warning if any usage is above 50%.
comment

cpu=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}') 
ram=$(free | awk '/Mem:/ {print ($3/$2)*100}')
disk=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "CPU Usage: $cpu%"
echo "RAM Usage: $ram%"
echo "Disk Usage: $disk%"

if (( ${cpu%.*} > 50 ))
then
    echo "WARNING: CPU usage is above 50%"
fi

if (( ${ram%.*} > 50 ))
then
    echo "WARNING: RAM usage is above 50%"
fi

if (( disk > 50 ))
then
    echo "WARNING: Disk usage is above 50%"
fi
