#!/bin/bash

<<Comment
.Extract all IP addresses from a log file.
Comment


read -p "log file path :" path
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$path"

