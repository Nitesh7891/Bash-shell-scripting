#!/bin/bash

HOST=$1
PORT=$2

if nc -z -w 3 "$HOST" "$PORT" > /dev/null 2>&1
then
    echo "Port $PORT on $HOST is OPEN"
else
    echo "Port $PORT on $HOST is CLOSED"
fi
