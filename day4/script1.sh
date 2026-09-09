#!/bin/bash

<<Comment
Create a directory structure (nested folders) from a list.
Comment

read -p "File path:" line


while IFS= read -r line
do
    echo "$line"
done < file.txt
