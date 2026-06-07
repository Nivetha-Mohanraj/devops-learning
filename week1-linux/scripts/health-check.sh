#!/bin/bash
# system-health.sh — checks overall system health

set -euo pipefail

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'    # No Color

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

echo "========================================="
echo "       System Health Check Report"
echo "       $(date)"
echo "========================================="

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 | cut -d'.' -f1)
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo -e "${RED}❌ CPU: ${CPU_USAGE}% (CRITICAL!)${NC}"
else
    echo -e "${GREEN}✅ CPU: ${CPU_USAGE}%${NC}"
fi

# Check Memory usage
MEM_USAGE=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    echo -e "${RED}❌ Memory: ${MEM_USAGE}% (CRITICAL!)${NC}"
else
    echo -e "${GREEN}✅ Memory: ${MEM_USAGE}%${NC}"
fi

# Check Disk usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo -e "${RED}❌ Disk: ${DISK_USAGE}% (CRITICAL!)${NC}"
else
    echo -e "${GREEN}✅ Disk: ${DISK_USAGE}%${NC}"
fi

# Check critical services
SERVICES=("ssh" "docker")
for service in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$service" 2>/dev/null; then
        echo -e "${GREEN}✅ Service $service: Running${NC}"
    else
        echo -e "${YELLOW}⚠️  Service $service: Not running${NC}"
    fi
done

echo "========================================="
echo "Health check complete!"
