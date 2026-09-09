#!/bin/bash

<<Comment
Find and print the Nth line of a file.
Comment

read -p "File path: " file
sed -i "${n}p" "$file"
