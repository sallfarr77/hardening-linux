#!/bin/bash
# scripts/security/ssh.sh

# Backup existing SSH config
cp /etc/ssh/sshd_config /api-server-hardening/backups/sshd_config.bak

# Disable root login and password authentication
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Specify a custom SSH port
sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config

# Restart SSH service
systemctl restart sshd

echo "SSH configuration hardened."