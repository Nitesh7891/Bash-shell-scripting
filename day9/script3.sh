#!/bin/bash

<<Comment
Find which day of the week a given date falls on.
Comment

read -p "Write date for which you want to know about the day:" Date

DAY=$(date -d "$Date" '+%A')

echo "Date      : $Date"
echo "Day       : $DAY"
