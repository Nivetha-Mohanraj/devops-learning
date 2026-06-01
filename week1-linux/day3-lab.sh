#!/bin/bash
# Day 3 Lab - Processes, Signals and System Monitoring

# =====================
# Task 1 - Explore processes
# =====================
echo "=== All Running Processes ==="
ps aux | head -20

echo "=== Process Tree ==="
pstree | head -20

echo "=== Current User Processes ==="
ps aux | grep $USER

# =====================
# Task 2 - System monitoring
# =====================
echo "=== Memory Usage ==="
free -h

echo "=== Disk Usage ==="
df -h

echo "=== Largest directories ==="
du -sh /* 2>/dev/null | sort -rh | head -10

echo "=== CPU Info ==="
lscpu | head -20

echo "=== System Uptime ==="
uptime

# =====================
# Task 3 - Signal practice
# =====================
echo "=== Starting a background process ==="
sleep 300 &
echo "Sleep PID: $!"
BG_PID=$!

echo "=== Jobs list ==="
jobs

echo "=== Sending SIGTERM ==="
kill -15 $BG_PID
sleep 1

echo "=== Verify process is gone ==="
ps aux | grep "sleep 300" | grep -v grep

# =====================
# Task 4 - Port checking
# =====================
echo "=== Listening Ports ==="
ss -tulpn

echo "=== Open files by current user ==="
lsof -u $USER 2>/dev/null | head -20

# =====================
# Task 5 - Find resource heavy processes
# =====================
echo "=== Top 5 CPU consuming processes ==="
ps aux --sort=-%cpu | head -6

echo "=== Top 5 Memory consuming processes ==="
ps aux --sort=-%mem | head -6

echo "Day 3 Lab Complete!"
