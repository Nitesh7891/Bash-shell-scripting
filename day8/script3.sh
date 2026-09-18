#!/usr/bin/bash

<<Comment
Backup and rotate — keep only the last 5 backups, delete older ones.
Comment


SOURCE_DIR="/mnt/d/practice/practice-scripts"
BACKUP_DIR="/mnt/d/practice/backup"

TIMESTAMP=$(date +%Y%m%d)


tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" "$SOURCE_DIR"

ls -t "$BACKUP_DIR"/backup_*.tar.gz | tail -n +6 | xargs -r rm -f

echo "Backup created and rotated successfully."
