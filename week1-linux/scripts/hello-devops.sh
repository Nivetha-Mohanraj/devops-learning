#!/bin/bash
# My first DevOps script

set -euo pipefail

NAME=$1    # first argument

if [ -z "$NAME" ]; then
    echo "Usage: $0 <your-name>"
    exit 1
fi

echo "Hello $NAME! Welcome to DevOps!"
echo "Today is $(date)"
echo "You are logged in as: $USER"
echo "Current directory: $PWD"
echo "Server hostname: $(hostname)"
