#!/bin/bash

YEAR=$(date +%Y)
MONTH=$(date +%m)

# Find number of days in current month
DAYS=$(date -d "$YEAR-$MONTH-01 +1 month -1 day" +%d)

echo "Dates for $(date '+%B %Y')"

for ((DAY=1; DAY<=10#$DAYS; DAY++))
do
    DATE=$(date -d "$YEAR-$MONTH-$DAY" '+%Y-%m-%d')
    echo "$DATE"
done
