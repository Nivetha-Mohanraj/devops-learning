# Day 1 - Linux File System, Navigation and Permissions

## Linux File System Structure
- / → Root, top of everything
- /etc → All config files (nginx.conf, ssh config)
- /home → User home directories
- /var → Logs, databases, runtime data
- /tmp → Temporary files, cleared on reboot
- /bin → Essential commands (ls, cp, mv)
- /proc → Live kernel and process info (virtual)
- /opt → Optional/third party software
- /mnt → Mount points for disks

## Permission System
- r = read = 4
- w = write = 2
- x = execute = 1

## Common Permission Numbers
- 755 = rwxr-xr-x → scripts, binaries
- 644 = rw-r--r-- → config files, regular files
- 600 = rw------- → SSH keys, secret files
- 777 = rwxrwxrwx → NEVER use in production!

## Special Permissions
- SUID (4000) → runs as file owner regardless of who executes
- Find SUID files: find / -perm -4000 -type f 2>/dev/null

## Key Commands Learned
- pwd, ls, ls -la, cd, tree → navigation
- chmod, chown → permissions
- touch, mkdir, cp, mv, rm → file operations
- find, locate, which, whereis → finding files
- cat, less, head, tail, tail -f → viewing files

## Error Redirection
- 2>/dev/null → discard all errors
- > file.txt → redirect stdout to file
- >> file.txt → append stdout to file
- 2>&1 → redirect stderr to stdout

## Interview Points
- /etc/passwd stores user info NOT passwords
- /etc/shadow stores encrypted passwords
- chmod 600 for SSH keys always
- tail -f for live log watching in production
- find / -perm -4000 finds privilege escalation risks
- 2>/dev/null cleans up error noise in scripts
