#!/bin/bash
# sync two files into a third file without duplicate lines.

file1=$1
file2=$2
file3=$3

syncFiles(){
cat $file1 $file2 | sort -u > $file3
}

syncFiles()
