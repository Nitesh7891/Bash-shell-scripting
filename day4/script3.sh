#!/bin/bash
<<Comment
Find and delete empty files/directories.
Comment


read -p "Path:" path
for file in "$path"/*
do
    if [[ -f "$file"  ]]
    then
	    find "$file" -empty -delete 

    elif [[ -d "$file" ]]
    then
	    find "$file" -empty -delete
    fi
done
