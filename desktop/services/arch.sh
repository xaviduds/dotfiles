#!/bin/bash

# Nix
systemctl enable nix-daemon.service

# Wake On Lan (WOL)
SERVICE_FILE="/etc/systemd/system/wol.service"

# Create the WOL service file
cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=Enable Wake-on-LAN
After=network.target

[Service]
Type=oneshot
ExecStart=/sbin/ethtool -s enp2s0 wol g

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to recognize the new service
echo "Reloading systemd configuration..."
systemctl daemon-reload

# Enable the WOL service to start at boot
echo "Enabling WOL service..."
systemctl enable wol.service

# Start the service immediately to apply WOL settings now
echo "Starting WOL service..."
systemctl start wol.service

echo "WOL setup complete. Service file created at $SERVICE_FILE"

