#!/bin/bash

<<Comment
Count frequency of each word in a file.
Comment

read -p "file path: " path

tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | tr -s '[:space:]' '\n' | sort | uniq -c
