#!/bin/bash
# Disk monitor — designed to run via cron

THRESHOLD=80
LOG_FILE="/tmp/disk-monitor.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Check disk usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

echo "[$TIMESTAMP] Disk usage: ${DISK_USAGE}%" >> "$LOG_FILE"

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "[$TIMESTAMP] ⚠️  WARNING: Disk at ${DISK_USAGE}%!" >> "$LOG_FILE"
fi
