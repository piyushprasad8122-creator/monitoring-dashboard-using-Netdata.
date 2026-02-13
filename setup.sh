#!/bin/bash

set -e

echo "Updating system packages..."
sudo apt update -y

echo "Installing required dependencies..."
sudo apt install -y curl

echo "Installing Netdata..."
curl -s https://get.netdata.cloud | bash

echo "Configuring Netdata refresh interval..."
sudo mkdir -p /etc/netdata
sudo tee /etc/netdata/netdata.conf > /dev/null <<EOF
[global]
    update every = 2
EOF

echo "Configuring CPU usage alert..."
sudo mkdir -p /etc/netdata/health.d
sudo tee /etc/netdata/health.d/cpu.conf > /dev/null <<EOF
alarm: cpu_usage_high
on: system.cpu
lookup: average -3s percentage
every: 10s
units: %
warn: \$this > 80
crit: \$this > 90
info: CPU usage is high
EOF

echo "Restarting Netdata..."
sudo systemctl restart netdata

echo "Setup completed."
echo "Access dashboard at http://localhost:19999"
