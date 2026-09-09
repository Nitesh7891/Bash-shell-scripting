#!/bin/bash

<<Comment
File organizer – Sort files in a directory into subfolders by extension
Comment


read -p "Enter directory path:" path

for file in "$path"/*; do
	if [[ -f "$file" ]]; then
          extension="${file##*.}"	  
	  if [[ ! -d "$extension" ]]; then
	    mkdir  "$extension"
	  fi
	mv "$file" "$path/$extension/"

done

	  
