#!/bin/bash

<<Comment
.Extract specific columns from a CSV file.
Comment

read -p "file path :" file
read -p "column number you want to extract:" column
cut -d ',' -f"$column" "$file" 
