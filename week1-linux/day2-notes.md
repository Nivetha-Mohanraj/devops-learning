# Day 2 - Users, Groups and Sudo

## Key Learnings

- Linux has 3 user types: root (UID 0), system (UID 1-999), regular (UID 1000+)
- /etc/passwd stores user info, /etc/shadow stores encrypted passwords
- sudo is safer than su because it logs every command
- Service accounts use -r and -s /sbin/nologin flags
- Always use -a flag with usermod -G to avoid removing existing groups

## Commands I learned
- useradd, usermod, userdel
- groupadd, groupdel, gpasswd
- id, groups, whoami, w

## Interview Points
- Never run apps as root — use service accounts
- sudo logs are in /var/log/auth.log
- visudo is the safe way to edit sudoers file
