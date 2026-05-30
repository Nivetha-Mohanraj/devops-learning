# Task 1 - Explore the file system
ls /
ls /etc | head -20
ls /var/log

# Task 2 - Navigate and understand your home
pwd
ls -la ~
cd /tmp && pwd && cd ~

# Task 3 - Create a folder structure
mkdir -p ~/devops-learning/week1-linux/practice/{scripts,logs,configs}
tree ~/devops-learning/week1-linux/

# Task 4 - Permission practice
cd ~/devops-learning/week1-linux/practice
touch myapp.sh secret.key config.txt

chmod 755 myapp.sh       # executable script
chmod 600 secret.key     # private key (sensitive!)
chmod 644 config.txt     # readable config

ls -la                   # verify permissions

# Task 5 - Find files
find /etc -name "*.conf" | head -10
find /var/log -name "*.log" | head -10
