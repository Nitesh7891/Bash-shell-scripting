#!/bin/bash

read -p "Enter directory to backup: " source_dir
read -p "Enter backup destination: " backup_dir

if [[ ! -d "$source_dir" ]]; then
    echo "Source directory does not exist."
    exit 1
fi

mkdir -p "$backup_dir"

directory_name=$(basename "$source_dir")

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

backup_file="${backup_dir}/${directory_name}_${timestamp}.tar.gz"

tar -czf "$backup_file" "$source_dir"

if [[ $? -eq 0 ]]; then
    echo "Backup created successfully."
    echo "Backup file: $backup_file"
else
    echo "Backup failed."
    exit 1
fi
