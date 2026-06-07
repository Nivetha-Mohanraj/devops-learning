#!/bin/bash
# Check if a port is open on a server

set -euo pipefail

HOST=$1
PORT=$2

if [ $# -ne 2 ]; then
    echo "Usage: $0 <host> <port>"
    echo "Example: $0 google.com 443"
    exit 1
fi

echo "Checking $HOST:$PORT..."

if nc -zv "$HOST" "$PORT" 2>/dev/null; then
    echo "✅ Port $PORT is OPEN on $HOST"
else
    echo "❌ Port $PORT is CLOSED on $HOST"
fi


