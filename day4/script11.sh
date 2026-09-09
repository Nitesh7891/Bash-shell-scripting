#!/bin/bash

read -p "Enter directory: " path

declare -A seen

# Store files that already exist
for file in "$path"/*
do
    [[ -f "$file" ]] && seen["$file"]=1
done

while true
do
    for file in "$path"/*
    do
        if [[ -f "$file" && -z "${seen["$file"]}" ]]; then

            echo "New file: $file"

            # Process the file
            # Example:
            # zip archive.zip "$file"

            seen["$file"]=1
        fi
    done

    sleep 5
done
