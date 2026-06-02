#!/bin/bash
# Day 4 Lab - Linux Networking Commands

# =====================
# Task 1 - Network interfaces
# =====================
echo "=== Network Interfaces ==="
ip addr show

echo "=== Routing Table ==="
ip route show

# =====================
# Task 2 - Connectivity testing
# =====================
echo "=== Ping Google ==="
ping -c 4 8.8.8.8

echo "=== DNS Lookup ==="
nslookup google.com
dig google.com +short

# =====================
# Task 3 - Port checking
# =====================
echo "=== All Listening Ports ==="
ss -tulpn

echo "=== Check if port 22 is open ==="
ss -tulpn | grep :22

echo "=== Check if port 80 is open ==="
ss -tulpn | grep :80

# =====================
# Task 4 - Process using port
# =====================
echo "=== What is using port 22? ==="
sudo lsof -i :22

# =====================
# Task 5 - Test remote ports
# =====================
echo "=== Test Google port 80 ==="
nc -zv google.com 80

echo "=== Test Google port 443 ==="
nc -zv google.com 443

echo "=== Test closed port ==="
nc -zv google.com 81

# =====================
# Task 6 - curl practice
# =====================
echo "=== HTTP Headers of Google ==="
curl -I https://google.com

echo "=== Check HTTP response code ==="
curl -o /dev/null -s -w "%{http_code}\n" https://google.com

echo "=== Test public API ==="
curl https://api.github.com/users/Nivetha-Mohanraj

# =====================
# Task 7 - Generate SSH key
# =====================
echo "=== Generating SSH key ==="
ssh-keygen -t ed25519 -C "nivethamohan0602@gmail.com" -f ~/.ssh/devops_key -N ""

echo "=== SSH key created ==="
ls -la ~/.ssh/
cat ~/.ssh/devops_key.pub

echo "Day 4 Lab Complete!"
