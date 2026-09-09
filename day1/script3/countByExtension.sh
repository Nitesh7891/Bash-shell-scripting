#!/bin/bash

<<Comment
Count files by extension and display the folder structure in tree format.
Comment

read -p "Enter the folder path :" path

countFilesByExtension(){
	find "$path" -type f | awk -F'.' '{print $NF}' | sort | uniq -c 
}

formatTree(){
	tree "$path" | sort 
}

count=$(countFilesByExtension "$path");
echo "$count"
treeFormat=$(formatTree "$path")
echo "$treeFormat"



