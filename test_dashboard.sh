#!/bin/bash

echo "Installing stress tool..."
sudo apt install -y stress

echo "Generating CPU load for 60 seconds..."
stress --cpu 2 --timeout 60

echo "Load test completed."
