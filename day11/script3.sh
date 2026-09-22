#!/bin/bash

#Convert a JSON array into a CSV file.

INPUT_FILE="employees.json"
OUTPUT_FILE="script2.csv"

jq -r '
    ["id", "name", "department", "salary"],
    (.[] | [.id, .name, .department, .salary])
    | @csv
' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "JSON converted to CSV successfully."
echo "Output file: $OUTPUT_FILE"
cat "$OUTPUT_FILE"
