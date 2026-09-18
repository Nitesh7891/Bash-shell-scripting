#!/bin/bash

<<Comment
Calculate the number of days between two dates.
Comment

date1="2026-09-10"
date2="2026-09-18"

time1=$(date -d "date1" +s%)
time2=$(date -d "date2" +s%)

Diff=$((time2-time1))

days=$((Diff/86400))

if [ "$days" -lt 0 ]; then
    days=$((-days))
fi

echo "Date 1     : $date1"
echo "Date 2     : $date2"
echo "Difference : $daysS days"


