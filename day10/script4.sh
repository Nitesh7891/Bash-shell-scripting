#!/bin/bash

#.Enable/disable and start/stop a systemd service based on an argument.

if [ $# -ne 2 ]; then
    echo "Usage: $0 <service> <action>"
    echo
    echo "Actions:"
    echo "  start"
    echo "  stop"
    echo "  restart"
    echo "  enable"
    echo "  disable"
    echo "  status"
    exit 1
fi

SERVICE="$1"
ACTION="$2"

case "$ACTION" in

    start)
        sudo systemctl start "$SERVICE"
        ;;

    stop)
        sudo systemctl stop "$SERVICE"
        ;;

    restart)
        sudo systemctl restart "$SERVICE"
        ;;

    enable)
        sudo systemctl enable "$SERVICE"
        ;;

    disable)
        sudo systemctl disable "$SERVICE"
        ;;

    status)
        systemctl status "$SERVICE"
        ;;

    *)
        echo "Invalid action: $ACTION"
        exit 1
        ;;
esac

if [ $? -eq 0 ]; then
    echo "$ACTION successful for $SERVICE"
else
    echo "$ACTION failed for $SERVICE"
    exit 1
fi