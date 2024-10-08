#!/bin/bash
apt-get install ufw -y

# Deny all incoming and allow all outgoing traffic by default
ufw default deny incoming
ufw default allow outgoing

# Allow SSH, HTTP, and HTTPS
ufw allow 2222/tcp
ufw allow http
ufw allow https

# Enable UFW
ufw enable

echo "Firewall configured."