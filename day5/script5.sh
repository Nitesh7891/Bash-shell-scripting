#!/bin/bash

<<Comment
Remove blank lines from a file.
Comment

read -p "file path:" path
sed -i '/^$/d' "$path"
