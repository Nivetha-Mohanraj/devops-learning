#!/bin/bash
# Array and string manipulation practice

set -euo pipefail

# Define arrays
SERVERS=("web1" "web2" "db1" "cache1")
PORTS=(80 443 3306 6379)

echo "=== Server List ==="
echo "Total servers: ${#SERVERS[@]}"

for i in "${!SERVERS[@]}"; do
    echo "Server $((i+1)): ${SERVERS[$i]} on port ${PORTS[$i]}"
done

echo ""
echo "=== String Manipulation ==="
FILENAME="myapp_backup_20240607.tar.gz"
echo "Original: $FILENAME"
echo "Uppercase: ${FILENAME^^}"
echo "Without extension: ${FILENAME%.tar.gz}"
echo "Length: ${#FILENAME} characters"
