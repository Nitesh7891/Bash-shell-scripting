#!/bin/bash


<<Comment
Find and replace text across multiple files using sed.
Comment


read -p "Enter path :" path
read -p "Enter the searching text : " searchText
read -p "Enter the replacing text : " replaceText

find "$path" -type f -exec sed -i "s|$searchText|$replaceText|g" {} +
