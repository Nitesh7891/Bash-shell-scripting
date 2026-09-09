!#/bin/bash

<<Comment
parse a CSV file and convert it to valid JSON using only shell tools
Comment

read -p "Enter CSV file path: " file

if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

awk '
BEGIN {
    FS = ","
    print "["
}

NR == 1 {
    for (i = 1; i <= NF; i++) {
        header[i] = $i
        gsub(/^[ \t]+|[ \t]+$/, "", header[i])
    }
    next
}

{
    if (NR > 2)
        print ","

    printf "  {"

    for (i = 1; i <= NF; i++) {
        value = $i

        # Remove leading/trailing whitespace
        gsub(/^[ \t]+|[ \t]+$/, "", value)

        # Escape double quotes and backslashes for JSON
        gsub(/\\/, "\\\\", value)
        gsub(/"/, "\\\"", value)

        printf "\"%s\":\"%s\"", header[i], value

        if (i < NF)
            printf ","
    }

    printf "}"
}

END {
    print ""
    print "]"
}
' "$file"
