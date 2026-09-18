#!/usr/bin/bash

BACKUP_DIR="/mnt/d/practice/practice-scripts/backup"
RESTORE_DIR="/mnt/d/practice/practice-scripts/restore_dir"

LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/backup_*.tar.gz | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "Error: No backup files found in $BACKUP_DIR."
    exit 1
fi

echo "Restoring from the latest backup: $LATEST_BACKUP"

mkdir -p "$RESTORE_DIR"

tar -xzf "$LATEST_BACKUP" -C "$RESTORE_DIR"

echo "Restore complete."
