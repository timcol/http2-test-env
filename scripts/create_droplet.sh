#!/bin/bash

# Generate a unique droplet name using the current timestamp
DROPLET_NAME="droplet-$(date +%Y%m%d-%H%M%S)"

# Create a new droplet
echo "Creating droplet $DROPLET_NAME..."
doctl compute droplet create "$DROPLET_NAME" --size s-1vcpu-1gb --image ubuntu-20-04-x64 --region syd1 --ssh-keys 43042409

# Wait for the droplet to be created and assigned an IP
echo "Waiting for droplet to be ready..."
sleep 30

# Get the droplet's IP address
IP=$(doctl compute droplet get "$DROPLET_NAME" --format PublicIPv4 --no-header)

echo "Droplet $DROPLET_NAME created with IP: $IP"
echo "update the IP"
