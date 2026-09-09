#!/bin/bash

<<Comment
Find the largest N files in a directory tree.
Comment

read -p "path: " path

find "$path" -type f print f '%s %p\n' | sort -nr | head -n 5
