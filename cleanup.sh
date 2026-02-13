#!/bin/bash

echo "Stopping Netdata service..."
sudo systemctl stop netdata || true

echo "Removing Netdata packages..."
sudo apt remove -y netdata netdata-core netdata-plugins-bash

echo "Removing Netdata configuration files..."
sudo rm -rf /etc/netdata
sudo rm -rf /var/lib/netdata
sudo rm -rf /var/cache/netdata

echo "Cleanup completed."
