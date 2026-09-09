#!/bin/bash

<<Comment
.Extract all email addresses from a text file.
Comment

read -p "File path: " file
grep -Eo '[[:alnum:]._%+-]+@[[:alnum:].-]+\.[[:alpha:]]+' "$file"
