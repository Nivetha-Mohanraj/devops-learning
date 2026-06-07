#!/bin/bash
# Service manager using case statement

set -euo pipefail

SERVICE=$1
ACTION=$2

if [ $# -ne 2 ]; then
    echo "Usage: $0 <service> <action>"
    echo "Actions: status|restart|logs"
    exit 1
fi

case "$ACTION" in
    status)
        echo "Checking status of $SERVICE..."
        systemctl is-active "$SERVICE" 2>/dev/null && \
            echo "✅ $SERVICE is running" || \
            echo "❌ $SERVICE is not running"
        ;;
    restart)
        echo "Restarting $SERVICE..."
        sudo systemctl restart "$SERVICE" && \
            echo "✅ $SERVICE restarted" || \
            echo "❌ Failed to restart $SERVICE"
        ;;
    logs)
        echo "Last 20 lines of $SERVICE logs:"
        sudo journalctl -u "$SERVICE" -n 20 --no-pager
        ;;
    *)
        echo "Unknown action: $ACTION"
        echo "Valid actions: status|restart|logs"
        exit 1
        ;;
esac
