#!/bin/bash

# Check status of multiple services at once and print a table.

if [ $# -eq 0 ]; then
    echo "Usage: $0 <service1> <service2> ..."
    echo "Example: $0 ssh cron nginx"
    exit 1
fi

printf "%-25s %-15s %-15s\n" "SERVICE" "ACTIVE" "ENABLED"
echo "----------------------------------------------------------"

for SERVICE in "$@"
do

    ACTIVE=$(systemctl is-active "$SERVICE" 2>/dev/null)
    ENABLED=$(systemctl is-enabled "$SERVICE" 2>/dev/null)

    if [ "$ACTIVE" == "active" ]; then
        ACTIVE="RUNNING"
    else
        ACTIVE="STOPPED"
    fi

    if [ "$ENABLED" == "enabled" ]; then
        ENABLED="YES"
    else
        ENABLED="NO"
    fi

    printf "%-25s %-15s %-15s\n" "$SERVICE" "$ACTIVE" "$ENABLED"

done