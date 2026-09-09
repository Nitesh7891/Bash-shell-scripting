#!/bin/bash

<<Comment 
Count total lines, words, and characters in all files of a directory.
Comment


read -p "Enter path :" path 

for file in "$path"/* ; do
	if [[ -f "$file" ]];then 
	   echo " Lines in "$file": $( wc -l < "$file") "
	   echo " Words in "$file": $( wc -w < "$file") "
	   echo " Characters in "$file": $(wc -m < "$file") "
	fi
done
