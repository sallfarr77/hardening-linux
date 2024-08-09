#!/bin/bash
# scripts/system/file-permissions.sh

# Set correct file permissions
chown root:root /etc/passwd /etc/shadow /etc/group /etc/gshadow
chmod 644 /etc/passwd /etc/group
chmod 600 /etc/shadow /etc/gshadow

echo "File permissions set."