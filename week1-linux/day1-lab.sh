#!/bin/bash
# Day 1 Lab - Linux File System, Navigation and Permissions
# Week 1 - DevOps Learning Journey

# =====================
# Task 1 - Explore the file system
# =====================
echo "=== Root Directory ==="
ls /

echo "=== /etc directory (first 20) ==="
ls /etc | head -20

echo "=== /var/log directory ==="
ls /var/log

# =====================
# Task 2 - Navigate and understand home
# =====================
echo "=== Current Directory ==="
pwd

echo "=== Home Directory Contents ==="
ls -la ~

echo "=== Navigate to /tmp and back ==="
cd /tmp && pwd && cd ~
pwd

# =====================
# Task 3 - Create folder structure
# =====================
echo "=== Creating practice folder structure ==="
mkdir -p ~/devops-learning/week1-linux/practice/{scripts,logs,configs}
tree ~/devops-learning/week1-linux/

# =====================
# Task 4 - Permission practice
# =====================
echo "=== Creating practice files ==="
cd ~/devops-learning/week1-linux/practice
touch myapp.sh secret.key config.txt

echo "=== Setting permissions ==="
chmod 755 myapp.sh       # executable script - rwxr-xr-x
chmod 600 secret.key     # private key - rw-------
chmod 644 config.txt     # readable config - rw-r--r--

echo "=== Verifying permissions ==="
ls -la

# =====================
# Task 5 - Find files
# =====================
echo "=== Finding .conf files in /etc ==="
find /etc -name "*.conf" 2>/dev/null | head -10

echo "=== Finding .log files in /var/log ==="
find /var/log -name "*.log" 2>/dev/null | head -10

echo "=== Finding SUID files ==="
find / -perm -4000 -type f 2>/dev/null

echo "Day 1 Lab Complete!"
