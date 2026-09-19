#!/bin/bash

#Write a basic systemd service unit from a script and register it.

SERVICE_NAME="my-bash-service"
SCRIPT_PATH="/usr/local/bin/my_service.sh"
SERVICE_PATH="/etc/systemd/system/$SERVICE_NAME.service"

echo "Creating Bash service script..."

sudo tee "$SCRIPT_PATH" > /dev/null <<'EOF'
#!/bin/bash

while true
do
    echo "Service running: $(date)" >> /var/log/my-bash-service.log
    sleep 10
done
EOF

sudo chmod +x "$SCRIPT_PATH"

echo "Creating systemd unit..."

sudo tee "$SERVICE_PATH" > /dev/null <<EOF
[Unit]
Description=My Basic Bash Service
After=network.target

[Service]
Type=simple
ExecStart=$SCRIPT_PATH
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

echo "Reloading systemd..."

sudo systemctl daemon-reload

echo "Enabling service..."

sudo systemctl enable "$SERVICE_NAME"

echo "Starting service..."

sudo systemctl start "$SERVICE_NAME"

echo
echo "Service created and started successfully."
echo
echo "Check status:"
echo "sudo systemctl status $SERVICE_NAME"