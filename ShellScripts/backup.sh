#!/bin/bash

# Author: Parth Badwer
# Roll Number: 2601730080
# Purpose: Create compressed folder backups

# Check if argument is provided
if [ -z "$1" ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SOURCE="$1"

# Check if folder exists
if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi

# Create backup directory
BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$BACKUP_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create archive filename
BACKUP_FILE="$BACKUP_DIR/backup_${TIMESTAMP}.tar.gz"

# Create compressed backup
if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then
    SIZE=$(du -h "$BACKUP_FILE" | awk '{print $1}')

    echo "Backup created successfully!"
    echo "Backup filename: $(basename "$BACKUP_FILE")"
    echo "Backup size: $SIZE"

    echo "$TIMESTAMP - SUCCESS - $(basename "$BACKUP_FILE") - $SIZE" >> "$BACKUP_DIR/backup.log"
else
    echo "Error: Backup failed."

    echo "$TIMESTAMP - FAILED - $SOURCE" >> "$BACKUP_DIR/backup.log"
    exit 1
fi
