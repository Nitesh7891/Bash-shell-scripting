#!/bin/bash

INTERFACE=$1

while true
do
    RX=$(cat /proc/net/dev | grep "$INTERFACE:" | awk '{print $2}')
    TX=$(cat /proc/net/dev | grep "$INTERFACE:" | awk '{print $10}')

    echo "Interface: $INTERFACE"
    echo "Received: $RX bytes"
    echo "Transmitted: $TX bytes"
    echo "-------------------------"

    sleep 2
done
