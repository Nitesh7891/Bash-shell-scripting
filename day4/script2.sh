#!/bin/bash

<<Comment
Count the number of files/folders in a directory.
Comment


read -p "Please specify the path:" path

ls -1 "$path" | wc -l
