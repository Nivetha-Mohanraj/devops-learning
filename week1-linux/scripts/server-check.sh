#!/bin/bash
# Check multiple servers/hosts

set -euo pipefail

HOSTS=("google.com" "github.com" "8.8.8.8" "1.1.1.1")

echo "========================================="
echo "Server Connectivity Check - $(date)"
echo "========================================="

UP=0
DOWN=0

for host in "${HOSTS[@]}"; do
    if ping -c 1 -W 2 "$host" > /dev/null 2>&1; then
        echo "✅ $host is UP"
        UP=$((UP + 1))
    else
        echo "❌ $host is DOWN"
        DOWN=$((DOWN + 1))
    fi
done

echo "========================================="
echo "Summary: $UP UP | $DOWN DOWN"
echo "========================================="
