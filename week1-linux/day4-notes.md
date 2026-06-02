# Day 4 - Linux Networking Commands

## Key Ports to Remember
- 22 → SSH
- 80 → HTTP
- 443 → HTTPS
- 3306 → MySQL
- 5432 → PostgreSQL
- 6379 → Redis
- 27017 → MongoDB

## TCP vs UDP
- TCP → reliable, ordered, 3-way handshake (HTTP, SSH)
- UDP → fast, unreliable, no handshake (DNS, video)

## Must Know Commands
- ip addr → view interfaces
- ss -tulpn → all listening ports
- lsof -i :PORT → process using port
- nc -zv host port → test port connectivity
- ping -c 4 host → test reachability
- dig/nslookup → DNS lookup
- curl -I → HTTP headers
- curl -o /dev/null -s -w "%{http_code}" → check HTTP status

## SSH Key Commands
- ssh-keygen -t ed25519 → generate modern key
- chmod 600 ~/.ssh/id_rsa → private key permission (must!)
- ssh-copy-id user@host → copy public key to server

## Troubleshooting Order
1. ping → can I reach server?
2. nc -zv → is port open?
3. ss -tulpn → is service listening?
4. ufw status → is firewall blocking?
5. journalctl -u service → check logs

## Interview Points
- ss replaces netstat (modern systems)
- Always chmod 600 private keys
- nc -zv is fastest way to test port
- curl -w "%{http_code}" for health checks
- dig is more detailed than nslookup
