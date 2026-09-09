#!/bin/bash
file1=${1%.*};
file2=${2%.*};

echo "So this is file one $file1"
echo "So this is file two $file2"
echo "So this is $(basename "$0" .sh) file"
