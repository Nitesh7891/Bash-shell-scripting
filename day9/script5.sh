#!/bin/bash

<<Comment
Script that runs different logic depending on weekday vs weekend.
Comment

day = $(date +%u)

if [["$day" -le 5]];then 
	echo "Today is weekday"
else
	echo "Today is weekend"
fi
