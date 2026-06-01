# Day 3 - Processes, Signals and System Monitoring

## Process Basics
- Every running program = a process with unique PID
- PID 1 = systemd = parent of all processes
- Process states: R(running) S(sleeping) D(disk wait) Z(zombie)

## Key Commands
- ps aux → all processes
- top/htop → real time monitoring
- kill -15 PID → graceful stop (always try first)
- kill -9 PID → force kill (last resort only)
- kill -1 PID → reload config (nginx etc)
- pgrep nginx → get PID by name
- pkill nginx → kill by name

## Load Average
- 3 numbers = 1min, 5min, 15min averages
- Compare against number of CPU cores
- load > cores = system overloaded

## Disk Monitoring
- df -h → disk space
- du -sh /path → directory size
- find / -size +500M → large files

## Signals Must Know
- SIGTERM(15) → graceful, process cleans up
- SIGKILL(9) → force, no cleanup, data risk
- SIGHUP(1) → reload config, zero downtime

## Interview Points
- Always use SIGTERM before SIGKILL
- SIGHUP reloads nginx config without downtime
- Zombie process = finished but parent didn't collect exit status
- high wa% in top = disk I/O bottleneck
- Load average > CPU cores = system overloaded
- nohup keeps process running after SSH disconnect
