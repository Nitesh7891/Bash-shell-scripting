#!/bin/bash

<<Comment 
Compare two directories and report differences using diff
Comment

read -p "Enter first directory path:" path1
read -p "Enter second directory path:" path2

diff -rq "$path1" "$path2"

