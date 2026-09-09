#!/bin/bash

<<Comment
.Parse Apache/Nginx access logs — top 10 IPs by request count.
Comment
read -p "File path :" path
cut -d' ' -f1 "$path" | sort | uniq -c | sort -nr | head -10
