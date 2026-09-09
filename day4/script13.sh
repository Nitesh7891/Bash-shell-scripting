#!/bin/bash

<<Comment
Archive files older than N days into a archive.
Comment


read -p "path" path
read -p "number of days :" n

find "$path" -type f -mtime +"$n" -print| zip old_files.zip -@
