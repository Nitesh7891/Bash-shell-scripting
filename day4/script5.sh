#!/bin/bash

<<Comment
Rename all files in a folder with a sequential number.
Comment

read -p "Path: " path 

count=1;

for file in "$path"/* ; do
	if [[-f "$file" ]];then 
          extension = "${file##*.}"
	  mv "$file" "$path/count.$extension"
	  ((count++))
	fi
done
