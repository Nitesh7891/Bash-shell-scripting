#!/bin/bash

<<Comment
Split a large file into smaller chunks using split command,
Comment


read -p "Enter file path :" path

# -d → use numeric suffixes instead of aa, ab


split -l 5 -d -a 2 "$path" chunk_
