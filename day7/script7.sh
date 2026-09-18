#!/bin/bash

FILE="urls.txt"
OUTPUT_DIR="downloads"

mkdir -p "$OUTPUT_DIR"

while read -r URL
do
    echo "Downloading: $URL"

    wget -P "$OUTPUT_DIR" "$URL"

    if [ $? -eq 0 ]
    then
        echo "Download successful"
    else
        echo "Download failed"
    fi

    echo "----------------------"

done < "$FILE"
