#!/bin/bash

<<Comment
Find all .log files modified in the last 24 hours.
Comment

read -p "Enter path:" path

find "$path" -type f -name "*.log" -mtime -1

