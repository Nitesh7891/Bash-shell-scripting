#!/bin/bash

<<Comment
List all installed packages and export to a file for replication.
Comment

OUTPUT_FILE="installed_packages.txt"

echo "Getting installed packages..."

dpkg-query -W -f='${binary:Package}\n' > "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Packages exported successfully."
    echo "File: $OUTPUT_FILE"
    echo "Total packages: $(wc -l < "$OUTPUT_FILE")"
else
    echo "Failed to export packages."
    exit 1
fi