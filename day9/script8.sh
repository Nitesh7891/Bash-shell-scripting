#!/bin/bash

<<Comment
Convert epoch timestamps in a log file to human-readable dates.
Comment


LOG_FILE="/mnt/d/practice/practice-scripts/day10/epoch.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "File not found: $LOG_FILE"
    exit 1
fi

while IFS= read -r LINE
do
    TIMESTAMP=$(echo "$LINE" | awk '{print $1}')

    # Check if first field is a number
    if [[ "$TIMESTAMP" =~ ^[0-9]+$ ]]; then

        HUMAN_DATE=$(date -d "@$TIMESTAMP" '+%Y-%m-%d %H:%M:%S')

        # Remove timestamp and print remaining log message
        MESSAGE=$(echo "$LINE" | cut -d' ' -f2-)

        echo "$HUMAN_DATE $MESSAGE"

    else
        echo "$LINE"
    fi

done < "$LOG_FILE"
