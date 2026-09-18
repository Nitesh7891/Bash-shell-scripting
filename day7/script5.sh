#!/bin/bash

FILE="domains.txt"

while read -r domain
do
    echo "Domain: $domain"

    IP=$(dig +short "$domain" | head -n 1)

    if [ -n "$IP" ]
    then
        echo "IP: $IP"
    else
        echo "DNS lookup failed"
    fi

    echo "----------------------"

done < "$FILE"
