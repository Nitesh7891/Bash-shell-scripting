#!/bin/bash

<<Comment
Find duplicate files by checksum .
Comment

read -p "path: " path
find "$path" -type f -exec md5sum {} + |
sort |
uniq -w 32 -D
