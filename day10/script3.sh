#!/bin/bash

#Script to update/upgrade a system with logging and a dry-run flag.


LOG_FILE="system_update_$(date +%Y%m%d_%H%M%S).log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

DRY_RUN=false

if [ "$1" == "--dry-run" ]; then
    DRY_RUN=true
fi

log "System update started."

if [ "$DRY_RUN" = true ]; then

    log "Running in DRY-RUN mode."

    echo
    echo "Packages that can be upgraded:"
    apt list --upgradable 2>/dev/null

    log "Dry-run completed."

else

    log "Updating package information..."

    sudo apt update 2>&1 | tee -a "$LOG_FILE"

    if [ ${PIPESTATUS[0]} -ne 0 ]; then
        log "apt update failed."
        exit 1
    fi

    log "Upgrading packages..."

    sudo apt upgrade -y 2>&1 | tee -a "$LOG_FILE"

    if [ ${PIPESTATUS[0]} -ne 0 ]; then
        log "apt upgrade failed."
        exit 1
    fi

    log "System upgrade completed successfully."
fi

log "Log file: $LOG_FILE"