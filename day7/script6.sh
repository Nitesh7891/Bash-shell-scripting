#!/bin/bash

URL=$1

STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$URL")

if [ "$STATUS" -ge 200 ] && [ "$STATUS" -lt 400 ]
then
    echo "$URL : UP ($STATUS)"
else
    echo "$URL : DOWN/ERROR ($STATUS)"
fi
