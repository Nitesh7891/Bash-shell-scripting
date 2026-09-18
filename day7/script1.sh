#!/bin/bash

# File containing hosts
FILE="hosts.txt"

while read -r host
do
    if ping -c 1 -W 2 "$host" > /dev/null 2>&1
    then
        echo "$host : UP"
    else
        echo "$host : DOWN"
    fi
done < "$FILE"
