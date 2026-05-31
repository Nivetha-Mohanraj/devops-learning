#!/bin/bash
# Day 2 Lab - Users, Groups and Sudo
# Date: $(date)

# =====================
# Task 1 - Explore existing users
# =====================
echo "=== Existing Users ==="
cat /etc/passwd | tail -10

echo "=== Existing Groups ==="
cat /etc/group | tail -10

echo "=== Current User Info ==="
id
groups

# =====================
# Task 2 - Create users and groups
# =====================
echo "=== Creating devops-team group ==="
sudo groupadd devops-team

echo "=== Creating developers ==="
sudo useradd -m -s /bin/bash developer1
sudo useradd -m -s /bin/bash developer2
sudo usermod -aG devops-team developer1
sudo usermod -aG devops-team developer2

echo "=== Verify Groups ==="
groups developer1
groups developer2

# =====================
# Task 3 - Service account
# =====================
echo "=== Creating service account ==="
sudo useradd -r -s /sbin/nologin appuser
id appuser

# =====================
# Task 4 - File ownership
# =====================
echo "=== Creating app directory ==="
sudo mkdir /var/devops-app
sudo chown root:devops-team /var/devops-app
sudo chmod 770 /var/devops-app
ls -la /var/ | grep devops-app

# =====================
# Task 5 - Cleanup
# =====================
echo "=== Cleanup ==="
sudo userdel -r developer1
sudo userdel -r developer2
sudo userdel appuser
sudo groupdel devops-team

echo "=== Verify Cleanup ==="
id developer1 2>/dev/null || echo "developer1 deleted successfully"
id developer2 2>/dev/null || echo "developer2 deleted successfully"
getent group devops-team || echo "devops-team group deleted successfully"
